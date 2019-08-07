Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2DD83F83
	for <lists+devel-orangefs@lfdr.de>; Wed,  7 Aug 2019 03:35:33 +0200 (CEST)
Received: from [::1] (port=56068 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hvArU-0000F0-PN
	for lists+devel-orangefs@lfdr.de; Tue, 06 Aug 2019 21:35:32 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40523)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1hvArT-00005I-2i
 for devel@lists.orangefs.org; Tue, 06 Aug 2019 21:35:31 -0400
Received: by mail-pf1-f195.google.com with SMTP id p184so42493160pfp.7
 for <devel@lists.orangefs.org>; Tue, 06 Aug 2019 18:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iyBF/TunLLNE9m64WGZW5xnvl+XVp1Tkb/4cWK4Q28U=;
 b=eabm6eV7x6nJ3H6jB3OWHKTAjJ5hccshhWRSvyF8YaL4Xb3kcN3FPSj+mrT7hdf1FM
 0MWhm5PqlQFyy6zw76EwLtyOlQEQTOAPUCRq2cKY8d4yFrfincU70ZRfebLbmlijIWR2
 wTENuQ2R1ycfB8EIZdvDLYgUy7fahn8NbpOFjvcP7wPItsW4fy1klzu0bIomS6ZhLV9L
 FATmBTkmPO3bz1bBRYsOrrqOVmLfRrGMChgnyEYGXYwKFOo3GWkjWYe147H72f0kIcVc
 Tr73f17ZMCrLU+eCYt8HTv90LoBSVz+pg0lUMLNh1TQmkPNzI1sbpCYBSoNZ3shE6svq
 cn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iyBF/TunLLNE9m64WGZW5xnvl+XVp1Tkb/4cWK4Q28U=;
 b=Yl7PL0qqx2hHGX6SA+1Rc/t7Xh/YtiF9+qHof6d8ya4r/GRq83o9aiOSzmPgs/Ktbi
 YpnfL9ygHtjjkWURiLTbK5rzqjLu3id27tz9j0zadkwdCDzewl7kpyVaPjIz41GvCLE0
 EF39rNbK8sT6BRM8SyYUhKwQ7lpa33dbfp5vF5i4KhtrkfN9FASm4ZlCX5XhfE9uHm55
 NUSZ+8rQSv6brGXcEEFA0jSbSAM9gsep7vTf6ZasHRSGciXqKR9nAa4dZcusQuu/m4JW
 +XB/xMmnZJGXG+5yq/xbx07oFCffHpfE12Eg7sftiVgwsizIKcifFq6mkYJL96TfLXl7
 3oXg==
X-Gm-Message-State: APjAAAVCHv7pDTWZJgIvQWnPe/mMg+IFsSY/lumPr0/5hvKEMKuU8ccw
 FL457XjQMo91rwkh3gedUfg=
X-Google-Smtp-Source: APXvYqz3mrxPCB1S0CW+dxLuweNihe5G+Md2rLL8K5hOTJIrjMzyu1ZdPrsndXXUg8jjoSZHHVCyxA==
X-Received: by 2002:a62:14c4:: with SMTP id 187mr6515801pfu.241.1565141690166; 
 Tue, 06 Aug 2019 18:34:50 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:49 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 41/41] mm/ksm: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:40 -0700
Message-Id: <20190807013340.9706-42-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Daniel Black <daniel@linux.ibm.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Mike Kravetz <mike.kravetz@oracle.com>
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

Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Daniel Black <daniel@linux.ibm.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 mm/ksm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 3dc4346411e4..e10ee4d5fdd8 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -456,7 +456,7 @@ static inline bool ksm_test_exit(struct mm_struct *mm)
  * We use break_ksm to break COW on a ksm page: it's a stripped down
  *
  *	if (get_user_pages(addr, 1, 1, 1, &page, NULL) == 1)
- *		put_page(page);
+ *		put_user_page(page);
  *
  * but taking great care only to touch a ksm page, in a VM_MERGEABLE vma,
  * in case the application has unmapped and remapped mm,addr meanwhile.
@@ -483,7 +483,7 @@ static int break_ksm(struct vm_area_struct *vma, unsigned long addr)
 					FAULT_FLAG_WRITE | FAULT_FLAG_REMOTE);
 		else
 			ret = VM_FAULT_WRITE;
-		put_page(page);
+		put_user_page(page);
 	} while (!(ret & (VM_FAULT_WRITE | VM_FAULT_SIGBUS | VM_FAULT_SIGSEGV | VM_FAULT_OOM)));
 	/*
 	 * We must loop because handle_mm_fault() may back out if there's
@@ -568,7 +568,7 @@ static struct page *get_mergeable_page(struct rmap_item *rmap_item)
 		flush_anon_page(vma, page, addr);
 		flush_dcache_page(page);
 	} else {
-		put_page(page);
+		put_user_page(page);
 out:
 		page = NULL;
 	}
@@ -1974,10 +1974,10 @@ struct rmap_item *unstable_tree_search_insert(struct rmap_item *rmap_item,
 
 		parent = *new;
 		if (ret < 0) {
-			put_page(tree_page);
+			put_user_page(tree_page);
 			new = &parent->rb_left;
 		} else if (ret > 0) {
-			put_page(tree_page);
+			put_user_page(tree_page);
 			new = &parent->rb_right;
 		} else if (!ksm_merge_across_nodes &&
 			   page_to_nid(tree_page) != nid) {
@@ -1986,7 +1986,7 @@ struct rmap_item *unstable_tree_search_insert(struct rmap_item *rmap_item,
 			 * it will be flushed out and put in the right unstable
 			 * tree next time: only merge with it when across_nodes.
 			 */
-			put_page(tree_page);
+			put_user_page(tree_page);
 			return NULL;
 		} else {
 			*tree_pagep = tree_page;
@@ -2328,7 +2328,7 @@ static struct rmap_item *scan_get_next_rmap_item(struct page **page)
 							&rmap_item->rmap_list;
 					ksm_scan.address += PAGE_SIZE;
 				} else
-					put_page(*page);
+					put_user_page(*page);
 				up_read(&mm->mmap_sem);
 				return rmap_item;
 			}
-- 
2.22.0


