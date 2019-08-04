Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DEA80D64
	for <lists+devel-orangefs@lfdr.de>; Mon,  5 Aug 2019 00:50:35 +0200 (CEST)
Received: from [::1] (port=46086 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1huPKl-0002SH-3Y
	for lists+devel-orangefs@lfdr.de; Sun, 04 Aug 2019 18:50:35 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46522)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1huPKj-0002Ew-Ar
 for devel@lists.orangefs.org; Sun, 04 Aug 2019 18:50:33 -0400
Received: by mail-pg1-f193.google.com with SMTP id w3so1455238pgt.13
 for <devel@lists.orangefs.org>; Sun, 04 Aug 2019 15:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6GC3vp7Kgk6wrS2t1aIFSliRmKpmpPmHRVTf1Sq+2hE=;
 b=dM/IGJPKx3vHMSaH2jjH8cddB9IjzpJgXXKkO7CuRXnxMJrRMmXVqwBAlQ88WzjX5h
 dPH11zKs16Cup5MqaIdJ1qgQ5dnUSJO3TyirSMdWy1ehRY6u0fAfZaZVJnTvSLI1QoSZ
 1OPtp46Njt0JJnUOBtfou4qDlL/RKFcmnKhvrMMghCphBN24qaIVDJrBrmeB7g2Z62x7
 9z4wjKe5TgqpPsxN1F6MtFwbERWIIYczU3Vlcoi9Bn6Io4pS8zl9BxvD7OfIkvOk2DHe
 bKWOTx3ItGlZJtYz9ERx5/QSr4d6lkRb9ThyPESwSqEPXbfdWPFzLZ85HYqnnwwoanPc
 GvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6GC3vp7Kgk6wrS2t1aIFSliRmKpmpPmHRVTf1Sq+2hE=;
 b=brNmEzoC2bBKX4ss374g3ZztlTqbZyAOlDIn8EBDIMuAS2lb0wG7BsiuhM9DnTvLd5
 XZ5mhm2EHv+X7xve2q6IitgA5Tmh/zYsKWdBlhiSgHnvU5TsmRga2+5usbZHwl68R0BL
 wvMzG0Z+VIr9CSMOtB/qjmWwYm2R05wkU0jGq9S8cVnaIDuvE2X8aGQUpKpBQ9VrmU74
 zwKg7fXcgH6ojG82mASQARiibbLqoDjPGdp2hxn65A/+LtQ2oJoyFzT4JJNu2fQpikbw
 mXF12Z0QvqV3YmkRWBHbUafQpf3Wj/h1jhrypGDHdanxvHC3pRAHjkLAHaFroc4Ubh4i
 RRTA==
X-Gm-Message-State: APjAAAXuXoXFg4/Dp0/PEFUl6/nZt3lUIqSIdMb6xZy6NF8q5NqlbKmB
 pjexnLVSNm50etjUTihyYuI=
X-Google-Smtp-Source: APXvYqwq/YfHOhrmZHkD7vjJE2TMWCM5ZcaZGqo7qwngyLyrDMEmQDpJGD3vf7HiLmlT/OfJiu4DXA==
X-Received: by 2002:a17:90a:360c:: with SMTP id
 s12mr15495527pjb.30.1564958992495; 
 Sun, 04 Aug 2019 15:49:52 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:52 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 21/34] fs/exec.c: convert put_page() to put_user_page*()
Date: Sun,  4 Aug 2019 15:49:02 -0700
Message-Id: <20190804224915.28669-22-jhubbard@nvidia.com>
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
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
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

Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 fs/exec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/exec.c b/fs/exec.c
index f7f6a140856a..ee442151582f 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -227,7 +227,7 @@ static struct page *get_arg_page(struct linux_binprm *bprm, unsigned long pos,
 
 static void put_arg_page(struct page *page)
 {
-	put_page(page);
+	put_user_page(page);
 }
 
 static void free_arg_pages(struct linux_binprm *bprm)
-- 
2.22.0


