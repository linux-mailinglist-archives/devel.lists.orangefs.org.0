Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id F03D07E877
	for <lists+devel-orangefs@lfdr.de>; Fri,  2 Aug 2019 04:21:44 +0200 (CEST)
Received: from [::1] (port=51306 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1htNCS-00080Z-6I
	for lists+devel-orangefs@lfdr.de; Thu, 01 Aug 2019 22:21:44 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39721)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1htNCQ-0007nA-Sj
 for devel@lists.orangefs.org; Thu, 01 Aug 2019 22:21:42 -0400
Received: by mail-pl1-f196.google.com with SMTP id b7so33054280pls.6
 for <devel@lists.orangefs.org>; Thu, 01 Aug 2019 19:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t4E5L+nteFApbv8x9BTzZhAA9CrCHyfc4N+4wDD55sE=;
 b=hrmJ0pEUxxlEVbmnkJiCuXB+z0obVkpM5OAxcIB8ex62qKsRGc8GrJbesoMFhr0ezJ
 BB7gqJEvJ/0j1sMNBYjptk6WEDqh/SuRhAh3YnXCDA+D03E9VD/w0ZTpWsRp/gFtvqDb
 GPSJBQRO2YGZ2n4ciW9tAFCe3EDjB9OuDXHwxqBfuLFzCDYC5sbEZNesZN0XL0xy/T+d
 A/rrSMYh6KaPOeAYQGAhhvKvLVo5NyuQKSBc7dnWcPrp/sW9C+D3tHmYcyJ9WgLD0vU4
 zE+pn4brWMiLPK0lo9h6ZHMbPaOqGStN6e8qWC9iDeImsGRohVaoMFw5HAYT+EunHz7d
 Gu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t4E5L+nteFApbv8x9BTzZhAA9CrCHyfc4N+4wDD55sE=;
 b=qihuaddYYdwsoZqZxMCqQyn0ilbcGeT/HWLwugIWBd3NoPXWbUqSFipW+R15nTzN0q
 RWRB2AFMowTeir5dpC1u8el1YabjyC7xNdsnUO2f2DibS18nDzSH5XglzUE6z3qovieF
 OA21+G/sKAw7Kpdcw1dQBaq8k4u9W9e8f6Oao2T49oliinEzBQGoDRngQ8PMIwgOef7X
 ZgzMAurf/3yDhpQnKBYxej1lsUJlXoTrPBTpDTkBtn6yQZKf+4L4smdKDugdjAeYomKq
 vy2QPMavrQFq+advmZ6DxTFl+g3Jxz3zMigv/wvNAmKG/hOwBEtqF9y3vSarllfQGj9U
 Bg7A==
X-Gm-Message-State: APjAAAWh8z/v4PZ6f1vB//7ljLo2wkMxg0oM+mUCYz1TOh0q5cAKSk78
 pPtdfcl8cXCNRHmpizyHOwE=
X-Google-Smtp-Source: APXvYqwMLKf8AGC5hDWCQUPLqudyxsaLfy2JXIWmRI5mzRP+HqysSD+VYVGt/11B9bnV5geCVBXglQ==
X-Received: by 2002:a17:902:20ec:: with SMTP id
 v41mr122012162plg.142.1564712462015; 
 Thu, 01 Aug 2019 19:21:02 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.21.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:21:01 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 32/34] goldfish_pipe: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:20:03 -0700
Message-Id: <20190802022005.5117-33-jhubbard@nvidia.com>
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
 Jason Gunthorpe <jgg@ziepe.ca>, Roman Kiryanov <rkir@google.com>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org
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

As Christophe Hellwig put it, "set_page_dirty() is only safe if we are
dealing with a file backed page where we have reference on the inode it
hangs off." [1]

[1] https://lore.kernel.org/r/20190723153640.GB720@lst.de

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Kiryanov <rkir@google.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/platform/goldfish/goldfish_pipe.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/goldfish/goldfish_pipe.c b/drivers/platform/goldfish/goldfish_pipe.c
index cef0133aa47a..2bd21020e288 100644
--- a/drivers/platform/goldfish/goldfish_pipe.c
+++ b/drivers/platform/goldfish/goldfish_pipe.c
@@ -288,15 +288,12 @@ static int pin_user_pages(unsigned long first_page,
 static void release_user_pages(struct page **pages, int pages_count,
 			       int is_write, s32 consumed_size)
 {
-	int i;
+	bool dirty = !is_write && consumed_size > 0;
 
-	for (i = 0; i < pages_count; i++) {
-		if (!is_write && consumed_size > 0)
-			set_page_dirty(pages[i]);
-		put_page(pages[i]);
-	}
+	put_user_pages_dirty_lock(pages, pages_count, dirty);
 }
 
+
 /* Populate the call parameters, merging adjacent pages together */
 static void populate_rw_params(struct page **pages,
 			       int pages_count,
-- 
2.22.0


