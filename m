Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id BC93D1C09B7
	for <lists+devel-orangefs@lfdr.de>; Thu, 30 Apr 2020 23:53:27 +0200 (CEST)
Received: from [::1] (port=47872 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jUH7X-0007fs-1H
	for lists+devel-orangefs@lfdr.de; Thu, 30 Apr 2020 17:53:27 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46248)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <guoqing.jiang@cloud.ionos.com>)
 id 1jUH7W-0007fK-0d
 for devel@lists.orangefs.org; Thu, 30 Apr 2020 17:53:26 -0400
Received: by mail-ed1-f65.google.com with SMTP id l3so5785705edq.13
 for <devel@lists.orangefs.org>; Thu, 30 Apr 2020 14:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0x0u2gx9fn/eR0FN5+bPGwv0n6eHZLnbohIE4ZZX1xA=;
 b=EKSoG5Ew33JLpPLoDYTtE+/Mgaiip4zvgBvwtrD+hzLSfo0W4PoRueJtf0vHDfylth
 bljRy4d4FM68XWGdNeOkwmfpot8DYA8ccYVAgwhAOhIi49XGb7to4+pAAZneDZCwf4G6
 IkFcj1IZ9Qq8NOMnothYcg8j2FPeyvEg43skasH+eZw77B+t7Qfs+j68ULZzmwKal/h3
 9saDCk1g1y7x4x+j5cKc0w4eHvhoxpHehsWHYcMrqIF522cmVjrQX9TO1JsfPCvOuR/I
 zHxuTKM5R0LSq/EtBs1ZI6S/nV/ouTfbgPwVZmpLRJi6srnLa57HKoMQe8NfaoufTaQa
 mUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0x0u2gx9fn/eR0FN5+bPGwv0n6eHZLnbohIE4ZZX1xA=;
 b=Z7wdIkgp2NMYnyXHaCF2ia250U8nTcGjRHr6AfOtsS0InHaFnoFuKfTBm0M2gJPX0S
 tb7MDmmLOqG6+drPLCkd3rEtsBjCyIAUeVrc6giDWGWIj/2cch0WS2jRa0VCwvKGNZfh
 VUrEdpYqjQTxkZyeld+iv5us6f+wTTCVbfxC3bvX9eRNvnZmrpCQRwrqy0O0NwBBVeVl
 /G5q1jPLYSQ+Nh5CtElELdd+HPT4RXUbVf4uoDp1WxpBv89SrCyjuq1gTANq8u4jm1IQ
 hjazhbT3ugf+a/tcWdqth2+WyHRGaoHnY0FSA/BzhZqnXbrof5lJwFrQjPJB6CoKgCOk
 bdOQ==
X-Gm-Message-State: AGi0PuaaOTXO24SEzblnEn2IKWyj1pdehvYZ7OTff9HDbWf4fE8d1srR
 gB1NzLDueIXUT0SbeuRIDOeS5g==
X-Google-Smtp-Source: APiQypKmEI+P+Q9Igmy/Z+wtCcfy41Y3uqyWZUCr4Xom2jUvuVGNOvsSANgZbWuTvpeKE8zdOXrN5A==
X-Received: by 2002:aa7:ce0f:: with SMTP id d15mr995432edv.327.1588283565020; 
 Thu, 30 Apr 2020 14:52:45 -0700 (PDT)
Received: from ls00508.pb.local ([2001:1438:4010:2540:b82f:dfc:5e2a:e7cc])
 by smtp.gmail.com with ESMTPSA id f13sm92022ejd.2.2020.04.30.14.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 14:52:44 -0700 (PDT)
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH V2 8/9] orangefs: use attach/clear_page_private
Date: Thu, 30 Apr 2020 23:44:49 +0200
Message-Id: <20200430214450.10662-9-guoqing.jiang@cloud.ionos.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430214450.10662-1-guoqing.jiang@cloud.ionos.com>
References: <20200430214450.10662-1-guoqing.jiang@cloud.ionos.com>
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
RFC -> RFC V2
1. change the name of new functions to attach/clear_page_private.
2. avoid potential use-after-free as suggested by Dave Chinner.

 fs/orangefs/inode.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
index 12ae630fbed7..139c450aca68 100644
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
+	kfree(clear_page_private(page));
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
+		kfree(clear_page_private(page));
 		return;
 	/* write range entirely within invalidate range (or equal) */
 	} else if (page_offset(page) + offset <= wr->pos &&
 	    wr->pos + wr->len <= page_offset(page) + offset + length) {
-		kfree((struct orangefs_write_range *)page_private(page));
-		set_page_private(page, 0);
-		ClearPagePrivate(page);
-		put_page(page);
+		kfree(clear_page_private(page));
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
+	kfree(clear_page_private(page));
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


