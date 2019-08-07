Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDE383F06
	for <lists+devel-orangefs@lfdr.de>; Wed,  7 Aug 2019 03:34:32 +0200 (CEST)
Received: from [::1] (port=55546 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hvAqW-0008SM-3Y
	for lists+devel-orangefs@lfdr.de; Tue, 06 Aug 2019 21:34:32 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38530)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1hvAqU-0008QV-Do
 for devel@lists.orangefs.org; Tue, 06 Aug 2019 21:34:30 -0400
Received: by mail-pg1-f196.google.com with SMTP id z14so5310319pga.5
 for <devel@lists.orangefs.org>; Tue, 06 Aug 2019 18:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GHzc1obwFKwJgG7nswfPGhmCYytguM8zaNUDmj5ciqU=;
 b=SVC7DSqJ1aViuFyLacSuD9ekUuon1nsbmGXQ+rccZqQD0M5OpWv4FInOJYOUS0zDrw
 iiaUKlpU3oYT6EB+TLC7fde9FCQbqLPjcDOo/pPYr/Dy4w9ZLyTeVh++4NmqxXNEZ0Um
 gS5DfjjL21uHhIzIHJrVsnAGurOzAGDNfpv0OIjYG3RHWT96uJJIGB6LIuNQuZVc7Ym2
 eeEnUQ4CldleB6IB/9Fxp6/W0nXsF/e4MjOETkKBsrMtb7StZJlqXJT9WcIpX7tnyI6X
 9gewZeHtS0mR3vhC08tQKk4aqf3pL5knJE/hrGJP04i1jVNIaCHMRTQVdWFD0VLC/Xeg
 c3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GHzc1obwFKwJgG7nswfPGhmCYytguM8zaNUDmj5ciqU=;
 b=QNfg60XbfW8ekKI9e4UgN8kdy0SzGSw8+idRwnpODBv9edU5cDzh6V9181RPRAXcxx
 EOCcS+s7GQOLO1g/OJeeYxDTyZzeIuqZ+F9363cL8xEh1PyOvPuh3yuGORsWiExre5ss
 1/p2YZglg0iA++aO3FrbswN34pX38tgbDR8/G9RbsxWhxlf9qVVKKG5rocESQ0o+vdHN
 Xy7JYqmNWb+sYjZ0fpr92aamNPKt90+wKPpxXvhvh0AW1XNPnp6OQOJJiWB2Q942fH6W
 bgx3QV8aDz4sD1wtnN+jDr00nX9PYHK5sl6rx1EI7nlGOzh9S2gJo0G2P7sOlaRrrLGf
 b3Iw==
X-Gm-Message-State: APjAAAVb1dKTdysl5fnDIaj1UoXHiRTey++bO5BQX5pxnWRoT0J4Vhe3
 B2vj1A79nTv8IqH3chJB2W0=
X-Google-Smtp-Source: APXvYqxeOvPea8wN4/1KbcpbOcv0WCKYw/yUT+8N/xQtvHJFmkBBq3xYGl9YYXdHhoFcN7NXCSJlJw==
X-Received: by 2002:a17:90a:e397:: with SMTP id
 b23mr5992770pjz.117.1565141629443; 
 Tue, 06 Aug 2019 18:33:49 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.33.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:33:48 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 03/41] net/xdp: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:02 -0700
Message-Id: <20190807013340.9706-4-jhubbard@nvidia.com>
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
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Magnus Karlsson <magnus.karlsson@intel.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
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

Acked-by: Björn Töpel <bjorn.topel@intel.com>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>
Cc: David S. Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 net/xdp/xdp_umem.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/net/xdp/xdp_umem.c b/net/xdp/xdp_umem.c
index 83de74ca729a..17c4b3d3dc34 100644
--- a/net/xdp/xdp_umem.c
+++ b/net/xdp/xdp_umem.c
@@ -166,14 +166,7 @@ void xdp_umem_clear_dev(struct xdp_umem *umem)
 
 static void xdp_umem_unpin_pages(struct xdp_umem *umem)
 {
-	unsigned int i;
-
-	for (i = 0; i < umem->npgs; i++) {
-		struct page *page = umem->pgs[i];
-
-		set_page_dirty_lock(page);
-		put_page(page);
-	}
+	put_user_pages_dirty_lock(umem->pgs, umem->npgs, true);
 
 	kfree(umem->pgs);
 	umem->pgs = NULL;
-- 
2.22.0


