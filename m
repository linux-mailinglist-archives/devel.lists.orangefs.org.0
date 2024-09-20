Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 717B397DAD0
	for <lists+devel-orangefs@lfdr.de>; Sat, 21 Sep 2024 01:41:34 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id E50BA385388
	for <lists+devel-orangefs@lfdr.de>; Fri, 20 Sep 2024 19:41:32 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1726875692; bh=BWbr7lgRbE1fc81eCV90O8aJB7YrFzUOlrsqNgjVbO0=;
	h=From:Date:Subject:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NIAs1uQ4nUQvFPZye4+Ds4HhQz1B9+OKt9mm7idPTQN+S3VQbPA5e0pd1slnJJkrV
	 fxGKFrGoM290SwmLzmEXnBlNmORIcSUSVB8vXzWG7fEokYEW9RQ/Dex/Hwq6E8r1vS
	 EFfhZNusl8fnvwoPu5+vvAnaFSgHtjh8q64bVCIWkXzeDh43YaYHU53TXLrr5DhFo9
	 EtB79sEKbT+5qa+VvyIxtJbhskqadxskcbsLXxs96fwbVilEZ8G1036fU/ndEFI0v2
	 3YUlbXCMesdE5IsqcU2yEcALCAsD5jTcUijO8ndUAuVNh5EJ6O/xMqPYLRFz5iwS6T
	 30YTTddTsWUTg==
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	by mm1.emwd.com (Postfix) with ESMTPS id 5F6DC38537E
	for <devel@lists.orangefs.org>; Fri, 20 Sep 2024 19:41:29 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="yc88iHsT";
	dkim-atps=neutral
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-458320b30e7so17157321cf.0
        for <devel@lists.orangefs.org>; Fri, 20 Sep 2024 16:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726875689; x=1727480489;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CS7nHL0YpSltim+yTiE07vu+ADr6RRyFUsXhX72Lm08=;
        b=NHd1q7mY9WhO0mxiLeRNpgft+pKxey753841U1cfXqBp63phZS6H807+w2l8JjaYd/
         59u/GCDFXvtfFJ/ta8OMXGX16PawQ6uyHvn6+8yUVtoMkPQxxEc8cTO4Ms7lF+Er7ysz
         zz+eFXJqSLuDisa3o+aSk3J+T1qEnCfkniHoCMnVObnEYCM83xS3vw73s/aEFLBBQB+K
         z8kLHoOmbopQ/hLC3jQvXbJ1iyWT87sz323Q9V29ayQNfzfAo2+UT7mq9vOFNgo2Loeo
         e9xB7WlMMlMIFxtJoTNKJWJP41zVBly/FveJI6BrXirwbmK8OQx2ouj7BQOoJtAF8HB3
         6ifA==
X-Forwarded-Encrypted: i=1; AJvYcCWD3+uMNu4bWfk/CQaqrglR22hIsQC2BomuL+JjJ8t61cYYPhKjMPoJ3QuajXrvUaofYcRqtw==@lists.orangefs.org
X-Gm-Message-State: AOJu0Yw/UA4PbQDc31rDctosA+ukYJFBLL3xlJkcvdOfPVf4Mk0U6GMN
	uoKxnXcw3Pw5Kigx3dvwbyhy4b8LfAFKuyxZMa2dIhEPD24cEBTItAgUvuIfkOXYQk0WoHCTvBU
	itM6S50NZmMyJdWdE+BQpwzHR5ZJjLJZQDakl
X-Google-Smtp-Source: AGHT+IG+Ixo9qjTFl2HOI5Xkq6nqqBs1gxciRek3ByfdYFARKrNFjKypDa9WFze+Mti4qvm3q73n7+DnFzd8+TnDO1g=
X-Received: by 2002:ac8:5d8a:0:b0:458:a70:d9b5 with SMTP id
 d75a77b69052e-45b204f133amr71475171cf.15.1726875688686; Fri, 20 Sep 2024
 16:41:28 -0700 (PDT)
MIME-Version: 1.0
From: Mike Marshall <hubcap@omnibond.com>
Date: Fri, 20 Sep 2024 19:41:17 -0400
Message-ID: <CAOg9mSSU61P0en4i0aLF=+CiTXkV7LzkB9XGuJ3FTQBrq52BQA@mail.gmail.com>
Subject: [GIT PULL] orangefs changes for 6.12
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: EGU2H6MLO2IHSKRMQQGGLEP3G3GXSLPT
X-Message-ID-Hash: EGU2H6MLO2IHSKRMQQGGLEP3G3GXSLPT
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-fsdevel <linux-fsdevel@vger.kernel.org>, devel@lists.orangefs.org
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/EGU2H6MLO2IHSKRMQQGGLEP3G3GXSLPT/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

Hi Linus...

Sorry I fat-fingered my tag...

The following changes since commit 5be63fc19fcaa4c236b307420483578a56986a37:

  Linux 6.11-rc5 (2024-08-25 19:07:11 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux.git
tags/for-linux-6.12-ofs1

for you to fetch changes up to 96319dacaf15f666bcba7275953d780e23fe9e75:

  orangefs: Constify struct kobj_type (2024-09-06 10:18:17 -0400)

----------------------------------------------------------------
orangefs: Constify struct kobj_type

----------------------------------------------------------------
Huang Xiaojia (1):
      orangefs: Constify struct kobj_type

 fs/orangefs/orangefs-sysfs.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
