Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 670F32F8F6
	for <lists+devel-orangefs@lfdr.de>; Thu, 30 May 2019 11:05:48 +0200 (CEST)
Received: from [::1] (port=53534 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hWH0N-0002lm-94
	for lists+devel-orangefs@lfdr.de; Thu, 30 May 2019 05:05:47 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46438)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <blackgod016574@gmail.com>)
 id 1hWH0M-0002lI-5c
 for devel@lists.orangefs.org; Thu, 30 May 2019 05:05:46 -0400
Received: by mail-pg1-f194.google.com with SMTP id v9so1617203pgr.13
 for <devel@lists.orangefs.org>; Thu, 30 May 2019 02:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=WB3NAADDilR+pQagX0XJnxPLeHo0i5e2Cuu9jSLHh1E=;
 b=lpB1Jkw2oOAqbZBAmZSQC/b66H4fQsO13YoayB5e3p+1e8WhK+IWndHuFP9yLrK1u1
 iO9e/9gce9SWDSC+7w9NQlZ+efezCgjpg1dK0UWYmsZM9eNs1c3AzQc2AoGGPqSoyGqw
 Gu0xu4MUoTWkmXVIHGfz+NUR7iwSTs9Kodx5w/q3G30pR1EaVQjWejdEXGZPmOpOijtT
 v1YbppCuE/0Eo4vObiamodDEwECOYxujFpONtXglKwiCCNfA9DYPZSrUyA0GJPQ8W3c+
 W5YxuNW3HFH/hsk6kIDEn8pNlPXUUhKfBx+DMGnJCygcdYLdpHPwiMmjix+wxiGOWsiX
 2c5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=WB3NAADDilR+pQagX0XJnxPLeHo0i5e2Cuu9jSLHh1E=;
 b=Wai6+uHrSTNeoVLZ2ogwedh2yrlSub4QNdaiz/mSODCP8b0liI/srDYLNmOps3z3la
 XiGrrh5u7SadgdJEfxtj2l6nWdPbOkjjGcG805OPO9W+voNhSnFee5VtDlpMuQrhd6P+
 6NhyuCShk3igQafDcfff5vajT/dkDj137SW1KQ5a6mUAiwogjsGK1nZXeb7NYSp8HKms
 CHz0Vcg92uQiVO6owA68OBwO6TJjH9unoPxet7GnIqF2BF4qTX8QbSiXSZdlrcT3ORBe
 9f+qDqaPyOLodfJl5suL6dTVPGwX2I0RtiGebVat2IA+o3gWHo7RS3nIJulv2xA+BQpW
 cCyA==
X-Gm-Message-State: APjAAAUxXDgKJ7rzB5Uyhqeoc51XUceNK4byBOIDenUF9lhUr3H/UHDp
 f1nWJOlLNQOKID/Ve/dOHgU=
X-Google-Smtp-Source: APXvYqzuZM8q4NuM6xInvIKRaIVPk2x6fMdjoOxyHExzjr+fV67DncXgE2+JwgNQneEOgzBTvCU44A==
X-Received: by 2002:a17:90a:dc86:: with SMTP id
 j6mr2336394pjv.141.1559207105150; 
 Thu, 30 May 2019 02:05:05 -0700 (PDT)
Received: from zhanggen-UX430UQ ([66.42.35.75])
 by smtp.gmail.com with ESMTPSA id x10sm3427230pfj.136.2019.05.30.02.05.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 02:05:04 -0700 (PDT)
Date: Thu, 30 May 2019 17:04:55 +0800
From: Gen Zhang <blackgod016574@gmail.com>
To: hubcap@omnibond.com, martin@omnibond.com
Subject: [PATCH] orangefs-debugfs: fix a missing-check bug in
 debug_string_to_mask()
Message-ID: <20190530090455.GA3059@zhanggen-UX430UQ>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: linux-kernel@vger.kernel.org, devel@lists.orangefs.org
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

In debug_string_to_mask(), 'strsep_fodder' is allocated by kstrdup().
It returns NULL when fails. So 'strsep_fodder' should be checked.

Signed-off-by: Gen Zhang <blackgod016574.gmail>
---
diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugfs.c
index 87b1a6f..a9a9aac 100644
--- a/fs/orangefs/orangefs-debugfs.c
+++ b/fs/orangefs/orangefs-debugfs.c
@@ -888,6 +888,8 @@ static void debug_string_to_mask(char *debug_string, void *mask, int type)
 	char *unchecked_keyword;
 	int i;
 	char *strsep_fodder = kstrdup(debug_string, GFP_KERNEL);
+	if (!strsep_fodder)
+		return;
 	char *original_pointer;
 	int element_count = 0;
 	struct client_debug_mask *c_mask = NULL;

