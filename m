Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 4801180D4B
	for <lists+devel-orangefs@lfdr.de>; Mon,  5 Aug 2019 00:50:24 +0200 (CEST)
Received: from [::1] (port=45988 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1huPKZ-0002Pd-HN
	for lists+devel-orangefs@lfdr.de; Sun, 04 Aug 2019 18:50:23 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46506)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1huPKY-0002Dt-EK
 for devel@lists.orangefs.org; Sun, 04 Aug 2019 18:50:22 -0400
Received: by mail-pg1-f193.google.com with SMTP id w3so1455097pgt.13
 for <devel@lists.orangefs.org>; Sun, 04 Aug 2019 15:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6zqhiQUR/t5HSZML/x55nFGZKGW5GK1LULKEmO0k7kA=;
 b=hu5YrExV2sbaBMNc30Tq7LBcjGDWN6fA4XsdWSIq37Gwal4TYkzXoLBSc1aN7i+AE1
 bVIm03I7zSnUPoNc0DrhbAQOAdTqkzN/WZ5+3xyT5kplICRjLk7gnM7AiECUFxJQtYf8
 l/vpyueUrdUTa6ElP3ExxKx8ue3ogMcet3zTMrly4eFXGYC31urxAGlYkrOSMCRCSnIc
 Arzc564JY6ON2HabMEPBcS/dFGMN4ODa4koUgN5YXXQfy4c5GL3kiXmJTl6qra2xMUY4
 X0U+ntdMZNCalKgfycF+64XZ+c1uJzhUDj8x9G9dxye9pgPlZzglleDcPGTS1gL3JdjR
 +zXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6zqhiQUR/t5HSZML/x55nFGZKGW5GK1LULKEmO0k7kA=;
 b=EGX+CToLJ3bP7iAEqvNsv/TNSFNdxlIYNP8l3V7U04Q+3fCVD5vfNsYCSfmsUYdr/W
 hl4VV7qemsDZ/P/m7wWISRXpNJ+JkwNk/hAuIp5JsM5moVbiGcuyY3EnzYjNMA2cmcZ8
 vo4/ELvW2uzfZvRyKu9tuvETXeO/c7OrrVlUDHbQ+SzMunnUJsFadh12JNZngkcZE2as
 6GdZfuph0rPxtq//he3dfyY3DoJcu/5SlOQM+Oh/aWgYCXZtwfcfMokshAvsnnG46mo6
 1PBopmAbj26VE733b6mygKYJuI/T+IgLX7L9Qm3a46x3M5rXi5ofqlviCZL+xDQnBLgN
 gWMw==
X-Gm-Message-State: APjAAAWsDHBLbA/7bu7rB9P9nwQcJux1i2QFnEkmqxbTEA2T2/xptMAp
 XbvxVFhftRNFh5YQ7h+leHM=
X-Google-Smtp-Source: APXvYqzKlxaRYSDqTrQ5Buu3RAMAQLfm5nyXOzRFCQZdRK9SX2nPkzOnWKnTtQrduQ4tH9q8VfqmlA==
X-Received: by 2002:a62:b408:: with SMTP id h8mr68625605pfn.46.1564958981600; 
 Sun, 04 Aug 2019 15:49:41 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:41 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 14/34] oradax: convert put_page() to put_user_page*()
Date: Sun,  4 Aug 2019 15:48:55 -0700
Message-Id: <20190804224915.28669-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
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
Cc: linux-fbdev@vger.kernel.org, Rob Gardner <rob.gardner@oracle.com>,
 Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Wei Yongjun <weiyongjun1@huawei.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Jonathan Helman <jonathan.helman@oracle.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
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

Cc: David S. Miller <davem@davemloft.net>
Cc: Jonathan Helman <jonathan.helman@oracle.com>
Cc: Rob Gardner <rob.gardner@oracle.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: sparclinux@vger.kernel.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/sbus/char/oradax.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/sbus/char/oradax.c b/drivers/sbus/char/oradax.c
index 8af216287a84..029e619992fc 100644
--- a/drivers/sbus/char/oradax.c
+++ b/drivers/sbus/char/oradax.c
@@ -412,7 +412,7 @@ static void dax_unlock_pages(struct dax_ctx *ctx, int ccb_index, int nelem)
 				dax_dbg("freeing page %p", p);
 				if (j == OUT)
 					set_page_dirty(p);
-				put_page(p);
+				put_user_page(p);
 				ctx->pages[i][j] = NULL;
 			}
 		}
-- 
2.22.0


