Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 9652B7E863
	for <lists+devel-orangefs@lfdr.de>; Fri,  2 Aug 2019 04:21:36 +0200 (CEST)
Received: from [::1] (port=51236 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1htNCJ-0007yn-S1
	for lists+devel-orangefs@lfdr.de; Thu, 01 Aug 2019 22:21:35 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39363)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1htNCJ-0007l6-10
 for devel@lists.orangefs.org; Thu, 01 Aug 2019 22:21:35 -0400
Received: by mail-pg1-f194.google.com with SMTP id u17so35241561pgi.6
 for <devel@lists.orangefs.org>; Thu, 01 Aug 2019 19:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GAYBkmVoEF3i3+udFKn42Z4HyLG0jAAiACtL32v96bk=;
 b=bmiw3CX7eWARhNE7AvtkZmQS4x25Aeig4lpzknXcIaYlaD2lFjd7SScDpJpgYkkx7H
 M9zB+YKzWGQiUxpLMFNGr5C65PRt2twJ1gMudyUxXC2keVru4Xjo/FbRHcQrMN3Y+TrZ
 eo41sq59jY3La9DLko+7E0ikMqlCsHblNQuS0OdL1WxPMxgnPsNhJmLosVpKu/cSt2yk
 /jFkZ5J0l+DrkETHxtxwR7Cu6qeEDmLrh7LIOTNKe2v9mBpFbaPnHS0W/dcoeyOSz4Iu
 4HCVwyMi41Z2O7etDQGq6Zv3vzS7McPz5uoywJBAMCcGAE7RrRQ8O1qBbeYiWwc/8w4w
 LKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GAYBkmVoEF3i3+udFKn42Z4HyLG0jAAiACtL32v96bk=;
 b=F/TJdHopw6///FjqwJlYwkfGGGPxMoQpMFuQBPg4Sk3WrqpJ98eYpetL4XWm4T8nZ4
 vtjKImsvnUJcAPSFROQgoY7eOfIdzGub6aXo/lIeT9X6fK7g9YLEphKueLamOYwV9tFi
 Aiyx5bUX692M7XwapB4RZ9Tv8++Zw51qeB1PQo5LNH+CQ2xb3pGqX/R7htf9srl2Fjce
 9nccoXsZEJfiWv0DH4GhBECTj2hO2bsv+THxximpmodCTCH2IruoLOr5yMN6sweiDTKh
 qgwZsZr5pTCKxmiuo2rA1qW2NfFZPP5HdPSQZJG/CfYaz7YAEOQjVdaEF9JB45UynGhK
 DPmw==
X-Gm-Message-State: APjAAAXPoceYow4y4Gl3fgi4S5qLZ81q2CfwJeqx24Getsb5im9sApAb
 eZOR/NfCauEb82CRIcvA/e4=
X-Google-Smtp-Source: APXvYqxC0ya0xWU0ncqxEWJISgZVi9PxJ3dzG7YEhtGnuj+4PZQMAaeHdCEV26ObbLm8aGFRS+hMhQ==
X-Received: by 2002:aa7:9481:: with SMTP id z1mr57240070pfk.92.1564712454191; 
 Thu, 01 Aug 2019 19:20:54 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:53 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 27/34] mm/memory.c: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:58 -0700
Message-Id: <20190802022005.5117-28-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
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
Cc: linux-fbdev@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Huang Ying <ying.huang@intel.com>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Souptick Joarder <jrdr.linux@gmail.com>,
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

Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: Huang Ying <ying.huang@intel.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Rik van Riel <riel@surriel.com>
Cc: Souptick Joarder <jrdr.linux@gmail.com>
Cc: Will Deacon <will.deacon@arm.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 mm/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index e2bb51b6242e..8870968496ea 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4337,7 +4337,7 @@ int __access_remote_vm(struct task_struct *tsk, struct mm_struct *mm,
 						    buf, maddr + offset, bytes);
 			}
 			kunmap(page);
-			put_page(page);
+			put_user_page(page);
 		}
 		len -= bytes;
 		buf += bytes;
-- 
2.22.0


