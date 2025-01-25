Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DADA1C45A
	for <lists+devel-orangefs@lfdr.de>; Sat, 25 Jan 2025 17:32:39 +0100 (CET)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id 0FF483856A4
	for <lists+devel-orangefs@lfdr.de>; Sat, 25 Jan 2025 11:32:38 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1737822758; bh=+icgcTO+S1udMBNfq5ehOwAdgM2oITqk2P+z6N+W1r8=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ieYn5+acmcaNBFtUbhIvzK0NOsA1KPlt969eVXqOu1dyN4t4a3PoDlsd2YWS1kCtz
	 9oQJWxr23pFauqP8ykp6+S/ZBS3FZNWRRf9D/54vMXNP0Mi1EmBJiYhsTK56qIPifx
	 7yuR1Sv1MeS3AGTmR4ERJIJYwpLPP5J7EmPOn/KxUmH7NKpMHQNSbYgeR3Qq9BEHyG
	 p8E4z20f5JOrxK9kYz+l9EC6xcSJA6jVxWfdVyHSfuJ6KgXBZG3PxN/uVcSd2hoQ2y
	 djk7wyAnajsf7rP3pN2mzdVqbHEXwMVl4phwXusJeNRXH3odfjcnhRpbfkmXxw+4tL
	 JmKn8HO7sWYXw==
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	by mm1.emwd.com (Postfix) with ESMTPS id 217B838569B
	for <devel@lists.orangefs.org>; Sat, 25 Jan 2025 11:32:35 -0500 (EST)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="hcs1k3ts";
	dkim-atps=neutral
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso4208787a91.2
        for <devel@lists.orangefs.org>; Sat, 25 Jan 2025 08:32:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737822755; x=1738427555;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8RWmB6Ep3bjiEwZP1/hvFukb7y8zZunDf0wQG6DUKAw=;
        b=A6L2WRZOP3KpS+k1R1KWb/6KmwJE5Vbqb9XCA/orwZODo/iQy0xmH8jGFLv++qlztb
         mm8D0j4TxdHKKzPrEtZaFvZirza6KDhRC5e2ie/wu9Te2c9DsVzh++WeQ4swQoQeCw9j
         VPALb7GTX8rTIJukTStOdiwwg8BzTknpuTKecKucRv0ppy4xOmJsBIpkBJbzPQmkdaYI
         m6JcENAazGWI58A9l6e7INVAAEHAB4NWaE9dk0nCzA+TitnIm7STMNMbHagQ8v2qIyqG
         QaDHZFRYho1Wz/5XFmaP+dfwp6Zz69BM2jz+XjTlcjI3pdK2ZCx/hWQxHWnxqkKoR7z7
         YR6g==
X-Forwarded-Encrypted: i=1; AJvYcCXJAIs0f+JyZg1WgOeBT1PhAiV0H3C2g6c3LjWjhf/uXV+x5tprNfXIC6CEGakcum6PgzAmKA==@lists.orangefs.org
X-Gm-Message-State: AOJu0YxMEAe+6iN/DGg3+mA4rVXzzOBgX0UaOPjiaUo5qb9NX5nZcJPj
	5U2wMGOVMSPPrJL1pSH2Wg/LiYvgZXi5kltS/t9FJN1as2LEgqT28/cDJOtsrIgEZuomHz9SWUT
	iorOMZM5iIAVAA8nnDDG5UyD/T0Lz1NSQiX7z
X-Gm-Gg: ASbGncsz6GHy/0yyM/0WREi/ag7yz6CWjuEC4x3/49AYqU7DhulTXf/AdHRYpubvWYG
	9/m6iWPaEzZUugf+NM5aL3lY//Y7lIK02AJXkFb+x/Z9UGLyi7CABMVP1TG51FKI/RM8qI1qHoQ
	==
X-Google-Smtp-Source: AGHT+IHHx+u79GqM41GGCDsK3bZE3OyhWYdDbkoczE0Z9sh/LUDSFyqPR58M/uma5dUMdBbzqARpumYNL70Z//90NL8=
X-Received: by 2002:a17:90b:5245:b0:2ee:5691:774e with SMTP id
 98e67ed59e1d1-2f782c55044mr52425519a91.2.1737822755067; Sat, 25 Jan 2025
 08:32:35 -0800 (PST)
MIME-Version: 1.0
From: Mike Marshall <hubcap@omnibond.com>
Date: Sat, 25 Jan 2025 11:32:24 -0500
X-Gm-Features: AWEUYZmplvW4HGPQjGkiPtmgU_R8VxpWx1hy9DAyzBb3qZ8CZZ61h8tenWoUcD0
Message-ID: <CAOg9mSRXYtybVX7GSK0dMcdOXTshJjy4YL8CF6Ly0aSPQV7nEg@mail.gmail.com>
Subject: [GIT PULL] orangefs syzbot fix...
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, Mike Marshall <hubcap@omnibond.com>,
	devel@lists.orangefs.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: 6O2ULSDGYF2JQRLDD63XQYY3KYM6NAQH
X-Message-ID-Hash: 6O2ULSDGYF2JQRLDD63XQYY3KYM6NAQH
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/6O2ULSDGYF2JQRLDD63XQYY3KYM6NAQH/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

The following changes since commit 9d89551994a430b50c4fffcb1e617a057fa76e20:

  Linux 6.13-rc6 (2025-01-05 14:13:40 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux.git
tags/for-linus-6.14-ofs1

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
