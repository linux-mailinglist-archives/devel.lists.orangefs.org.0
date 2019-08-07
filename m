Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B8683F54
	for <lists+devel-orangefs@lfdr.de>; Wed,  7 Aug 2019 03:35:11 +0200 (CEST)
Received: from [::1] (port=55876 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hvAr8-00009o-QJ
	for lists+devel-orangefs@lfdr.de; Tue, 06 Aug 2019 21:35:10 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38045)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1hvAr7-0008RR-3T
 for devel@lists.orangefs.org; Tue, 06 Aug 2019 21:35:09 -0400
Received: by mail-pf1-f193.google.com with SMTP id y15so42511713pfn.5
 for <devel@lists.orangefs.org>; Tue, 06 Aug 2019 18:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XDFswRI13oGzit66yuxshlgOj+nOKd4gwJhAdxr7MGM=;
 b=X+oC46vd7xsqyIlCfk9jfvvzV6KsruG8Ld3KbyZxbsoEi8/HO1GbnyS051djmD0t5e
 IHHS/+1UxUZwPEi5YIHD09i1hw+sYQFPMWL5MXVDvXn8jTsvyuss+94LZL/cM8p3bjpq
 d4b4EaFpAv2r0fuq82w4gX6G8xDhtpwliffNpgIRnaMzTN6SuMgZ7nNfOclK8ThivKOZ
 7xyX43NI19Uw1hhV+vBLTAkRAlmFP4cWwG7rBuQsdFHL+GJXdhmd4ykYSxe8XYPo9VdG
 z0ekXKuUssjo5Om7rTdk/VGJmbSK9hbVth13oi1xkOKAckGir4q2yshriVnE4uLo3fC5
 EABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XDFswRI13oGzit66yuxshlgOj+nOKd4gwJhAdxr7MGM=;
 b=Rndu61cP9vOihEjnPVCaZye9PwVQQtBb020gsYUH635pVBceJe1jJgLFiGdC3aQr6Y
 4z3ejk2v9/WF4ZVClX09cZFlfy1XqetfygTnzvyrBsWblWmWAS9iDSwUOc8n0MYDTZS8
 FYP5C6ytjhLUre48/seL6vPEb30LkKWz9os/JRtbqS/wauW6VWIfFpr2doGWNhvVgwAV
 7A4ByffRbDcWN/j8Mc/YePybVWgzTFTlTC7Z4rQMoCnHMgS5SD3OF5wU6stS+De6SIwD
 mzrXGB+zcYcNEpiNvtRjCDb9LDAPTaaZGHR9NdevNX0SstFTotUMzQI1hPit6UCej2Fi
 v4Sw==
X-Gm-Message-State: APjAAAVzvqUV1HQF1Qp9rwL4FSfa2zyECp4608/5U0HmWz7kQJnibH65
 dWFi9yXMLr4CIcvgbzZa1ds=
X-Google-Smtp-Source: APXvYqyNVjxjb1rRFJ4zL7VZgTd8hKKqHIiZI2K7th6msFTgZFcONMzTsZWyvyMWu34CEbDocoskag==
X-Received: by 2002:a65:5202:: with SMTP id o2mr5279108pgp.29.1565141668202;
 Tue, 06 Aug 2019 18:34:28 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:27 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 27/41] mm/frame_vector.c: convert put_page() to
 put_user_page*()
Date: Tue,  6 Aug 2019 18:33:26 -0700
Message-Id: <20190807013340.9706-28-jhubbard@nvidia.com>
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
 Jason Gunthorpe <jgg@ziepe.ca>, Mel Gorman <mgorman@suse.de>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
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

Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 mm/frame_vector.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/frame_vector.c b/mm/frame_vector.c
index c64dca6e27c2..f590badac776 100644
--- a/mm/frame_vector.c
+++ b/mm/frame_vector.c
@@ -120,7 +120,6 @@ EXPORT_SYMBOL(get_vaddr_frames);
  */
 void put_vaddr_frames(struct frame_vector *vec)
 {
-	int i;
 	struct page **pages;
 
 	if (!vec->got_ref)
@@ -133,8 +132,7 @@ void put_vaddr_frames(struct frame_vector *vec)
 	 */
 	if (WARN_ON(IS_ERR(pages)))
 		goto out;
-	for (i = 0; i < vec->nr_frames; i++)
-		put_page(pages[i]);
+	put_user_pages(pages, vec->nr_frames);
 	vec->got_ref = false;
 out:
 	vec->nr_frames = 0;
-- 
2.22.0


