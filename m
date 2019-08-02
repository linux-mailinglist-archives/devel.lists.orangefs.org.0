Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C27D7E85C
	for <lists+devel-orangefs@lfdr.de>; Fri,  2 Aug 2019 04:21:29 +0200 (CEST)
Received: from [::1] (port=51168 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1htNCC-0007uF-Hk
	for lists+devel-orangefs@lfdr.de; Thu, 01 Aug 2019 22:21:28 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41242)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1htNCB-0007jS-7Y
 for devel@lists.orangefs.org; Thu, 01 Aug 2019 22:21:27 -0400
Received: by mail-pf1-f196.google.com with SMTP id m30so35165015pff.8
 for <devel@lists.orangefs.org>; Thu, 01 Aug 2019 19:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3zvxFRr3gjg9t3ZKCwZWoMY3PeLUGF9FofBT0j+JfJs=;
 b=bFa24Z5mQSzxC4eOzJ4+7AblweRywqOmLHClqtb5KdjCAjd1PUSEw/ZsQSQOyWjUsC
 1nWyBkhFn3Be02SULNTaYtTCG2J6o3/uRCn091UpjmhLyF7xPQy8wXw/xt4PRY9wiXXM
 V1nMLk4YhEUMXleXPkZw51V9rlN393l9K+gVXIZUF6ECoqP/Y8CZfCnooK6DgUB0tUD4
 eFt7VWtlBH1sk6kipujvSPJHkQR53+eHLV2iAcuMnAVCEWZM24hHRYthkAG8xQ/D08vi
 iFZfyGckqNCA5JtaUEszagJMdsqH6lCds+G1LZm6Cvnsgs6SuhZpo2MKRXwMzsClRxnN
 IVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3zvxFRr3gjg9t3ZKCwZWoMY3PeLUGF9FofBT0j+JfJs=;
 b=dkliap9Pl2afM1jOnwplMs1NVnwGPZnI+fFLh7RCs5ROHCUyEoAap0zhO+q7OOY5vP
 JTt+oAcv1fKmF3fImKXhzRXLJ3XlQ+yRLnEk5bVyH4ole2mF3AxH27QCnEzVvoTkjsnJ
 uFf4S7iNLvO7wkSIaWlhEIvgaMLMuHOUF+aF9dJLr29gMfedxIjxC40xpfoFQV+jFOHW
 k+e53IHkgflr1Vy2xsUxEF/Kynj8fwM3aMVhFygVsotxE9POljK9atjGEX/XRA982LLC
 EsOkPQHU7IFiTJIPB7JGqwfTDXUgv8rbXCA727NmM7IyVsDOSsIqrpJ2skmIQ4O0BN8S
 LXgA==
X-Gm-Message-State: APjAAAW3C2OtcAdAQFkXWMg4uEaAteLQdP3l6Hr7UqeX/L17hVSqSDxd
 Bg8djnxp2bhE4VNlpqnjcrc=
X-Google-Smtp-Source: APXvYqxR/U1dL3txs9pGjSe+FwW9uMtR0k4KNaBNNpf6pbzUbZzBuQi9NPNfHMjGx+8Bx8bZmFuKIw==
X-Received: by 2002:a17:90a:8c18:: with SMTP id
 a24mr1817929pjo.111.1564712446323; 
 Thu, 01 Aug 2019 19:20:46 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:45 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 22/34] orangefs: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:53 -0700
Message-Id: <20190802022005.5117-23-jhubbard@nvidia.com>
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
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
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

Cc: Mike Marshall <hubcap@omnibond.com>
Cc: Martin Brandenburg <martin@omnibond.com>
Cc: devel@lists.orangefs.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 fs/orangefs/orangefs-bufmap.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/orangefs/orangefs-bufmap.c b/fs/orangefs/orangefs-bufmap.c
index 2bb916d68576..f2f33a16d604 100644
--- a/fs/orangefs/orangefs-bufmap.c
+++ b/fs/orangefs/orangefs-bufmap.c
@@ -168,10 +168,7 @@ static DEFINE_SPINLOCK(orangefs_bufmap_lock);
 static void
 orangefs_bufmap_unmap(struct orangefs_bufmap *bufmap)
 {
-	int i;
-
-	for (i = 0; i < bufmap->page_count; i++)
-		put_page(bufmap->page_array[i]);
+	put_user_pages(bufmap->page_array, bufmap->page_count);
 }
 
 static void
@@ -280,7 +277,7 @@ orangefs_bufmap_map(struct orangefs_bufmap *bufmap,
 
 		for (i = 0; i < ret; i++) {
 			SetPageError(bufmap->page_array[i]);
-			put_page(bufmap->page_array[i]);
+			put_user_page(bufmap->page_array[i]);
 		}
 		return -ENOMEM;
 	}
-- 
2.22.0


