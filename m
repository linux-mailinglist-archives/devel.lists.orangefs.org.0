Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECD583F29
	for <lists+devel-orangefs@lfdr.de>; Wed,  7 Aug 2019 03:34:47 +0200 (CEST)
Received: from [::1] (port=55684 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hvAqk-0008Vy-Pf
	for lists+devel-orangefs@lfdr.de; Tue, 06 Aug 2019 21:34:46 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36605)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1hvAqk-0008Qg-5c
 for devel@lists.orangefs.org; Tue, 06 Aug 2019 21:34:46 -0400
Received: by mail-pf1-f194.google.com with SMTP id r7so42500302pfl.3
 for <devel@lists.orangefs.org>; Tue, 06 Aug 2019 18:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=34zW6BJN89MycamN6XZc+aPi3iIpUXsyW4mngm2d11Q=;
 b=o1iMd41+ccZkK09IMPd2AYRK2nxxj4luxr/oXYf1r5zvl1rB+5Njvw5+yOF9jzdNKW
 0sOvnAPF3Qav8GrCrICbMqDOV9qASg1Kx51KsLT3kM/WuvVdMW7XrY8CvDI8Q5dEWx12
 oQbwqpjSWiFbIsNFbcpYcVrmKluAqCipM9FxALoNB6s3X2SZRLlz53JQRsVYPh0pH9nV
 Kc9qcjAV7p7rTzqe2/MHBF1cE8sJ8msPeJl3VFMqaq2A+nfaaBpGi8bFHG/baDlwWEny
 MHNVdhC+ELal559VaRapllf9o6PzvZgYyIKj0wGmpTTu6N66MHuYIC1lBVMp4ydMH/rt
 +u0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=34zW6BJN89MycamN6XZc+aPi3iIpUXsyW4mngm2d11Q=;
 b=f2b3RKR5tmzG09FSOoFGmq1Cb19I55bXYzoRXt7nh5RehC7bh+XUp5mmUps9R80f/r
 n968C95d982Oq2ySiw5gEgPde3WFxWvPVII0xhGyXwt/VVCPXNAjhWuinIDxoJaOaZtt
 MDwVaAuCqcxm75GUnlZqhp0sNybgCxop0TVpn3nVVKUgaFG1pCxtgWLJP1A+50RMZAx+
 jG5b1mQkHne7jN3qb1w8uxcf9xj3psjg8c0ux6qC67h9YTAYU+17ylOwBucVqdz8z9E3
 Sqfm1uKcprhCwjYhmmAX6ZHv3CbqlzqtrR3SYf+l6e8AXOlIOzHV9vHS5rDZM66rwp/I
 H1Iw==
X-Gm-Message-State: APjAAAUANMgRoh7zJtNI5IEj/URaxx2Ay8bl8oPcb+dmUQxlYaUjOFPH
 PkLAEAseLKQx40XwuybMEm8=
X-Google-Smtp-Source: APXvYqwDlo4CFJorDrBurduwUa2oSyS2Jx2b29d9K5TbsKnQqNAY6ckzALOmtrds4Hd5oSsH/O3vaA==
X-Received: by 2002:a17:90a:1b0c:: with SMTP id
 q12mr6044962pjq.76.1565141645264; 
 Tue, 06 Aug 2019 18:34:05 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:04 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 13/41] scif: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:12 -0700
Message-Id: <20190807013340.9706-14-jhubbard@nvidia.com>
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
 Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 Joerg Roedel <jroedel@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Zhen Lei <thunder.leizhen@huawei.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
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

Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Joerg Roedel <jroedel@suse.de>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/misc/mic/scif/scif_rma.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/mic/scif/scif_rma.c b/drivers/misc/mic/scif/scif_rma.c
index 01e27682ea30..d84ed9466920 100644
--- a/drivers/misc/mic/scif/scif_rma.c
+++ b/drivers/misc/mic/scif/scif_rma.c
@@ -113,13 +113,14 @@ static int scif_destroy_pinned_pages(struct scif_pinned_pages *pin)
 	int writeable = pin->prot & SCIF_PROT_WRITE;
 	int kernel = SCIF_MAP_KERNEL & pin->map_flags;
 
-	for (j = 0; j < pin->nr_pages; j++) {
-		if (pin->pages[j] && !kernel) {
+	if (kernel) {
+		for (j = 0; j < pin->nr_pages; j++) {
 			if (writeable)
-				SetPageDirty(pin->pages[j]);
+				set_page_dirty_lock(pin->pages[j]);
 			put_page(pin->pages[j]);
 		}
-	}
+	} else
+		put_user_pages_dirty_lock(pin->pages, pin->nr_pages, writeable);
 
 	scif_free(pin->pages,
 		  pin->nr_pages * sizeof(*pin->pages));
@@ -1385,11 +1386,9 @@ int __scif_pin_pages(void *addr, size_t len, int *out_prot,
 				if (ulimit)
 					__scif_dec_pinned_vm_lock(mm, nr_pages);
 				/* Roll back any pinned pages */
-				for (i = 0; i < pinned_pages->nr_pages; i++) {
-					if (pinned_pages->pages[i])
-						put_page(
-						pinned_pages->pages[i]);
-				}
+				put_user_pages(pinned_pages->pages,
+					       pinned_pages->nr_pages);
+
 				prot &= ~SCIF_PROT_WRITE;
 				try_upgrade = false;
 				goto retry;
-- 
2.22.0


