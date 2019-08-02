Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9BF7E83C
	for <lists+devel-orangefs@lfdr.de>; Fri,  2 Aug 2019 04:21:04 +0200 (CEST)
Received: from [::1] (port=50942 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1htNBn-0007nB-Hz
	for lists+devel-orangefs@lfdr.de; Thu, 01 Aug 2019 22:21:03 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43017)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1htNBm-0007io-4Q
 for devel@lists.orangefs.org; Thu, 01 Aug 2019 22:21:02 -0400
Received: by mail-pl1-f193.google.com with SMTP id 4so26013420pld.10
 for <devel@lists.orangefs.org>; Thu, 01 Aug 2019 19:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fEUR/G5OnJcefSlX4AYJWWcgqHhC+JXxEofDOG22P/4=;
 b=ZjBIvPI6FGYYuQaoM3wYb6xPjNep6A1qdBgLoxOD+angQDRZC9mN7qZBiGsA4x1Mmk
 DVp0b1Fq3km/l8LFUFJZZReS797zF2kYF9KrMWUllVa8HFfcUrM1hAE1P/qQjXzrMnOX
 JxD/xFl+WZHXSEuAGF9iElPEIqC+TRo873joNlnRMAHY9AMqSmLW3nsU27bTpXhcFKV6
 4LeM2yIf45e6IoMit2yX6aFzmLhkspb/EkG8Tlqf3bZNN4WeHI7tMYFctQdF6liMtwoJ
 IvfT9HS49sxx2bYOPNOBswTMjccuTwXWnzyhwEMT1ktty7/Al6mbgY/88Wt++RCGQUor
 cVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fEUR/G5OnJcefSlX4AYJWWcgqHhC+JXxEofDOG22P/4=;
 b=UQRf2cvuCHlblXMXeeIDJKuBCdLyCnv1gML1gMIrtB1DsQQYbfCPFOBHmOV8ExL/fr
 zivG9c95xOQKufhcragthsHDnelFwhpyd51FVfxmLJ92Ux7YizuleoI3/b29iREixrH0
 y8vhbkn5iXFi28jbK+qmHNUoexPmjzAnUO8CQYkAiIK7mehyJKmVr0ocamsqx+9rLTNO
 2tGNu+cqPUtJwe8hVSG3sOLfSHQ7jhkD+H2OPhTq2eqTJJloLwJ8/ddg/63zDqR7FQ96
 krldQMgnikBqXCAqnkjb1Qwy7cqwN/8UWEWYPb1B3iHYKEs7Gp3FYK0VWsn1vbXBSZgt
 LcrQ==
X-Gm-Message-State: APjAAAXBp8s3ZeI8zCdWjZyvOE/Wj3jCgh5OCot5PkzdjZrQOwRMliUl
 Rz1pVQUnAjR0rvunhdG59vE=
X-Google-Smtp-Source: APXvYqx7CDlh0PC+iGQbvpFabXIK4hA95kcB6ECyCRgjU7tdLEhAXCZnA9jGvinS59yHHVq1pirulQ==
X-Received: by 2002:a17:902:a409:: with SMTP id
 p9mr130268364plq.218.1564712421229; 
 Thu, 01 Aug 2019 19:20:21 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:20 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 06/34] drm/i915: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:37 -0700
Message-Id: <20190802022005.5117-7-jhubbard@nvidia.com>
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
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
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

Note that this effectively changes the code's behavior in
i915_gem_userptr_put_pages(): it now calls set_page_dirty_lock(),
instead of set_page_dirty(). This is probably more accurate.

As Christophe Hellwig put it, "set_page_dirty() is only safe if we are
dealing with a file backed page where we have reference on the inode it
hangs off." [1]

[1] https://lore.kernel.org/r/20190723153640.GB720@lst.de

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 528b61678334..c18008d3cc2a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -527,7 +527,7 @@ __i915_gem_userptr_get_pages_worker(struct work_struct *_work)
 	}
 	mutex_unlock(&obj->mm.lock);
 
-	release_pages(pvec, pinned);
+	put_user_pages(pvec, pinned);
 	kvfree(pvec);
 
 	i915_gem_object_put(obj);
@@ -640,7 +640,7 @@ static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
 		__i915_gem_userptr_set_active(obj, true);
 
 	if (IS_ERR(pages))
-		release_pages(pvec, pinned);
+		put_user_pages(pvec, pinned);
 	kvfree(pvec);
 
 	return PTR_ERR_OR_ZERO(pages);
@@ -663,11 +663,8 @@ i915_gem_userptr_put_pages(struct drm_i915_gem_object *obj,
 	i915_gem_gtt_finish_pages(obj, pages);
 
 	for_each_sgt_page(page, sgt_iter, pages) {
-		if (obj->mm.dirty)
-			set_page_dirty(page);
-
 		mark_page_accessed(page);
-		put_page(page);
+		put_user_pages_dirty_lock(&page, 1, obj->mm.dirty);
 	}
 	obj->mm.dirty = false;
 
-- 
2.22.0


