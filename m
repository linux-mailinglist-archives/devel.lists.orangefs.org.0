Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA3480D4F
	for <lists+devel-orangefs@lfdr.de>; Mon,  5 Aug 2019 00:50:27 +0200 (CEST)
Received: from [::1] (port=46016 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1huPKc-0002QP-M3
	for lists+devel-orangefs@lfdr.de; Sun, 04 Aug 2019 18:50:26 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46514)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1huPKb-0002EW-K5
 for devel@lists.orangefs.org; Sun, 04 Aug 2019 18:50:25 -0400
Received: by mail-pg1-f195.google.com with SMTP id w3so1455133pgt.13
 for <devel@lists.orangefs.org>; Sun, 04 Aug 2019 15:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kTcRkfjdEL9HxbTfItIV90QFm+wmUvO1k55I5bm4do4=;
 b=Ep9s674EttVY3vG9GU1V4CO0VAp8GtJx3E70Bw+ivefofNFR36jNbbRP9fe5FIQZE4
 umVMqO9egu8yEOZzzqqbwwV1I7DYNsWdtnMpjSDCOFHvVqNv36JvlrRHoOsRwSxTWTVP
 /zl1MVdDjGI3HP9tmkhM/nHneNlxFDUc/CIkN9kekhNbRfvwnuxQq6VAF9qYXEoT57y3
 qK7R3sgIPEBixUJFK2/dzWLhYDFU1YjPdLTEb28hPm7RM/mK7OCKl8gL81RQyvUkO6K/
 G7Yqf9jdy89IiWSIhZQ4nu37WAPJIhU0zlRaxZyxotIkxhGrgPKDGLU2Jo37XMi2DkW4
 GJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kTcRkfjdEL9HxbTfItIV90QFm+wmUvO1k55I5bm4do4=;
 b=luRHdo2la7n2NQsaMOejLkncW8hFWyXJME7DqykzP5fBNFaPkpnhlSlfb0bA/UFR6I
 FVk5HG5J/ytuiJOPeRDPLJ4QYZFnLnv0yi7zqgeEDnBFcxIVjHZ3IPSUxEiwgMjT5J4f
 aK5hy6IAQ60NJNhwyKHgQhJiyVHH9Y9VN8qmqLC84rk1D7xUMped5zb2UCWgvdmDtn06
 VSd2EaT+54BRHwgfNqTmLTlcQghfLC5l/FILXzXvBOMmhpuIDscrw7QKmj0bXX8friCF
 E1PZBOpcBWphydu9/X22nvfqHgU5t2C3pyUb1R/tAc9ila5JcZrBzP9KuM0GRZ6UhcAl
 bNhw==
X-Gm-Message-State: APjAAAUvjHBxQj77ssEg1LlHEp6xZ5p0U7PivzVfFcEtV8UnidHSHrxQ
 E1JhMDitkJ/99DYurIyrkos=
X-Google-Smtp-Source: APXvYqxK0LrtPmyfw6JWYh2YgP6+bfFhY9MmK0zn3g5ZQLaZJtrpA2Yd1v8gV+8lSuqs4iprBin/bw==
X-Received: by 2002:a63:c442:: with SMTP id m2mr4964322pgg.286.1564958984667; 
 Sun, 04 Aug 2019 15:49:44 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:44 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 16/34] drivers/tee: convert put_page() to put_user_page*()
Date: Sun,  4 Aug 2019 15:48:57 -0700
Message-Id: <20190804224915.28669-17-jhubbard@nvidia.com>
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

Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
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


