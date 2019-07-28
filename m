Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DA7780D6
	for <lists+devel-orangefs@lfdr.de>; Sun, 28 Jul 2019 20:04:51 +0200 (CEST)
Received: from [::1] (port=57762 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hrnXN-0001yl-SF
	for lists+devel-orangefs@lfdr.de; Sun, 28 Jul 2019 14:04:49 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43482)
 by mm1.emwd.com with esmtps (TLSv1:AES256-SHA:256) (Exim 4.92)
 (envelope-from <colin.king@canonical.com>) id 1hrnXN-0001ya-2E
 for devel@lists.orangefs.org; Sun, 28 Jul 2019 14:04:49 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hrnWh-0006ft-NR; Sun, 28 Jul 2019 18:04:07 +0000
From: Colin King <colin.king@canonical.com>
To: Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org
Subject: [PATCH] orangefs: remove redundant assignment to err
Date: Sun, 28 Jul 2019 19:04:07 +0100
Message-Id: <20190728180407.15156-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

Variable err is initialized to a value that is never read and it
is re-assigned later.  The initialization is redundant and can
be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/orangefs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
index 0c337d8bdaab..efb12197da18 100644
--- a/fs/orangefs/inode.c
+++ b/fs/orangefs/inode.c
@@ -940,7 +940,7 @@ int orangefs_setattr(struct dentry *dentry, struct iattr *iattr)
 int orangefs_getattr(const struct path *path, struct kstat *stat,
 		     u32 request_mask, unsigned int flags)
 {
-	int ret = -ENOENT;
+	int ret;
 	struct inode *inode = path->dentry->d_inode;
 
 	gossip_debug(GOSSIP_INODE_DEBUG,
-- 
2.20.1


