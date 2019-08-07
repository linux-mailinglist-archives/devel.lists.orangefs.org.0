Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id C80BB83F5C
	for <lists+devel-orangefs@lfdr.de>; Wed,  7 Aug 2019 03:35:15 +0200 (CEST)
Received: from [::1] (port=55918 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hvArD-0000Aw-19
	for lists+devel-orangefs@lfdr.de; Tue, 06 Aug 2019 21:35:15 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37730)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1hvArB-0008Sc-Pg
 for devel@lists.orangefs.org; Tue, 06 Aug 2019 21:35:13 -0400
Received: by mail-pf1-f193.google.com with SMTP id 19so42487179pfa.4
 for <devel@lists.orangefs.org>; Tue, 06 Aug 2019 18:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Puv5caB6Xd1AJbwd7nGzyFKNouoVWAfL+vJwz/b+4QQ=;
 b=tmsRy1GqXUm98oxjqXOZPjsWspl9AXdfGLJi4f4YSRE4p2Xnzia+lP7gOvMdJeaaOV
 ZMTpzk7cqa5s9Whlhun0Z7Axe9U+exCqGVHdHS/nwzXnj2PJKIWBdXJBCa3H/2BHiz19
 BnEnordNgtmPL4Xz5g5gGRNQFD3awe5Sds/iOUIPfzMq0+Xzzslt2XeYTRCDaqUoB/tZ
 5WSuCY8UmuqBDYfQsynPZOWWiAW9iVZeFmsUs+zlPeiO0OHcuVwV2drvqj8qlA8ICP6u
 9yeV7By6zGvwf0U2BDyf/bSCue82V2u+FVMGjOFTaa85KNQg5C2wQoPnNjOXVsaihczq
 TD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Puv5caB6Xd1AJbwd7nGzyFKNouoVWAfL+vJwz/b+4QQ=;
 b=hZpzlywTL9KM7PO/VicIWsq6Ckr9Zy7B2UBMCe1Lnh07ibll7HU/KzIGnGyA6lbMo8
 QjlIoD/oU+KayO8Rt0V/KR+tCHjS0oty9522e5L+jsX3WzAtr+IygFzgFuLKRAUFo6Vs
 9pUEYUx5ZQkyJk9G7IoT3s9Chp4aHcr6Kyd2S2OlbRlt1fMtfKzzLsNcCcUp8WUd8ZSH
 sk3ZObJuDbDz7cJMwwhAjXcm+olmqexrUo7DggCnxlAKnS62yOvNuJOEseL0nmjR6Puv
 N4ea4CC6/ZcVpwJk3bsD6oG6mD+x+8oxJnEHJEnoOEbo+sa4DRLFXRSQrbHdtpKCjuKQ
 xzTg==
X-Gm-Message-State: APjAAAVAIJvWHHsIjbnWZ4ule0P7wChIrQSshYfq7oIFKB/cy9WJwYir
 vJ8GuiwWcCA29PJGX1tXIjI=
X-Google-Smtp-Source: APXvYqw2Uz+wsO3yNwpRHMDLbJirCIxZ4A4X8U6+Fg2LdiPaNY42ayE9pYwjEAVQClZpIkVOBc80qg==
X-Received: by 2002:a17:90a:e38f:: with SMTP id
 b15mr6129518pjz.85.1565141672902; 
 Tue, 06 Aug 2019 18:34:32 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:32 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 30/41] mm/madvise.c: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:29 -0700
Message-Id: <20190807013340.9706-31-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
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


