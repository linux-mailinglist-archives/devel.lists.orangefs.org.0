Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 292C21B9455
	for <lists+devel-orangefs@lfdr.de>; Sun, 26 Apr 2020 23:50:38 +0200 (CEST)
Received: from [::1] (port=51350 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jSpAb-0008Ej-0P
	for lists+devel-orangefs@lfdr.de; Sun, 26 Apr 2020 17:50:37 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:35782)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <guoqing.jiang@cloud.ionos.com>)
 id 1jSpAZ-0008Cu-KR
 for devel@lists.orangefs.org; Sun, 26 Apr 2020 17:50:35 -0400
Received: by mail-ed1-f67.google.com with SMTP id a8so12026961edv.2
 for <devel@lists.orangefs.org>; Sun, 26 Apr 2020 14:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qimnPXc/z1dTWaJyW3qhOlSkB0/PAvYb4yEUYXtkvBs=;
 b=Gm5iEQRGXjL2eUupRJ1Bh30r73SUBX84ADcBLaYreiF3hSkQEWeKNIEUgAFgJLtLMv
 wPfZtMjOqDacKdHwqWjWK8uVQ188OIkqVCt146DjBGGH399nUPOYIlJkSW4dfDknFdUF
 7MZbSYWDEpgvMg69WJ+M7z5zshqFGp9auxPkebka7dLFCiHYBwsu5dsfZgALElUrvwf8
 DMOqEwdKpZ2bPipHuh1KAjPEo3Qe2sEvSDGUJU0QwVaiR6GH/gZlDzprRcFZ2Ke6EyZ9
 yUX9cBs8ilZZTyPKS+PUWadroC9CcJIR2cNNDoHBKSUR8zw2YRZtoZQ+7apQE5HafRd2
 Sbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qimnPXc/z1dTWaJyW3qhOlSkB0/PAvYb4yEUYXtkvBs=;
 b=PWyK/1QSZMJM4whR2iNuiw1Bd93ZaoO/048vlhVU1zV8OXuf5kTQ1HzKxpi8gMgq7G
 f54G70Y5MD6ivLewdc+PZqnMYBqVQjpBpxTyyVIrPEeLjdrVN9390roKUQ2/BZIvReh7
 VI3RHi67/IN/Q7hFZlL6A9g/MV03ulVBZDOFhlwUu0LVl8hkjndXz+BdO5B3gBmIq7Mv
 04MDX/7Pjdyo8cZWFw215RK30gby8svvUH8RozGgJzClt5qmke9BATsRGW7WhU/S59y4
 Ftj0G6tZB1lxRFGYJhxns/XlHKGy2b5YxAGjHb9C89k7mNpELoMNGDe3PJKOPLxQNEAo
 Qh7Q==
X-Gm-Message-State: AGi0PuZVn1qPLbFw7WDTyLuwGfYxR3F4BvNP/8nLMnNMag2vKxgcSttk
 o2IqvIOVYqUKc9wplUuhQK9frQ==
X-Google-Smtp-Source: APiQypIxdj3EgE49EVNEoQZtKa8LHmNouU6TNbFXBP16dEsDxvsw1UYgQ/dUsGDgJvJe0Ig5v2bGJQ==
X-Received: by 2002:a50:c3c2:: with SMTP id i2mr15735367edf.93.1587937794634; 
 Sun, 26 Apr 2020 14:49:54 -0700 (PDT)
Received: from ls00508.pb.local ([2001:1438:4010:2540:fab1:56ff:feab:56b1])
 by smtp.gmail.com with ESMTPSA id ce18sm2270108ejb.61.2020.04.26.14.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2020 14:49:54 -0700 (PDT)
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 8/9] orangefs: use set/clear_fs_page_private
Date: Sun, 26 Apr 2020 23:49:24 +0200
Message-Id: <20200426214925.10970-9-guoqing.jiang@cloud.ionos.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200426214925.10970-1-guoqing.jiang@cloud.ionos.com>
References: <20200426214925.10970-1-guoqing.jiang@cloud.ionos.com>
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
 fs/orangefs/inode.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
index 12ae630fbed7..893099d36e20 100644
--- a/fs/orangefs/inode.c
+++ b/fs/orangefs/inode.c
@@ -64,9 +64,7 @@ static int orangefs_writepage_locked(struct page *page,
 	}
 	if (wr) {
 		kfree(wr);
-		set_page_private(page, 0);
-		ClearPagePrivate(page);
-		put_page(page);
+		clear_fs_page_private(page);
 	}
 	return ret;
 }
@@ -409,9 +407,7 @@ static int orangefs_write_begin(struct file *file,
 	wr->len = len;
 	wr->uid = current_fsuid();
 	wr->gid = current_fsgid();
-	SetPagePrivate(page);
-	set_page_private(page, (unsigned long)wr);
-	get_page(page);
+	set_fs_page_private(page, wr);
 okay:
 	return 0;
 }
@@ -460,17 +456,13 @@ static void orangefs_invalidatepage(struct page *page,
 
 	if (offset == 0 && length == PAGE_SIZE) {
 		kfree((struct orangefs_write_range *)page_private(page));
-		set_page_private(page, 0);
-		ClearPagePrivate(page);
-		put_page(page);
+		clear_fs_page_private(page);
 		return;
 	/* write range entirely within invalidate range (or equal) */
 	} else if (page_offset(page) + offset <= wr->pos &&
 	    wr->pos + wr->len <= page_offset(page) + offset + length) {
 		kfree((struct orangefs_write_range *)page_private(page));
-		set_page_private(page, 0);
-		ClearPagePrivate(page);
-		put_page(page);
+		clear_fs_page_private(page);
 		/* XXX is this right? only caller in fs */
 		cancel_dirty_page(page);
 		return;
@@ -537,9 +529,7 @@ static void orangefs_freepage(struct page *page)
 {
 	if (PagePrivate(page)) {
 		kfree((struct orangefs_write_range *)page_private(page));
-		set_page_private(page, 0);
-		ClearPagePrivate(page);
-		put_page(page);
+		clear_fs_page_private(page);
 	}
 }
 
@@ -740,9 +730,7 @@ vm_fault_t orangefs_page_mkwrite(struct vm_fault *vmf)
 	wr->len = PAGE_SIZE;
 	wr->uid = current_fsuid();
 	wr->gid = current_fsgid();
-	SetPagePrivate(page);
-	set_page_private(page, (unsigned long)wr);
-	get_page(page);
+	set_fs_page_private(page, wr);
 okay:
 
 	file_update_time(vmf->vma->vm_file);
-- 
2.17.1


