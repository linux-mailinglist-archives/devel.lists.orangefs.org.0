Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DB983F65
	for <lists+devel-orangefs@lfdr.de>; Wed,  7 Aug 2019 03:35:23 +0200 (CEST)
Received: from [::1] (port=55972 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hvArK-0000CS-BY
	for lists+devel-orangefs@lfdr.de; Tue, 06 Aug 2019 21:35:22 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38824)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1hvArI-0008UG-6F
 for devel@lists.orangefs.org; Tue, 06 Aug 2019 21:35:20 -0400
Received: by mail-pl1-f195.google.com with SMTP id az7so38558734plb.5
 for <devel@lists.orangefs.org>; Tue, 06 Aug 2019 18:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=46lxAY1z81U+mrrESVpVIrQ+fWJc6iHl4OExj8KwBEA=;
 b=WuyyNqtpvvlvZwulsOSyl6jjDfFZFL7/Zx5rMnqGOdxDRsEuGcdgN1IewvAvlX+Ui3
 X7btLnm2F40F8RrpBhgVrMU3HOKje9DtE5nK+fpNzyjny+e0S7JZDS2kjkLoxOZDXhQl
 8/grXg9y3uP/GW5F5PAwd4bWzrVFH3BCp78Eig9BKFd6aIXye5gDuBBhD5viuX1OApXQ
 9VIP+L4AUKM2VFr2nldHjLjmSVNA49QX09uR5xAkxNN9xQUujG5Q/Q0AKTjDZbsxdlOq
 g4tQx0EnIYd52Zy5p9V4faNYnaj9xyaWhFJDGaxmSVhObIkgzad4uex02Ars3KOUlzef
 YWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=46lxAY1z81U+mrrESVpVIrQ+fWJc6iHl4OExj8KwBEA=;
 b=DSCA6HKG0tAlh/QTYPRzlGKkRkCsiYGdlFn7mHm9AJCTLbK7P5ecvu7/gE+LoB0u5v
 QnbxpV1WmB8GIUJFW87Hi/Z7BMoJsTilWc8YI//z3Ynxn2ez0IWDNsYy2jx4AuDQ2h1p
 2/G3EVx0UtxHeWcX+KehX3xpt3hiTn3sXn9eqlj0goh3ea1POht6Br0zY/LknL/w5LCe
 Nz/ygVz7ixXlqG4pr2AoRc81Lkqv3SMlVoHA8r9IqJBOYt55eYHecp43ZrxKA4KiMkHp
 ZgB9i0BbXr2VUoDmhmCmcgTxGLP69XEhlS1N68PkCz368AikcRIjPJgAXlL6MDblNe/e
 n2OQ==
X-Gm-Message-State: APjAAAV6SYkXm7HiljqKdOU8BjFvdcWfM68ekYAO6E1B2/FFQOCL8MdF
 6FWIkh6eMtZBZmTo9gWdEN0=
X-Google-Smtp-Source: APXvYqxeu3U+gXlTZOXb8hdX/T/5F9QSVWlhZwpRfNn+ISG+GmBUrBJWAvgFajanndvmV9JUd/JHZg==
X-Received: by 2002:a17:902:a606:: with SMTP id
 u6mr5434497plq.275.1565141679262; 
 Tue, 06 Aug 2019 18:34:39 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:38 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 34/41] goldfish_pipe: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:33 -0700
Message-Id: <20190807013340.9706-35-jhubbard@nvidia.com>
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

As Christoph Hellwig put it, "set_page_dirty() is only safe if we are
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


