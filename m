Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 652B583F1E
	for <lists+devel-orangefs@lfdr.de>; Wed,  7 Aug 2019 03:34:43 +0200 (CEST)
Received: from [::1] (port=55644 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hvAqg-0008Uq-J8
	for lists+devel-orangefs@lfdr.de; Tue, 06 Aug 2019 21:34:42 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:32854)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1hvAqf-0008Qd-Ab
 for devel@lists.orangefs.org; Tue, 06 Aug 2019 21:34:41 -0400
Received: by mail-pg1-f193.google.com with SMTP id n190so1730636pgn.0
 for <devel@lists.orangefs.org>; Tue, 06 Aug 2019 18:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=51+On65LrNSvXr2lp5EjmvkWwZiof+VzaE7I05DxrV4=;
 b=HS5hgHLQTuHN2Sn9FeJ7Ry9Shi37CsQ8JBuMgzW+QMGy5IXf/RFsCZt6S1x06XBeQi
 DnjGCaTAaZsljEKwzFgSKCv3YKZyY9LJk5C71dTnu0TTqdIkluqZnGH65tZnImTYNKAd
 2pWlz2fyn5+MKPzhhgK7Nc+MXto5LZw4BYu52Kq3r1UDWXa+Eo9UCDH4MczS5x/pQmnw
 VRUedCXK07PgrjjNVT2/ovRym41o4od9NHcnmASHKSTmbkxw8flhZPB1nOgA8m/sENwh
 Lvo4EfzFR3bHyNsXSJiKXO3OmKyrCfkmolY0a3G9Y5UDT+HZQc4MDN5LW5udmGwvXApo
 r3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=51+On65LrNSvXr2lp5EjmvkWwZiof+VzaE7I05DxrV4=;
 b=TH1RDuNzBxU1zN/kADr3ADMn8oDKN/7tvEsfqo+/5OHisvH1STHO4fw9HLiEFD5Y8u
 mOJnkv0msOEJ1Hpo1AIMeBuKaJlNr7/FH8Tb7K7q/QGCPHeyACZlY5OF0OeAXdmxyQdY
 6jmA2jVj29+MwZz2KHlvmSWJNPlo42Gn9LQTB42IcPwAoUKazW8iCaEZNfvw9pMVl9i+
 5ZZIM71plFhKwNVuNGkUBi9r7MPL9h15LsPLeexenb0HWik9nx0Hldk2rcVL0FayUZIa
 LgmVgqZj345CHmGkzU4F2/pQw1sDok2Dpfzola/Vm7VdqUYsmQLSdAB0ZHIFDbkQqvEb
 662g==
X-Gm-Message-State: APjAAAWpE5C/ac6eW+1QgOlH3Aw68dgW16NRL/4njeQY16H2VdRULDMu
 gv0jR0efSXLhnO1xQFSpk8o=
X-Google-Smtp-Source: APXvYqyf93EQUF5J1TAu6cpDsM1o6JoPpYe+Wwb8uLsZYmcgqFaJy5X85xn6gzZV4mlFfmMiaJJNdA==
X-Received: by 2002:a17:90a:9f4a:: with SMTP id
 q10mr5945834pjv.95.1565141640357; 
 Tue, 06 Aug 2019 18:34:00 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.33.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:33:59 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 10/41] media/ivtv: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:09 -0700
Message-Id: <20190807013340.9706-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
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
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 Andy Walls <awalls@md.metrocast.net>, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org
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

Cc: Andy Walls <awalls@md.metrocast.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/media/pci/ivtv/ivtv-udma.c | 14 ++++----------
 drivers/media/pci/ivtv/ivtv-yuv.c  | 11 +++--------
 2 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-udma.c b/drivers/media/pci/ivtv/ivtv-udma.c
