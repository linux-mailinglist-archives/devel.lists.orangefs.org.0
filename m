Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D6C80D75
	for <lists+devel-orangefs@lfdr.de>; Mon,  5 Aug 2019 00:50:45 +0200 (CEST)
Received: from [::1] (port=46166 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1huPKu-0002UQ-Hk
	for lists+devel-orangefs@lfdr.de; Sun, 04 Aug 2019 18:50:44 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46533)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1huPKt-0002GF-9I
 for devel@lists.orangefs.org; Sun, 04 Aug 2019 18:50:43 -0400
Received: by mail-pg1-f196.google.com with SMTP id w3so1455362pgt.13
 for <devel@lists.orangefs.org>; Sun, 04 Aug 2019 15:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GAYBkmVoEF3i3+udFKn42Z4HyLG0jAAiACtL32v96bk=;
 b=AhiTy6BwwPX512pCtOjXzDhtmzbgOoiJS/+TVyOQOpgZBJJ3KH2MvMlT06wgQ0OyIE
 yRj5vh0m/7nueGoCFtjCaur9BEfURX9GzhTYKWy0B3aTXsLWtG8nWNwdvuLJmmVnPrhP
 95nQuVNILOT8/qwgmNMhZUxktGIeWYoKF4s7BnIeiizbkSEamO5uEElN38AxJ2A5eBFh
 hUZ0Kt1okRjv7luJmtlo0FzBe+9ghVWNnXfTbLZh+WnsUeeUMycJgCWu3dSBNK1w3TM4
 /0kY40aJkh8f8jXxTbX8I9Uw2iPPUnqs4M2MJ05zm7QPLg8alWzs50lrMgIbZfArqyLV
 LbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GAYBkmVoEF3i3+udFKn42Z4HyLG0jAAiACtL32v96bk=;
 b=sOFHYkIJuN2GoZvgUsS97JnfzOhiHE9DY6vB0ZV0ybrsi4ISs05lBWwQRiUJblBMu1
 iUkOYX9Un4YjhgSobTLVNsoRYG8iFPdzY+sRpPxckcS7FzaB1yr502cfQmFDsgRdbpdT
 lwnUkUBvMzrcdJR/0Kc74LhXH+OKbgVJZWCJ499L6EwEi0WIp5TUODvu7akcfeu4dYUb
 OZfYc12b25ewF5VMc2hQbbOWm0b7TiL6Dm2duyzfCH/sF9H6nDRhT2iVz1IPylrRbEQO
 pGPfb5A4LXupZc7JH9XeKwxIRmlnTF2nHd45uptNtn6l8A7HkJqYoo3mRJkr0cPHPf+x
 1NqQ==
X-Gm-Message-State: APjAAAXI01/kD6FP+NqgFzVoOIUvaqis5yT3WWv/KDOwfTIp/QZR+nxD
 7dFp77S2fH4OcoFb6NnrF38=
X-Google-Smtp-Source: APXvYqxnFD3/8kVar2adJXY1j7ibwpw3u4EZRA3KMnmY1X8dVMpcbjzWPVU1wzddWPe9+8PMCheF4A==
X-Received: by 2002:a63:8dc9:: with SMTP id
 z192mr78564615pgd.151.1564959002300; 
 Sun, 04 Aug 2019 15:50:02 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.50.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:50:01 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 27/34] mm/memory.c: convert put_page() to put_user_page*()
Date: Sun,  4 Aug 2019 15:49:08 -0700
Message-Id: <20190804224915.28669-28-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
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


