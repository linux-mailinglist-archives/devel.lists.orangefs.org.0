Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 074BF83F3A
	for <lists+devel-orangefs@lfdr.de>; Wed,  7 Aug 2019 03:35:00 +0200 (CEST)
Received: from [::1] (port=55780 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hvAqx-00006t-7o
	for lists+devel-orangefs@lfdr.de; Tue, 06 Aug 2019 21:34:59 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40479)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1hvAqw-0008Qs-1A
 for devel@lists.orangefs.org; Tue, 06 Aug 2019 21:34:58 -0400
Received: by mail-pf1-f196.google.com with SMTP id p184so42492437pfp.7
 for <devel@lists.orangefs.org>; Tue, 06 Aug 2019 18:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zk7mJfsjIPJK9Qgsn0u5osZJajJrXebF0c1tZrgdgoI=;
 b=SC6fy0nJ+5PJ+uzUodkQNgZrF01XL4oLeLC56OFBk8WNdVXJEhXdfnbycjiEGLb0We
 Iu9ehQr2XuhNar0+cOOcnuWTDzgnJQOZf2nhFq9SkSbfMVKKQlgbBbr/DzgGJpA2zgNE
 SH9LdtGtZEDMK2ObSXiKnb7p35+i1ZPY62UTf23m8h6lM8RDSVmojjsKFFq6AHV0Kg7N
 l0Mr0PozM18bgs6gsyipPgOwh2HesyAFpZqdTaDseaeVgz0a/Wn16vsKh7i90SBwvo7N
 ssA83RPwWAs18iPpiVevS9yzToDMKktmsaAXU8RmgcEKrZ1Ps1HBX3IeUwmveghlYyG8
 ruRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zk7mJfsjIPJK9Qgsn0u5osZJajJrXebF0c1tZrgdgoI=;
 b=Epr5fpFUHcmmRYp/zhV4yjK60VgE5J2x9vdf7osskbGywFh9UtfvZOWfFgPYcNuEn2
 d5GteV79MvgO1KyZLtfxVuT73O+3tslyuyUGZi8YlcSPOEVAITKiqie4FSvRplHHfzs4
 L+t1mAhAeEDXYWhcv/Yqv0dMbRF1aYqbFSjgB84b7cWTxxzVrCO+RsaXj27jX5DKCxY7
 TasN+PcOiS3j5MSLL+S6X864E68pBkQDvHGrMPCYYwRgR2Z5QrKqZ3jWwVG4WmMEcMGW
 1adC3tvOImblETkB8QOlGyt49UkdfBOQlbbTCPMDW6oSf3OjOD5DqLy9ayetcMYVgwyn
 2GXA==
X-Gm-Message-State: APjAAAW0Z/aSgaCznYwnfTFkkzPZaVEA0lok3aM7umvbwykmIdbbmSPp
 +l4Xhsl8p+aNp04Yrj5dyjY=
X-Google-Smtp-Source: APXvYqzgZPQySecfl1w9rbSdSUoujeX96j23T70OrIYhDcbszTpXzwBQIEpy9+PmeMFp8KmBYei+SA==
X-Received: by 2002:a63:dd17:: with SMTP id t23mr4918609pgg.295.1565141656992; 
 Tue, 06 Aug 2019 18:34:16 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:16 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 20/41] fbdev/pvr2fb: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:19 -0700
Message-Id: <20190807013340.9706-21-jhubbard@nvidia.com>
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
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Arvind Yadav <arvind.yadav.cs@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Bhumika Goyal <bhumirks@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>
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

Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Bhumika Goyal <bhumirks@gmail.com>
Cc: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/video/fbdev/pvr2fb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/pvr2fb.c b/drivers/video/fbdev/pvr2fb.c
index 7ff4b6b84282..0e4f9aa6444d 100644
--- a/drivers/video/fbdev/pvr2fb.c
+++ b/drivers/video/fbdev/pvr2fb.c
@@ -700,8 +700,7 @@ static ssize_t pvr2fb_write(struct fb_info *info, const char *buf,
 	ret = count;
 
 out_unmap:
-	for (i = 0; i < nr_pages; i++)
-		put_page(pages[i]);
+	put_user_pages(pages, nr_pages);
 
 	kfree(pages);
 
-- 
2.22.0


