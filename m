Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B4F80D69
	for <lists+devel-orangefs@lfdr.de>; Mon,  5 Aug 2019 00:50:41 +0200 (CEST)
Received: from [::1] (port=46132 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1huPKq-0002Ta-Df
	for lists+devel-orangefs@lfdr.de; Sun, 04 Aug 2019 18:50:40 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36158)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1huPKp-0002FI-St
 for devel@lists.orangefs.org; Sun, 04 Aug 2019 18:50:39 -0400
Received: by mail-pf1-f193.google.com with SMTP id r7so38601411pfl.3
 for <devel@lists.orangefs.org>; Sun, 04 Aug 2019 15:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XDFswRI13oGzit66yuxshlgOj+nOKd4gwJhAdxr7MGM=;
 b=rRmTjwmKQyZXs+w2fc61p+6blqitgFt44VDlq2hBJa3msEqsCjE3iMA0N59ImENjx1
 pWxFmzHovpTywgJof2duXF6btSgoIVe+p+WICBao5KO8pBkE9NcaTV9gfxHpi58Jd393
 DFKgJ0xyVx8/IYN8IUERTh2Rxf2HWoXWnWj+XPN7lRyL0wmkPmCXMh8pOjTaDWP9OB/k
 giTYlSTz/ZRaJt6cAxVDISU3w6TbcicUIO0JMUvDlHhqw/CPHipUdbC11SYdC5WWsNXd
 vc/vSbii+ZbRuDVkTzr0tcFTEidEPQ4hRCQUhyIepPPKxZC6v01QDasnaLKNedkEXXRF
 M2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XDFswRI13oGzit66yuxshlgOj+nOKd4gwJhAdxr7MGM=;
 b=GsZOTcEIfDUI8Id2R/JQiii+yPDiEv3JU+c6FXpxYDeE21a8t1/6hHI39ZYV8Ayr4L
 hOhlVs4oK5jILXj5MYmZEWNBgA3A/o4br9wR1n2zkf651XL1ze1Gx0lcxPQ1IdfpLeTi
 +KvLPgSU8WYG1i6J8l0jlEgmR1YLhKuiA7H9ylavt7i2g5JPGbXZzhPg48gEdHxxYay2
 u0mwmDAVSdE3nBj1N1DrVqODCfwcUPrCHlnawkTL/UvE+wXgpt82yoIqMEqN89JOItM1
 R8+ZgderFRiUVj+xKu0yep+MM8/IjxCjofbqCueONiGkO8yJwbSmlQUSzpdsPBqG4fZD
 WipQ==
X-Gm-Message-State: APjAAAVaQtrjRmOOpO7GuOzS1OoXD3PQnBxXj0u4n4IVlFxhI7cva4mn
 Ah0XllXkBAkJauhQa5ZX4mS0Ol8M
X-Google-Smtp-Source: APXvYqwlrqrBPfbU3uzw56VyHFJ2u/Wv2Z0KkmEAsOsnKmMeY4aJMueEUB/6oS1u2+NCnzOVxWkmSA==
X-Received: by 2002:a63:4a51:: with SMTP id
 j17mr133593330pgl.284.1564958998921; 
 Sun, 04 Aug 2019 15:49:58 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:58 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 25/34] mm/frame_vector.c: convert put_page() to
 put_user_page*()
Date: Sun,  4 Aug 2019 15:49:06 -0700
Message-Id: <20190804224915.28669-26-jhubbard@nvidia.com>
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


