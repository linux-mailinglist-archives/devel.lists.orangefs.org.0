Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id CB14083F35
	for <lists+devel-orangefs@lfdr.de>; Wed,  7 Aug 2019 03:34:54 +0200 (CEST)
Received: from [::1] (port=55740 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hvAqs-00005p-2G
	for lists+devel-orangefs@lfdr.de; Tue, 06 Aug 2019 21:34:54 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36134)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1hvAqr-0008Qk-0T
 for devel@lists.orangefs.org; Tue, 06 Aug 2019 21:34:53 -0400
Received: by mail-pg1-f195.google.com with SMTP id l21so42540224pgm.3
 for <devel@lists.orangefs.org>; Tue, 06 Aug 2019 18:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JsaN0a6ImilSblrGqgWWjtVL4aaUVqoBD3LMggUShuU=;
 b=GqUNc3X3RUD+fMQ/tQov0eVptsX6vtpAZn07Fz7EwuEqRFmPs6eCUIqWfymN9U5tJQ
 Hp7GWk6oPhSKnPDc9mTSSc0b1ETtX6WZgNyVT9i/ZAc9DVX2wgidQTYQD678snuo6Uld
 OC0AxpA2rwU9kzsgxg4J7222NtI9nwWIQ3kKBxRvKJz1x31XBYs72NYIFgvDtQhOtH6x
 c30ljXQcc0npojtfiU8d5Zil2HhFRjkicdzBOPLsXrn4hkS7yUXDhahjzIOv/1HcFIxR
 8vAP8M1yLlIpgKytXt/GLUCaDmX+n+gX0JAtjCLQsjpUrzEN6iMEgLfOxOdX4VT9I1MD
 gqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JsaN0a6ImilSblrGqgWWjtVL4aaUVqoBD3LMggUShuU=;
 b=Cx6V5AuS8pMK+cDP2ph+tQWcoazIJecPQoa20FF/hCp3eTQcIlmfFtC9wNT4NTuh6f
 Pomb7HjDFbmPrka4/Ty0m1NI5JCDSal/20Lv+FzIWcYoFCIGkESuIzEFr+g4A3TqBJoq
 9/vCelal0omE6gAvHe9wUYNZIeojBNrutXzJDtiNeQO4ajZ3hnJWnIEi8u8USEE5FKxz
 c96HUsTRA4rRqn6UJAvCoqerTX9uCSV3W1yQY1rCuTfXkip13IwtN2TPxdH0/q6bc7aB
 61Ougen8S0P6Mtp3aYK3CAwa6KaMHuxhIhZ+Ig16MUDFFpEDoa02E/dhs0xJerNNJVp1
 c5SA==
X-Gm-Message-State: APjAAAU1owjX7rRxTvM2ZL1ZGpO4dNIA0JECyYfI/sy7qZs93vYicsHI
 QhAEc3dzx7pMX2O6K3dUsD4=
X-Google-Smtp-Source: APXvYqxA3xyoDOQ03wz3+MrAsxUgDjCiiP1q/97dVlMDAvCMqLwWlj7LgNPejGHFGrv69vRcUlGBpA==
X-Received: by 2002:a63:3112:: with SMTP id x18mr5571166pgx.385.1565141652072; 
 Tue, 06 Aug 2019 18:34:12 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:11 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 17/41] staging/vc04_services: convert put_page() to
 put_user_page*()
Date: Tue,  6 Aug 2019 18:33:16 -0700
Message-Id: <20190807013340.9706-18-jhubbard@nvidia.com>
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
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
 Suniel Mahesh <sunil.m@techveda.org>, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Mihaela Muraru <mihaela.muraru21@gmail.com>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Kishore KP <kishore.p@techveda.org>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 Sidong Yang <realwakka@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, Eric Anholt <eric@anholt.net>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>
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

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Cc: Eric Anholt <eric@anholt.net>
Cc: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mihaela Muraru <mihaela.muraru21@gmail.com>
Cc: Suniel Mahesh <sunil.m@techveda.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Sidong Yang <realwakka@gmail.com>
Cc: Kishore KP <kishore.p@techveda.org>
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: devel@driverdev.osuosl.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_2835_arm.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
index 61c69f353cdb..ec92b4c50e95 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
@@ -336,10 +336,7 @@ cleanup_pagelistinfo(struct vchiq_pagelist_info *pagelistinfo)
 	}
 
 	if (pagelistinfo->pages_need_release) {
-		unsigned int i;
-
-		for (i = 0; i < pagelistinfo->num_pages; i++)
-			put_page(pagelistinfo->pages[i]);
+		put_user_pages(pagelistinfo->pages, pagelistinfo->num_pages);
 	}
 
 	dma_free_coherent(g_dev, pagelistinfo->pagelist_buffer_size,
@@ -454,10 +451,7 @@ create_pagelist(char __user *buf, size_t count, unsigned short type)
 				       __func__, actual_pages, num_pages);
 
 			/* This is probably due to the process being killed */
-			while (actual_pages > 0) {
-				actual_pages--;
-				put_page(pages[actual_pages]);
-			}
+			put_user_pages(pages, actual_pages);
 			cleanup_pagelistinfo(pagelistinfo);
 			return NULL;
 		}
-- 
2.22.0


