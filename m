Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4887E85E
	for <lists+devel-orangefs@lfdr.de>; Fri,  2 Aug 2019 04:21:31 +0200 (CEST)
Received: from [::1] (port=51182 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1htNCE-0007vz-Js
	for lists+devel-orangefs@lfdr.de; Thu, 01 Aug 2019 22:21:30 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37511)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1htNCC-0007kO-Qj
 for devel@lists.orangefs.org; Thu, 01 Aug 2019 22:21:28 -0400
Received: by mail-pg1-f195.google.com with SMTP id d1so2419362pgp.4
 for <devel@lists.orangefs.org>; Thu, 01 Aug 2019 19:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lKIFYbXGeRFczJ7GPuSawhtMV9YIx2+MYUTps7oOTAE=;
 b=R1dyNzOze/eqllrUqxRpjhDn38RC7VsduB92QlfhFLYwuwka43d0Yt9myEGcw6WlZm
 fYIT193clb3cCKkKRa4gQjk01O64tt0BXAAw6nkursyUCEWzk96M/WL6vzziPZU6IL+r
 rvITeJdAvAjJK8q/L91CFM+eVayVF1xEXzXBIhRNt9HdhEGbz9zWiE6QknGvjT5Q+PbG
 0FUQwvdG6OLHf8hS8zvFCr0JHd7YtbTEpJO3//HXWtUvFA/ZCzXGA0y95q3Jed0ZzVaE
 Qk7ZxouFXvlN6jsSJv67cehYgfxqrCWaOQlJqOD886yacjrOWwt50AkY8+51bO/ECErB
 IQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lKIFYbXGeRFczJ7GPuSawhtMV9YIx2+MYUTps7oOTAE=;
 b=GKvmZBUQk+i7+esTgu7i+1l4aiCDPiPMeiIB5LW4fQJU3rd/irsfDLZmlFivNhz4Xk
 sEhptMXuW2Rjx2guznZZIV0NFVgROkuWn51naLMuwNzNKXbuKsEOOzGVvKPNQazLMF1T
 LkZWEStq5e//FxGwFMPWsznApcQT9bR8a6uZuRTM/GdurJA/z/QYNzL0TgkW1ldKn9sY
 QMn45VJCeLpORhLZJj4/pXDUgM67UykgPzQGHz/nn72XxvKRDSnH2tN/4oBqvrxbPjI8
 GiIQNQ3z1zOzt9XSZ009Yb9Ecr3UekL0eONDNg+dyZHlQkFWRw65JCoiRzQHWtaP8rrV
 Hg0Q==
X-Gm-Message-State: APjAAAXwAv/muUC65KZbs/Jylkha7r9kJz1y8VXSFomn9rlshnn8R7D6
 bCRqoBz+PxTZ5bKJAybZxuA=
X-Google-Smtp-Source: APXvYqxwmSe9JrA8Nqe8Cu6LF/8yd68XYfT17/pT9PHXIhg3Pa3JuYgXApqhYkPrHPsf3+6NRlbhyg==
X-Received: by 2002:a17:90a:601:: with SMTP id j1mr1872789pjj.96.1564712447882; 
 Thu, 01 Aug 2019 19:20:47 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:47 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 23/34] uprobes: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:54 -0700
Message-Id: <20190802022005.5117-24-jhubbard@nvidia.com>
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
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
 Jiri Olsa <jolsa@redhat.com>, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Namhyung Kim <namhyung@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
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

From: John Hubbard <jhubbard@nvidia.com>

For pages that were retained via get_user_pages*(), release those pages
via the new put_user_page*() routines, instead of via put_page() or
release_pages().

This is part a tree-wide conversion, as described in commit fc1d8e7cca2d
("mm: introduce put_user_page*(), placeholder versions").

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Jiri Olsa <jolsa@redhat.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 kernel/events/uprobes.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 84fa00497c49..4a575de8cec8 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -397,7 +397,7 @@ __update_ref_ctr(struct mm_struct *mm, unsigned long vaddr, short d)
 	ret = 0;
 out:
 	kunmap_atomic(kaddr);
-	put_page(page);
+	put_user_page(page);
 	return ret;
 }
 
@@ -504,7 +504,7 @@ int uprobe_write_opcode(struct arch_uprobe *auprobe, struct mm_struct *mm,
 	ret = __replace_page(vma, vaddr, old_page, new_page);
 	put_page(new_page);
 put_old:
-	put_page(old_page);
+	put_user_page(old_page);
 
 	if (unlikely(ret == -EAGAIN))
 		goto retry;
@@ -1981,7 +1981,7 @@ static int is_trap_at_addr(struct mm_struct *mm, unsigned long vaddr)
 		return result;
 
 	copy_from_page(page, vaddr, &opcode, UPROBE_SWBP_INSN_SIZE);
-	put_page(page);
+	put_user_page(page);
  out:
 	/* This needs to return true for any variant of the trap insn */
 	return is_trap_insn(&opcode);
-- 
2.22.0