index 5f8883031c9c..7c7f33c2412b 100644
--- a/drivers/media/pci/ivtv/ivtv-udma.c
+++ b/drivers/media/pci/ivtv/ivtv-udma.c
@@ -92,7 +92,7 @@ int ivtv_udma_setup(struct ivtv *itv, unsigned long ivtv_dest_addr,
 {
 	struct ivtv_dma_page_info user_dma;
 	struct ivtv_user_dma *dma = &itv->udma;
-	int i, err;
+	int err;
 
 	IVTV_DEBUG_DMA("ivtv_udma_setup, dst: 0x%08x\n", (unsigned int)ivtv_dest_addr);
 
@@ -119,8 +119,7 @@ int ivtv_udma_setup(struct ivtv *itv, unsigned long ivtv_dest_addr,
 		IVTV_DEBUG_WARN("failed to map user pages, returned %d instead of %d\n",
 			   err, user_dma.page_count);
 		if (err >= 0) {
-			for (i = 0; i < err; i++)
-				put_page(dma->map[i]);
+			put_user_pages(dma->map, err);
 			return -EINVAL;
 		}
 		return err;
@@ -130,9 +129,7 @@ int ivtv_udma_setup(struct ivtv *itv, unsigned long ivtv_dest_addr,
 
 	/* Fill SG List with new values */
 	if (ivtv_udma_fill_sg_list(dma, &user_dma, 0) < 0) {
-		for (i = 0; i < dma->page_count; i++) {
-			put_page(dma->map[i]);
-		}
+		put_user_pages(dma->map, dma->page_count);
 		dma->page_count = 0;
 		return -ENOMEM;
 	}
@@ -153,7 +150,6 @@ int ivtv_udma_setup(struct ivtv *itv, unsigned long ivtv_dest_addr,
 void ivtv_udma_unmap(struct ivtv *itv)
 {
 	struct ivtv_user_dma *dma = &itv->udma;
-	int i;
 
 	IVTV_DEBUG_INFO("ivtv_unmap_user_dma\n");
 
@@ -170,9 +166,7 @@ void ivtv_udma_unmap(struct ivtv *itv)
 	ivtv_udma_sync_for_cpu(itv);
 
 	/* Release User Pages */
-	for (i = 0; i < dma->page_count; i++) {
-		put_page(dma->map[i]);
-	}
+	put_user_pages(dma->map, dma->page_count);
 	dma->page_count = 0;
 }
 
diff --git a/drivers/media/pci/ivtv/ivtv-yuv.c b/drivers/media/pci/ivtv/ivtv-yuv.c
index cd2fe2d444c0..2c61a11d391d 100644
--- a/drivers/media/pci/ivtv/ivtv-yuv.c
+++ b/drivers/media/pci/ivtv/ivtv-yuv.c
@@ -30,7 +30,6 @@ static int ivtv_yuv_prep_user_dma(struct ivtv *itv, struct ivtv_user_dma *dma,
 	struct yuv_playback_info *yi = &itv->yuv_info;
 	u8 frame = yi->draw_frame;
 	struct yuv_frame_info *f = &yi->new_frame_info[frame];
-	int i;
 	int y_pages, uv_pages;
 	unsigned long y_buffer_offset, uv_buffer_offset;
 	int y_decode_height, uv_decode_height, y_size;
@@ -81,8 +80,7 @@ static int ivtv_yuv_prep_user_dma(struct ivtv *itv, struct ivtv_user_dma *dma,
 				 uv_pages, uv_dma.page_count);
 
 			if (uv_pages >= 0) {
-				for (i = 0; i < uv_pages; i++)
-					put_page(dma->map[y_pages + i]);
+				put_user_pages(&dma->map[y_pages], uv_pages);
 				rc = -EFAULT;
 			} else {
 				rc = uv_pages;
@@ -93,8 +91,7 @@ static int ivtv_yuv_prep_user_dma(struct ivtv *itv, struct ivtv_user_dma *dma,
 				 y_pages, y_dma.page_count);
 		}
 		if (y_pages >= 0) {
-			for (i = 0; i < y_pages; i++)
-				put_page(dma->map[i]);
+			put_user_pages(dma->map, y_pages);
 			/*
 			 * Inherit the -EFAULT from rc's
 			 * initialization, but allow it to be
@@ -112,9 +109,7 @@ static int ivtv_yuv_prep_user_dma(struct ivtv *itv, struct ivtv_user_dma *dma,
 	/* Fill & map SG List */
 	if (ivtv_udma_fill_sg_list (dma, &uv_dma, ivtv_udma_fill_sg_list (dma, &y_dma, 0)) < 0) {
 		IVTV_DEBUG_WARN("could not allocate bounce buffers for highmem userspace buffers\n");
-		for (i = 0; i < dma->page_count; i++) {
-			put_page(dma->map[i]);
-		}
+		put_user_pages(dma->map, dma->page_count);
 		dma->page_count = 0;
 		return -ENOMEM;
 	}
-- 
2.22.0


