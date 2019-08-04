Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFC780D79
	for <lists+devel-orangefs@lfdr.de>; Mon,  5 Aug 2019 00:50:46 +0200 (CEST)
Received: from [::1] (port=46180 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1huPKv-0002Um-Jy
	for lists+devel-orangefs@lfdr.de; Sun, 04 Aug 2019 18:50:45 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37781)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1huPKu-0002Gc-Mv
 for devel@lists.orangefs.org; Sun, 04 Aug 2019 18:50:44 -0400
Received: by mail-pl1-f194.google.com with SMTP id b3so35710591plr.4
 for <devel@lists.orangefs.org>; Sun, 04 Aug 2019 15:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Puv5caB6Xd1AJbwd7nGzyFKNouoVWAfL+vJwz/b+4QQ=;
 b=n2GzADBCRaGfCHf6HbXgRg+V0C89X4GtWNxkv2j3+LQsrqKpmTUVe0ByTHKQwdeBJn
 2GjNEQhUsYm7dhY4Od2Sd6r20534hykhUqRe4t1VnKwQ4DMvNZ5YhS01Fzzgrjh0SFnz
 cOALy97h5W1lbkzKyPwHr+vFBFBbcXlcy5zpFAQBNWN4n0Cj0kftmPhY24PBwGy3tLN5
 iaVwvJuxvheoQgKbgYArnZAnGqCyndt7VZwBKzGO0BC6OrGMqarpUlPnyV+UVYDmCU/k
 M/mEk0A479arzsza58VY7eIxZdZ0ZSau4HrT6ltuIf1VzdnlaHlbMs8Cfp7zJmoWUVEJ
 eBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Puv5caB6Xd1AJbwd7nGzyFKNouoVWAfL+vJwz/b+4QQ=;
 b=KcWe+B1GhlddmEpqF4GDgrKgb4lMK7djKlxFXefgdmhbqLUskLcybRzU35DaXXV2NM
 0ijLKhIN0lYgRFUGItHp4i0QN+5V7z2uRRAxTURARpp3HnIvqdnYmINLRGFYkJfZkgYx
 0ghaJFPOCENNu2VvvW+6KwfxiddwByC5Er7DY8z9nexZZZWkOpvkoMpRcGlK8K5v1FNn
 HVZjpgljm4+3zrvKiuIGYNScatp/xE6QcQ2TkqmGsWJgscEKuwU5gvpsbHk0cMOl8j1w
 E5ZsYouRVls/HZIf4aBxkBXBXARf7sGVPmdZRU3/IrRtKTk9KbTqH3S3TmyODZcxJsKR
 fgPA==
X-Gm-Message-State: APjAAAXJgyUQiUhqnpSwmVDNA0rpXeNQmOukET9wK2U+8JnTi3Fw03pL
 WMAO5eGmrcHYy6s3xZRmzIw=
X-Google-Smtp-Source: APXvYqwABL/owZcbuKs02BqFh/fswcnIOGTkP8u9lrE9SbNiB96M9TYbiEw8R+LSl6DRBzA56M1pUA==
X-Received: by 2002:a17:902:bb81:: with SMTP id
 m1mr58194086pls.125.1564959003903; 
 Sun, 04 Aug 2019 15:50:03 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.50.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:50:03 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 28/34] mm/madvise.c: convert put_page() to put_user_page*()
Date: Sun,  4 Aug 2019 15:49:09 -0700
Message-Id: <20190804224915.28669-29-jhubbard@nvidia.com>
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
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Daniel Black <daniel@linux.ibm.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Mike Kravetz <mike.kravetz@oracle.com>
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

Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Daniel Black <daniel@linux.ibm.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 mm/madvise.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 968df3aa069f..1c6881a761a5 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -672,7 +672,7 @@ static int madvise_inject_error(int behavior,
 		 * routine is responsible for pinning the page to prevent it
 		 * from being released back to the page allocator.
 		 */
-		put_page(page);
+		put_user_page(page);
 		ret = memory_failure(pfn, 0);
 		if (ret)
 			return ret;
-- 
2.22.0


