Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id E32661D6D92
	for <lists+devel-orangefs@lfdr.de>; Sun, 17 May 2020 23:48:14 +0200 (CEST)
Received: from [::1] (port=47824 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jaR8o-0008HK-5M
	for lists+devel-orangefs@lfdr.de; Sun, 17 May 2020 17:48:14 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37015)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <guoqing.jiang@cloud.ionos.com>)
 id 1jaR8m-0008Gk-CA
 for devel@lists.orangefs.org; Sun, 17 May 2020 17:48:12 -0400
Received: by mail-wr1-f66.google.com with SMTP id l17so9590428wrr.4
 for <devel@lists.orangefs.org>; Sun, 17 May 2020 14:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SlqZ0+quTzs0gn5rYjmOostsnZNRU9Vv8J3xoIiDfhs=;
 b=VH7rLkRs00e3V5j6MTq+VAW1I0RCxdyuX/WcaV/wa9Iy/hLbDu/JAqqn7zXKJbDEGe
 7F47zhLySh5dNxZxyclhRFKF0wNt3kETEBfy6OerjR5ey0QtZeUrdizcT+T470iMyvGx
 9X/4DVXkxs69mTJ4Plb2j4jqjG/1z/W/akCauTZlj0LcbZZsEDdkhLlmP1IYgaaKv4rW
 PCMiLRYgiKtewxDJ0eItQ6pu4VbREnHgEK5x8SvZAciW3k1YW5dCr7fZCcF/CunQj4Xn
 h33yzPtvGDakdH0PvDVtUNWap8a5MysQezDzHgZRnRz7TgYkxpXDxH/XWX9PlFvA7C2R
 0y9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SlqZ0+quTzs0gn5rYjmOostsnZNRU9Vv8J3xoIiDfhs=;
 b=oG71XwxxEGwUUrYxJ6dhNWiy3xmcw18jGZXf60Nb+FtOF6/L5rON5lrbz/5MpCBAd0
 uW2EAJBjirbGb9jd7zhZzuNEm5eJIXyvlDk/RrnP/tF4yBJCvjLlJnD57aZbQx6wQr7m
 hYkfLcel3hTgK49QDO04D76HHepW/xs2EcEHIFyzmyaBkETqrVlUiRbRLqOEvhYGLIQo
 v+vZlTpLLppUmL9X5L0Xmo2OIQ5g1YE14X/WPwwmWUVp8p5S9S82RYccsGgF9bVPKB+K
 /zQ82KqaFkvLpNkU5WwBuWdp/eaeOEFfFGQHx4y76qow5MvLll2y+Oxn8a70a3jfSxYu
 pUHA==
X-Gm-Message-State: AOAM530DULNFD1VJnG7G9yIu7TXQCWIhqRNurn6HeC8MbHj8lu/j1lu7
 5cLt4Bvinok0IE7oq682MeeJNA==
X-Google-Smtp-Source: ABdhPJza7OASSGVEI7sH52Q8TXauNBOHM5LsFEw9mjVCm8wvkCOSHgxfMNv0wdbu+ykEdVfLI5znaw==
X-Received: by 2002:a5d:438e:: with SMTP id i14mr16144528wrq.413.1589752051306; 
 Sun, 17 May 2020 14:47:31 -0700 (PDT)
Received: from ls00508.pb.local ([2001:1438:4010:2540:bc3e:92a1:7010:2763])
 by smtp.gmail.com with ESMTPSA id v126sm14441244wmb.4.2020.05.17.14.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 14:47:30 -0700 (PDT)
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
To: akpm@linux-foundation.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH 08/10] orangefs: use attach/detach_page_private
Date: Sun, 17 May 2020 23:47:16 +0200
Message-Id: <20200517214718.468-9-guoqing.jiang@cloud.ionos.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200517214718.468-1-guoqing.jiang@cloud.ionos.com>
References: <20200517214718.468-1-guoqing.jiang@cloud.ionos.com>
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
 linux-kernel@vger.kernel.org, willy@infradead.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, devel@lists.orangefs.org
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
No change since RFC V3.

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


