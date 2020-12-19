Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id B124C2DED25
	for <lists+devel-orangefs@lfdr.de>; Sat, 19 Dec 2020 06:20:22 +0100 (CET)
Received: from [::1] (port=41892 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1kqUfF-0000JF-DS
	for lists+devel-orangefs@lfdr.de; Sat, 19 Dec 2020 00:20:21 -0500
Received: from casper.infradead.org ([90.155.50.34]:39282)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <willy@infradead.org>) id 1kqUfE-0000IA-MC
 for devel@lists.orangefs.org; Sat, 19 Dec 2020 00:20:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=TARKRSXf7326kO0qCmfUIKv486q/szb6N/69HhzDey0=; b=YbsRvyx1wjoh6xiZB57/1lgbpU
 iwesdLeyBD5NlC5Ebn55VCHGoE/DxpCuJ0L6/ymooF9ySssio42lEqyLae/84EJYfShO/3D5C/uov
 ZUhibatmwQKaa2bRcIjyC4cfUeF+ePFwjYluYrNBiAbRSPmyc1PlgFryWptalK9e7LVM7L7h//1jw
 LRzsD4I1TkBdfWOjJ0/pCYlaVE94YT3bf7xHQ0vtQ6YMmjXINBk/5nOf/7qc55Z1pxJ7Df7HwGbU8
 IqINRT8F3FkK2YAifRhYvOoBGGDS8CBO/j3uHzoYUy+kfPMv5Wlz5Ntalex0MHvDk+ISZ1tjIuHz4
 Pml8KPWA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kqUdo-0000CE-Sl; Sat, 19 Dec 2020 05:18:52 +0000
Date: Sat, 19 Dec 2020 05:18:52 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: Re: set_page_dirty vs truncate
Message-ID: <20201219051852.GP15600@casper.infradead.org>
References: <20201218160531.GL15600@casper.infradead.org>
 <20201218220316.GO15600@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201218220316.GO15600@casper.infradead.org>
X-BeenThere: devel@lists.orangefs.org
X-Mailman-Version: 2.1.33
Precedence: list
List-Id: <devel.lists.orangefs.org>
List-Unsubscribe: <http://lists.orangefs.org/mailman/options/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=unsubscribe>
List-Archive: <http://lists.orangefs.org/pipermail/devel_lists.orangefs.org/>
List-Post: <mailto:devel@lists.orangefs.org>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Subscribe: <http://lists.orangefs.org/mailman/listinfo/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=subscribe>
Cc: linux-cifs@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
 Miklos Szeredi <miklos@szeredi.hu>, Dave Kleikamp <shaggy@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Dominique Martinet <asmadeus@codewreck.org>, linux-um@lists.infradead.org,
 linux-nfs@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>,
 Steve French <sfrench@samba.org>, linux-ntfs-dev@lists.sourceforge.net,
 Hans de Goede <hdegoede@redhat.com>, devel@lists.orangefs.org,
 Anna Schumaker <anna.schumaker@netapp.com>,
 v9fs-developer@lists.sourceforge.net, Jeff Dike <jdike@addtoit.com>,
 Anton Altaparmakov <anton@tuxera.com>
Errors-To: devel-bounces@lists.orangefs.org
Sender: "Devel" <devel-bounces@lists.orangefs.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - mm1.emwd.com
X-AntiAbuse: Original Domain - lfdr.de
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lists.orangefs.org
X-Get-Message-Sender-Via: mm1.emwd.com: acl_c_authenticated_local_user: mailman/mailman
X-Authenticated-Sender: mm1.emwd.com: mailman@lists.orangefs.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

On Fri, Dec 18, 2020 at 10:03:16PM +0000, Matthew Wilcox wrote:
> On Fri, Dec 18, 2020 at 04:05:31PM +0000, Matthew Wilcox wrote:
> > A number of implementations of ->set_page_dirty check whether the page
> > has been truncated (ie page->mapping has become NULL since entering
> > set_page_dirty()).  Several other implementations assume that they can do
> > page->mapping->host to get to the inode.  So either some implementations
> > are doing unnecessary checks or others are vulnerable to a NULL pointer
> > dereference if truncate() races with set_page_dirty().
> > 
> > I'm touching ->set_page_dirty() anyway as part of the page folio
> > conversion.  I'm thinking about passing in the mapping so there's no
> > need to look at page->mapping.
> > 
> > The comments on set_page_dirty() and set_page_dirty_lock() suggests
> > there's no consistency in whether truncation is blocked or not; we're
> > only guaranteed that the inode itself won't go away.  But maybe the
> > comments are stale.
> 
> The comments are, I believe, not stale.  Here's some syzbot
> reports which indicate that ext4 is seeing races between set_page_dirty()
> and truncate():
> 
>  https://groups.google.com/g/syzkaller-lts-bugs/c/s9fHu162zhQ/m/Phnf6ucaAwAJ
> 
> The reproducer includes calls to ftruncate(), so that would suggest
> that's what's going on.

Hmmm ... looks like __set_page_dirty_nobuffers() has a similar problem:

{
        lock_page_memcg(page);
        if (!TestSetPageDirty(page)) {
                struct address_space *mapping = page_mapping(page);
                unsigned long flags;

                if (!mapping) {
                        unlock_page_memcg(page);
                        return 1;
                }

                xa_lock_irqsave(&mapping->i_pages, flags);
                BUG_ON(page_mapping(page) != mapping);

sure, we check that the page wasn't truncated between set_page_dirty()
and the call to TestSetPageDirty(), but we can truncate dirty pages
with no problem.  So between the call to TestSetPageDirty() and
the call to xa_lock_irqsave(), the page can be truncated, and the
BUG_ON should fire.

I haven't been able to find any examples of this, but maybe it's just a very
narrow race.  Does anyone recognise this signature?  Adding the filesystems
which use __set_page_dirty_nobuffers() directly without extra locking.

$ git grep set_page_dirty.*=.*__set_page_dirty_nobuffers
fs/9p/vfs_addr.c:       .set_page_dirty = __set_page_dirty_nobuffers,
fs/cifs/file.c: .set_page_dirty = __set_page_dirty_nobuffers,
fs/cifs/file.c: .set_page_dirty = __set_page_dirty_nobuffers,
fs/fuse/file.c: .set_page_dirty = __set_page_dirty_nobuffers,
fs/hostfs/hostfs_kern.c:        .set_page_dirty = __set_page_dirty_nobuffers,
fs/jfs/jfs_metapage.c:  .set_page_dirty = __set_page_dirty_nobuffers,
fs/nfs/file.c:  .set_page_dirty = __set_page_dirty_nobuffers,
fs/ntfs/aops.c: .set_page_dirty = __set_page_dirty_nobuffers,   /* Set the page dirty
fs/orangefs/inode.c:    .set_page_dirty = __set_page_dirty_nobuffers,
fs/vboxsf/file.c:       .set_page_dirty = __set_page_dirty_nobuffers,


