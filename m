Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AA011F552
	for <lists+devel-orangefs@lfdr.de>; Sun, 15 Dec 2019 02:59:48 +0100 (CET)
Received: from [::1] (port=42514 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1igJCF-0000G3-Nm
	for lists+devel-orangefs@lfdr.de; Sat, 14 Dec 2019 20:59:47 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:33313)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <navid.emamdoost@gmail.com>)
 id 1igJCF-0000FY-5O
 for devel@lists.orangefs.org; Sat, 14 Dec 2019 20:59:47 -0500
Received: by mail-io1-f67.google.com with SMTP id z8so1653196ioh.0
 for <devel@lists.orangefs.org>; Sat, 14 Dec 2019 17:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=h0fD7W5daiv6qwL/B0pVkhAvgnXRveIJ7BunMFgKkMk=;
 b=JOuZGoHQ+oXbOnTCu6GWPSpzi6EZr3yelrs8UNixeiPxeRE63yqw3d1alrlbpQsIg1
 Ukt/UMOEFypRtXDL44cdkinsSVXOwMYnSYBOgJRgQK9Yy2xfs2lEi1DrIoCvgFSwGyXg
 m26p21hvSDRQnwjxuX6zln6hguH5luvluxYVBBPJXzQ19RRnKbTx1D1b8n7SP20brMOV
 Y4tb97A4zz+LhuNxVsrOYBfl44C9vx0hE3RYIAO27rXd6jEZKHnha18QbplNrsLYTLaM
 8Yo0sTNNiYOzW2pRzmgD4Rcy6fFkerEKSeB8fIrHDMBvKqC6hYPzOmJ9+hkIwDqmGcFr
 NHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=h0fD7W5daiv6qwL/B0pVkhAvgnXRveIJ7BunMFgKkMk=;
 b=aP72tlEdUQAtyMf6Ij4scnvOnnqGtUabx7Zwju+N3ZJuhY+y+QLcCpItmUCSu/stmD
 I5E5OdsckQlicj9R5czBNv7T3zAt+fiJh3BFII8KcOAwwGxHVk5Ro4403iZY+kCpEwAc
 ffZwwVaoprOgutbLAqgn4JFDaeDYjIIf6Ve28GQzSdZyOEn9QP1TtXyOs5gfb+NbuyP8
 99JpxUGxkaMygVn3WhT+zDUUQTebUQHVoSWZoDE0Krh7VoOXeNEYD3xaEXg3oyCSsfzB
 AoGG+d6UbY/zFAIE3yXGnkLEmfMKTfQxWPZqS2FFlaS+1QwZe9DW0SRf4vCj6O26STAo
 dO+g==
X-Gm-Message-State: APjAAAXuSBwM/+Ok2L0eeGpsq6Z20/uBo9WZN8V7EjkOLM783EPfvm1z
 47DWfjagqy+l7rpLWmFZd1M=
X-Google-Smtp-Source: APXvYqygrz5FCi0oWMKV7ndji8LS93zjryLb8n/jM89wYPvCkgqbP7Nc3UpIByYK9KTxUNfn0hn5Dg==
X-Received: by 2002:a05:6602:235b:: with SMTP id
 r27mr13519184iot.51.1576375146408; 
 Sat, 14 Dec 2019 17:59:06 -0800 (PST)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id h3sm353493ilh.6.2019.12.14.17.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Dec 2019 17:59:06 -0800 (PST)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] orangefs: Fix memory leak in orangefs_mount
Date: Sat, 14 Dec 2019 19:58:48 -0600
Message-Id: <20191215015849.23223-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-BeenThere: devel@lists.orangefs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <devel.lists.orangefs.org>
List-Unsubscribe: <http://lists.orangefs.org/mailman/options/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=unsubscribe>
List-Archive: <http://lists.orangefs.org/pipermail/devel_lists.orangefs.org/>
List-Post: <mailto:devel@lists.orangefs.org>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Subscribe: <http://lists.orangefs.org/mailman/listinfo/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=subscribe>
Cc: emamd001@umn.edu, Navid Emamdoost <navid.emamdoost@gmail.com>
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

In the implementation of orangefs_mount() the allocated memory for sb
info should be released if op_alloc() fails. Release it via
goto free_sb_and_op.

Fixes: 482664ddba81 ("orangefs: add features op")
Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 fs/orangefs/super.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/orangefs/super.c b/fs/orangefs/super.c
index ee5efdc35cc1..ad98b893989b 100644
--- a/fs/orangefs/super.c
+++ b/fs/orangefs/super.c
@@ -566,8 +566,10 @@ struct dentry *orangefs_mount(struct file_system_type *fst,
 
 	if (orangefs_userspace_version >= 20906) {
 		new_op = op_alloc(ORANGEFS_VFS_OP_FEATURES);
-		if (!new_op)
-			return ERR_PTR(-ENOMEM);
+		if (!new_op) {
+			d = ERR_PTR(-ENOMEM);
+			goto free_sb_and_op;
+		}
 		new_op->upcall.req.features.features = 0;
 		ret = service_operation(new_op, "orangefs_features", 0);
 		orangefs_features = new_op->downcall.resp.features.features;
-- 
2.17.1


