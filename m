Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ABA80D68
	for <lists+devel-orangefs@lfdr.de>; Mon,  5 Aug 2019 00:50:41 +0200 (CEST)
Received: from [::1] (port=46130 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1huPKq-0002TS-BQ
	for lists+devel-orangefs@lfdr.de; Sun, 04 Aug 2019 18:50:40 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42316)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1huPKo-0002FB-6M
 for devel@lists.orangefs.org; Sun, 04 Aug 2019 18:50:38 -0400
Received: by mail-pf1-f196.google.com with SMTP id q10so38581975pff.9
 for <devel@lists.orangefs.org>; Sun, 04 Aug 2019 15:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rRiJNzkH0bRoPJKYXoQcsROADD9YH4USeXVLEsmAa1E=;
 b=AV7uFQE9YUuDd+D7n/raE3+Vd4+M3WfHMpSGBy7Po/eVbcIBoj8uNAj9DUgT5bKiPy
 NOFpz/m3dZOdwDIxZQeVlxsCTnZ92dZxKMNJ/rR2X1bMUek0j8TGq+u0eAdIPX6nv7Xg
 3xla0EEXNbB0lWncn+d/ABroqlg3T2U7E2b5B9Xg8cDDZKP8nXSMimiXqXtFe+tBDXhV
 ARezJERjiP3GeR4zOW6+cUq9Pz5Hkpr43jELcaC0lfmmiiWVj3OueADfK4ODHerMWl3x
 WKZ0WyFn5raZ50oDfnPOKa2jV6SJBQSgxKSa9LR9P0FGYWA2KC5auYEx1XvMz/0dUJhq
 D/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rRiJNzkH0bRoPJKYXoQcsROADD9YH4USeXVLEsmAa1E=;
 b=iCkGhQng1e4xKSBHvhzY5zJHpGBRVyFWBXL6aeqIcAE+BqN3gc670JMU5jkQOAUQxa
 +HEWiPx0DU+SwcqG8XFixqiXWWniVadwZ1P6FWe6CutFxZLIRPRdhpe/PFXracWLAF10
 HgpbCPm1Gt2F1Yu1/pKL3gDIqRRwwzLjaXswYSm7mwHuTYjmLhOc33iJFnuM9br9SI5X
 6DO/dNU7FWrwuUXshAmkhtbCL4ZIq3lAc8sklvjUx7pKNVnVFAwMR65NPEUrlWfKgA67
 jiEjYkkBurmaCIfO5C802Gyd76kpYWt1IHRIc3r69uo/KxYmamnMcrll7cqEAnFcFl3s
 cEaw==
X-Gm-Message-State: APjAAAWmkyYr4vruJElr1KZ6E/cX8AUo2I0JSKFEER2r++HITQV64ntH
 dsDYIhnFOH+a84D0m2VifxufGBRo
X-Google-Smtp-Source: APXvYqxM1jqqH644LscYZh1fOmR6SQroZ5U0oF421RZK6m1nNZ1H1tDwWIOHK+9da6OAru/hIya3FA==
X-Received: by 2002:a63:61cf:: with SMTP id
 v198mr17505607pgb.217.1564958997274; 
 Sun, 04 Aug 2019 15:49:57 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:56 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 24/34] futex: convert put_page() to put_user_page*()
Date: Sun,  4 Aug 2019 15:49:05 -0700
Message-Id: <20190804224915.28669-25-jhubbard@nvidia.com>
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
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Darren Hart <dvhart@infradead.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-crypto@vger.kernel.org,
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

From: John Hubbard <jhubbard@nvidia.com>

For pages that were retained via get_user_pages*(), release those pages
via the new put_user_page*() routines, instead of via put_page() or
release_pages().

This is part a tree-wide conversion, as described in commit fc1d8e7cca2d
("mm: introduce put_user_page*(), placeholder versions").

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 kernel/futex.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/futex.c b/kernel/futex.c
index 6d50728ef2e7..4b4cae58ec57 100644
--- a/kernel/futex.c
+++ b/kernel/futex.c
@@ -623,7 +623,7 @@ get_futex_key(u32 __user *uaddr, int fshared, union futex_key *key, enum futex_a
 		lock_page(page);
 		shmem_swizzled = PageSwapCache(page) || page->mapping;
 		unlock_page(page);
-		put_page(page);
+		put_user_page(page);
 
 		if (shmem_swizzled)
 			goto again;
@@ -675,7 +675,7 @@ get_futex_key(u32 __user *uaddr, int fshared, union futex_key *key, enum futex_a
 
 		if (READ_ONCE(page->mapping) != mapping) {
 			rcu_read_unlock();
-			put_page(page);
+			put_user_page(page);
 
 			goto again;
 		}
@@ -683,7 +683,7 @@ get_futex_key(u32 __user *uaddr, int fshared, union futex_key *key, enum futex_a
 		inode = READ_ONCE(mapping->host);
 		if (!inode) {
 			rcu_read_unlock();
-			put_page(page);
+			put_user_page(page);
 
 			goto again;
 		}
@@ -702,7 +702,7 @@ get_futex_key(u32 __user *uaddr, int fshared, union futex_key *key, enum futex_a
 		 */
 		if (!atomic_inc_not_zero(&inode->i_count)) {
 			rcu_read_unlock();
-			put_page(page);
+			put_user_page(page);
 
 			goto again;
 		}
@@ -723,7 +723,7 @@ get_futex_key(u32 __user *uaddr, int fshared, union futex_key *key, enum futex_a
 	}
 
 out:
-	put_page(page);
+	put_user_page(page);
 	return err;
 }
 
-- 
2.22.0


