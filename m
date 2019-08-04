Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id F364780D37
	for <lists+devel-orangefs@lfdr.de>; Mon,  5 Aug 2019 00:50:12 +0200 (CEST)
Received: from [::1] (port=45886 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1huPKN-0002Ix-Vm
	for lists+devel-orangefs@lfdr.de; Sun, 04 Aug 2019 18:50:11 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38507)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1huPKN-0002At-59
 for devel@lists.orangefs.org; Sun, 04 Aug 2019 18:50:11 -0400
Received: by mail-pl1-f196.google.com with SMTP id az7so35652695plb.5
 for <devel@lists.orangefs.org>; Sun, 04 Aug 2019 15:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o2GwgSJoRuvPfZ2J7Awdgxw+WyrY01QvDnyFb1fV9Xk=;
 b=IixwRKA1QE3hWrmSzVu2XYy+JWLjNAQrucyf3NmNwYmsVM90KnIP/Y31YnkjOev47U
 W5BLgfFrXSW8PROIAFlomTaKNpVy1Vu5By67adxMe4BBJxN/wVE8FkT1LMOB065Mk0v2
 mSKCOGzenGHlXCxavESBy8UzJUM5v3SbHyYItPfvN0BCRa3ugcdFoCHED6cZcBJjkH8M
 ktZ6/qTMPJteWEcAIxyF4khSUAdUalV8iDMz2BZGmRYRaKNynSgB+6FWP696OD7W7rKp
 ihl6Zic4VgOX9hVo+fby0upSQX/BJURRdR3g7cpl9a4Zd0ppOamvzLqwtGuG3Jg66+lE
 8+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o2GwgSJoRuvPfZ2J7Awdgxw+WyrY01QvDnyFb1fV9Xk=;
 b=XAJu/y4NI3nRmxnB3tKSHO54LceOZnt3okWu1b1cVpYzX2YDJhjDtVMAGzFEWRAyrQ
 FFWHewHTQkQGDlS0pjc5AGh2wD2LvzQHYFCpSoBR7avFe1r2x1kRJeQVJKLHosRauhDQ
 6SNaTgZqkdk3gnlvRmIZYg45CSOW1w1MLJcGxMZOY2o730CngcONTDnFslNRukKW63Jj
 BOMdT6TYmRELUFS2BlJGg3hOl0joVPj9qNdU/SxzGmNxoyRClYb9DB9P2bNHKm16xJBL
 bqOOOFmoenpeNnLQXzYaIodEbYWyjAFZiHC4YCaJp+mbaOk0YcxhKWBEc0jwNzfF1kGh
 vRHQ==
X-Gm-Message-State: APjAAAWRfgappvCAQBwXYrfmXQ6/qIaq8NE7+cMTZ5z/9JH/LJa4j2g2
 BTdV8WY7MBDa+QrnHm1TmnM=
X-Google-Smtp-Source: APXvYqzkwKiNRyTGG1wY4vsK+VenpXGpZnU+FOR0NniR/kq9Ywi59tDMXfkUVow9nHIhYFHAcQFleQ==
X-Received: by 2002:a17:902:e282:: with SMTP id
 cf2mr143340556plb.301.1564958970256; 
 Sun, 04 Aug 2019 15:49:30 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:29 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 07/34] drm/radeon: convert put_page() to put_user_page*()
Date: Sun,  4 Aug 2019 15:48:48 -0700
Message-Id: <20190804224915.28669-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
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
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, David Zhou <David1.Zhou@amd.com>,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: David (ChunMing) Zhou <David1.Zhou@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index fb3696bc616d..4c9943fa10df 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -540,7 +540,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_tt *ttm)
 	kfree(ttm->sg);
 
 release_pages:
-	release_pages(ttm->pages, pinned);
+	put_user_pages(ttm->pages, pinned);
 	return r;
 }
 
-- 
2.22.0


