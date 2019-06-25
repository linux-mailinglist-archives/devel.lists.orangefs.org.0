Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBF753042
	for <lists+devel-orangefs@lfdr.de>; Tue, 25 Jun 2019 12:37:39 +0200 (CEST)
Received: from [::1] (port=56526 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hfipX-0004tk-29
	for lists+devel-orangefs@lfdr.de; Tue, 25 Jun 2019 06:37:39 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58650)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from
 <BATV+c5155a46dc30cc8634d8+5784+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1hfipW-0004sh-BW
 for devel@lists.orangefs.org; Tue, 25 Jun 2019 06:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1VNqATdiMZjRjBl/SX9aDfK/cY5ROrczskzh7bEhyqQ=; b=ZpriNPniMtQfF3PzrXrZFLu9+
 swp27pwzGA3dKtOql8ByZMlmC5XAUIK6Dd+GMHjf0qKANtiVkMY+kP24emwMCRR8Bd7PMgTyLe9QA
 5OqMw/nvM9U3sRjirT+3roDKm/2t058rf3DiyN7fkLSlwMZ0SYle68bvh+fdV+mCDEdE0F8PxUYpO
 6uADPC1wdetL3m6crno/ECGMbIBw4GF5RRX2ugGr6ltI3bjWVADicfMYipFtp/ocudq1CWBwDRZB8
 y8f1S9n0qHQVZzv6yurSepPmJiIiCIwpzAKGBbc00350emRHfZhiQtGnClIv9oYZsJs4CbEdnWkcx
 MCg3FRwHw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hfioR-0001Ln-BN; Tue, 25 Jun 2019 10:36:31 +0000
Date: Tue, 25 Jun 2019 03:36:31 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: [PATCH v4 0/7] vfs: make immutable files actually immutable
Message-ID: <20190625103631.GB30156@infradead.org>
References: <156116141046.1664939.11424021489724835645.stgit@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156116141046.1664939.11424021489724835645.stgit@magnolia>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: devel@lists.orangefs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: <devel.lists.orangefs.org>
List-Unsubscribe: <http://lists.orangefs.org/mailman/options/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=unsubscribe>
List-Archive: <http://lists.orangefs.org/pipermail/devel_lists.orangefs.org/>
List-Post: <mailto:devel@lists.orangefs.org>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Subscribe: <http://lists.orangefs.org/mailman/listinfo/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=subscribe>
Cc: linux-efi@vger.kernel.org, linux-btrfs@vger.kernel.org, yuchao0@huawei.com,
 linux-mm@kvack.org, clm@fb.com, adilger.kernel@dilger.ca,
 matthew.garrett@nebula.com, linux-nilfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org, josef@toxicpanda.com,
 reiserfs-devel@vger.kernel.org, viro@zeniv.linux.org.uk, dsterba@suse.com,
 jaegeuk@kernel.org, tytso@mit.edu, ard.biesheuvel@linaro.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com
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

On Fri, Jun 21, 2019 at 04:56:50PM -0700, Darrick J. Wong wrote:
> Hi all,
> 
> The chattr(1) manpage has this to say about the immutable bit that
> system administrators can set on files:
> 
> "A file with the 'i' attribute cannot be modified: it cannot be deleted
> or renamed, no link can be created to this file, most of the file's
> metadata can not be modified, and the file can not be opened in write
> mode."
> 
> Given the clause about how the file 'cannot be modified', it is
> surprising that programs holding writable file descriptors can continue
> to write to and truncate files after the immutable flag has been set,
> but they cannot call other things such as utimes, fallocate, unlink,
> link, setxattr, or reflink.

I still think living code beats documentation.  And as far as I can
tell the immutable bit never behaved as documented or implemented
in this series on Linux, and it originated on Linux.

If you want  hard cut off style immutable flag it should really be a
new API, but I don't really see the point.  It isn't like the usual
workload is to set the flag on a file actively in use.

