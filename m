Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F987E857
	for <lists+devel-orangefs@lfdr.de>; Fri,  2 Aug 2019 04:21:23 +0200 (CEST)
Received: from [::1] (port=51112 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1htNC6-0007rT-AO
	for lists+devel-orangefs@lfdr.de; Thu, 01 Aug 2019 22:21:22 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37963)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <john.hubbard@gmail.com>)
 id 1htNC5-0007j1-9g
 for devel@lists.orangefs.org; Thu, 01 Aug 2019 22:21:21 -0400
Received: by mail-pl1-f196.google.com with SMTP id az7so32985961plb.5
 for <devel@lists.orangefs.org>; Thu, 01 Aug 2019 19:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zk7mJfsjIPJK9Qgsn0u5osZJajJrXebF0c1tZrgdgoI=;
 b=nL5gA8HkBp1qUXL8uSk44yRPDpQM1GzztnKY+vjFkpLO4+ej8Ho3KCm6C4y+E5m8LE
 h9Iaftsjh1UsJUr+Pb21bHX0tSSHXapiGzhmehbpJMXTX/8OVSokepo7ZYp/sAOufRJM
 Dn+Q/LNbJL1I2nNGcQbJ8ZQUaKHbOXUsbWTmj876BCAWOoZWZ6NdZCYaUx//X8gLE1Fe
 Ao4iR+EL7uUQrdQvqWcLAimsvB7jPrqJUl8VTCYTJSYJDpeTKlwz9tVoL0Kex6hlm0oH
 POKBdW3YOuZavjeRiRdEl20H0UanKpKGw2d45prgvnfRqnKjFtcxDl+Dci+NMwFW+1GP
 a0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zk7mJfsjIPJK9Qgsn0u5osZJajJrXebF0c1tZrgdgoI=;
 b=deqwmICHfwbbNJAa5IJ4UVZkJg8PkGV5CJhMSfwwgsCCmN4SXEDAUxuA/dkDGFI99l
 qnU/WfSKmQsN9U4Wzg3QARKEGlOBKhAR+KCQ8oIStHjSY4w6mpfJNQQ0jOrK/PeO/WLF
 xXLlYFd71y9XehnVhNioXQ/9WnVo1Yjv02FLS+H8FvwdGelrsU+bHYfxe1wNiq+wxJz4
 bu0bT1rC/jfspkZK2PAgaHW/5PVLaaOU6TZwGkqzpOArg6wOvQvh4Ntcs0nrRMlnHauC
 LqruIZ1TGzQBKuWcoXLVO28KXcmVnpz6lcYUSXMdnPo1bat/KVTAUE/k2B494Ro5rlHC
 5wUw==
X-Gm-Message-State: APjAAAVhCwX6TlY9Wq/VBYyRtfWv2Mc2+wyozd/QZz1kcnrwk6Rr38ul
 6E1E/sRbD0Y6SL4IU63ka0c=
X-Google-Smtp-Source: APXvYqztsbUVpJnR1pWJXE324fW+SugJBxHHKLNQRZirN/VnD1v0OsiDr/qT4pG5Y0OOV3QlfOZRKQ==
X-Received: by 2002:a17:902:830c:: with SMTP id
 bd12mr131600821plb.237.1564712440479; 
 Thu, 01 Aug 2019 19:20:40 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:40 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 18/34] fbdev/pvr2fb: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:49 -0700
Message-Id: <20190802022005.5117-19-jhubbard@nvidia.com>
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
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Arvind Yadav <arvind.yadav.cs@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Bhumika Goyal <bhumirks@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>
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

Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Bhumika Goyal <bhumirks@gmail.com>
Cc: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/video/fbdev/pvr2fb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/pvr2fb.c b/drivers/video/fbdev/pvr2fb.c
index 7ff4b6b84282..0e4f9aa6444d 100644
--- a/drivers/video/fbdev/pvr2fb.c
+++ b/drivers/video/fbdev/pvr2fb.c
@@ -700,8 +700,7 @@ static ssize_t pvr2fb_write(struct fb_info *info, const char *buf,
 	ret = count;
 
 out_unmap:
-	for (i = 0; i < nr_pages; i++)
-		put_page(pages[i]);
+	put_user_pages(pages, nr_pages);
 
 	kfree(pages);
 
-- 
2.22.0


