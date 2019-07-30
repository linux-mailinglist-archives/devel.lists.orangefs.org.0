Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 6286079E4A
	for <lists+devel-orangefs@lfdr.de>; Tue, 30 Jul 2019 03:51:20 +0200 (CEST)
Received: from [::1] (port=54502 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hsHIN-0005sL-Ir
	for lists+devel-orangefs@lfdr.de; Mon, 29 Jul 2019 21:51:19 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40610)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <deepa.kernel@gmail.com>)
 id 1hsHIM-0005s3-2J
 for devel@lists.orangefs.org; Mon, 29 Jul 2019 21:51:18 -0400
Received: by mail-pf1-f194.google.com with SMTP id p184so28939059pfp.7
 for <devel@lists.orangefs.org>; Mon, 29 Jul 2019 18:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2pzcazUl/YPKOksb7vbUDmWoTVBPfLTioSqOrhqez9Y=;
 b=pLw9p0nt0hUU7YWjb96e0yxgbLIaZW3MxiGngSf7VlziEjgE3XYrQpkwVaK9yDBbKZ
 Zh15d7rg5YUakKBN8gZARrsLnY2tm4Zd0XabmRrln1L7IJL5PBbNCUbrg0nJ35oOmQwu
 M4uoxxYroyZpW+Io7Lc2Kjx5snWpyeHkcGTMMguW+EwimhSS34kane0RA/t87gz/BVkk
 7KQP3+dAfeHoCVF9pi6M+/1hvr1yhCmcigOyOd1yTca9pXr4oJQBPyrYClPiM/2gIWgL
 miFY53BeQJz1qpTxfSfEGtGYMrA7luW27vw0WhaXKs3o3BKSDGR/FYdihKvOVDdOIMrv
 wwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2pzcazUl/YPKOksb7vbUDmWoTVBPfLTioSqOrhqez9Y=;
 b=r1KOsObamJekeWVCv58BfwLdprhvWhNBUKKRjXFzDV6cTov2+b1I9bRvc50fdDZFiH
 +cN42PfCkxiQOpCnRIrai/Meak6zlz6qPAA52kJqqa2uEUWfRaWaAvb1zEAejIqU0pK6
 ZbN3nd/EP3swKRmNcGfoYgF9RMoGTNmf49oSZfpnVEdNrKuIYeO56TsRQ12k010UcrcQ
 j1FEQg0lthF7iwZwGfIfssnjStJo8/3oeff+i2Wa6anDDJrEN12aiIt2I5z65pDIeUBJ
 rutTbMhDbQmSNJYTVk7kmyQZXOTTYOKQ60SiJ0zhVYjqpZNQ8f5IY5ihgN3Vdy4Uiwrh
 8ejQ==
X-Gm-Message-State: APjAAAULAMW3l1KjiJXzG6iMfxo8rBL4FAFxS1IveerZKXb49FXaJTDm
 U2ACLlcPPIMyrGaOkJ6vBRA=
X-Google-Smtp-Source: APXvYqwuoNCFskzA7wwr+3fhcEUFUPA856yNJ6Zox7fqtsa9eOMvdD4IodszPXes+qaudx93RAiWMA==
X-Received: by 2002:a62:cec4:: with SMTP id y187mr39052123pfg.84.1564451437010; 
 Mon, 29 Jul 2019 18:50:37 -0700 (PDT)
Received: from deepa-ubuntu.lan (c-98-234-52-230.hsd1.ca.comcast.net.
 [98.234.52.230])
 by smtp.gmail.com with ESMTPSA id r6sm138807156pjb.22.2019.07.29.18.50.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 18:50:36 -0700 (PDT)
From: Deepa Dinamani <deepa.kernel@gmail.com>
To: viro@zeniv.linux.org.uk,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/20] fs: orangefs: Initialize filesystem timestamp ranges
Date: Mon, 29 Jul 2019 18:49:20 -0700
Message-Id: <20190730014924.2193-17-deepa.kernel@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190730014924.2193-1-deepa.kernel@gmail.com>
References: <20190730014924.2193-1-deepa.kernel@gmail.com>
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
Cc: arnd@arndb.de, y2038@lists.linaro.org, linux-fsdevel@vger.kernel.org,
 devel@lists.orangefs.org
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

Fill in the appropriate limits to avoid inconsistencies
in the vfs cached inode times when timestamps are
outside the permitted range.

Assume the limits as unsigned according to the below
commit 98e8eef557a9 ("changed PVFS_time from int64_t to uint64_t")
in https://github.com/waltligon/orangefs

Author: Neill Miller <neillm@mcs.anl.gov>
Date:   Thu Sep 2 15:00:38 2004 +0000

Signed-off-by: Deepa Dinamani <deepa.kernel@gmail.com>
Cc: hubcap@omnibond.com
Cc: martin@omnibond.com
Cc: devel@lists.orangefs.org
---
 fs/orangefs/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/orangefs/super.c b/fs/orangefs/super.c
index ee5efdc35cc1..dcd97e8158b1 100644
--- a/fs/orangefs/super.c
+++ b/fs/orangefs/super.c
@@ -439,6 +439,8 @@ static int orangefs_fill_sb(struct super_block *sb,
 	sb->s_blocksize = PAGE_SIZE;
 	sb->s_blocksize_bits = PAGE_SHIFT;
 	sb->s_maxbytes = MAX_LFS_FILESIZE;
+	sb->s_time_min = 0;
+	sb->s_time_max = S64_MAX;
 
 	ret = super_setup_bdi(sb);
 	if (ret)
-- 
2.17.1


