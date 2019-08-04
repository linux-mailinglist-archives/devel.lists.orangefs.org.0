Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id E444A80D3F
	for <lists+devel-orangefs@lfdr.de>; Mon,  5 Aug 2019 00:50:15 +0200 (CEST)
Received: from [::1] (port=45918 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1huPKR-0002KY-41
	for lists+devel-orangefs@lfdr.de; Sun, 04 Aug 2019 18:50:15 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37789)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1huPKQ-0002C8-CY
 for devel@lists.orangefs.org; Sun, 04 Aug 2019 18:50:14 -0400
Received: by mail-pf1-f194.google.com with SMTP id 19so38589562pfa.4
 for <devel@lists.orangefs.org>; Sun, 04 Aug 2019 15:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5vxuyadJL7U7uLaLdbmi0wM48++CcjfxvCZKqh2vh4A=;
 b=SmLYPFHmKN1uE643ZHBnB9dNk1rkYQS38le9bhNsjkuijth7hTQM++IPMv3pLW0TEI
 7/x46VCEIatXmkV3w2KshE0imX/kUzrth+ucng6DZOKNE0opT13YpOAAUVZVUjGyDlRy
 PB2Ml2hj6K3sDNS5iK8QIe0u19usMs5R4F7ygDzoCAKAQPcQlfC/e9zMHKVg/PGP6KNH
 jH8S8rBi9/AhB/tXE8C3wWfrNrkZfmcdnxjHGl0d8mZOAczH5is/McK+cj5KFruHwe2c
 MlwNgBe4BfI2d4CuM85b0u6u4v6w/IVsnWdV3/DEzbLrJ3+c49m+Mf//mO5waQdOc/o0
 4mBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5vxuyadJL7U7uLaLdbmi0wM48++CcjfxvCZKqh2vh4A=;
 b=mZwvcOmbcjug9iSWxufM5wPufhL4LEUdF3pzKa5z7jm3i1EiOzl6kA+zAIYqYTnjg/
 S4r9dfKw40YE+uOc8XVSrJridpSikp86rA7cgVApFEf72Hw4nOI9nCXf5QBqzj0UwNXo
 DK+t7D8qoRWqOPwPN30undDoztt4+UXAG/23f+JKoJmmiUkVjmTNd3X8bu64fmojkJnM
 9zDDuRSo27Kr42kHLDwBs2QSHjmbMOnQ7yTGzolvbAl9l2IbqLyw8w5LgONh3ikAKcvV
 piHRUeRSoZ6puasBPNCL5UQhKUBH5TK4Sfba7tC8M+NyBkF4KJ6wfz+1rCv1XZLfYNAN
 CG+Q==
X-Gm-Message-State: APjAAAVuRjhxutMGqakbpbL9MluT9QL2Gf3nyngpUDqyaZo34SpPG8A/
 5PS1QTQUlVCK9ETCK+z6Ses=
X-Google-Smtp-Source: APXvYqx8ZWVr6MlzhqOcGh2E3H/RsN7D9i6b3t0CUjOfGBvpDNUsLBn0LfDPCNpJqri3cJedM4xZQw==
X-Received: by 2002:a63:1b56:: with SMTP id b22mr16835931pgm.265.1564958973404; 
 Sun, 04 Aug 2019 15:49:33 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:32 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 09/34] media/v4l2-core/mm: convert put_page() to
 put_user_page*()
Date: Sun,  4 Aug 2019 15:48:50 -0700
Message-Id: <20190804224915.28669-10-jhubbard@nvidia.com>
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
 Jason Gunthorpe <jgg@ziepe.ca>, Hans Verkuil <hans.verkuil@cisco.com>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Souptick Joarder <jrdr.linux@gmail.com>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
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

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Hans Verkuil <hans.verkuil@cisco.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Souptick Joarder <jrdr.linux@gmail.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: linux-media@vger.kernel.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/media/v4l2-core/videobuf-dma-sg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/videobuf-dma-sg.c b/drivers/media/v4l2-core/videobuf-dma-sg.c
index 66a6c6c236a7..d6eeb437ec19 100644
--- a/drivers/media/v4l2-core/videobuf-dma-sg.c
+++ b/drivers/media/v4l2-core/videobuf-dma-sg.c
@@ -349,8 +349,7 @@ int videobuf_dma_free(struct videobuf_dmabuf *dma)
 	BUG_ON(dma->sglen);
 
 	if (dma->pages) {
-		for (i = 0; i < dma->nr_pages; i++)
-			put_page(dma->pages[i]);
+		put_user_pages(dma->pages, dma->nr_pages);
 		kfree(dma->pages);
 		dma->pages = NULL;
 	}
-- 
2.22.0


