Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6F380D4A
	for <lists+devel-orangefs@lfdr.de>; Mon,  5 Aug 2019 00:50:23 +0200 (CEST)
Received: from [::1] (port=45974 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1huPKY-0002PC-Ea
	for lists+devel-orangefs@lfdr.de; Sun, 04 Aug 2019 18:50:22 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41112)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1huPKW-0002D8-RF
 for devel@lists.orangefs.org; Sun, 04 Aug 2019 18:50:20 -0400
Received: by mail-pf1-f196.google.com with SMTP id m30so38608241pff.8
 for <devel@lists.orangefs.org>; Sun, 04 Aug 2019 15:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=60C6UutqWDg70MnmR2wOYRHcozVv05mGJual4EWfkd0=;
 b=dlbSsRNX77Ei4qlHR7ScPLtFWbFA/wSFhYs9NQOll92MElLIHH0XM5uWEMJZOCpSZn
 fw6jxIpOESniygQ2CP+jqWxww/Yc9BpBnk334qu29zs2vzmgy87c6XuHVe23RKpRZPxO
 jThG9GtjK3Wnrebfh/rbMsq7112krYjWlIxKkWaUHxL2oFoS1RUMIQu8ytggftTKUFm3
 IZx5EXAb50Ed18W0N5uy/HOdcsYR51BeefJ+gL6tmEuCp3+fjY6YxhqUW4uaaLKgEtr0
 EwxJMkmMabXGRdUgV0PB/zPRqhRIlzaqolidM2g4cvymDIwFa+iZFzPQhAPl2KRAIsyu
 jBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=60C6UutqWDg70MnmR2wOYRHcozVv05mGJual4EWfkd0=;
 b=geBrIPjcGoLZzhtqMenfelt+zK2Mslpxjn+u+XkDhwfol/YsZImWV0N0/Kr2etgRDk
 YfAiiczdDJzDD0OtDlk2HvEjJ2XTKOWb6sx5cBwYtPj+PNCRD6m5abOt7qWS4GlYxM0G
 B0QS6GBqyM4GAS2nMdGkWmDvj/ny5x2YgAtq8P1OwRwyMMS0kn2skT899eyV+SiiDRLh
 YXh1CFTI+XovGTbiQSZ0CD28FLpN+x9/ROqSdG12XlTTx2yi6Md1Uj2JdL/VnykTM9LO
 tkJgVg31omgrVAoAI7ob9syhRUGeC8Qtaw9K6LpNA670pizzimygxRZufZwfZsmCJZ/B
 2VjQ==
X-Gm-Message-State: APjAAAXGKEO20xijzSjtO4CE+9UX2klQHEsYhoVkEvn3I31jOMzkYr7P
 x3l7rqgndneka2F/8DDufc4=
X-Google-Smtp-Source: APXvYqxgxAYQpO8e4Spo4W3ynw/PKZNsgndpQrQdEvTtqBpVU8mbg8ThNNd4XLW1NQVXChaVjFCWhA==
X-Received: by 2002:a05:6a00:4c:: with SMTP id
 i12mr70639006pfk.134.1564958979908; 
 Sun, 04 Aug 2019 15:49:39 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:39 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 13/34] rapidio: convert put_page() to put_user_page*()
Date: Sun,  4 Aug 2019 15:48:54 -0700
Message-Id: <20190804224915.28669-14-jhubbard@nvidia.com>
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
 Matt Porter <mporter@kernel.crashing.org>, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 Alexandre Bounine <alex.bou9@gmail.com>, linux-crypto@vger.kernel.org,
 Ioan Nicu <ioan.nicu.ext@nokia.com>, linux-fsdevel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Al Viro <viro@zeniv.linux.org.uk>
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

Cc: Matt Porter <mporter@kernel.crashing.org>
Cc: Alexandre Bounine <alex.bou9@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Logan Gunthorpe <logang@deltatee.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Ioan Nicu <ioan.nicu.ext@nokia.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/rapidio/devices/rio_mport_cdev.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/rapidio/devices/rio_mport_cdev.c b/drivers/rapidio/devices/rio_mport_cdev.c
index 8155f59ece38..0e8ea0e5a89e 100644
--- a/drivers/rapidio/devices/rio_mport_cdev.c
+++ b/drivers/rapidio/devices/rio_mport_cdev.c
@@ -572,14 +572,12 @@ static void dma_req_free(struct kref *ref)
 	struct mport_dma_req *req = container_of(ref, struct mport_dma_req,
 			refcount);
 	struct mport_cdev_priv *priv = req->priv;
-	unsigned int i;
 
 	dma_unmap_sg(req->dmach->device->dev,
 		     req->sgt.sgl, req->sgt.nents, req->dir);
 	sg_free_table(&req->sgt);
 	if (req->page_list) {
-		for (i = 0; i < req->nr_pages; i++)
-			put_page(req->page_list[i]);
+		put_user_pages(req->page_list, req->nr_pages);
 		kfree(req->page_list);
 	}
 
@@ -815,7 +813,7 @@ rio_dma_transfer(struct file *filp, u32 transfer_mode,
 	struct mport_dma_req *req;
 	struct mport_dev *md = priv->md;
 	struct dma_chan *chan;
-	int i, ret;
+	int ret;
 	int nents;
 
 	if (xfer->length == 0)
@@ -946,8 +944,7 @@ rio_dma_transfer(struct file *filp, u32 transfer_mode,
 
 err_pg:
 	if (!req->page_list) {
-		for (i = 0; i < nr_pages; i++)
-			put_page(page_list[i]);
+		put_user_pages(page_list, nr_pages);
 		kfree(page_list);
 	}
 err_req:
-- 
2.22.0


