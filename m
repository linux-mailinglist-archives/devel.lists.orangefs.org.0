Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A0C7E859
	for <lists+devel-orangefs@lfdr.de>; Fri,  2 Aug 2019 04:21:26 +0200 (CEST)
Received: from [::1] (port=51140 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1htNC9-0007sB-EB
	for lists+devel-orangefs@lfdr.de; Thu, 01 Aug 2019 22:21:25 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:32843)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1htNC8-0007j3-Bm
 for devel@lists.orangefs.org; Thu, 01 Aug 2019 22:21:24 -0400
Received: by mail-pf1-f193.google.com with SMTP id g2so35158846pfq.0
 for <devel@lists.orangefs.org>; Thu, 01 Aug 2019 19:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NpCZQ4VK8hzAbP37Qxye6UhXG/4cH2zDttwN2tDhLJk=;
 b=hA+dHc1dKtzF01UNAT1GCb910It9M6OYeo1UwisVEiPximZ0Uizqhd58Gx7EN+cwqG
 oOXAC9GpXS9cMgyPAFeZsWw6yiG5HTsH6dTfrkzHKXhkxbTehvYO/DkXd3o8uGT1hUxz
 8W3I7PS2I6VpD8By/LG/APt7ortKYREWRihQ/MahJgv1XZqDU9aXSO+0f9WVFU4wcOzF
 PifhANph7r1h1aR2sJtcNbzpatSVDPr8LOmoCCwtkUnv/6xTTuq0KjPRlt5jI5AQn0Bo
 qGRQZk7nx9WeapKs5M+9pdwyKPbEullYlAI/CW2M7lTdWIAU5bo5Tw/OmRhRr64X9QFj
 r+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NpCZQ4VK8hzAbP37Qxye6UhXG/4cH2zDttwN2tDhLJk=;
 b=IYZWabbd9gNIEDrtFrkUTbiAGukBe/zjf2baCApLKEOpYg94rUljD2R6T3nKQJ5Z7L
 idbbrQDse9BxfSo/Cl6Gk/PCm/xu0kJtAYVl64F4qo7lHYeXvT3Ffi5CYY2P/mPa6+Vv
 wdAEZ3s5k7zaAGAGAEmrxIgU4gBDplxgu8+upjmh7vZbRP55+jwy6hkn7M+TNWN6/ode
 QG/A53s1CakU6AvIM05axtdtp7jgnD77McCqXB9FGFyxKmK10V6pj8W0ucjF2P8cuNEL
 Lo32rxGfBltpQ/TDcwQNu2eXVIkhZU8GPd04J0VlmuiVJ6m8GpaguKJ5bm1XB06QUAzF
 z4LQ==
X-Gm-Message-State: APjAAAVTH7VORjiMXkQqQHd7nQXUPlSek7u/S4NbOQkLRtqwu1BJ9Ax1
 o/IHuizU4Kka3M16k8PscRs=
X-Google-Smtp-Source: APXvYqwoCf/Pdnvn5s1n1tJ64nDODMRXeExgk7vpJhyWgRCwW2Xl8gxjUqSaBtscPD/0WWSuL29y+g==
X-Received: by 2002:a62:fb18:: with SMTP id x24mr55563811pfm.231.1564712443423; 
 Thu, 01 Aug 2019 19:20:43 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:42 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 20/34] xen: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:51 -0700
Message-Id: <20190802022005.5117-21-jhubbard@nvidia.com>
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
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
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org
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

Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/xen/gntdev.c  | 5 +----
 drivers/xen/privcmd.c | 7 +------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 4c339c7e66e5..2586b3df2bb6 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -864,10 +864,7 @@ static int gntdev_get_page(struct gntdev_copy_batch *batch, void __user *virt,
 
 static void gntdev_put_pages(struct gntdev_copy_batch *batch)
 {
-	unsigned int i;
-
-	for (i = 0; i < batch->nr_pages; i++)
-		put_page(batch->pages[i]);
+	put_user_pages(batch->pages, batch->nr_pages);
 	batch->nr_pages = 0;
 }
 
diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 2f5ce7230a43..29e461dbee2d 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -611,15 +611,10 @@ static int lock_pages(
 
 static void unlock_pages(struct page *pages[], unsigned int nr_pages)
 {
-	unsigned int i;
-
 	if (!pages)
 		return;
 
-	for (i = 0; i < nr_pages; i++) {
-		if (pages[i])
-			put_page(pages[i]);
-	}
+	put_user_pages(pages, nr_pages);
 }
 
 static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
-- 
2.22.0


