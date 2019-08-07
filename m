Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CCF83F5E
	for <lists+devel-orangefs@lfdr.de>; Wed,  7 Aug 2019 03:35:18 +0200 (CEST)
Received: from [::1] (port=55944 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hvArG-0000Bd-6V
	for lists+devel-orangefs@lfdr.de; Tue, 06 Aug 2019 21:35:18 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42637)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1hvArF-0008TM-3Q
 for devel@lists.orangefs.org; Tue, 06 Aug 2019 21:35:17 -0400
Received: by mail-pg1-f193.google.com with SMTP id t132so42536294pgb.9
 for <devel@lists.orangefs.org>; Tue, 06 Aug 2019 18:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4iYkOl3aeyTERThJenFq1/3UwJx4Onl0nTT+k7YLDaI=;
 b=fg/Pfm4bbVSmVcCrQT7+5JHEhqSFsHPgOaHWfBPnZWxRApjKfb4cb3kH5stgfnMMig
 zbelcrPsCI0tI4xwfOZRnckTrTKeUm3wG0kqfTVOMRYMB6MvjyF1Rql1N0HWLaZIzEfM
 iWdx9yjCpgBpQS5lPDIGFaAFICDzqEqnoV9x5MiP1hBYLTSZ4ogFH5QAAV9Yz6tw/8b2
 ZykLmdq9ZFns/SDVctWkjbZ0w3aCcCbjN/JvbQSxSyp41bzHjOAMChIKQXNa4QdCxgL9
 jwRKUeEurDeq/o0JqzXeiTfFAPo9oNntq7QpxEmENoOSeaVMGgE1SeT20aw5cXMwj05c
 mafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4iYkOl3aeyTERThJenFq1/3UwJx4Onl0nTT+k7YLDaI=;
 b=Ek8BPsM37V4EdafTDcltd8GMr2bG8RvFQgns9rwMyRBRi+9q4r1iLDQ9MQgYAzWvmN
 lakjd3JIe/7PBmfTqqAjwHVY07da35FnzRZVKEAby7pQdfUcRSg9eoT9fWQz+kFpA7fB
 M5LfAHyMKLAfXZB5q6lXz+p085O7IvkAYoEmlj0sJDvtHyZ9bwdgFBJyONTuZLUwuDSL
 tByGgzxkO71gugIuaOHGN6cfXei1bj2GGToJ0xMnc3ZU8gbicywvDlRCNOKCM7hmZxe3
 xlahooJuuDZ0uCdE6cXFfq+dFAv7eIrAcJ0bsrmChiyIQbKt/CD37U81Wxh3bPbsRKsx
 TfGw==
X-Gm-Message-State: APjAAAU/+6EAIa9QQZ5b8GxxCXEOJMwRg+OiMvedDt+X4qrYLRWmnWVt
 V2GDUpmGRDOLNAPRg7T5EWY=
X-Google-Smtp-Source: APXvYqyxpq50qUVkp6HWZCQLNWkEvhnyucBHKSZoboyNMe/1/wbJw75uRBEC9F8SIFpx6GEidj30Zg==
X-Received: by 2002:a17:90a:de02:: with SMTP id
 m2mr6000462pjv.18.1565141676262; 
 Tue, 06 Aug 2019 18:34:36 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:35 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 32/41] crypt: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:31 -0700
Message-Id: <20190807013340.9706-33-jhubbard@nvidia.com>
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
 rds-devel@oss.oracle.com, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
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

Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David S. Miller <davem@davemloft.net>
Cc: linux-crypto@vger.kernel.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 crypto/af_alg.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/crypto/af_alg.c b/crypto/af_alg.c
index 879cf23f7489..edd358ea64da 100644
--- a/crypto/af_alg.c
+++ b/crypto/af_alg.c
@@ -428,10 +428,7 @@ static void af_alg_link_sg(struct af_alg_sgl *sgl_prev,
 
 void af_alg_free_sg(struct af_alg_sgl *sgl)
 {
-	int i;
-
-	for (i = 0; i < sgl->npages; i++)
-		put_page(sgl->pages[i]);
+	put_user_pages(sgl->pages, sgl->npages);
 }
 EXPORT_SYMBOL_GPL(af_alg_free_sg);
 
@@ -668,7 +665,7 @@ static void af_alg_free_areq_sgls(struct af_alg_async_req *areq)
 		for_each_sg(tsgl, sg, areq->tsgl_entries, i) {
 			if (!sg_page(sg))
 				continue;
-			put_page(sg_page(sg));
+			put_user_page(sg_page(sg));
 		}
 
 		sock_kfree_s(sk, tsgl, areq->tsgl_entries * sizeof(*tsgl));
-- 
2.22.0


