Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E431E03B4
	for <lists+devel-orangefs@lfdr.de>; Mon, 25 May 2020 00:48:45 +0200 (CEST)
Received: from [::1] (port=46676 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jczQC-0004ao-Nr
	for lists+devel-orangefs@lfdr.de; Sun, 24 May 2020 18:48:44 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:53088)
 by mm1.emwd.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA
 (Exim 4.93) (envelope-from <colin.king@canonical.com>)
 id 1jczQB-0004a1-VC
 for devel@lists.orangefs.org; Sun, 24 May 2020 18:48:44 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1jczPW-00013I-He; Sun, 24 May 2020 22:48:02 +0000
From: Colin King <colin.king@canonical.com>
To: Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org
Subject: [PATCH] orangefs: remove redundant assignment to variable ret
Date: Sun, 24 May 2020 23:48:02 +0100
Message-Id: <20200524224802.27850-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

The variable ret is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/orangefs/orangefs-mod.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/orangefs/orangefs-mod.c b/fs/orangefs/orangefs-mod.c
index c010c1fddafc..289b648ae196 100644
--- a/fs/orangefs/orangefs-mod.c
+++ b/fs/orangefs/orangefs-mod.c
@@ -79,7 +79,7 @@ DECLARE_WAIT_QUEUE_HEAD(orangefs_request_list_waitq);
 
 static int __init orangefs_init(void)
 {
-	int ret = -1;
+	int ret;
 	__u32 i = 0;
 
 	if (op_timeout_secs < 0)
-- 
2.25.1


