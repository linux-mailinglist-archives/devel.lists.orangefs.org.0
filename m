Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id D030980D5D
	for <lists+devel-orangefs@lfdr.de>; Mon,  5 Aug 2019 00:50:32 +0200 (CEST)
Received: from [::1] (port=46058 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1huPKh-0002RT-Uz
	for lists+devel-orangefs@lfdr.de; Sun, 04 Aug 2019 18:50:31 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45318)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1huPKg-0002El-CS
 for devel@lists.orangefs.org; Sun, 04 Aug 2019 18:50:30 -0400
Received: by mail-pf1-f196.google.com with SMTP id r1so38588498pfq.12
 for <devel@lists.orangefs.org>; Sun, 04 Aug 2019 15:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=py067aGaFWqYQnWW3CrL2Yk9VWIyNl4WEpwUsrZ7LgI=;
 b=P8+hbDz6iDdAtFosRygKfZrawOprY/RqOz+jkdBR9/iAK9lQTDaHpPD0YVzeAsadTA
 6buCCtQt6FcRN+b9XggnJ5bqnrb15u93xXHo/kWkRIj/AEZJAg96rbyj3hSasGDU5QMN
 kLomBnFCn//tdm3UAsqLPAHdx4izNhPtZ1DR2n/EeVgTygzhGs4N/AXfq0vWNV5wg6OG
 nDjWxo9WfIwu4zNuVNFOgCWRwLE7DfTE0h0+OhqrWzWxBngYRK81NL6ifxTbjwc0Tsbz
 dA0CzQ264QnjubFwn/fuuREzrVo+nBB4mnVLQqsZ8A+pWd/WcxXuqwIjuSU30F6iEjCB
 X4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=py067aGaFWqYQnWW3CrL2Yk9VWIyNl4WEpwUsrZ7LgI=;
 b=oR/f7CGX/ocs6LTmuOcbeFKwLXFJ26zE4TBNJ9wECzeHDQT+autJfI8D2sxg8HR+Dj
 GpXIKQflrQEdx1J1ZHq0GUxxbEUi0A7hiTgp+3qfJFjG3X4qoVpAkDUw1AKnlHYgU1Dk
 dSEI919g6AYtpuWk1pspj7tDjX2ZuJyqaH2iir3RDDlzzPsPC2Xv3/cau1XoEwFb0JIv
 xRRPFwDu0UuXaXchFM6DhHZw2zVDPiscrLCZOFb4k8qboNXVDaO8HHRbhVt0/EKDjAcG
 iMfc2EMOS3w8sXQccDJg+YlVNg58fjjkFf/nXGAbtMyT+pehSs3jwojsiHEgvL//VUpU
 oCyg==
X-Gm-Message-State: APjAAAUumoig79DaFUV5T7wMLVpbD43Pd8oeezEOkSr1a7toLpfubSvi
 oOvEH4a55w7MrLOXxZ3AIzI=
X-Google-Smtp-Source: APXvYqyegNlmLCsE27HWcwEQVob39MHAl+cimFnsXUYquTno1Yk7+aU+Agg2DBt67SqnkuavcPllBQ==
X-Received: by 2002:a63:29c4:: with SMTP id
 p187mr82820390pgp.330.1564958989494; 
 Sun, 04 Aug 2019 15:49:49 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:49 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 19/34] fsl_hypervisor: convert put_page() to
 put_user_page*()
Date: Sun,  4 Aug 2019 15:49:00 -0700
Message-Id: <20190804224915.28669-20-jhubbard@nvidia.com>
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
 Rob Herring <robh@kernel.org>, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
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

This changes the release code slightly, because each page slot in the
page_list[] array is no longer checked for NULL. However, that check
was wrong anyway, because the get_user_pages() pattern of usage here
never allowed for NULL entries within a range of pinned pages.

Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Kees Cook <keescook@chromium.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/virt/fsl_hypervisor.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/virt/fsl_hypervisor.c b/drivers/virt/fsl_hypervisor.c
index 93d5bebf9572..a8f78d572c45 100644
--- a/drivers/virt/fsl_hypervisor.c
+++ b/drivers/virt/fsl_hypervisor.c
@@ -292,11 +292,8 @@ static long ioctl_memcpy(struct fsl_hv_ioctl_memcpy __user *p)
 		virt_to_phys(sg_list), num_pages);
 
 exit:
-	if (pages) {
-		for (i = 0; i < num_pages; i++)
-			if (pages[i])
-				put_page(pages[i]);
-	}
+	if (pages)
+		put_user_pages(pages, num_pages);
 
 	kfree(sg_list_unaligned);
 	kfree(pages);
-- 
2.22.0


