Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF89194515
	for <lists+devel-orangefs@lfdr.de>; Thu, 26 Mar 2020 18:07:57 +0100 (CET)
Received: from [::1] (port=36138 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jHVz2-0006eW-Hk
	for lists+devel-orangefs@lfdr.de; Thu, 26 Mar 2020 13:07:56 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:41426)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from
 <BATV+f73da832ea8226d6223e+6059+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1jHVz1-0006dQ-Eb
 for devel@lists.orangefs.org; Thu, 26 Mar 2020 13:07:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=o9hWonZdK7qOdVSuVgvE7D7VzhV6FqrA9zPqPwq++AA=; b=RqUeCpX4KPGswjWK1+3HquX3N1
 ZXCmC4fXIqQ5JArb8viyWEIB0miaeAhv/Ko5UZYhvcnN5Cw4l8uEQjXjiwHs5T4jLtFFjzvaN/tEp
 wbBjor5Ybg/+m/iVZUJREOCN+yVRHlN7LyWHyjbKh31ubPajaZL7ENVE9NScdhve4QpIZ7wAunnYz
 L3bBoTRpxgSbI7nxzteytDKmEHardsR/ybmsEn0s9N6nKgR9nc7IBB64gperg2YOQ+ecY5thW+CWK
 eTKy5yBFykn0db9Ifsm6kxJnxfAaKsLfpZ6hAezvR9fH9uKkIarrZ1ahvGaLCT8NPBP3PWnrRSCFc
 pmCrMqRQ==;
Received: from [2001:4bb8:18c:2a9e:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHVyM-00019E-D1; Thu, 26 Mar 2020 17:07:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>
Subject: [PATCH 2/2] orangefs: don't mess with I_DIRTY_TIMES in orangefs_flush
Date: Thu, 26 Mar 2020 18:07:05 +0100
Message-Id: <20200326170705.1552562-3-hch@lst.de>
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

orangefs_flush just writes out data on every close(2) call.  There is no
need to change anything about the dirty state, especially as orangefs
doesn't treat I_DIRTY_TIMES special in any way.  The code seems to
come from partially open coding vfs_fsync.

Fixes: 90fc07065a35 ("orangefs: avoid fsync service operation on flush")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/orangefs/file.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/fs/orangefs/file.c b/fs/orangefs/file.c
index 173e6ea57a47..af375e049aae 100644
--- a/fs/orangefs/file.c
+++ b/fs/orangefs/file.c
@@ -645,16 +645,8 @@ static int orangefs_flush(struct file *file, fl_owner_t id)
 	 * on an explicit fsync call.  This duplicates historical OrangeFS
 	 * behavior.
 	 */
-	struct inode *inode = file->f_mapping->host;
 	int r;
 
-	if (inode->i_state & I_DIRTY_TIME) {
-		spin_lock(&inode->i_lock);
-		inode->i_state &= ~I_DIRTY_TIME;
-		spin_unlock(&inode->i_lock);
-		mark_inode_dirty_sync(inode);
-	}
-
 	r = filemap_write_and_wait_range(file->f_mapping, 0, LLONG_MAX);
 	if (r > 0)
 		return 0;
-- 
2.25.1


