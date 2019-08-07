Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id EB79383F37
	for <lists+devel-orangefs@lfdr.de>; Wed,  7 Aug 2019 03:34:56 +0200 (CEST)
Received: from [::1] (port=55752 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hvAqu-00006B-4E
	for lists+devel-orangefs@lfdr.de; Tue, 06 Aug 2019 21:34:56 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36186)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1hvAqs-0008Ql-Kb
 for devel@lists.orangefs.org; Tue, 06 Aug 2019 21:34:54 -0400
Received: by mail-pl1-f193.google.com with SMTP id k8so38605464plt.3
 for <devel@lists.orangefs.org>; Tue, 06 Aug 2019 18:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kTcRkfjdEL9HxbTfItIV90QFm+wmUvO1k55I5bm4do4=;
 b=KDwx8fQCZQ/Suzu3VWi1DDiS9f3wTi5qeR5KhjjsQerQ6jWb9Bppmpi69n/V7tCxcC
 9V2HGmZDwg97QSRgi6Hzl0GWRBp4H3fcCqkNmUDvJ7PxDk1fQHC9lxTEdaxbxQEHg95+
 fmJWsxqnzJxJ030LBsGzIkf3pk8sgU5o1+lx7X7ZwO38eZaDsEUDZZ+Gf9yjWoGjqdBb
 oE7CxyrW2H4Sq40LC5GKmO3wadn0xgnPrP2IQTLB/VxU0JkFqP6vTrlLsm15L7ZnAf7Z
 6nnOQfF4c4+DtdbQKQz7daub11+4pw4UtoY7fINHO6b6C0kllebTtI7UQsSaNXpquZs/
 z2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kTcRkfjdEL9HxbTfItIV90QFm+wmUvO1k55I5bm4do4=;
 b=kA0utpUpum5Wei5gl6ARQA3bjFRfH2nJ7D5J9iyRkqON3Izxwv/DQPcKxj7HHMkw7a
 4vM7OlMCWF5/QjTWfrGfms9r2F3HsOatb5hHGicQoxPIaSuxXC9yHJxMTuXMqGzTtSt4
 co4rhYB2xRnCthpA3BUYOevZrFVasUhhSOdxExPx4AydOZwn+T0/B+OZ0FOk8ZcViQPN
 hp9Ui3OHM10HZO2G1/c/wpMuzsHI6wOWckXuXDdTRJWewI+PTB+baUpVoiyO1H0g1pju
 4JUqKIhTlPDtAwRjdLuCaMP3BjvjBtcAA61+AGJlDmILj0jQHT41cm7fesP/TlZRub3P
 zBgQ==
X-Gm-Message-State: APjAAAUmWetV4/3d+w6lDctz3ln53d56pS1nq2oVgAP8Gcmn5e35f0pD
 WQ2G8bCrtAi1IGrhBqyBjmA=
X-Google-Smtp-Source: APXvYqzTT0+13248qiTrSGNvS1mzJ345uGp41Ak44ir6kC277kEDTytzqOp0Yto6oZ69oylCJdvvLQ==
X-Received: by 2002:a17:902:f204:: with SMTP id
 gn4mr5916565plb.3.1565141653735; 
 Tue, 06 Aug 2019 18:34:13 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:13 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 18/41] drivers/tee: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:17 -0700
Message-Id: <20190807013340.9706-19-jhubbard@nvidia.com>
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
 linux-fsdevel@vger.kernel.org, Jens Wiklander <jens.wiklander@linaro.org>
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

Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/tee/tee_shm.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index 2da026fd12c9..c967d0420b67 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -31,16 +31,13 @@ static void tee_shm_release(struct tee_shm *shm)
 
 		poolm->ops->free(poolm, shm);
 	} else if (shm->flags & TEE_SHM_REGISTER) {
-		size_t n;
 		int rc = teedev->desc->ops->shm_unregister(shm->ctx, shm);
 
 		if (rc)
 			dev_err(teedev->dev.parent,
 				"unregister shm %p failed: %d", shm, rc);
 
-		for (n = 0; n < shm->num_pages; n++)
-			put_page(shm->pages[n]);
-
+		put_user_pages(shm->pages, shm->num_pages);
 		kfree(shm->pages);
 	}
 
@@ -313,16 +310,13 @@ struct tee_shm *tee_shm_register(struct tee_context *ctx, unsigned long addr,
 	return shm;
 err:
 	if (shm) {
-		size_t n;
-
 		if (shm->id >= 0) {
 			mutex_lock(&teedev->mutex);
 			idr_remove(&teedev->idr, shm->id);
 			mutex_unlock(&teedev->mutex);
 		}
 		if (shm->pages) {
-			for (n = 0; n < shm->num_pages; n++)
-				put_page(shm->pages[n]);
+			put_user_pages(shm->pages, shm->num_pages);
 			kfree(shm->pages);
 		}
 	}
-- 
2.22.0


