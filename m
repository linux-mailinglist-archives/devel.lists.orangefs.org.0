Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 343E3A240DB
	for <lists+devel-orangefs@lfdr.de>; Fri, 31 Jan 2025 17:41:49 +0100 (CET)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id D9DA73858C4
	for <lists+devel-orangefs@lfdr.de>; Fri, 31 Jan 2025 11:41:47 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1738341707; bh=wJUNdGYXVqVyOlcBenOV5oy6/Ed39bOIYBNj2ptd2ZU=;
	h=From:Date:Subject:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=spmFcurflMLBIUcT0cEKmKpLjS/EigOonkE1pz6AdFCn2H+Z/2adhp0Aa4397Au9z
	 hQzUicv9k1CL8SXe9TD91+InPmIqVuP2X6f19o33gp+eSdXFAWiMoDwJTk24iOYxrl
	 Yg2QI4U5aBzlyUIhtmnA019t4wIEq/CJe7ag3A7akijq611Z2Rr3rXF3ySFiLEj4qN
	 3LrxDhy7OJD5svS5pbzKq7RrL2IahRXhN03GO+ZMI/QhfFHAvEifSbHLVBoHebw7BB
	 o7eRbtt6Pz6qbNkX2gfSEeA57e6LD/Zbuc5sZImuWpXWK+gN5Q5mfuDeyr6Gbdr6JR
	 ctIzocrUfOIRw==
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	by mm1.emwd.com (Postfix) with ESMTPS id B87FF3858CF
	for <devel@lists.orangefs.org>; Fri, 31 Jan 2025 11:41:45 -0500 (EST)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="IlyzxhgL";
	dkim-atps=neutral
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f42992f608so3095864a91.0
        for <devel@lists.orangefs.org>; Fri, 31 Jan 2025 08:41:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738341705; x=1738946505;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+eEfJJcr87RnYRXAj2DBnEKk4dXdxniqCx7iRFRd+FM=;
        b=QwZLp92BHpvvB56fVv3KkioiGTofJ1DXSaWC1annP/PZeB9g07S6Cw1+G2qAljIxRG
         XlDrtnKMzwyndHUfG5jFY3s7+GsuPeiOC/TdYcMA5J2z15SPnRFFMJ8i1LUAQzt9i0sX
         TcNzT2OxQSEnnG/qlwO7ali6zKafiNA+6vYQ/Q0aCcYGo8Mh79QNnsKvKe26yElx16Uy
         Ezn5BHbZ3jSJjvMRCthdY3VN1rm6yHMjvUY0D35UwUJVFm7KceVt/goj2iAFlf6FLiIV
         nzJlLotMozqJL+ijQeiUZHBQY5snCAnx1JvNkWrqTFxxfMQSiWnNoWKJclfFnR5OXG3Q
         AKWw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ4/zc08ybYIAno3gI28cMaNrjb5aRUeH7Y5DrDc70s6wpBkeRm03/qjwEmYoxquEvDtJilg==@lists.orangefs.org
X-Gm-Message-State: AOJu0YwSjsIv4BhwJwYxHfkL1xbyro+aY4CWHcAz/nzDzVWzeJMu2KwX
	WdnpQblzkDdYfYL69AeeqTSFHEuH74/yF0KKwSUyC7QJgMZRcI1NDdOqG3b7a7H7grzk+cLXyfD
	8VDlmJaC6JDadZyVVQzmur/oG8bu/XcJmUUSL
X-Gm-Gg: ASbGncu4kbmSt76cZgpyoC3qRpKMFYk+OKw+CIy6oNxq+5v2/YptKwD6UHN3W2/xynQ
	3N28okeVsuZdvAXsfgTyWC8E7z0dVI77EUSh4JL5giDABDQ4jBxXOOWis5F+bspMOFuOSjprUr2
	PHt0CyLfn6
X-Google-Smtp-Source: AGHT+IHH/PljsUV1KvbPnycXhYIE0cHQ+QDn8rPx+3EHhl6pLqnSAS4tzZmHF6tCsKgTFPq1c0TjHXEwoQWEsW0Ugkg=
X-Received: by 2002:a17:90b:3a08:b0:2ea:37b4:5373 with SMTP id
 98e67ed59e1d1-2f83abe2135mr18428482a91.10.1738341704660; Fri, 31 Jan 2025
 08:41:44 -0800 (PST)
MIME-Version: 1.0
From: Mike Marshall <hubcap@omnibond.com>
Date: Fri, 31 Jan 2025 11:41:34 -0500
X-Gm-Features: AWEUYZnR4NiQXJ2cA63iwkm_loA5nyd83TSHb9GyBRYsNYddmwivKjLD9UQQVco
Message-ID: <CAOg9mSRMrw4+OJVQ_tiTcCxOi=E0XScii7uD44w846ryht1T1Q@mail.gmail.com>
Subject: [GIT PULL] orangefs syzbot fix resend....
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: KFTDT5RXHQQLOANE4SANNFH76P73RTY4
X-Message-ID-Hash: KFTDT5RXHQQLOANE4SANNFH76P73RTY4
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-fsdevel <linux-fsdevel@vger.kernel.org>, devel@lists.orangefs.org
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/KFTDT5RXHQQLOANE4SANNFH76P73RTY4/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

Hi Linus... Konstantin helped me get my nitro key going, I hope this
one is OK... thanks!

-Mike

The following changes since commit 9d89551994a430b50c4fffcb1e617a057fa76e20:

  Linux 6.13-rc6 (2025-01-05 14:13:40 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux.git
tags/for-linus-6.14-ofs4

for you to fetch changes up to f7c848431632598ff9bce57a659db6af60d75b39:

  orangefs: fix a oob in orangefs_debug_write (2025-01-08 14:35:59 -0500)

----------------------------------------------------------------
orangefs: fix a oob in orangefs_debug_write

I got a syzbot report: slab-out-of-bounds Read in
orangefs_debug_write... several people suggested fixes,
I tested Al Viro's suggestion and made this patch.

----------------------------------------------------------------
Mike Marshall (1):
      orangefs: fix a oob in orangefs_debug_write

 fs/orangefs/orangefs-debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
