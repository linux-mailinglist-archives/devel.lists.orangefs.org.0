Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 218E57E856
	for <lists+devel-orangefs@lfdr.de>; Fri,  2 Aug 2019 04:21:22 +0200 (CEST)
Received: from [::1] (port=51098 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1htNC5-0007r7-89
	for lists+devel-orangefs@lfdr.de; Thu, 01 Aug 2019 22:21:21 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46892)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1htNC3-0007j0-US
 for devel@lists.orangefs.org; Thu, 01 Aug 2019 22:21:20 -0400
Received: by mail-pg1-f195.google.com with SMTP id k189so16189560pgk.13
 for <devel@lists.orangefs.org>; Thu, 01 Aug 2019 19:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0y5rJgolnpdx1vwnOpLTxW7O4fuw+3wJL+gU2Q7/qgc=;
 b=XcvG9OtyU86jk5JnQKO48GBJW89xfPHHxg+Ne0d0GJwSK2IuihtMCJFR8pabDqBzEF
 DuPSfNePU528rZ6hBUi+QFYoZILMY8tdggEmTr3mN7PzDRJ7a6OmrfV2tsrS8kf2+6HI
 Zo6kU0MY4gjn6C4vTTeXk9IHVKARwawE7INoHfJ5sfq56uo1gVj3e8g1oiz6b7OI/wgS
 KnIyWK9Z49VV7ULXr41yNDN0bWyja3EYTBz6mLtPsaZCe7aB+yHXvCTEBAOwbU3wp1bf
 uiomAHYjSX4K0Tach88phQCyk3zfRucll/enDp2U+3MmHAZ/atNajIitsMHfeEHfycq9
 ft2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0y5rJgolnpdx1vwnOpLTxW7O4fuw+3wJL+gU2Q7/qgc=;
 b=Ct3g4wY9rxJrE6MRp/NMxKNyJUCGv0e97KuwzwQ67vgcL/+OykTejz3uRTx7azSFkG
 KsdnueIUSAP+z20JO0DfSRodJdceOmZEb21YJU4HjTP0jY5rneC8C/j912J+42tylVJ2
 UbYeTqu+qz7EhaqAeh+DH4hxvH+qhX8DmxIdGISsZOnZMc/cjMWlh1JQEqtmcgS/oNRQ
 D9iXclRFjmcbKlvkJUcBuEds8i0Pu/BqgaerWDwsApc25JmS5b6avwX1EHtoaeSO/r2C
 n5oa83mv+ykJYscRouzzJug5WPWqIP/9yHynFGGEwRo5TjgtIoE6+E21Jr7+cm+ycyHD
 7ynA==
X-Gm-Message-State: APjAAAWfOlQKDhr87Kyn24KE1NBZvRiSdBPRFCqUAtLd2DFHyDG/wwpk
 wLPp6Ydn9T/9Nz2l0yLf0Bo=
X-Google-Smtp-Source: APXvYqwl6c8l8akPJ/a0xk+3KepmeSM3zSOQCzHQzAg87pSWv9yrqkhky05R7WwjG4AiAw2gALdPbw==
X-Received: by 2002:a17:90a:b908:: with SMTP id
 p8mr1903028pjr.94.1564712438974; 
 Thu, 01 Aug 2019 19:20:38 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:38 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 17/34] vfio: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:48 -0700
Message-Id: <20190802022005.5117-18-jhubbard@nvidia.com>
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
 rds-devel@oss.oracle.com, Alex Williamson <alex.williamson@redhat.com>,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
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

Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/vfio/vfio_iommu_type1.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 054391f30fa8..5a5461a14299 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -320,9 +320,9 @@ static int put_pfn(unsigned long pfn, int prot)
 {
 	if (!is_invalid_reserved_pfn(pfn)) {
 		struct page *page = pfn_to_page(pfn);
-		if (prot & IOMMU_WRITE)
-			SetPageDirty(page);
-		put_page(page);
+		bool dirty = prot & IOMMU_WRITE;
+
+		put_user_pages_dirty_lock(&page, 1, dirty);
 		return 1;
 	}
 	return 0;
@@ -356,7 +356,7 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsigned long vaddr,
 		 */
 		if (ret > 0 && vma_is_fsdax(vmas[0])) {
 			ret = -EOPNOTSUPP;
-			put_page(page[0]);
+			put_user_page(page[0]);
 		}
 	}
 	up_read(&mm->mmap_sem);
-- 
2.22.0


