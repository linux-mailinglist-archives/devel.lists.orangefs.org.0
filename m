Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC3F7E871
	for <lists+devel-orangefs@lfdr.de>; Fri,  2 Aug 2019 04:21:42 +0200 (CEST)
Received: from [::1] (port=51292 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1htNCQ-00080D-4M
	for lists+devel-orangefs@lfdr.de; Thu, 01 Aug 2019 22:21:42 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43163)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1htNCP-0007mj-C6
 for devel@lists.orangefs.org; Thu, 01 Aug 2019 22:21:41 -0400
Received: by mail-pg1-f193.google.com with SMTP id r22so7632810pgk.10
 for <devel@lists.orangefs.org>; Thu, 01 Aug 2019 19:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b/YV2nCBRUvj+JHalhe5VKLnhqnMLLZTxEiSQrNBGLQ=;
 b=LoaCL2H2RUJBCIOglYnaArkmIVWTYlGIsKjGOYisZuAUApfhu5gEmc6qkNjj0+H7tu
 P+8Dh9t16ihvD6gplnd7Tc9AK6ZGCZeLjxm8tt5yZaZLJjevhgAQKR5u0bAClFOVBiw3
 mudk+AK8dwI6nYLVBSSjbYQjnEo/x77kPGPgsQFzLk0mY0MTwpLYueBrrkls4g4lNcFE
 23WeAWQvuXbP3ljk10sU7SrPFsFGjeRWLbXNTJO4ixgqQlxC9gc1Tv3tUxDQgjI0BYi3
 8BhTJVYtfR/r0jUz//rNUXMcepW6CTlPDrLR0cTlbj3o8jhk3sRuBiigNZ2CjgqdDsZo
 Ctuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b/YV2nCBRUvj+JHalhe5VKLnhqnMLLZTxEiSQrNBGLQ=;
 b=S/DlWxO5dRkk/AUvYVhpdL7EdDF3UG0eIC8g4uMtTGBBV20f8dMgI9tgp0lYL0eK5K
 aLyr4ttklFiZud8xMnhVLU4iVMsOGAIQ36yPbd8nKoZ9F9udsVSkgtLf9Ip55vrMaeN4
 dJmvudqjDtw1ErIkeacwKO7ZrAGx0Q6/91SM14zVSSocdNJ3kJ2cdP0tFUL6bRDDIowE
 8ienaZpl7Eh8U+BeFQOmlJIX5ejPEroGRrH4R2CxLufBuu5H6leueBy2gUbyAstB5Veg
 KbNvOXJ+1OFknfh245s/e2iVrkTND3fC0GL45QQZ38kuB83F0TTUnO89ijbxwncxWu83
 MRLQ==
X-Gm-Message-State: APjAAAUW5QzmDj1Zx9TYr7uZdB0ncbmC0po7vnC0ligo+m0QSYtCLw7M
 IHWr+btuNvR+gJ/BSfhsqrU=
X-Google-Smtp-Source: APXvYqwGNmSeCqbGUwEK1nMIVRCwdEn4NOX6aNf7I9lvnteHEiZ+Pa2UbMiy7LcaaaYIQGQbOjX2Vg==
X-Received: by 2002:a17:90a:3086:: with SMTP id
 h6mr1977670pjb.14.1564712460540; 
 Thu, 01 Aug 2019 19:21:00 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:21:00 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 31/34] nfs: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:20:02 -0700
Message-Id: <20190802022005.5117-32-jhubbard@nvidia.com>
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
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>
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

Cc: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: Anna Schumaker <anna.schumaker@netapp.com>
Cc: linux-nfs@vger.kernel.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 fs/nfs/direct.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/nfs/direct.c b/fs/nfs/direct.c
index 0cb442406168..b00b89dda3c5 100644
--- a/fs/nfs/direct.c
+++ b/fs/nfs/direct.c
@@ -278,9 +278,7 @@ ssize_t nfs_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
 
 static void nfs_direct_release_pages(struct page **pages, unsigned int npages)
 {
-	unsigned int i;
-	for (i = 0; i < npages; i++)
-		put_page(pages[i]);
+	put_user_pages(pages, npages);
 }
 
 void nfs_init_cinfo_from_dreq(struct nfs_commit_info *cinfo,
-- 
2.22.0


