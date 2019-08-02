Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 874637E862
	for <lists+devel-orangefs@lfdr.de>; Fri,  2 Aug 2019 04:21:35 +0200 (CEST)
Received: from [::1] (port=51224 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1htNCI-0007yS-Q3
	for lists+devel-orangefs@lfdr.de; Thu, 01 Aug 2019 22:21:34 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40104)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1htNCH-0007kn-9d
 for devel@lists.orangefs.org; Thu, 01 Aug 2019 22:21:33 -0400
Received: by mail-pl1-f194.google.com with SMTP id a93so32956800pla.7
 for <devel@lists.orangefs.org>; Thu, 01 Aug 2019 19:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o8Q8kE8hzW/DwKrVVZh1taN77rkNxpuim/5zYvIGd0I=;
 b=SN9JCWjRa62SDUJKkHaVdcwHX85kw/BYyJx1Oz6MKq1tPWuA+R+kvOX6gTDvC/TGzM
 WuYG+JBQhglp5JUL5bE3kcONL91y/gVNfG1/TEEmXEUkwsc3IV9ZwlZo4fZZ39RQbUrI
 einldN97i3VjPzZmNrk7Gi70UVvHdYeVSXiOY7z0rmJg1OD2RJX0hB2kTyBbOVlbD4F/
 wFv0bPm5s1TrbkD6/tFvn6bnIJfGHM4gcvzjJiA5o2aPM4xOIDqOY4iccbO2F7+VYayI
 O0zTQo6na3+rAYAFM80xDRcL3DANvgDbjQbLbpyWsZCgQEzyIKagAyXZm1uNkiwXdu5u
 s1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o8Q8kE8hzW/DwKrVVZh1taN77rkNxpuim/5zYvIGd0I=;
 b=gLx3dTJItwBrKmTsATJPZn8t7MxesIhq1Y4IfvV8rVTYlb66AJhgHBj/qeNTCUpDvq
 d33raHzW9mx991WrOLX2Hkl+CwzOzIUxLKY8KTL3g4gJ/FWtkC5+LNLtBx2HfbNoyJMz
 /m5Vje+X3TcuiwkjMjMdRHA+VOWriNzVwjst8Xfcg/XIQSvl142v23+RJSJu0POcDYbH
 qATs09p8xpbEYz2z6ZgKatl7IMAZHMk5YmiJTjIg4g3FnT+m7M+B1LoDFSAprLWMssdr
 XicM/FtZau7LW/kGVVSDJJtqIh9jiAy6aapncjYKgXwtJGYkEjwWzND/EcX6j1ejSFtU
 OAIg==
X-Gm-Message-State: APjAAAXWb4ommBDUycQupVobmjACL4/BboGk+/vPwCks2cXCTq5W2DYR
 0U3ylQHOnXCSu8zipe/2SNA=
X-Google-Smtp-Source: APXvYqz1YTjVZYS+LesWuf1AG7NOEG7XNcFlAKVjP+75gMoI5m//7o/WseaBl+rAw+Wa9I/u7wQNfg==
X-Received: by 2002:a17:902:740a:: with SMTP id
 g10mr129917590pll.82.1564712452476; 
 Thu, 01 Aug 2019 19:20:52 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:51 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 26/34] mm/gup_benchmark.c: convert put_page() to
 put_user_page*()
Date: Thu,  1 Aug 2019 19:19:57 -0700
Message-Id: <20190802022005.5117-27-jhubbard@nvidia.com>
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
 "Michael S . Tsirkin" <mst@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, Keith Busch <keith.busch@intel.com>,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 YueHaibing <yuehaibing@huawei.com>, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
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

Cc: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Keith Busch <keith.busch@intel.com>
Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: YueHaibing <yuehaibing@huawei.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 mm/gup_benchmark.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/gup_benchmark.c b/mm/gup_benchmark.c
index 7dd602d7f8db..515ac8eeb6ee 100644
--- a/mm/gup_benchmark.c
+++ b/mm/gup_benchmark.c
@@ -79,7 +79,7 @@ static int __gup_benchmark_ioctl(unsigned int cmd,
 	for (i = 0; i < nr_pages; i++) {
 		if (!pages[i])
 			break;
-		put_page(pages[i]);
+		put_user_page(pages[i]);
 	}
 	end_time = ktime_get();
 	gup->put_delta_usec = ktime_us_delta(end_time, start_time);
-- 
2.22.0


