Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE8B83F16
	for <lists+devel-orangefs@lfdr.de>; Wed,  7 Aug 2019 03:34:40 +0200 (CEST)
Received: from [::1] (port=55616 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hvAqd-0008U6-EC
	for lists+devel-orangefs@lfdr.de; Tue, 06 Aug 2019 21:34:39 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42586)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1hvAqc-0008Qb-7B
 for devel@lists.orangefs.org; Tue, 06 Aug 2019 21:34:38 -0400
Received: by mail-pg1-f193.google.com with SMTP id t132so42535512pgb.9
 for <devel@lists.orangefs.org>; Tue, 06 Aug 2019 18:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YDBAQLU7S2U/jcsuraEitExVA8qAggFNDXffEk4LOSU=;
 b=fH35navam8Lh5O3/qNrV94jl6iS2d0GfzCxk/u0RVGSb5dvr8ME5vr6Nrz7RbT0FzH
 b+0bwfj6a40pZ7ZDEBSPteuD+EtCdatETgtIbhA4HjNGhTvq4/6/8Hfd0cWzD4ACfYbW
 rgRW0nwu/E9vCWm7L7kW1f14dc8w0gfs4RZvtHi6Oflt61RfXIS6VkmL4oCieKfyzE0K
 4m3Xz2o0LiyRj0Y9KXj50L4atLA3dDsoGvMpdRLog6j+z0Lu9QLqi3MvwrgBmW5y8MHT
 21A4qIppa4JRGq/2QNHN+lrWM1Z/51ATanglohKPJpBhZfdY/rs/WBKjHemXIrn3RGac
 3taQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YDBAQLU7S2U/jcsuraEitExVA8qAggFNDXffEk4LOSU=;
 b=ANuW+k9OdB2ZJIyWCo2N6bZZ68Ou+C9vipZwvInUuwFuOyOG0oez/6PglQPG7KiEJ3
 aOrrJS00+srxySd/Q0p5XP3xk6JnZaFcL/iEVi51Twa0X/h8/6pRk6n3HZHnSKhyY5xt
 QAzy5T7MtquTPcrX/tUZPLEvpcgzwnQhpyXSwzDNZZbnfS2EmxF0fU8D1n3eAHF0cuEw
 4aci2p4kU8zsXuXi1dhKqxTovCA2sEGc6qATqQUeSsqr5ZudRJbyHYkP3RCuust1gXX1
 ClOqrKV/zJnCwyzlV8LFcQS36DWklk4AcnGjCt4EgsZ7M8bGHDJPCK23z4s2grrCw9Xm
 uDgA==
X-Gm-Message-State: APjAAAXmk/olDyT4tcuGRhyKkKlW6rIQn5fWEbBDC91Xj9Y3Q9JqVKUw
 zkumrNx5UH7r3xiZ2cxOz7Y=
X-Google-Smtp-Source: APXvYqxowmB5KY9x5+3VpBUz7AtpjaBcc2B1U6EZUCl5VRWjmEE9hilm+u0BPGPiavOiCOJ108uPDQ==
X-Received: by 2002:a17:90a:30cf:: with SMTP id
 h73mr6096915pjb.42.1565141637378; 
 Tue, 06 Aug 2019 18:33:57 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.33.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:33:56 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 08/41] drm/i915: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:07 -0700
Message-Id: <20190807013340.9706-9-jhubbard@nvidia.com>
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

This is a merge-able version of the fix, because it restricts
itself to put_user_page() and put_user_pages(), both of which
have not changed their APIs. Later, i915_gem_userptr_put_pages()
can be simplified to use put_user_pages_dirty_lock().

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 2caa594322bc..76dda2923cf1 100644
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
@@ -675,7 +675,7 @@ i915_gem_userptr_put_pages(struct drm_i915_gem_object *obj,
 			set_page_dirty_lock(page);
 
 		mark_page_accessed(page);
-		put_page(page);
+		put_user_page(page);
 	}
 	obj->mm.dirty = false;
 
-- 
2.22.0


