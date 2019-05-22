Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 331CC26B75
	for <lists+devel-orangefs@lfdr.de>; Wed, 22 May 2019 21:27:34 +0200 (CEST)
Received: from [::1] (port=49270 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.91)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hTWth-0002o6-CT
	for lists+devel-orangefs@lfdr.de; Wed, 22 May 2019 15:27:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:59508)
 by mm1.emwd.com with esmtps (TLSv1.2:AECDH-AES256-SHA:256)
 (Exim 4.91) (envelope-from <sashal@kernel.org>) id 1hTWtf-0002na-H3
 for devel@lists.orangefs.org; Wed, 22 May 2019 15:27:31 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C91E21850;
 Wed, 22 May 2019 19:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558553210;
 bh=eZoYOpEZZXBBGLzR1IIyocDg/nlN3NiCX+nI3TnIoso=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZPfIx6S0hhGYgtUv1I689FAmF1ik2c8xdXG/pCRQ4Xq9uulA2iSDq2Ws50YprFT6b
 Z/prwm3FuGmhflSPn8q4bB7K5YcMiRpLXi4zU4ZUWrhLhhM/iPyFpOan9/XmVkS37G
 blg8bi10rR80Z6XxEiQhmLUhiNqXFvG43DE1yq9I=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 014/244] orangefs: truncate before updating size
Date: Wed, 22 May 2019 15:22:40 -0400
Message-Id: <20190522192630.24917-14-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522192630.24917-1-sashal@kernel.org>
References: <20190522192630.24917-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, devel@lists.orangefs.org
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

From: Martin Brandenburg <martin@omnibond.com>

[ Upstream commit 33713cd09ccdc1e01b10d0782ae60200d4989553 ]

Otherwise we race with orangefs_writepage/orangefs_writepages
which and does not expect i_size < page_offset.

Fixes xfstests generic/129.

Signed-off-by: Martin Brandenburg <martin@omnibond.com>
Signed-off-by: Mike Marshall <hubcap@omnibond.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/orangefs/inode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
index 31932879b7162..9bf2ceed4f29b 100644
--- a/fs/orangefs/inode.c
+++ b/fs/orangefs/inode.c
@@ -172,7 +172,11 @@ static int orangefs_setattr_size(struct inode *inode, struct iattr *iattr)
 	}
 	orig_size = i_size_read(inode);
 
-	truncate_setsize(inode, iattr->ia_size);
+	/* This is truncate_setsize in a different order. */
+	truncate_pagecache(inode, iattr->ia_size);
+	i_size_write(inode, iattr->ia_size);
+	if (iattr->ia_size > orig_size)
+		pagecache_isize_extended(inode, orig_size, iattr->ia_size);
 
 	new_op = op_alloc(ORANGEFS_VFS_OP_TRUNCATE);
 	if (!new_op)
-- 
2.20.1


