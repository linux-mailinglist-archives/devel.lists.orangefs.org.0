Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id EF35383F39
	for <lists+devel-orangefs@lfdr.de>; Wed,  7 Aug 2019 03:34:57 +0200 (CEST)
Received: from [::1] (port=55766 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hvAqv-00006X-5y
	for lists+devel-orangefs@lfdr.de; Tue, 06 Aug 2019 21:34:57 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38945)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1hvAqu-0008Qr-4g
 for devel@lists.orangefs.org; Tue, 06 Aug 2019 21:34:56 -0400
Received: by mail-pf1-f195.google.com with SMTP id f17so38504798pfn.6
 for <devel@lists.orangefs.org>; Tue, 06 Aug 2019 18:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1X33MY8P1PVcaLkCZcp6PkXiHV9wvPThIXgNE9TFbj4=;
 b=eL3MErGFo1XqhdMwEg2Kjw8ppwk7Vahm6mgoNNA3cii/CVgkEKjt7vsL/U/CmyPRH+
 vBu50G7ybGgkp7Hokph0DkgDWhI/CbhoDAa+AbddMqWT6ISLL60rYA89HWspc4xyz4Vp
 5XWKqpmskK/zJd8DBYamJF8+Y0ROhmLz8Fdh4cz2AghIDfFUZCj9rMXq3aFWqKMWQAG2
 HgrGAFAgdTFgMvzU7LHu/FiPYMdm8mLe8AL0h5BcC9G6165T14l59ud/pmRsQYRQ9HTJ
 QDGVt3CGvwstyiOJQq9AlYZoAOTVBthJyf2RDDu2y6x+HTZ/VWBzsErS5Ba5fNi4EntP
 9Gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1X33MY8P1PVcaLkCZcp6PkXiHV9wvPThIXgNE9TFbj4=;
 b=uoJ75azkUTIvV1Cw/U2KIWrtPti68QUX4V2McG9mtVa9p7dJ5fkeziDZwuNIHiH9wx
 LPy3ReGnItOknbPudo6rY0ZZKv87YLlqq4k1hhUQ9NMsH7CTPb3yd+lMxY1tQQmAjEfp
 DuIh2R5CJqNsj0EtQbSP+448MYBmDBf4G+EXq3bDkymXvUu3MB2vwPL6NPqkuz20m9BD
 gC75E1Os0OT4zk+JXBRNQYyqdrzL6xACR+7hjDDwSZD2RYyciXuOPhY2HDDwz98uw03K
 a09kVDUZjNYliyUBQ30OWmG0z+2vNfHVTHcS8KZmZiOgGd5rst/NPZUefai605BePpT/
 kqcQ==
X-Gm-Message-State: APjAAAUsjgaNTWQLgYmEaO3DQ+uBvTtoiTVfW2ud/t2khGVWizTgjuyn
 nU1cmRpmyqV/eajat66BlDE=
X-Google-Smtp-Source: APXvYqzI59Ma7HfX7JZrmVs+MBRFW3wzbxtnFzHUxVGy1m1ZSRzZ7m9Bk2Hb9Owa8Q1RMoC2THAX6w==
X-Received: by 2002:a63:c008:: with SMTP id h8mr5698079pgg.427.1565141655205; 
 Tue, 06 Aug 2019 18:34:15 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:14 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 19/41] vfio: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:18 -0700
Message-Id: <20190807013340.9706-20-jhubbard@nvidia.com>
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

As Christoph Hellwig put it, "set_page_dirty() is only safe if we are
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


