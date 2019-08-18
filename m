Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B5A9180D
	for <lists+devel-orangefs@lfdr.de>; Sun, 18 Aug 2019 19:00:49 +0200 (CEST)
Received: from [::1] (port=48332 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hzOXt-0000o7-64
	for lists+devel-orangefs@lfdr.de; Sun, 18 Aug 2019 13:00:45 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44815)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <deepa.kernel@gmail.com>)
 id 1hzOXr-0000nf-UO
 for devel@lists.orangefs.org; Sun, 18 Aug 2019 13:00:44 -0400
Received: by mail-pg1-f195.google.com with SMTP id i18so5502195pgl.11
 for <devel@lists.orangefs.org>; Sun, 18 Aug 2019 10:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4vdpiujyv0Q54P4wr1NHiItOOVlay6nEIW3I5YYez1M=;
 b=qUD/uEQQpa5IDC7eb5nxpxQr/sWFHbFJfQN7K/crcrZ2iHsJ2DJgPtrQ5pL8lKjaOf
 GPYR11BRkK20l0XSflbKunmNOk0fMJ7hCwJC6eYGYAkss/I9A/UcV3qlTgLq3/imhpmS
 4G7Z3YROQt83sLgDymrw4DFNq66x9Xtp/fOBr1KyXz3k1xISoJfPY4oZ5fERJ7E5/V2D
 qnAml5iKJ7fgcKDv5ssM671Ay2p1kCPe/tD1qxfO5W0KY0PbG3iYrwMe5OrlWfGQy5cX
 cWVpHihyiDeAHupNdZksDWLzOzBNVj2M6kFBPl22MqGlI2K2pX0zrxeXijX5QNvQTcXx
 TiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4vdpiujyv0Q54P4wr1NHiItOOVlay6nEIW3I5YYez1M=;
 b=ovbTXHU0pqlfUNDa9S9B4lLZndLIJaL8o0Mko0v5tKu0aPvtn/lFZTtaFEL3FImydX
 in9yVBmp3puOs8C0lO9VK0vjIsE6pua2XkSSMQumIqxXZO41X4PpAL3GpY/gls7OXVqx
 uPNB1dVRoEFVCZClAWZdqlw/DP1RL8AvDIRnNjtEWieQcho26TymIM1297ZfEKeoCaU9
 cJE28JCNKUt5hespZ85oMglL6mAxUI5W+u4KBsaHhMz9oxK3SkB53sQoWtYt2wMC0T+m
 KP8/064yDyCC3TIOCCqlQUkvP+s064IMu47GabRZTW9LdSBLoz0vi5pJK5bGViboUTu9
 NRtA==
X-Gm-Message-State: APjAAAVbFM6bezl5Od1blDR8Yl1Kwt22nRIIHEdePhn3Ne6HYgJKNNBp
 tH2EnUhWqnf0fhuOHiTQDpc=
X-Google-Smtp-Source: APXvYqyr9mBtlQK7ACvNr+uLKfh0Jp10T6k1lmnDKUFzMFgoW8J/zrcMq8sDrz3A6P+Mu4s+wlJGRQ==
X-Received: by 2002:a63:8dc9:: with SMTP id
 z192mr16109414pgd.151.1566147602804; 
 Sun, 18 Aug 2019 10:00:02 -0700 (PDT)
Received: from deepa-ubuntu.lan (c-98-234-52-230.hsd1.ca.comcast.net.
 [98.234.52.230])
 by smtp.gmail.com with ESMTPSA id b136sm15732831pfb.73.2019.08.18.10.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2019 10:00:02 -0700 (PDT)
From: Deepa Dinamani <deepa.kernel@gmail.com>
To: viro@zeniv.linux.org.uk,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 16/20] fs: orangefs: Initialize filesystem timestamp ranges
Date: Sun, 18 Aug 2019 09:58:13 -0700
Message-Id: <20190818165817.32634-17-deepa.kernel@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190818165817.32634-1-deepa.kernel@gmail.com>
References: <20190818165817.32634-1-deepa.kernel@gmail.com>
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
index 2811586fafc2..1ec08fe459cf 100644
--- a/fs/orangefs/super.c
+++ b/fs/orangefs/super.c
@@ -425,6 +425,8 @@ static int orangefs_fill_sb(struct super_block *sb,
 	sb->s_blocksize = PAGE_SIZE;
 	sb->s_blocksize_bits = PAGE_SHIFT;
 	sb->s_maxbytes = MAX_LFS_FILESIZE;
+	sb->s_time_min = 0;
+	sb->s_time_max = S64_MAX;
 
 	ret = super_setup_bdi(sb);
 	if (ret)
-- 
2.17.1


