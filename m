Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED777E836
	for <lists+devel-orangefs@lfdr.de>; Fri,  2 Aug 2019 04:20:59 +0200 (CEST)
Received: from [::1] (port=50902 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1htNBi-0007m0-B3
	for lists+devel-orangefs@lfdr.de; Thu, 01 Aug 2019 22:20:58 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43096)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1htNBh-0007il-CQ
 for devel@lists.orangefs.org; Thu, 01 Aug 2019 22:20:57 -0400
Received: by mail-pg1-f193.google.com with SMTP id r22so7631852pgk.10
 for <devel@lists.orangefs.org>; Thu, 01 Aug 2019 19:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=weSPcOAlMB+nks0BWLOsxsBmAu907UZGrfndvq6oQnc=;
 b=g/PNAVO1jcA7rjmvur5Gi5SyBm+cHCwd0FZu0S4Yd4WKYY8nqKUy+Kjq5L8LbAIDam
 oq+DMw/apiFaV6V9t2AYTvJ0UtZRGdqpPgiFYeIHq5U9A659jHv3iijVBsi80zStn1WW
 yA7d3ZYX2ikKALXpz54vXEPMXgXSlYxT87JksMZBQueD34Vn0QLhvvHOTCuzyirgAxhY
 PS1hXIRKbtV044f7MD5ThhAFxJavcS5DN9nP30sURDOyWv4TACAbp0MhELnCZVrxEr+Y
 L5R1pu68TEBkTXOjXzFMyL79KTHMlgJNcYv+KmIulF31bskwh/7J7wKRv6nstiIy1Eix
 KMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=weSPcOAlMB+nks0BWLOsxsBmAu907UZGrfndvq6oQnc=;
 b=IYNaVnKHbY5d87NebYCpYewzTUYL/Q1zEKitYoKAq/+95vLPwplQM22kIQa5tdUkjw
 llLUIiY3Va7Shg63Dl8ETk5019K/S6mFqsPSANX2p189lVRnHTTSRqy5G0ChxLsERowg
 EgyFAhmGaUKQv9t2nFbVONlcnxHMx6m0o3m6DoDdtFKGFRVTJIm1v17hpUEqB1+LK0QX
 aLwMQ1Cssmf9cV5NCFV1K8IEZepc78MvspSqAQCdhiSj1tPoGiJfGbX8voiD1vOTak42
 Sbo0/hZAlYTYVlwwJh59bfgX13nnf2/BUrbVFcYZepvEo3rO092EWw6Szcp92caT12Fe
 f2lA==
X-Gm-Message-State: APjAAAVWlB7ceFG153kj2cVAAJeVHmplc+/BrS1Z7/rXZNqawwG7pLAc
 1ERiwzBbhUCSuw2tGTQzWlg=
X-Google-Smtp-Source: APXvYqxciGgcMDXcQ3A2dbcQcp1f7eltXWtJvGVKyn0lRu+bq9UEFtA9QCl9A6sNDZqj7/W8XpREEA==
X-Received: by 2002:a17:90a:2385:: with SMTP id
 g5mr1977411pje.12.1564712416439; 
 Thu, 01 Aug 2019 19:20:16 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:16 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 03/34] net/ceph: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:34 -0700
Message-Id: <20190802022005.5117-4-jhubbard@nvidia.com>
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
 rds-devel@oss.oracle.com, Sage Weil <sage@redhat.com>,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
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

Cc: Ilya Dryomov <idryomov@gmail.com>
Cc: Sage Weil <sage@redhat.com>
Cc: David S. Miller <davem@davemloft.net>
Cc: ceph-devel@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 net/ceph/pagevec.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/net/ceph/pagevec.c b/net/ceph/pagevec.c
index 64305e7056a1..c88fff2ab9bd 100644
--- a/net/ceph/pagevec.c
+++ b/net/ceph/pagevec.c
@@ -12,13 +12,7 @@
 
 void ceph_put_page_vector(struct page **pages, int num_pages, bool dirty)
 {
-	int i;
-
-	for (i = 0; i < num_pages; i++) {
-		if (dirty)
-			set_page_dirty_lock(pages[i]);
-		put_page(pages[i]);
-	}
+	put_user_pages_dirty_lock(pages, num_pages, dirty);
 	kvfree(pages);
 }
 EXPORT_SYMBOL(ceph_put_page_vector);
-- 
2.22.0


