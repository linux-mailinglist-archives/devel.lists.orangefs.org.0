Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id A23D6FA207
	for <lists+devel-orangefs@lfdr.de>; Wed, 13 Nov 2019 03:02:04 +0100 (CET)
Received: from [::1] (port=59518 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1iUhyt-0006Ap-Tf
	for lists+devel-orangefs@lfdr.de; Tue, 12 Nov 2019 21:02:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:36472)
 by mm1.emwd.com with esmtps (TLSv1.2:AECDH-AES256-SHA:256)
 (Exim 4.92) (envelope-from <sashal@kernel.org>) id 1iUhys-0006AF-LF
 for devel@lists.orangefs.org; Tue, 12 Nov 2019 21:02:02 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 21D6A2247C;
 Wed, 13 Nov 2019 02:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573610481;
 bh=5sAEPQ6C3izdvVEkVcjaWep+k5AXbl+VHCVHCcYnFlU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MUa9+AJQe7OHeND9/dXINbz+JBzktj4geKdBDbJ/34RLUh3XE8Cqt3cr13rmDqzhb
 kSJFTRJ5ZfDyyCbDUYDAqhW6xG6XTKYlg/4kbkcdgImlW+tDREwpsswy641eLBiv3H
 9zMRw1vgHeh7SJFxr8VKHmtByn3UngLk+R+iPEU4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 62/68] orangefs: rate limit the client not running
 info message
Date: Tue, 12 Nov 2019 20:59:26 -0500
Message-Id: <20191113015932.12655-62-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113015932.12655-1-sashal@kernel.org>
References: <20191113015932.12655-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Colin Ian King <colin.king@canonical.com>,
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

From: Colin Ian King <colin.king@canonical.com>

[ Upstream commit 2978d873471005577e7b68a528b4f256a529b030 ]

Currently accessing various /sys/fs/orangefs files will spam the
kernel log with the following info message when the client is not
running:

[  491.489284] sysfs_service_op_show: Client not running :-5:

Rate limit this info message to make it less spammy.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Mike Marshall <hubcap@omnibond.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/orangefs/orangefs-sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/orangefs/orangefs-sysfs.c b/fs/orangefs/orangefs-sysfs.c
index a799546a67f77..f6172c3f83ba0 100644
--- a/fs/orangefs/orangefs-sysfs.c
+++ b/fs/orangefs/orangefs-sysfs.c
@@ -315,7 +315,7 @@ static ssize_t sysfs_service_op_show(struct kobject *kobj,
 	/* Can't do a service_operation if the client is not running... */
 	rc = is_daemon_in_service();
 	if (rc) {
-		pr_info("%s: Client not running :%d:\n",
+		pr_info_ratelimited("%s: Client not running :%d:\n",
 			__func__,
 			is_daemon_in_service());
 		goto out;
-- 
2.20.1


