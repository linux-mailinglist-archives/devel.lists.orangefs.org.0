Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id A19DB1A7F1
	for <lists+devel-orangefs@lfdr.de>; Sat, 11 May 2019 15:27:45 +0200 (CEST)
Received: from [::1] (port=39252 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.91)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hPS2S-0004oO-8e
	for lists+devel-orangefs@lfdr.de; Sat, 11 May 2019 09:27:44 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33577)
 by mm1.emwd.com with esmtps (TLSv1:AES256-SHA:256) (Exim 4.91)
 (envelope-from <colin.king@canonical.com>) id 1hPS2Q-0004nG-Uc
 for devel@lists.orangefs.org; Sat, 11 May 2019 09:27:43 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hPS1l-0003mv-9X; Sat, 11 May 2019 13:27:01 +0000
From: Colin King <colin.king@canonical.com>
To: Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org
Subject: [PATCH] orangefs: remove redundant assignment to variable buffer_index
Date: Sat, 11 May 2019 14:27:00 +0100
Message-Id: <20190511132700.4862-1-colin.king@canonical.com>
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

The variable buffer_index is being initialized however this is never
read and later it is being reassigned to a new value. The initialization
is redundant and hence can be removed.

Addresses-Coverity: ("Unused Value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/orangefs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/orangefs/file.c b/fs/orangefs/file.c
index a35c17017210..80f06ee794c5 100644
--- a/fs/orangefs/file.c
+++ b/fs/orangefs/file.c
@@ -52,7 +52,7 @@ ssize_t wait_for_direct_io(enum ORANGEFS_io_type type, struct inode *inode,
 	struct orangefs_inode_s *orangefs_inode = ORANGEFS_I(inode);
 	struct orangefs_khandle *handle = &orangefs_inode->refn.khandle;
 	struct orangefs_kernel_op_s *new_op = NULL;
-	int buffer_index = -1;
+	int buffer_index;
 	ssize_t ret;
 	size_t copy_amount;
 
-- 
2.20.1


