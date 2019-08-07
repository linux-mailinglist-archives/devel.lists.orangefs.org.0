Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 353AD83F6B
	for <lists+devel-orangefs@lfdr.de>; Wed,  7 Aug 2019 03:35:25 +0200 (CEST)
Received: from [::1] (port=56000 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hvArM-0000D4-Fc
	for lists+devel-orangefs@lfdr.de; Tue, 06 Aug 2019 21:35:24 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39963)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1hvArL-0008Ur-84
 for devel@lists.orangefs.org; Tue, 06 Aug 2019 21:35:23 -0400
Received: by mail-pg1-f193.google.com with SMTP id w10so42542790pgj.7
 for <devel@lists.orangefs.org>; Tue, 06 Aug 2019 18:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cegKTIaYJ+tSle0YiC1yJpybmvJrVZXG5Xryw9OToL0=;
 b=gZINIBPpiSlkU+80KFQT2S/tbeKnfN8Fqd69WGW6s9PoHlp7eF6XztSLcUxuW4oRoZ
 aif7qo6403jD2jU7LBsHpubuYdPGQryF8kiw1ZTc3iFqoyXR++oshdcjJ7vxHU3SStmv
 hRrnv/6QnmfU9YFS9vFfR/LY5o8S7tCbaokKkpmJCmaCQPMpBAUHfIH7veXkFUWyuI/D
 QxXzz4jXTjDqbca8hg8XrnqAJ/u2yXOWeQAohMq1NTArxvWPC4Z+YJ1UfdhghSe68uD6
 jg98gaM28Wf1Jgr/YOooV8Oz8uSBvPGIEINpe+ifSuk1KD3Z7HL09IvdAtxhoavy3yVQ
 XT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cegKTIaYJ+tSle0YiC1yJpybmvJrVZXG5Xryw9OToL0=;
 b=ZObR05t2P+VnniQrk61kzNB33Th9rEM1s/hqq1BjpIEoNrASh7SK/LmP6LPeS+xKSx
 3bkTaYNbgyQMQyFyedWECkD0CWrUHzDKSzwPHmNzz37WuiSezbdCfN1c31zUA1JrwzTb
 O3bBubzVAGCejsaBWdfiGOV4D2NiAJLi5UPfIGnnfRrdPMycR1hmi3r/uKRW2Sp+cenU
 +bgS/VyiuXj/6hSSEGC4pgztWRJCAZevd8hj16tnPBdE8cEIwvkgUb4IpIhCnZdfvczG
 F5LJs8xSwA/HCl+WvqA/aT/FRfmyZ9ws9N8xEhRpmwdT/ipnEiStuhYYHM9w2UnaFnzN
 XKGw==
X-Gm-Message-State: APjAAAU0P2Qayx9w50Yo+S6roi0P8QB2P1BUB6542LrFRsgetTftzN8d
 teAbc/05ag1NMCge7Z7VMTY=
X-Google-Smtp-Source: APXvYqzSNe/bSKcNensRQ/IJ84TBXlUJvFYUKsvrq7/hKNH55OC+L+xYYWdqI5nDZFgfOlgeKmaOXw==
X-Received: by 2002:a65:6256:: with SMTP id q22mr5554856pgv.408.1565141682238; 
 Tue, 06 Aug 2019 18:34:42 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:41 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 36/41] fs/binfmt_elf: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:35 -0700
Message-Id: <20190807013340.9706-37-jhubbard@nvidia.com>
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
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
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

From: Ira Weiny <ira.weiny@intel.com>

For pages that were retained via get_user_pages*(), release those pages
via the new put_user_page*() routines, instead of via put_page() or
release_pages().

This is part a tree-wide conversion, as described in commit fc1d8e7cca2d
("mm: introduce put_user_page*(), placeholder versions").

get_dump_page calls get_user_page so put_user_page must be used
to match.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 fs/binfmt_elf.c       | 2 +-
 fs/binfmt_elf_fdpic.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index d4e11b2e04f6..92e4a5ca99d8 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -2377,7 +2377,7 @@ static int elf_core_dump(struct coredump_params *cprm)
 				void *kaddr = kmap(page);
 				stop = !dump_emit(cprm, kaddr, PAGE_SIZE);
 				kunmap(page);
-				put_page(page);
+				put_user_page(page);
 			} else
 				stop = !dump_skip(cprm, PAGE_SIZE);
 			if (stop)
diff --git a/fs/binfmt_elf_fdpic.c b/fs/binfmt_elf_fdpic.c
index d86ebd0dcc3d..321724b3be22 100644
--- a/fs/binfmt_elf_fdpic.c
+++ b/fs/binfmt_elf_fdpic.c
@@ -1511,7 +1511,7 @@ static bool elf_fdpic_dump_segments(struct coredump_params *cprm)
 				void *kaddr = kmap(page);
 				res = dump_emit(cprm, kaddr, PAGE_SIZE);
 				kunmap(page);
-				put_page(page);
+				put_user_page(page);
 			} else {
 				res = dump_skip(cprm, PAGE_SIZE);
 			}
-- 
2.22.0


