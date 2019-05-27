Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 6533A2B961
	for <lists+devel-orangefs@lfdr.de>; Mon, 27 May 2019 19:22:43 +0200 (CEST)
Received: from [::1] (port=57106 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.91)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hVJKc-0006vK-71
	for lists+devel-orangefs@lfdr.de; Mon, 27 May 2019 13:22:42 -0400
Received: from gateway34.websitewelcome.com ([192.185.149.105]:25681)
 by mm1.emwd.com with esmtps (TLSv1.2:AECDH-AES256-SHA:256)
 (Exim 4.91) (envelope-from <gustavo@embeddedor.com>)
 id 1hVJKb-0006v0-03
 for devel@lists.orangefs.org; Mon, 27 May 2019 13:22:41 -0400
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id 215385FC645
 for <devel@lists.orangefs.org>; Mon, 27 May 2019 12:22:00 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id VJJwhlkC3YTGMVJJwhlZEK; Mon, 27 May 2019 12:22:00 -0500
X-Authority-Reason: nr=8
Received: from [189.250.47.159] (port=35202 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hVJJu-002THu-Vi; Mon, 27 May 2019 12:21:59 -0500
Date: Mon, 27 May 2019 12:21:58 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>
Subject: [PATCH] orangefs: fix unused value in __orangefs_setattr
Message-ID: <20190527172158.GA28107@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.orangefs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.47.159
X-Source-L: No
X-Exim-ID: 1hVJJu-002THu-Vi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.47.159]:35202
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Cc: linux-kernel@vger.kernel.org, devel@lists.orangefs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
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

Add check for the return value of posix_acl_chmod() and
fix unused value bug.

Notice that if this check is not in place, the value in
ret is overwritten at line 913, before it can be used:

913	ret = 0;

Addresses-Coverity-ID: 1445565 ("Unused value")
Fixes: df2d7337b570 ("orangefs: let setattr write to cached inode")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 fs/orangefs/inode.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
index 0c337d8bdaab..3608f183d075 100644
--- a/fs/orangefs/inode.c
+++ b/fs/orangefs/inode.c
@@ -906,9 +906,12 @@ int __orangefs_setattr(struct inode *inode, struct iattr *iattr)
 	spin_unlock(&inode->i_lock);
 	mark_inode_dirty(inode);
 
-	if (iattr->ia_valid & ATTR_MODE)
+	if (iattr->ia_valid & ATTR_MODE) {
 		/* change mod on a file that has ACLs */
 		ret = posix_acl_chmod(inode, inode->i_mode);
+		if (ret)
+			goto out;
+	}
 
 	ret = 0;
 out:
-- 
2.21.0


