Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFFA80D80
	for <lists+devel-orangefs@lfdr.de>; Mon,  5 Aug 2019 00:50:54 +0200 (CEST)
Received: from [::1] (port=46258 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1huPL3-0002Wc-Vr
	for lists+devel-orangefs@lfdr.de; Sun, 04 Aug 2019 18:50:53 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45344)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1huPL2-0002Iw-DQ
 for devel@lists.orangefs.org; Sun, 04 Aug 2019 18:50:52 -0400
Received: by mail-pf1-f196.google.com with SMTP id r1so38588769pfq.12
 for <devel@lists.orangefs.org>; Sun, 04 Aug 2019 15:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rv0dCo+fqAQ13SgPxACDlFOa16RsKjSPlFe+eBoZNRU=;
 b=YPOY1YFdr7iX/mwZQqcGNXlBs0EVKoyeBFEUqInEu6rA0ndI8Mif+0ZPJeKKJ5iFwE
 NKOF3uvUa5VJ+UGiH9nbc87NqjJWsSl0scr9GeK88ydFUly3DCHseKqxTpEd0IfXvu5q
 jcaFXkdAdHJL26lkS0kDgmBvj/6IRTs5wSna3kfRs+vwcKzTL9APp6Wsc+o3ppVF+IRl
 wjQCOTSjcDQ7GQjBBXsLdt+Iue6eXN2thWrje4Rt9XoDAoEpWZdNECCtZUxO8cwujSm4
 fowCwuwgU3C+BFfj4zTJJ1Y4PbaxN4OhvtwxUy9pYDnCK6XNpmRXg/q/Jb/Qj5fLadYM
 mSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rv0dCo+fqAQ13SgPxACDlFOa16RsKjSPlFe+eBoZNRU=;
 b=PEL+GaDL0kfR0g2ZsXiFRhHdG8avJVSlv8g1rpeNoK+Qx4P2phwhqHujIJG04G9U4r
 xzB8bPuWcCtvCjv6mszvD0sfDAFnFfXRtSgVMVpZg3pmNU0ctiL3xEHwz3xTeIHgk6/4
 nAp6MDMhk3bwfweqIoa339gQ03w5PWwpFIk5LAvpDipFfhkFiV8zmQZPxcdM7TjGDRx6
 59ZmioEJicQ6gkr7ZRHra3SekKZR/XT2qNcAVDHD2+/RLc1J+SF08D7t4sk9aJY/x2pb
 YeA1QaCHSfRs+0kEiumfOyUNifLcCwDuRIsg0jp1WAfkwbObykv0bH74pEJauUM/A84c
 YgSg==
X-Gm-Message-State: APjAAAUCTtWQnQTrHMHra/ZiKmRhlHLArJGa0q47HflHiY8S0gQ5jTte
 1P9R8x1SmBuD1hzCG/e9kV0=
X-Google-Smtp-Source: APXvYqxvM1qX7vPDXvngph7SDjRt5A72CS0QHjJHMrDwzL+npYmbY1LXNKjG2Jciqo+k4AO5Wz8/Mw==
X-Received: by 2002:a17:90a:b883:: with SMTP id
 o3mr15076411pjr.50.1564959011569; 
 Sun, 04 Aug 2019 15:50:11 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.50.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:50:11 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 33/34] kernel/events/core.c: convert put_page() to
 put_user_page*()
Date: Sun,  4 Aug 2019 15:49:14 -0700
Message-Id: <20190804224915.28669-34-jhubbard@nvidia.com>
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
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
 Jiri Olsa <jolsa@redhat.com>, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Namhyung Kim <namhyung@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
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

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Jiri Olsa <jolsa@redhat.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 kernel/events/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 0463c1151bae..7be52bbbfe87 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6426,7 +6426,7 @@ static u64 perf_virt_to_phys(u64 virt)
 			phys_addr = page_to_phys(p) + virt % PAGE_SIZE;
 
 		if (p)
-			put_page(p);
+			put_user_page(p);
 	}
 
 	return phys_addr;
-- 
2.22.0


