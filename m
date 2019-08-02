Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE2A7E855
	for <lists+devel-orangefs@lfdr.de>; Fri,  2 Aug 2019 04:21:21 +0200 (CEST)
Received: from [::1] (port=51084 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1htNC4-0007qr-6Q
	for lists+devel-orangefs@lfdr.de; Thu, 01 Aug 2019 22:21:20 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42998)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1htNC2-0007iz-By
 for devel@lists.orangefs.org; Thu, 01 Aug 2019 22:21:18 -0400
Received: by mail-pf1-f196.google.com with SMTP id q10so35138231pff.9
 for <devel@lists.orangefs.org>; Thu, 01 Aug 2019 19:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CBO3xGCo70BH915jG2N5Cwh2jdAxvuNp3xf6kgL3BUo=;
 b=ICzJUrYTaIdsry/DtrBHUvha+R1kZxiR3TimqNDYFmB7o5jfa7m5UsfpaX/zpz7gqG
 QDNhfomKE98We8ADhaaApqL24L4GLju/2Iqw8fB/Gdc8zIwCPKElMlCmrcylshjiY6HA
 Wpq/jdgFFEI2UXPzsw4kiY3k+2UuXyC1t4Wgx970D5YK3PPwUf+ffB7bQXfIs3z5ka8f
 jIxsm6PzFlXfLaS3w/r9zrOwtEfiVXxBJ3zPq4sXYknfWxx8T3YIHBMUaH+laDDR6clX
 EbIaZCmFhhDYcIMZgiNQmuBlXcj32bO5TFJ498KeDHFEPtpyis1t2GqB2XiuUnW1fIm6
 uMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CBO3xGCo70BH915jG2N5Cwh2jdAxvuNp3xf6kgL3BUo=;
 b=T/EJCCpcEF+jawEZZ2sPRpaAaLzgJwNc9GoDtc8WEcxV+6+bYUqh+9fVyY+zgzYCg5
 J0Zooznorv7tGsWSopbp5klkkVs+2Vp2aqarOF1eI6lKT3QoXpKKsC4xYfSv3FyDkT6F
 kJ1ELykst7agWLxp5Te9Gvw+Qf17E7ubgxV8lnh8o+gmaTSpxdiGWejTzJYEdPHdJ2rL
 J70ZoszwtoHN8zdjm8U2eVy+tzSpGURGt57Rx4mH66mHXWIpkbpcTKpKIa8gvRPYQSHX
 Gz/gp31E6Kz5v8sj+cMEuGkph1frGxgd6DjX9yXHGlVdC2CTN+o4K2Tx7hiHL7yP53Gx
 5hGQ==
X-Gm-Message-State: APjAAAVYCvZ+VGVPbfmXCQGUOAPRIXtGv+AgX+hSHNQCaTOAuC+M0ETT
 eyOWbL0kjUtjMj3w6kttvVE=
X-Google-Smtp-Source: APXvYqxkmOrmri+Wx3FPhMPhDHr4oTLl0gd58UJ9/zI2U5cFZ+LG43cVChESIiZ/iGIXbamewPD5YA==
X-Received: by 2002:a65:51c1:: with SMTP id i1mr101132075pgq.417.1564712437381; 
 Thu, 01 Aug 2019 19:20:37 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:36 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 16/34] drivers/tee: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:47 -0700
Message-Id: <20190802022005.5117-17-jhubbard@nvidia.com>
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
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jens Wiklander <jens.wiklander@linaro.org>
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

Cc: Jens Wiklander <jens.wiklander@linaro.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/tee/tee_shm.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index 2da026fd12c9..c967d0420b67 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -31,16 +31,13 @@ static void tee_shm_release(struct tee_shm *shm)
 
 		poolm->ops->free(poolm, shm);
 	} else if (shm->flags & TEE_SHM_REGISTER) {
-		size_t n;
 		int rc = teedev->desc->ops->shm_unregister(shm->ctx, shm);
 
 		if (rc)
 			dev_err(teedev->dev.parent,
 				"unregister shm %p failed: %d", shm, rc);
 
-		for (n = 0; n < shm->num_pages; n++)
-			put_page(shm->pages[n]);
-
+		put_user_pages(shm->pages, shm->num_pages);
 		kfree(shm->pages);
 	}
 
@@ -313,16 +310,13 @@ struct tee_shm *tee_shm_register(struct tee_context *ctx, unsigned long addr,
 	return shm;
 err:
 	if (shm) {
-		size_t n;
-
 		if (shm->id >= 0) {
 			mutex_lock(&teedev->mutex);
 			idr_remove(&teedev->idr, shm->id);
 			mutex_unlock(&teedev->mutex);
 		}
 		if (shm->pages) {
-			for (n = 0; n < shm->num_pages; n++)
-				put_page(shm->pages[n]);
+			put_user_pages(shm->pages, shm->num_pages);
 			kfree(shm->pages);
 		}
 	}
-- 
2.22.0


