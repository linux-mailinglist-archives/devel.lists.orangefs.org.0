Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEC67E865
	for <lists+devel-orangefs@lfdr.de>; Fri,  2 Aug 2019 04:21:38 +0200 (CEST)
Received: from [::1] (port=51250 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1htNCL-0007z9-U4
	for lists+devel-orangefs@lfdr.de; Thu, 01 Aug 2019 22:21:37 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36556)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1htNCK-0007lX-M5
 for devel@lists.orangefs.org; Thu, 01 Aug 2019 22:21:36 -0400
Received: by mail-pl1-f194.google.com with SMTP id k8so33033715plt.3
 for <devel@lists.orangefs.org>; Thu, 01 Aug 2019 19:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Puv5caB6Xd1AJbwd7nGzyFKNouoVWAfL+vJwz/b+4QQ=;
 b=QRyVr5yg7UVnGFe/94tarV2cx/oce/jeAuEbGS+hXnWMVkUY07iSzJ+XdsjD5nlJBq
 rtaqXFFIyJDVZMz/IPqdxV28iUWO51kec9aYcvEuc1NKK19hn11UPjRAndaZuD321pFs
 RKnDddIFoWzyAYe9j0yIZ0ilD198KHwio3GcyDW9wHOLHbZQnh4EWC6hi4aeKuKjN/3A
 ASJiUynmLC6iZL/fZBtp3/NtpLCOGP1VvcXTdQwMcpbWEECy63Zknc8xjKmFGFNfVmU2
 0O+/0uGt4SKVMx7bM2tpg32Bk0v9UkWkkUlVmxU39ntVy853hr2Hw2jr21+6/jgrAg21
 vCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Puv5caB6Xd1AJbwd7nGzyFKNouoVWAfL+vJwz/b+4QQ=;
 b=bHq5vX7p3J8S8B8UnK/pIKkn6rfbWdZpyzqN/M9AQnWyV3HXwPfidvqokeiQ+Rmxo9
 XToSCyLcbfkFJu6mu9zaFEYrT8HTHDwCZzCJc2kzyKDPJI0Ea9zQ0t6qUJ2uCo8Cwm/I
 HWTfBfcaI9aT1Z/Z7x1TM89aHfGRXPzipKaJtKRgGX2wCv2NNTuhtt720uGUjytx3GEo
 w0+1YmkgFSTPw64/fP6OqGW1Q7UX0YiGX/r9ANvYPya/W692nbMAZmAYUY9hk1VQY77k
 DEpTJIHuJErwI6Ye5MnQNd3HJnQXKyx6oleEa+YFmP6cZ20fsw17Agb9zgKF+dd/Wdmv
 Dxog==
X-Gm-Message-State: APjAAAV+7eIumFOda9Pbjp2m+86SNbK2sIlJdZjYBvIUKY9G3Mc18xMK
 eoeNMUaApulkuqH6S0RNE6M=
X-Google-Smtp-Source: APXvYqyaZ4okZt4HMDulUfOascyI9kF+Bm8CH1styyIgJXB6Yp2GZVtQjz5NJsvyCn9V25oNb5Ohjg==
X-Received: by 2002:a17:902:100a:: with SMTP id
 b10mr87552918pla.338.1564712455774; 
 Thu, 01 Aug 2019 19:20:55 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:55 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 28/34] mm/madvise.c: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:59 -0700
Message-Id: <20190802022005.5117-29-jhubbard@nvidia.com>
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
 mm/madvise.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 968df3aa069f..1c6881a761a5 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -672,7 +672,7 @@ static int madvise_inject_error(int behavior,
 		 * routine is responsible for pinning the page to prevent it
 		 * from being released back to the page allocator.
 		 */
-		put_page(page);
+		put_user_page(page);
 		ret = memory_failure(pfn, 0);
 		if (ret)
 			return ret;
-- 
2.22.0


