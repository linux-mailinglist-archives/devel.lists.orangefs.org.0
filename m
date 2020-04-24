Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 750231B79A3
	for <lists+devel-orangefs@lfdr.de>; Fri, 24 Apr 2020 17:36:22 +0200 (CEST)
Received: from [::1] (port=52754 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jS0NJ-0006xk-AL
	for lists+devel-orangefs@lfdr.de; Fri, 24 Apr 2020 11:36:21 -0400
Received: from 15.mo3.mail-out.ovh.net ([87.98.150.177]:42543)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <steve@sk2.org>) id 1jS0NI-0006wD-2P
 for devel@lists.orangefs.org; Fri, 24 Apr 2020 11:36:20 -0400
Received: from player711.ha.ovh.net (unknown [10.110.171.131])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id BCED224D9A3
 for <devel@lists.orangefs.org>; Fri, 24 Apr 2020 17:35:38 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
 (Authenticated sender: steve@sk2.org)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id 676CC1196D5C9;
 Fri, 24 Apr 2020 15:35:30 +0000 (UTC)
From: Stephen Kitt <steve@sk2.org>
To: Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>, Jonathan Corbet <corbet@lwn.net>,
 devel@lists.orangefs.org, linux-doc@vger.kernel.org
Subject: [PATCH] docs: orangefs: fix pvfs2tab literal block
Date: Fri, 24 Apr 2020 17:35:15 +0200
Message-Id: <20200424153515.134500-1-steve@sk2.org>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 525232308669205942
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieehrddvhedrvddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejuddurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdprhgtphhtthhopeguvghvvghlsehlihhsthhsrdhorhgrnhhgvghfshdrohhrgh
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
Cc: Stephen Kitt <steve@sk2.org>, linux-kernel@vger.kernel.org
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

Following a merge fix-up, the literal block is introduced too early;
this patch merges the localhost mention with the introduction, fixing

	Documentation/filesystems/orangefs.rst:124: WARNING: Literal block expected; none found.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 Documentation/filesystems/orangefs.rst | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/filesystems/orangefs.rst b/Documentation/filesystems/orangefs.rst
index e41369709c5b..463e37694250 100644
--- a/Documentation/filesystems/orangefs.rst
+++ b/Documentation/filesystems/orangefs.rst
@@ -119,9 +119,7 @@ it comes to that question::
 
     /opt/ofs/bin/pvfs2-genconfig /etc/pvfs2.conf
 
-Create an /etc/pvfs2tab file::
-
-Localhost is fine for your pvfs2tab file:
+Create an /etc/pvfs2tab file (localhost is fine)::
 
     echo tcp://localhost:3334/orangefs /pvfsmnt pvfs2 defaults,noauto 0 0 > \
 	/etc/pvfs2tab
-- 
2.25.3


