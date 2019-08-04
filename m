Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EE380D7E
	for <lists+devel-orangefs@lfdr.de>; Mon,  5 Aug 2019 00:50:51 +0200 (CEST)
Received: from [::1] (port=46230 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1huPL0-0002Vu-RH
	for lists+devel-orangefs@lfdr.de; Sun, 04 Aug 2019 18:50:50 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37954)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1huPKz-0002I1-HU
 for devel@lists.orangefs.org; Sun, 04 Aug 2019 18:50:49 -0400
Received: by mail-pf1-f193.google.com with SMTP id y15so38609123pfn.5
 for <devel@lists.orangefs.org>; Sun, 04 Aug 2019 15:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sx0x91HVjVXCVkLMMHrdncyqT4rW2sU28Vf+3l+oloA=;
 b=M7iDvAmPBRpGJcJpcoqgvaoi3nLFkyQK4dkSIj4ojX3FvseJtfjnZyfckr18kI2oDa
 LHzSPof56TngxWHSp0ym44XehwQNp0Dvit6wm4Dt65OPXwL2baR6+4zLMuIAexRHFzmx
 ZFMgjeYMSC1sErMdOV/WNMAc2Iu4rRWK81eLPAWfZwZdfeXx16tZd5680zs185LTKzUq
 VYv2LHkMnMPv4yg/Pui3fxt3Z+TxPOd1GexxLj8LbBhnNpT3XVb8jW9mQwG5C5+4ClkN
 g/MAUKuZK56HuoBkHT35BiifdFKR3pPYOWepAjU+8QcCzdVYmtG3jMaPBQTkt/nS1dsZ
 WZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sx0x91HVjVXCVkLMMHrdncyqT4rW2sU28Vf+3l+oloA=;
 b=mZ8MVVrinJC+a8MpjjFbNftl++CASlHisEOomqXlkltbeAD2gU0+qcI06/qytpJdp2
 0oMaSct+XddXM5NggBowxRKZjzUmOaOG7OgMVerqWXtytsg1GK9K13P1uGjzPHfMutq7
 BkAFOxRWU5TLdbXhj3GVTfDYTPJdYSUND7uzt7Xog3v8l20XW1t1xCS6EJ42goeQhGSz
 leBGCn1m7+kFjQUJSNbMxwRXS4hWdlfqUvMOaLK/RlqKU1g4MdZbV1p2PeuLCPt0lY+1
 o4K9BOFyXbGUwf1R9zj8e16iNmJm7UWTzioxVf0WVfYOOExzb2tk7Qbp6pgB4Q5ZpRWn
 WpyQ==
X-Gm-Message-State: APjAAAX3fFQh8ZTgnQSY7tr2RKoYwAdKbg9ZaXJkuwHrCWwgqGgA9z7q
 IjBYw+eH/G8ZsyggYGvv+m4=
X-Google-Smtp-Source: APXvYqzdBAOi64WyR4vf0DFOxQNVALmaSa46GoCIBIpjxflBtAErOscOmlieUmCz4Qhdah1mimse2w==
X-Received: by 2002:a63:7358:: with SMTP id
 d24mr133542074pgn.224.1564959008549; 
 Sun, 04 Aug 2019 15:50:08 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.50.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:50:08 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 31/34] fs/nfs: convert put_page() to put_user_page*()
Date: Sun,  4 Aug 2019 15:49:12 -0700
Message-Id: <20190804224915.28669-32-jhubbard@nvidia.com>
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
Cc: Calum Mackay <calum.mackay@oracle.com>, linux-fbdev@vger.kernel.org,
 Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
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

Cc: Calum Mackay <calum.mackay@oracle.com>
Cc: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: Anna Schumaker <anna.schumaker@netapp.com>
Cc: linux-nfs@vger.kernel.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 fs/nfs/direct.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/fs/nfs/direct.c b/fs/nfs/direct.c
index 0cb442406168..c0c1b9f2c069 100644
--- a/fs/nfs/direct.c
+++ b/fs/nfs/direct.c
@@ -276,13 +276,6 @@ ssize_t nfs_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
 	return nfs_file_direct_write(iocb, iter);
 }
 
-static void nfs_direct_release_pages(struct page **pages, unsigned int npages)
-{
-	unsigned int i;
-	for (i = 0; i < npages; i++)
-		put_page(pages[i]);
-}
-
 void nfs_init_cinfo_from_dreq(struct nfs_commit_info *cinfo,
 			      struct nfs_direct_req *dreq)
 {
@@ -512,7 +505,7 @@ static ssize_t nfs_direct_read_schedule_iovec(struct nfs_direct_req *dreq,
 			pos += req_len;
 			dreq->bytes_left -= req_len;
 		}
-		nfs_direct_release_pages(pagevec, npages);
+		put_user_pages(pagevec, npages);
 		kvfree(pagevec);
 		if (result < 0)
 			break;
@@ -935,7 +928,7 @@ static ssize_t nfs_direct_write_schedule_iovec(struct nfs_direct_req *dreq,
 			pos += req_len;
 			dreq->bytes_left -= req_len;
 		}
-		nfs_direct_release_pages(pagevec, npages);
+		put_user_pages(pagevec, npages);
 		kvfree(pagevec);
 		if (result < 0)
 			break;
-- 
2.22.0


