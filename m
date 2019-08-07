Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 179B083F5F
	for <lists+devel-orangefs@lfdr.de>; Wed,  7 Aug 2019 03:35:21 +0200 (CEST)
Received: from [::1] (port=55958 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hvArI-0000C0-95
	for lists+devel-orangefs@lfdr.de; Tue, 06 Aug 2019 21:35:20 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42639)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1hvArG-0008TT-IS
 for devel@lists.orangefs.org; Tue, 06 Aug 2019 21:35:18 -0400
Received: by mail-pg1-f194.google.com with SMTP id t132so42536316pgb.9
 for <devel@lists.orangefs.org>; Tue, 06 Aug 2019 18:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=66nLgLSrAAtLnk7heFQOXwTIycZbzywZGh2gpdUQtHA=;
 b=hGadGekT36tWWF2x+rPXatg5Phju1cJkPhVohpTnvU9xcLgSYz3c/H9JfBuvb/eqpQ
 gJm9ULhd1h25PBFy4ZlpC+tAGAEAzuKiPxwK1X6/dMDelBe1FYe+sUe691h23Hpm09qn
 NtkXw7G9BBhwySB0UzQpKOHO5RlAvdX8JQycevy+XDQPWxcX8dLLfHqYFlfiIf28POCQ
 XQLWbzezNK3qTnHI7eGrMbtyoSKY/W2T3jkcfT5nC0QYcZ+CMjkTw7ZL3pOdyAZGwJLx
 tXBADMMsq1ukRK67JdNPKq0uGvf0IBEzyL0wmcyHhzZLuqxNXwAHA+z0PFrP2wNDYOQy
 6sYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=66nLgLSrAAtLnk7heFQOXwTIycZbzywZGh2gpdUQtHA=;
 b=QKy6P69VPAU3CCS6sPRrz/DH/NXj8Uh4cCKM+dkvRdPMhAXe1HUo1bbYLJOh6dsHcE
 95f1pGX2Rk0UzL8qsaqTjup0JXnIC/zjFft0aKrQbGMdRaqkxFFK/hT6csy9JKO6vlVk
 QZFpkcqO4AcHfsryrzsm33jlaPe0MPweOlQqOHb5exADKHPHNv8pA2i3k3MGPd3HkYv9
 3zWxUXulqyJBuo6HvN0MXLwHwBOEGUV/kX7zsiPX6lDy0dZZXRijydHEf3TWNrBNSbVg
 ULvNLbFWNmkrw/J6+tPpgkEf3bl2ywMHZw9eDBfHXID1FA16PmnzIzGeXvTn5iPAX7lg
 hgxw==
X-Gm-Message-State: APjAAAUVrXUa1KcMl8+cRQl5YAUEsVU7t8xBwYH0B3ab+9QFk3XiUnpR
 t3d9Tb+unvd3lfFgIwwjRdE=
X-Google-Smtp-Source: APXvYqxVqy6uPNA5pMhiCuVlDYKPDVYd5IZkwA2Cp9U8q1WFZ9BX6VmEjp+QCN9e6zqU7bkXXXxyWA==
X-Received: by 2002:aa7:9197:: with SMTP id x23mr6650509pfa.95.1565141677758; 
 Tue, 06 Aug 2019 18:34:37 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:37 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 33/41] fs/nfs: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:32 -0700
Message-Id: <20190807013340.9706-34-jhubbard@nvidia.com>
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

Reviewed-by: Calum Mackay <calum.mackay@oracle.com>

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


