Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEC380D6F
	for <lists+devel-orangefs@lfdr.de>; Mon,  5 Aug 2019 00:50:43 +0200 (CEST)
Received: from [::1] (port=46160 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1huPKs-0002U8-Fi
	for lists+devel-orangefs@lfdr.de; Sun, 04 Aug 2019 18:50:42 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:32937)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1huPKr-0002FV-JG
 for devel@lists.orangefs.org; Sun, 04 Aug 2019 18:50:41 -0400
Received: by mail-pl1-f194.google.com with SMTP id c14so35603723plo.0
 for <devel@lists.orangefs.org>; Sun, 04 Aug 2019 15:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uQGOdku7Vl3REPvOJ8nTMNJxS9zoi9IIquO7PYdcYIA=;
 b=oIs58MXEzvjiKDUeW9Xx92JohiWAGomnLQHItXPj3gpTBXaBLirgbU7J3jjvMstF5d
 BR9zwxRQqnHrZHmC+32LB+Dm9++A3dYw7Z2gJLbUoT9k9Up7ZxFGUG2x0WkDD/8qau+X
 8ICuV69VxIrVLbwg5iBoAnxA83TGhAb0DJKf1XP2ErlJJVcbhXrO4o1FNI28ciyGEPgV
 qFlJ/47uB+ONPIryHewnPf7OnXpaPBMbJVHPddHFRguTyQ/cP/UdMYVUDXMppTee+whc
 a4C30SWihk27rz0hGEMgPT9159ZIY9uL4Q4yGaDE4CFFho6QVBfddU7eeA74Zc4mT+ns
 u84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uQGOdku7Vl3REPvOJ8nTMNJxS9zoi9IIquO7PYdcYIA=;
 b=cFDjLQGo/7zNrEsx3bhvbWFCeNPJPMKCLSseZDIB6oeZJeLvIKjHYYK4eKnY5v07Yv
 j3Yedpsaa9t723YqTmd3IwkUmRvRbIsSCo4FsffG3tdhPudXNWVEkHDZ1qe61hDFZeyS
 /qckJPEiJc5FVyyzlpPdqohwFInrgassYjWzBM85rbh3/bCXWz/rySwEIW5zQGoBLiiv
 6jSB+DMWyv/+48SH6cfFZ4SV7X1K/9kutBD3ThC3KXtCY8p7DlP/cBy8kSsDc9ZhVts9
 gEfR/Fp+gOCcVEDpuv/UES4RlDUvlXutLqqx6eNcptF46y9tCaRwKEcRirXeCF/LWV6u
 dFgA==
X-Gm-Message-State: APjAAAV5rIlfEFqA04T1Ze6BSPXCwKfaKSJKGXjHxIgS3eVW5YTu72ye
 1TZgsXSL7G+Qpfklvbi+MsQ=
X-Google-Smtp-Source: APXvYqw3vCtbIdRevAqGeALSRYvYtlE73TuMq0puGfIkY6Ze8a3qg+Hme5vTx4BKBMgk8zaLu9jyhw==
X-Received: by 2002:a17:902:2b8a:: with SMTP id
 l10mr141386929plb.283.1564959000721; 
 Sun, 04 Aug 2019 15:50:00 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:50:00 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 26/34] mm/gup_benchmark.c: convert put_page() to
 put_user_page*()
Date: Sun,  4 Aug 2019 15:49:07 -0700
Message-Id: <20190804224915.28669-27-jhubbard@nvidia.com>
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
 "Michael S . Tsirkin" <mst@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, Keith Busch <keith.busch@intel.com>,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 YueHaibing <yuehaibing@huawei.com>, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
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

Reviewed-by: Keith Busch <keith.busch@intel.com>

Cc: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Keith Busch <keith.busch@intel.com>
Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: YueHaibing <yuehaibing@huawei.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 mm/gup_benchmark.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/gup_benchmark.c b/mm/gup_benchmark.c
index 7dd602d7f8db..515ac8eeb6ee 100644
--- a/mm/gup_benchmark.c
+++ b/mm/gup_benchmark.c
@@ -79,7 +79,7 @@ static int __gup_benchmark_ioctl(unsigned int cmd,
 	for (i = 0; i < nr_pages; i++) {
 		if (!pages[i])
 			break;
-		put_page(pages[i]);
+		put_user_page(pages[i]);
 	}
 	end_time = ktime_get();
 	gup->put_delta_usec = ktime_us_delta(end_time, start_time);
-- 
2.22.0


