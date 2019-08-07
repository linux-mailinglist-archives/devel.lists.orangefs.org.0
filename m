Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 135B083F3C
	for <lists+devel-orangefs@lfdr.de>; Wed,  7 Aug 2019 03:35:01 +0200 (CEST)
Received: from [::1] (port=55794 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hvAqy-00007F-9V
	for lists+devel-orangefs@lfdr.de; Tue, 06 Aug 2019 21:35:00 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:32884)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1hvAqx-0008Qt-KH
 for devel@lists.orangefs.org; Tue, 06 Aug 2019 21:34:59 -0400
Received: by mail-pg1-f195.google.com with SMTP id n190so1731022pgn.0
 for <devel@lists.orangefs.org>; Tue, 06 Aug 2019 18:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=py067aGaFWqYQnWW3CrL2Yk9VWIyNl4WEpwUsrZ7LgI=;
 b=iMIf7vv1OqjXs/pb2O80RbThn+V5BnR0qPinv0FzH0+g7xzprGLZVDhHDxqDtetcXv
 SaFnJoqNzRoFcPTVGSdSF8TWmFRSDY6HyI/xKEnGPkkBlyCLQ6e2r6EYWiPfaVK2Vmzt
 JZbyLYWCDWgBCgJU9imVgUMeONuNrElpVb025PXYsw4Ce7zDMpi0HqX5tsCmiW5ztLIV
 YDzIY1y6BpKbNCZAoclL3hg7itbVU1NhtHk3aXipSm7TKgtN0MS2OckyNUh0niZVwB8z
 njr19wA60AtVpgYuy80idYiGH3Z0ffMXU+t6KgBLR+IFYvULEDog7RhMgjNZybcJ+5TY
 bmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=py067aGaFWqYQnWW3CrL2Yk9VWIyNl4WEpwUsrZ7LgI=;
 b=WIyC9+H9y0tEd7KapdJ+gsDumHMjkAqXTAD0lA1tLYq3exLCRTdXGhB99jUkKFeDTF
 ddAvtEAhp5+Gzm8SpD2PkO5oqG8UkBVptyv7aS+Rm+2yGCUdiXbgO6Eh+j2eZJSP2hDd
 qfVXLUfD9viuP2cF4lMY51tbCCarOVbg/XXjq/k3+8LoGTh4/W/xLPa6S1Jl5AfFWPuJ
 yBaArcYTBf0jtr1I7oRb6poTsQbPi9ujHvskEw/qF7MVC2an9O5EpQ7Lo1XCgDjpEFcn
 KjlbppAMPhtU/Di5IPtySannhkqmtLLB0jqzV+w25Y+BScsYMKpPjVmYLLku500SWtD3
 GFvw==
X-Gm-Message-State: APjAAAWGGV2NjJclKqGlxZmFX6EVXyA0pmvqhGnfgJudhQSLRALwD2Jl
 XdLelx+Fj+5Tr6yzBDI6UeY=
X-Google-Smtp-Source: APXvYqzEjGdQT4zwHkPHC3zuchqcBixfKdrLByyRaCgYuUpeMBSsZZqsbT+G0enkm62MLPirbgVZ8A==
X-Received: by 2002:a17:90a:fa07:: with SMTP id
 cm7mr5782148pjb.138.1565141658674; 
 Tue, 06 Aug 2019 18:34:18 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:18 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 21/41] fsl_hypervisor: convert put_page() to
 put_user_page*()
Date: Tue,  6 Aug 2019 18:33:20 -0700
Message-Id: <20190807013340.9706-22-jhubbard@nvidia.com>
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
 Rob Herring <robh@kernel.org>, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
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

This changes the release code slightly, because each page slot in the
page_list[] array is no longer checked for NULL. However, that check
was wrong anyway, because the get_user_pages() pattern of usage here
never allowed for NULL entries within a range of pinned pages.

Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Kees Cook <keescook@chromium.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/virt/fsl_hypervisor.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/virt/fsl_hypervisor.c b/drivers/virt/fsl_hypervisor.c
index 93d5bebf9572..a8f78d572c45 100644
--- a/drivers/virt/fsl_hypervisor.c
+++ b/drivers/virt/fsl_hypervisor.c
@@ -292,11 +292,8 @@ static long ioctl_memcpy(struct fsl_hv_ioctl_memcpy __user *p)
 		virt_to_phys(sg_list), num_pages);
 
 exit:
-	if (pages) {
-		for (i = 0; i < num_pages; i++)
-			if (pages[i])
-				put_page(pages[i]);
-	}
+	if (pages)
+		put_user_pages(pages, num_pages);
 
 	kfree(sg_list_unaligned);
 	kfree(pages);
-- 
2.22.0


