Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id D199A1C9DB2
	for <lists+devel-orangefs@lfdr.de>; Thu,  7 May 2020 23:45:09 +0200 (CEST)
Received: from [::1] (port=51388 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jWoKK-0006Hy-Tf
	for lists+devel-orangefs@lfdr.de; Thu, 07 May 2020 17:45:08 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40046)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <guoqing.jiang@cloud.ionos.com>)
 id 1jWoKJ-0006Gs-3P
 for devel@lists.orangefs.org; Thu, 07 May 2020 17:45:07 -0400
Received: by mail-ed1-f67.google.com with SMTP id d16so6737914edq.7
 for <devel@lists.orangefs.org>; Thu, 07 May 2020 14:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=x1k2am9O4R7Y4YHJ4Be5yH8QLb/HmP/D5mGyD5wTZwk=;
 b=DqSTGd8rzc46rV5EX1cpfSoxdzSXi4EvLLhtIxUZl7wvMLlAIHdW2/4M0GfdL8Fm1d
 6UNkyIXF2cOpVkbG98ZwWik0/In1ULaWpxc4NZsEFId32aSQ+K+Kk/tFkHawqNT1T0aq
 duA15dILclSATjQAKk1C3lIVZp8bDdeQeFx+u6u1eelDaZoN8qUPdwr9FHW6O8U9x2JP
 02M1BU4hAwTponPR7/EG8mYRfPmx+PClEJ+oofvj7xM07KBIqu8Bf/V/MD4qZ5ix/shu
 CsMPyXhtGCgZF5A5Zn3OlGyVUNNwJ6skkk/tjB4DJ9BOZ5TnVKN48ej8XsTfb6oW11z2
 lijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=x1k2am9O4R7Y4YHJ4Be5yH8QLb/HmP/D5mGyD5wTZwk=;
 b=EKNiAQCds+ND2Tp5V+CqFpG64Aa551Bn1LLUtniWerR8mJju3GsoOliTTBm4TLUlIg
 HheQQIRnJ1o2oeGZWAS2nbMkdERj5m8Wpq4wIMCn7P0YD057QyO00GBZi9vYYn2ykh74
 7XMfIWEEpTxzKya57KzpmvvX9Zlu45ERks1zw0SMG13pZJAhZ0F9eG0jwW3lIDJWmq+j
 NcVWPnPnrVzyY5j2d+dJSdqwj7KlDopRO4xcROJSIl/9RMfUMnzEwuxMb35QhDy1sXqi
 sApKc4TitjW+d+iON4wPUXsS1qybBQr7iPaK9wSnZzFCo2fZJfNxYlg9Ydi+TcyUTfIw
 GVSQ==
X-Gm-Message-State: AGi0PuYEfb8OhI+MZT6vgQIS2UGwAm5FSQWPdfEmpf8zPYHZCf3e0mJW
 DSgP51IrhO6bBH3amgwlRC03YQ==
X-Google-Smtp-Source: APiQypKU+QDtTzAGbt+rGx7x4k3z0gzwhpSfgQcNFLq8Sc/4CGP3DKvBCi/+fwfP+Bt5DxySqrSSLw==
X-Received: by 2002:a05:6402:4a:: with SMTP id
 f10mr14429868edu.274.1588887866036; 
 Thu, 07 May 2020 14:44:26 -0700 (PDT)
Received: from ls00508.pb.local ([2001:1438:4010:2540:a1ee:a39a:b93a:c084])
 by smtp.gmail.com with ESMTPSA id k3sm613530edi.60.2020.05.07.14.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 14:44:25 -0700 (PDT)
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH V3 08/10] orangefs: use attach/detach_page_private
Date: Thu,  7 May 2020 23:43:58 +0200
Message-Id: <20200507214400.15785-9-guoqing.jiang@cloud.ionos.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200507214400.15785-1-guoqing.jiang@cloud.ionos.com>
References: <20200507214400.15785-1-guoqing.jiang@cloud.ionos.com>
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
Cc: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>, david@fromorbit.com,
 willy@infradead.org, hch@infradead.org, devel@lists.orangefs.org
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

Since the new pair function is introduced, we can call them to clean the
code in orangefs.

Cc: Mike Marshall <hubcap@omnibond.com>
Cc: Martin Brandenburg <martin@omnibond.com>
Cc: devel@lists.orangefs.org
Signed-off-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
---
RFC V2 -> RFC V3
1. rename clear_page_private to detach_page_private.

RFC -> RFC V2
1. change the name of new functions to attach/clear_page_private.
2. avoid potential use-after-free as suggested by Dave Chinner.

 fs/orangefs/inode.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
index 12ae630fbed7..48f0547d4850 100644
--- a/fs/orangefs/inode.c
+++ b/fs/orangefs/inode.c
@@ -62,12 +62,7 @@ static int orangefs_writepage_locked(struct page *page,
 	} else {
 		ret = 0;
 	}
-	if (wr) {
-		kfree(wr);
-		set_page_private(page, 0);
-		ClearPagePrivate(page);
-		put_page(page);
-	}
+	kfree(detach_page_private(page));
 	return ret;
 }
 
@@ -409,9 +404,7 @@ static int orangefs_write_begin(struct file *file,
 	wr->len = len;
 	wr->uid = current_fsuid();
 	wr->gid = current_fsgid();
-	SetPagePrivate(page);
-	set_page_private(page, (unsigned long)wr);
-	get_page(page);
+	attach_page_private(page, wr);
 okay:
 	return 0;
 }
@@ -459,18 +452,12 @@ static void orangefs_invalidatepage(struct page *page,
 	wr = (struct orangefs_write_range *)page_private(page);
 
 	if (offset == 0 && length == PAGE_SIZE) {
-		kfree((struct orangefs_write_range *)page_private(page));
-		set_page_private(page, 0);
-		ClearPagePrivate(page);
-		put_page(page);
+		kfree(detach_page_private(page));
 		return;
 	/* write range entirely within invalidate range (or equal) */
 	} else if (page_offset(page) + offset <= wr->pos &&
 	    wr->pos + wr->len <= page_offset(page) + offset + length) {
-		kfree((struct orangefs_write_range *)page_private(page));
-		set_page_private(page, 0);
-		ClearPagePrivate(page);
-		put_page(page);
+		kfree(detach_page_private(page));
 		/* XXX is this right? only caller in fs */
 		cancel_dirty_page(page);
 		return;
@@ -535,12 +522,7 @@ static int orangefs_releasepage(struct page *page, gfp_t foo)
 
 static void orangefs_freepage(struct page *page)
 {
-	if (PagePrivate(page)) {
-		kfree((struct orangefs_write_range *)page_private(page));
-		set_page_private(page, 0);
-		ClearPagePrivate(page);
-		put_page(page);
-	}
+	kfree(detach_page_private(page));
 }
 
 static int orangefs_launder_page(struct page *page)
@@ -740,9 +722,7 @@ vm_fault_t orangefs_page_mkwrite(struct vm_fault *vmf)
 	wr->len = PAGE_SIZE;
 	wr->uid = current_fsuid();
 	wr->gid = current_fsgid();
-	SetPagePrivate(page);
-	set_page_private(page, (unsigned long)wr);
-	get_page(page);
+	attach_page_private(page, wr);
 okay:
 
 	file_update_time(vmf->vma->vm_file);
-- 
2.17.1


