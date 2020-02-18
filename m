Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BC1161FB7
	for <lists+devel-orangefs@lfdr.de>; Tue, 18 Feb 2020 05:02:52 +0100 (CET)
Received: from [::1] (port=44446 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1j3u5z-0001o9-7u
	for lists+devel-orangefs@lfdr.de; Mon, 17 Feb 2020 23:02:51 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:41904)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <willy@infradead.org>) id 1j3u5x-0001md-QW
 for devel@lists.orangefs.org; Mon, 17 Feb 2020 23:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7wGa3YK3qBJM1kRhsgewapkT2JCnOADkdvrgCfI8+90=; b=oTTxMJX6amDV3Ionqdhrrglrcb
 W7H8kpBfSnTDWxOXNM7fFfN0yug+0CKzj9Ko8iqxRm7V6BVIbDWhEC5i1no59QsIWFL0/D6tAI2iv
 rfCKb7LLP1qh9qDF5mjh+jTUcyT5+O7Px3mmqtHkFpbin0++ry4u0Hbw15v1wdN54TlTK2c2lDqdh
 J8IWjfgf4ukQe4UHOQDrt6egCl1KRtL8tSJig+d4s2S5T6WjGgiQg/RAx1FTvaRP8UHvjnWbOAv6x
 T4khKePRX4dxjOA1oXQIsUE8Ii8jxjOmrdfGyI0GcE9KonY0mJiM64L+QsNgaS/eLh9tYlU78Q+ft
 X2WA0Kag==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j3u4w-00078u-UB; Tue, 18 Feb 2020 04:01:46 +0000
Date: Mon, 17 Feb 2020 20:01:46 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 00/44] Manually convert filesystem FS documents to ReST
Message-ID: <20200218040146.GM7778@bombadil.infradead.org>
References: <cover.1581955849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1581955849.git.mchehab+huawei@kernel.org>
X-BeenThere: devel@lists.orangefs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <devel.lists.orangefs.org>
List-Unsubscribe: <http://lists.orangefs.org/mailman/options/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=unsubscribe>
List-Archive: <http://lists.orangefs.org/pipermail/devel_lists.orangefs.org/>
List-Post: <mailto:devel@lists.orangefs.org>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Subscribe: <http://lists.orangefs.org/mailman/listinfo/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=subscribe>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Jan Kara <jack@suse.cz>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Amir Goldstein <amir73il@gmail.com>, Bob Copeland <me@bobcopeland.com>,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, Ilya Dryomov <idryomov@gmail.com>,
 linux-afs@lists.infradead.org, Naohiro Aota <naohiro.aota@wdc.com>,
 Christoph Hellwig <hch@infradead.org>, linux-nilfs@vger.kernel.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Sage Weil <sage@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Tyler Hicks <code@tyhicks.com>, cluster-devel@redhat.com,
 v9fs-developer@lists.sourceforge.net, Gao Xiang <xiang@kernel.org>,
 linux-ext4@vger.kernel.org, Salah Triki <salah.triki@gmail.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, devel@lists.orangefs.org,
 Chao Yu <chao@kernel.org>, Eric Van Hensbergen <ericvh@gmail.com>,
 ecryptfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 Bob Peterson <rpeterso@redhat.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Anton Altaparmakov <anton@tuxera.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Luis de Bethencourt <luisbg@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 linux-ntfs-dev@lists.sourceforge.net, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, ocfs2-devel@oss.oracle.com,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>, Johannes Thumshirn <jth@kernel.org>,
 linux-erofs@lists.ozlabs.org, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org
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

On Mon, Feb 17, 2020 at 05:11:46PM +0100, Mauro Carvalho Chehab wrote:
> There are lots of plain text documents under Documentation/filesystems.
> 
> Manually convert several of those to ReST and add them to the index file.

I think at least 90% of this material needs to be in admin-guide.  Should
we create Documentation/admin-guide/filesystems/ and move most of these
files there?

