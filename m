Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9D1ABDF96
	for <lists+devel-orangefs@lfdr.de>; Tue, 20 May 2025 17:53:11 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id D97F83850F9
	for <lists+devel-orangefs@lfdr.de>; Tue, 20 May 2025 11:53:09 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1747756389; bh=8gjQNVIy6w6vD2czbuvav3DLIklHq1vaF0DRVXISh+E=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=I3OFq26yyAADb4/ZAQMbqsXWyVyLm8B5Xgt2On9+Ey6p+wivyLd29y8WbHdIHrLuX
	 +MHQRQq+7JZ+RX6mtqi0t/AnhgYhqIGrs6apPaYNk0wBoQOadT/fqaSRaGWLVXofRD
	 LL4Ukmk5cRozjL7oSiZ9CmLHPxfK3JjTmxQ/iGLXJiMW4RY6c3UGn3PjtVsW29h1IX
	 YQ9wMzkoG+/Y1lT6DcUSIhEfUDB7uEBy0MoaS8JdvM38nQ1eAoPcmEDWIJW+ll5qZG
	 8o7feeQGpi+81JqYVZ4cmE7/0gnIAMZnUc4sv2xKyBAgFMI+LLpsLWbS95gJPnTFFe
	 NERZ+DqoXPXTA==
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	by mm1.emwd.com (Postfix) with ESMTPS id AC2723809BE
	for <devel@lists.orangefs.org>; Tue, 20 May 2025 11:53:07 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="HT7KIOXT";
	dkim-atps=neutral
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-3081fe5987eso4883226a91.3
        for <devel@lists.orangefs.org>; Tue, 20 May 2025 08:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747756387; x=1748361187;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bXMRndVqJ6YbEU8PV90w5eWyznhaN960cxNJaXiRdDs=;
        b=jrujC4R+mLT8HEvndAv2O0Ptv1mcHG1+enLPQfbmj6qKsE4dTkDMnDhlM0U8aFDBL8
         qP9/jJK2FlCwEWQPTrR6yaCg+w0aA3U2dl2o2cK4HQ4r96l+4721OYO/MEdX3i5qlL5F
         kbYvTVNfuMJc2yCBaZ9R1xKF8pqdVYp09L2PaDX3Qgm/XmPQZpnT2I+oaL4Apk1nuQf0
         2lx+mdpNXX66cjP/r1wx2owtnNLJZJb0XSFecJLBpJIdxEUY/DZXZJVxY8VBA9FL3RV/
         nlbOaJzJaDtRPEjAQ+/6gOpIe8b52pBlSAR6Zu0+utNY10Vk9sfcC1VH/HqJGfGnvzDB
         5lHw==
X-Forwarded-Encrypted: i=1; AJvYcCXDKEHUQFsLkIWdoAKgVOfj08c4ABWM+67JaX6+rX1gK0ZxlMjLd1/5YOC1O3bhUS7qmAq8gQ==@lists.orangefs.org
X-Gm-Message-State: AOJu0Yy4mBJnidNSZHADPAs5GOzuzBL3/szNdp5kvc/xcJe6MZo/LlOb
	a8Ygu8vIb2zDlTNbFWLHGjcDBrG8Ce6s+UHJWQnnq5LYmUdwFqsWgn/CMvBLRzRxnMCegA65jxh
	WENsr7oo+4PZ1H+CsbunIDNtSlSP/1M/aDuHJc951
X-Gm-Gg: ASbGncvaUvFVvsC+J692V7O7hjYA5Xug6FA7NcW+kFiM6G0quIjMSKZGO11r75nbuL3
	98ar6fyW/IGPxEPBpgok+Ux0BHlOYRkDPYs6EA3iZ40yMspEkIR/e/OT/+IC1oFd/4GB7GtHSHY
	JWT+pL6ZUhuqjyTgIgSnE5iCdqIxML7UVKCSDYame9Ft3L
X-Google-Smtp-Source: AGHT+IG+1qHgyfrAodz7VJowm7ljcCkBVBxOFi+oVdDBo3ZtOkqeyZ+27os/hLyojHtm71Vg+3b5ozueEmkIl8I32yA=
X-Received: by 2002:a17:90b:57e8:b0:30a:255c:9d10 with SMTP id
 98e67ed59e1d1-30e830e87f6mr25156331a91.8.1747756386745; Tue, 20 May 2025
 08:53:06 -0700 (PDT)
MIME-Version: 1.0
From: Mike Marshall <hubcap@omnibond.com>
Date: Tue, 20 May 2025 11:52:55 -0400
X-Gm-Features: AX0GCFvx2tmSAdBOuo-XQIrT6aTb0JpKFJFgUu_Q3Mca_Liok8QoRihtbNLCCAs
Message-ID: <CAOg9mSTe1vJLaw=ftzB7LsSEVqWj-5HEznERtWUh=CuBN7yKMg@mail.gmail.com>
Subject: [GIT PULL] fix for orangefs counting code
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, Mike Marshall <hubcap@omnibond.com>,
	devel@lists.orangefs.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: 2GRGRQNG3BE325RB2DMTROGRFX4LVV2R
X-Message-ID-Hash: 2GRGRQNG3BE325RB2DMTROGRFX4LVV2R
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/2GRGRQNG3BE325RB2DMTROGRFX4LVV2R/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux.git
tags/for-linus-6.15-ofs2

for you to fetch changes up to 219bf6edd7efcea9eca53c44c8dc3d1c6437f8b8:

  orangefs: adjust counting code to recover from 665575cf (2025-05-20
11:07:00 -0400)

----------------------------------------------------------------
Hello Linus.

A 6.14-rc7 commit (665575cf) broke orangefs for 6.14. I have a patch,
and it has been in linux-next for several days, but if I wait until
the merge window to ask for it to be pulled, orangefs will be broken
in 6.15 too.

I hope you can pull this patch during 6.15-rc7.

Thanks...

Mike Marshall

----------------------------------------------------------------
Mike Marshall (1):
      orangefs: adjust counting code to recover from 665575cf

 fs/orangefs/inode.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
