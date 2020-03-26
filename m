Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FD7194514
	for <lists+devel-orangefs@lfdr.de>; Thu, 26 Mar 2020 18:07:54 +0100 (CET)
Received: from [::1] (port=36120 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jHVyz-0006e5-GC
	for lists+devel-orangefs@lfdr.de; Thu, 26 Mar 2020 13:07:53 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:41420)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from
 <BATV+f73da832ea8226d6223e+6059+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1jHVyy-0006VM-LL
 for devel@lists.orangefs.org; Thu, 26 Mar 2020 13:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=RCrrXQzVlmqN4ohHYkOIzxbjnPYXhyo7f5OzGvr65VQ=; b=BKcLsou1XL+Ka1Y1C1RcAW4q2s
 Oqg8sMqB4zBjNVtiy/6HEESv6PQFHyWGSg4BFF/gxR6FkFyNRjMvb+r9kzVOTIr2Jg0bI5DJ+4Rqv
 /LBnWtNnCOYHC9fWA3ez4C4E6+ndcfCXNm/GsStLzre975J15zJJ5TExMjKJmxrSoQKd4kM3XNnEs
 GztrdqtUwhRPuyT77U1f9krXmxYZuINiWk7K2ERCXwEAhNAgVZQAUIjnHnWaxC5j4/FcSzkxp2WOd
 k20N1zB3NsApFtiadH61XHqCwGKUSPK4JIDznlggPy9FJYRon/aPKjduvJX3Dav3jt328Fsgmi8hB
 NbXPYt8A==;
Received: from [2001:4bb8:18c:2a9e:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHVyJ-000194-EW; Thu, 26 Mar 2020 17:07:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>
Subject: [PATCH 1/2] Revert "orangefs: remember count when reading."
Date: Thu, 26 Mar 2020 18:07:04 +0100
Message-Id: <20200326170705.1552562-2-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200326170705.1552562-1-hch@lst.de>
References: <20200326170705.1552562-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 devel@lists.orangefs.org
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

->read_iter calls can race with each other and one or more ->flush calls.
Remove the the scheme to store the read count in the file private data
as is is completely racy and can cause use after free or double free
conditions.

This reverts commit c2549f8c7a28c00facaf911f700c4811cfd6f52b.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/orangefs/file.c            | 26 +-------------------------
 fs/orangefs/orangefs-kernel.h |  4 ----
 2 files changed, 1 insertion(+), 29 deletions(-)

diff --git a/fs/orangefs/file.c b/fs/orangefs/file.c
index c740159d9ad1..173e6ea57a47 100644
--- a/fs/orangefs/file.c
+++ b/fs/orangefs/file.c
@@ -346,23 +346,8 @@ static ssize_t orangefs_file_read_iter(struct kiocb *iocb,
     struct iov_iter *iter)
 {
 	int ret;
-	struct orangefs_read_options *ro;
-
 	orangefs_stats.reads++;
 
-	/*
-	 * Remember how they set "count" in read(2) or pread(2) or whatever -
-	 * users can use count as a knob to control orangefs io size and later
-	 * we can try to help them fill as many pages as possible in readpage.
-	 */
-	if (!iocb->ki_filp->private_data) {
-		iocb->ki_filp->private_data = kmalloc(sizeof *ro, GFP_KERNEL);
-		if (!iocb->ki_filp->private_data)
-			return(ENOMEM);
-		ro = iocb->ki_filp->private_data;
-		ro->blksiz = iter->count;
-	}
-
 	down_read(&file_inode(iocb->ki_filp)->i_rwsem);
 	ret = orangefs_revalidate_mapping(file_inode(iocb->ki_filp));
 	if (ret)
@@ -650,12 +635,6 @@ static int orangefs_lock(struct file *filp, int cmd, struct file_lock *fl)
 	return rc;
 }
 
-static int orangefs_file_open(struct inode * inode, struct file *file)
-{
-	file->private_data = NULL;
-	return generic_file_open(inode, file);
-}
-
 static int orangefs_flush(struct file *file, fl_owner_t id)
 {
 	/*
@@ -669,9 +648,6 @@ static int orangefs_flush(struct file *file, fl_owner_t id)
 	struct inode *inode = file->f_mapping->host;
 	int r;
 
-	kfree(file->private_data);
-	file->private_data = NULL;
-
 	if (inode->i_state & I_DIRTY_TIME) {
 		spin_lock(&inode->i_lock);
 		inode->i_state &= ~I_DIRTY_TIME;
@@ -694,7 +670,7 @@ const struct file_operations orangefs_file_operations = {
 	.lock		= orangefs_lock,
 	.unlocked_ioctl	= orangefs_ioctl,
 	.mmap		= orangefs_file_mmap,
-	.open		= orangefs_file_open,
+	.open		= generic_file_open,
 	.flush		= orangefs_flush,
 	.release	= orangefs_file_release,
 	.fsync		= orangefs_fsync,
diff --git a/fs/orangefs/orangefs-kernel.h b/fs/orangefs/orangefs-kernel.h
index ed67f39fa7ce..e12aeb9623d6 100644
--- a/fs/orangefs/orangefs-kernel.h
+++ b/fs/orangefs/orangefs-kernel.h
@@ -239,10 +239,6 @@ struct orangefs_write_range {
 	kgid_t gid;
 };
 
-struct orangefs_read_options {
-	ssize_t blksiz;
-};
-
 extern struct orangefs_stats orangefs_stats;
 
 /*
-- 
2.25.1


