Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (unknown [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 057521C05B2
	for <lists+devel-orangefs@lfdr.de>; Thu, 30 Apr 2020 21:09:00 +0200 (CEST)
Received: from [::1] (port=51548 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jUEXo-0008U2-QX
	for lists+devel-orangefs@lfdr.de; Thu, 30 Apr 2020 15:08:24 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:35972)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <vitor@massaru.org>) id 1jUEXo-000831-1Q
 for devel@lists.orangefs.org; Thu, 30 Apr 2020 15:08:24 -0400
Received: by mail-qt1-f196.google.com with SMTP id w29so6018976qtv.3
 for <devel@lists.orangefs.org>; Thu, 30 Apr 2020 12:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C8AiLY8Jx+agzN5y2seIrLqYvcvctf8hMS4XCT7biTg=;
 b=cXyDHg4BakW/zjntd3RnSJFCetFIj31VQCU1kvleuvXtwnusFYS06s78v9XCBEWsPR
 Rb12gH3STnUJLri7F0qha7uZOZQVUfiZUOy+QHzbRNHlHeGmhjr0X3ZWUH3m9+/GqGof
 5hDErphgH7MBfeyqsL6/JIusJ2LIPidxn11mmzFMwCWom1EHzuQA+al0DZN9RNCDvEAB
 ZJ4V4LP2TDESxVa5boJbKQj3OG3BD09b0OwUyJ2BCu0M3L4ZV2T0KCUCgWyJ8u4zVOX3
 LqChc2GcYqLJGg1788YK50Gk6Svdm20KkViMySeEYv9rkpGfBxgOi8MPbn7M7dFdTtPV
 eviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C8AiLY8Jx+agzN5y2seIrLqYvcvctf8hMS4XCT7biTg=;
 b=iAPeI2av2tiCuyfivnhVBzEDr/vggezDII7EfC0iUSTLUxp8Gmfh7tv1w6ZWmL7gMM
 verPIlbalUpQbFg25wNRqpu/WcWWKFG1xv+rXK8yX/Pm1t9d7PAr8zfhgs97OaR9GoG0
 uPV8NLZit+gy5MCshhMW3HDS8TpDmYfKNctvsyc3mAqZLwrQR+pt0wHJvNOqsnGtjORq
 VvX/i/cudlz0UkLkkx4CYfriOeXKyp8EWBzkYBXDk8CEwbCh6uj5n/R2xf8k0IzIGM85
 b3QAvpHi4m1HrY14ZEkxyRz952WP4OgRoYR1Slnt8szXOLI2z02T2qDVIF6dq/MQfl9m
 k8UQ==
X-Gm-Message-State: AGi0PuZHdX7dCm61OBPZCq1e7JXXjs3EEfaJY2lu/Hn1WK6zSzgld6Iq
 PBXgqoBJq0LHvCDa2hC4u3dphg==
X-Google-Smtp-Source: APiQypI/UBx9Y5IWGpPtyBWd0nldKr9Js+rAqO9ame/KRp8gaD9ERM3xMuLiSYUC+W4jilxrmZD9Eg==
X-Received: by 2002:ac8:3102:: with SMTP id g2mr5266361qtb.349.1588273662712; 
 Thu, 30 Apr 2020 12:07:42 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id z4sm501252qtq.5.2020.04.30.12.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 12:07:42 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: linux-doc@vger.kernel.org
Subject: [PATCH] docs: filesystems: fix `make htmldocs` warning
Date: Thu, 30 Apr 2020 16:07:37 -0300
Message-Id: <20200430190737.80950-1-vitor@massaru.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: corbet@lwn.net, brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
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

make htmldocs
Documentation/filesystems/orangefs.rst:124: WARNING: Literal block expected; none found.

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
 Documentation/filesystems/orangefs.rst | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/filesystems/orangefs.rst b/Documentation/filesystems/orangefs.rst
index e41369709c5b..628dc220567e 100644
--- a/Documentation/filesystems/orangefs.rst
+++ b/Documentation/filesystems/orangefs.rst
@@ -119,9 +119,7 @@ it comes to that question::
 
     /opt/ofs/bin/pvfs2-genconfig /etc/pvfs2.conf
 
-Create an /etc/pvfs2tab file::
-
-Localhost is fine for your pvfs2tab file:
+Create an /etc/pvfs2tab file. Localhost is fine for your pvfs2tab file::
 
     echo tcp://localhost:3334/orangefs /pvfsmnt pvfs2 defaults,noauto 0 0 > \
 	/etc/pvfs2tab
-- 
2.25.1


