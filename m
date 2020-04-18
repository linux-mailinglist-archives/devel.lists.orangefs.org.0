Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB911AF5BA
	for <lists+devel-orangefs@lfdr.de>; Sun, 19 Apr 2020 00:52:14 +0200 (CEST)
Received: from [::1] (port=56650 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jPwJp-00013W-Aj
	for lists+devel-orangefs@lfdr.de; Sat, 18 Apr 2020 18:52:13 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45670)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <guoqing.jiang@cloud.ionos.com>)
 id 1jPwJo-000136-EH
 for devel@lists.orangefs.org; Sat, 18 Apr 2020 18:52:12 -0400
Received: by mail-ed1-f66.google.com with SMTP id f12so4338417edn.12
 for <devel@lists.orangefs.org>; Sat, 18 Apr 2020 15:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LJG/tvH74vPoZBWRmNdYjJBmTLQ93YDBV04Re8a/V+U=;
 b=KFN2BQBgovkjPW//Nj/G8X+du1tRzLXj3PCGFEzq/F5Zsi2k2lzaSPr7Eim84Z00wY
 o4Zc/B9YK556Iq9QhV8vk+JD5GbiG6musD/+6BRa8VHL62dCSI+QUoXisnlz9uIMXMHL
 yiWinSld4vUf9bOMhpCaheaghCuxM9BftbPgd0nAKIvsEAeug2B3rCDtofQvM3+nkGhF
 oSqB6MiYRP+75flGNSdr2NK6HCegAL+XJ75G/Fjv0QjR27pJNR+BcYg+UX/UXM10NTYj
 Zc+MD8TwBw0tfPOef1OUjuzMoceCf6+juHrK0ycAyga1RwV58qs7ET/d/p2X775r6S30
 IXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LJG/tvH74vPoZBWRmNdYjJBmTLQ93YDBV04Re8a/V+U=;
 b=VTVbIFqqDwzyBH8Ay4MOj4iF1kJaVbYaV4D5VrvVOk2ajjFqFKjPAsOztVhOTzjgKT
 mALPsjg/bGnscHHw6dfsZu936yXAS4LzNVDhToa+3t2MJm45fUROWMaukMLao6bo/Rtb
 b6BCsb+DeNq7gZz8zctANkolX0AcbqzBHA6+fSKl6yviANDF7XGN8ltG9KmbaDPBbl5g
 4U0TMzeTi8F7cR9Bqs4D3YFTWPQPOzFTV2FaqME5ZR4nuCwEShegZ+o6rDC6NCO412pv
 H6v4RIzdFtk+dr1ce1jAF0SeBwNCLyDYCWpSVlMwyIrZ0H8nMBKJQ9SAwT23s3wMq53+
 hN1Q==
X-Gm-Message-State: AGi0PuYBwjrSCvuaiHVQ4Yh/672OfQqmEP+naW9Wd8YqjTdUrfpHN8iM
 O+y4YbYHbVC07RcaVVgSL3AZRA==
X-Google-Smtp-Source: APiQypJovF9nvn1Yr9ZkK7hvEAqP4GrPPtpF1BNuB0WcmsdP6W/7lfIf/XIOf4WoWYBYdHzCtr5a9g==
X-Received: by 2002:aa7:d056:: with SMTP id n22mr8533808edo.281.1587250291361; 
 Sat, 18 Apr 2020 15:51:31 -0700 (PDT)
Received: from ls00508.pb.local ([2001:1438:4010:2540:6c58:b8bc:cdc6:2e2d])
 by smtp.gmail.com with ESMTPSA id g21sm2616767ejm.79.2020.04.18.15.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 15:51:30 -0700 (PDT)
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
To: linux-fsdevel@vger.kernel.org
Subject: [RFC PATCH 4/5] orangefs: call __clear_page_buffers to simplify code
Date: Sun, 19 Apr 2020 00:51:22 +0200
Message-Id: <20200418225123.31850-5-guoqing.jiang@cloud.ionos.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200418225123.31850-1-guoqing.jiang@cloud.ionos.com>
References: <20200418225123.31850-1-guoqing.jiang@cloud.ionos.com>
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
Cc: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>, devel@lists.orangefs.org
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

Since __clear_page_buffers is exported, we can call __clear_page_buffers
to simplify code in the four places.

Cc: Mike Marshall <hubcap@omnibond.com>
Cc: Martin Brandenburg <martin@omnibond.com>
Cc: devel@lists.orangefs.org
Signed-off-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
---
The order for set_page_private and ClearPagePrivate is swapped in
__clear_page_buffers, not sure it is identical or not, so this is
RFC.

Thanks,
Guoqing

 fs/orangefs/inode.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
index 12ae630fbed7..8e1591d8bf24 100644
--- a/fs/orangefs/inode.c
+++ b/fs/orangefs/inode.c
@@ -11,6 +11,7 @@
  */
 
 #include <linux/bvec.h>
+#include <linux/buffer_head.h>
 #include "protocol.h"
 #include "orangefs-kernel.h"
 #include "orangefs-bufmap.h"
@@ -64,9 +65,7 @@ static int orangefs_writepage_locked(struct page *page,
 	}
 	if (wr) {
 		kfree(wr);
-		set_page_private(page, 0);
-		ClearPagePrivate(page);
-		put_page(page);
+		__clear_page_buffers(page);
 	}
 	return ret;
 }
@@ -460,17 +459,13 @@ static void orangefs_invalidatepage(struct page *page,
 
 	if (offset == 0 && length == PAGE_SIZE) {
 		kfree((struct orangefs_write_range *)page_private(page));
-		set_page_private(page, 0);
-		ClearPagePrivate(page);
-		put_page(page);
+		__clear_page_buffers(page);
 		return;
 	/* write range entirely within invalidate range (or equal) */
 	} else if (page_offset(page) + offset <= wr->pos &&
 	    wr->pos + wr->len <= page_offset(page) + offset + length) {
 		kfree((struct orangefs_write_range *)page_private(page));
-		set_page_private(page, 0);
-		ClearPagePrivate(page);
-		put_page(page);
+		__clear_page_buffers(page);
 		/* XXX is this right? only caller in fs */
 		cancel_dirty_page(page);
 		return;
@@ -537,9 +532,7 @@ static void orangefs_freepage(struct page *page)
 {
 	if (PagePrivate(page)) {
 		kfree((struct orangefs_write_range *)page_private(page));
-		set_page_private(page, 0);
-		ClearPagePrivate(page);
-		put_page(page);
+		__clear_page_buffers(page);
 	}
 }
 
-- 
2.17.1


