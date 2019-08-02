Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id A747A7E84E
	for <lists+devel-orangefs@lfdr.de>; Fri,  2 Aug 2019 04:21:13 +0200 (CEST)
Received: from [::1] (port=51020 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1htNBw-0007pH-Tz
	for lists+devel-orangefs@lfdr.de; Thu, 01 Aug 2019 22:21:12 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45215)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1htNBv-0007iv-OS
 for devel@lists.orangefs.org; Thu, 01 Aug 2019 22:21:11 -0400
Received: by mail-pl1-f193.google.com with SMTP id y8so33025105plr.12
 for <devel@lists.orangefs.org>; Thu, 01 Aug 2019 19:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qtbgyNHZ/W16Wsr49ObVlGXNsYs5Ix8cECAWpHw8QNg=;
 b=RO5t4Ioq4WOEkql+z1BxTA9XpQ5l0uBsUNJdBVpEbEdDpylZNAFokBSBfkt63Vmsnw
 KKnFnDLW2SLxaXe4yEcd4Uwphs0F9rh9yrBF7wrtI6jX7Smsup4E8B+OCU5PAghiuPUe
 n/rru2nRkN4fBDLxv0E5LWIc3+ez3bVuBV4gRzIu0YbbR7/jG/nHlqRg4ui2ABpoKbbs
 zzA9SmSgidMvseL2Kb+bN8XRYc2qyorbmCL2eKn81WG2j5TabLu8TlIG3hp8Y7Gq/i02
 vYgsWfOu94xgHEddrADmlOmkGGALS2TQwhC3ZfS61Jjz+jw13+1q5hfNRcQVjxbv88fI
 6ULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qtbgyNHZ/W16Wsr49ObVlGXNsYs5Ix8cECAWpHw8QNg=;
 b=qpHHDakTSSOeb7nfxW1M6t7D+vy4CH/cVr4zSmueOzUbj49wkF/uiXHtNkg90dRpRU
 74pahSeMr2Q4enpzkAD7hkI/V+MD7k5cQQkh68r3CStdrAUedJc73diYU2xJyuKF3SYB
 9IPoF12lNfqsz8aPa44A+AYT6qXQkFC1HutaVXck/PMUb+5U713MhADGwHDWPzd88xjJ
 mCF58FXlAw/Ajt9Am0S+6wtTKoNePkyNI3kwFuhu5qaa6p8OFwcQcyIpUt5l4F248bkX
 0hc6MMh85vRzUNS7JsVMjYqtDpPNU4gIw4ePxQ7pXNGwcHLWAWFY2w3t51/ENGeIYjQC
 C5tw==
X-Gm-Message-State: APjAAAUMQWHf3G0e1Q/Y2VmSsFI6WtkFuCrRWBc2Tday4jmW+f989H5+
 IFPqvVZhtT1jXCz+m2GbXZ8=
X-Google-Smtp-Source: APXvYqwKrOY4Kztkj41s0a6oi7zayzaXd8LpjaiCIksbrU4wJsvnJgU6mF0Bb9Hw/Pj5xfTEZIafcQ==
X-Received: by 2002:a17:902:5ac4:: with SMTP id
 g4mr131986648plm.80.1564712430821; 
 Thu, 01 Aug 2019 19:20:30 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:30 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 12/34] vmci: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:43 -0700
Message-Id: <20190802022005.5117-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
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

From: John Hubbard <jhubbard@nvidia.com>

For pages that were retained via get_user_pages*(), release those pages
via the new put_user_page*() routines, instead of via put_page() or
release_pages().

This is part a tree-wide conversion, as described in commit fc1d8e7cca2d
("mm: introduce put_user_page*(), placeholder versions").

Note that this effectively changes the code's behavior in
qp_release_pages(): it now ultimately calls set_page_dirty_lock(),
instead of set_page_dirty(). This is probably more accurate.

As Christophe Hellwig put it, "set_page_dirty() is only safe if we are
dealing with a file backed page where we have reference on the inode it
hangs off." [1]

[1] https://lore.kernel.org/r/20190723153640.GB720@lst.de

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Kees Cook <keescook@chromium.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/misc/vmw_vmci/vmci_context.c    |  2 +-
 drivers/misc/vmw_vmci/vmci_queue_pair.c | 11 ++---------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_context.c b/drivers/misc/vmw_vmci/vmci_context.c
index 16695366ec92..9daa52ee63b7 100644
--- a/drivers/misc/vmw_vmci/vmci_context.c
+++ b/drivers/misc/vmw_vmci/vmci_context.c
@@ -587,7 +587,7 @@ void vmci_ctx_unset_notify(struct vmci_ctx *context)
 
 	if (notify_page) {
 		kunmap(notify_page);
-		put_page(notify_page);
+		put_user_page(notify_page);
 	}
 }
 
diff --git a/drivers/misc/vmw_vmci/vmci_queue_pair.c b/drivers/misc/vmw_vmci/vmci_queue_pair.c
index 8531ae781195..e5434551d0ef 100644
--- a/drivers/misc/vmw_vmci/vmci_queue_pair.c
+++ b/drivers/misc/vmw_vmci/vmci_queue_pair.c
@@ -626,15 +626,8 @@ static void qp_release_queue_mutex(struct vmci_queue *queue)
 static void qp_release_pages(struct page **pages,
 			     u64 num_pages, bool dirty)
 {
-	int i;
-
-	for (i = 0; i < num_pages; i++) {
-		if (dirty)
-			set_page_dirty(pages[i]);
-
-		put_page(pages[i]);
-		pages[i] = NULL;
-	}
+	put_user_pages_dirty_lock(pages, num_pages, dirty);
+	memset(pages, 0, num_pages * sizeof(struct page *));
 }
 
 /*
-- 
2.22.0


