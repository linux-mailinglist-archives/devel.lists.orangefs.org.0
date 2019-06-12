Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 995EB42AD6
	for <lists+devel-orangefs@lfdr.de>; Wed, 12 Jun 2019 17:22:52 +0200 (CEST)
Received: from [::1] (port=41124 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hb55N-00050g-89
	for lists+devel-orangefs@lfdr.de; Wed, 12 Jun 2019 11:22:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:51732)
 by mm1.emwd.com with esmtps (TLSv1.2:AECDH-AES256-SHA:256)
 (Exim 4.92) (envelope-from <gregkh@linuxfoundation.org>)
 id 1hb55M-0004tR-BV
 for devel@lists.orangefs.org; Wed, 12 Jun 2019 11:22:48 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F099A20874;
 Wed, 12 Jun 2019 15:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560352927;
 bh=sGDr0c3FXFGlriyHe0pkvtCv8nBvdEdsriVfk7ngCf0=;
 h=Date:From:To:Cc:Subject:From;
 b=x28B0ljOTVX17p88EOlZQCmB0BdNswxqUl8WyRwR0HwrC4rrBx/8IIDvcJwXUrMr1
 IOKE/G+oBFpTfFxPKarTwk9TlFclsDwHu1O+ViSOW0n4gJv30HdEcJ/kibShOBI97V
 kSah0fpV42VAqbSxZ0BX59lPhxBG+KVLfpj9uHZ0=
Date: Wed, 12 Jun 2019 17:22:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>
Subject: [PATCH] orangefs: no need to check return value of debugfs_create
 functions
Message-ID: <20190612152204.GA17511@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
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
Cc: devel@lists.orangefs.org
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

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Mike Marshall <hubcap@omnibond.com>
Cc: Martin Brandenburg <martin@omnibond.com>
Cc: devel@lists.orangefs.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/orangefs/orangefs-debugfs.c | 35 ++++------------------------------
 1 file changed, 4 insertions(+), 31 deletions(-)

diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugfs.c
index 87b1a6fce628..7723f581017d 100644
--- a/fs/orangefs/orangefs-debugfs.c
+++ b/fs/orangefs/orangefs-debugfs.c
@@ -99,7 +99,6 @@ static char *debug_help_string;
 static char client_debug_string[ORANGEFS_MAX_DEBUG_STRING_LEN];
 static char client_debug_array_string[ORANGEFS_MAX_DEBUG_STRING_LEN];
 
-static struct dentry *help_file_dentry;
 static struct dentry *client_debug_dentry;
 static struct dentry *debug_dir;
 
@@ -183,20 +182,9 @@ int orangefs_debugfs_init(int debug_mask)
 		(unsigned long long)orangefs_gossip_debug_mask);
 
 	debug_dir = debugfs_create_dir("orangefs", NULL);
-	if (!debug_dir) {
-		pr_info("%s: debugfs_create_dir failed.\n", __func__);
-		goto out;
-	}
 
-	help_file_dentry = debugfs_create_file(ORANGEFS_KMOD_DEBUG_HELP_FILE,
-				  0444,
-				  debug_dir,
-				  debug_help_string,
-				  &debug_help_fops);
-	if (!help_file_dentry) {
-		pr_info("%s: debugfs_create_file failed.\n", __func__);
-		goto out;
-	}
+	debugfs_create_file(ORANGEFS_KMOD_DEBUG_HELP_FILE, 0444, debug_dir,
+			    debug_help_string, &debug_help_fops);
 
 	orangefs_debug_disabled = 0;
 
@@ -230,17 +218,8 @@ static int orangefs_kernel_debug_init(void)
 		pr_info("%s: overflow 1!\n", __func__);
 	}
 
-	ret = debugfs_create_file(ORANGEFS_KMOD_DEBUG_FILE,
-				  0444,
-				  debug_dir,
-				  k_buffer,
-				  &kernel_debug_fops);
-	if (!ret) {
-		pr_info("%s: failed to create %s.\n",
-			__func__,
-			ORANGEFS_KMOD_DEBUG_FILE);
-		goto out;
-	}
+	debugfs_create_file(ORANGEFS_KMOD_DEBUG_FILE, 0444, debug_dir, k_buffer,
+			    &kernel_debug_fops);
 
 	rc = 0;
 
@@ -353,12 +332,6 @@ static int orangefs_client_debug_init(void)
 						  debug_dir,
 						  c_buffer,
 						  &kernel_debug_fops);
-	if (!client_debug_dentry) {
-		pr_info("%s: failed to create updated %s.\n",
-			__func__,
-			ORANGEFS_CLIENT_DEBUG_FILE);
-		goto out;
-	}
 
 	rc = 0;
 
-- 
2.22.0


