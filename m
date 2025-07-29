Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id C650DB1546C
	for <lists+devel-orangefs@lfdr.de>; Tue, 29 Jul 2025 22:51:37 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id DAE9354BD3F
	for <lists+devel-orangefs@lfdr.de>; Tue, 29 Jul 2025 16:51:33 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1753822293; bh=at7wv7dglQHSffUjEQ1SZQdJS8KUBIGGScGRZm65KvE=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=xy7VWgN92+6BjbkqMyLPU4tfVhmIiR8RivzaAuON+VtWhwu7iakaGnZ4a2niAKmuc
	 sdy9jhLUW4J80sHQZdBBMCs+rrvJH1SDFkxYGSZ20LkSWhQviayb4oGZFez4LGxtsd
	 dkH4Irp7E0UqXytPJ9woVlhqr/VuMWPnqw5QVp3kXnZdvRppUOjFCrZswvQ3DIvIlJ
	 Aogved6axX6FpEutfmx0dIBGvAA13xI0JsyJl48bZpdfgDTrn3rhAeOlBjhDDSbnIR
	 kw0Sg6bcPTzqwety3TCnlCEwMu68ETOIHMP2AwVnzwITItq3M7DgaxBbDALkd61YQ7
	 fC3NidS1O3YFA==
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	by mm1.emwd.com (Postfix) with ESMTPS id 6395F54BD27
	for <devel@lists.orangefs.org>; Tue, 29 Jul 2025 16:51:32 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="DOF9ACL+";
	dkim-atps=neutral
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b3bdab4bf19so193364a12.2
        for <devel@lists.orangefs.org>; Tue, 29 Jul 2025 13:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753822291; x=1754427091;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=578jKP0hi0tqBVIjYWRvcUwNsc6+UhPS5TGkN9Mmbb8=;
        b=OsPu1XQqbupAzPgtuQNqR97V+I/CrKt0Ltly9XPm0cMAVS1vhT7UmkLgeHAjLrvifX
         iDDKPNrDvISC3S4+95x0LvSaX52jhPQT4TKx4lj5YcEb+uKQxj8SIui85nF9zNTLdwDH
         Xfhcl5U+DnUrQ6xeV2JcIWCyfbA0LWYueDl1Tpw27ptQ4ItcCkg4fjzUSKHZszuF/C1H
         9BAio6p5tQG3GY3uHgnmKk58I0RiR30P97X9Y+MvRVQVdnsUKl7DyRlfNRtLQVXUkIQN
         hHmnzGxz663sKzmtef0scgedwdUl4ZknyNQRY5UzhW+aLG+Lc7EC1qbgQ1u3B7hdFpQv
         QgYg==
X-Forwarded-Encrypted: i=1; AJvYcCXVycHERQHV1t6NOclsYWrXWNxlI/OQP4HibzNSughznbNUehBAHSCigWBF48CwYWPNchkVdA==@lists.orangefs.org
X-Gm-Message-State: AOJu0Yx6JcbCgzfj1r/sHrcThBAm0rj9PEKyAaWqfbUSnUFTP5RnYsw1
	tGQYE0FsdxqzJPqBCGollDBecmx3C2ntW7KUEwpE7qTog/yXQVYCx98Ka8OerZp4U35ZniyJtIW
	wfGGKtbpUfFv8rXFXE5+LqgfTcsRweg0X3McunWR3
X-Gm-Gg: ASbGncvde0yZXEVNanMDuUmg+3szXAlA90Pv68XZX98Xo7EmI6ngnCrXrX/gP7Zis1o
	2r9u5pLYoOgaWAr0HB7sk2Xwdy2Y3f7v2UmXegy8ebMXheX6yKfkAzpcQ6twY0aEqCrEJlH5rnP
	L25fsjDW4/CtPcp9vUXCFNmueat3CZ+w+iFKtIbcF2KI4tQcHjEhQ1qdTZWbct7ct2XWIoqDh7j
	k21LYetntNEZhlrvLk=
X-Google-Smtp-Source: AGHT+IHFddi40TTm6cZBAA9PiJhIK2zNprWK8Gs1f+2BU0iJl2Rwr+HrzlAsoOff6zAq4E0jbc2qWg0bqp+nfvb0+MA=
X-Received: by 2002:a17:90b:4c8f:b0:312:f88d:25f9 with SMTP id
 98e67ed59e1d1-31f5dd8921dmr1025894a91.7.1753822291188; Tue, 29 Jul 2025
 13:51:31 -0700 (PDT)
MIME-Version: 1.0
From: Mike Marshall <hubcap@omnibond.com>
Date: Tue, 29 Jul 2025 16:51:20 -0400
X-Gm-Features: Ac12FXyFxL81O0IrhpWsHbUNoJI2MevNbfRHash4HpouZZbd8DogRq_OxDQUOf0
Message-ID: <CAOg9mSSTTgDcyex2gGK5V+JmaNfdXJidWkSkR8XdM+i2SN8NXQ@mail.gmail.com>
Subject: [GIT PULL] orangefs fixes for 6.17
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, Mike Marshall <hubcap@omnibond.com>,
	devel@lists.orangefs.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: 2GBCQ2O52NPKLLYDPU72GEQZKUJM56PB
X-Message-ID-Hash: 2GBCQ2O52NPKLLYDPU72GEQZKUJM56PB
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/2GBCQ2O52NPKLLYDPU72GEQZKUJM56PB/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

The following changes since commit 347e9f5043c89695b01e66b3ed111755afcf1911:

  Linux 6.16-rc6 (2025-07-13 14:25:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux.git
tags/for-linus-6.17-ofs1

for you to fetch changes up to 2138e89cb066b40386b1d9ddd61253347d356474:

  fs/orangefs: Allow 2 more characters in do_c_string() (2025-07-22
12:39:29 -0400)

----------------------------------------------------------------
orangefs: fixes for string handling in debugfs and sysfs

Change scnprintf to sysfs_emit in sysfs code.

Change sprintf to scnprintf in debugfs code.

Refactor debugfs mask-to-string code for readability and slightly
improved functionality.

----------------------------------------------------------------
Amir Mohammad Jahangirzad (1):
      fs/orangefs: use snprintf() instead of sprintf()

Dan Carpenter (1):
      fs/orangefs: Allow 2 more characters in do_c_string()

Shankari Anand (1):
      fs: orangefs: replace scnprintf() with sysfs_emit()

 fs/orangefs/orangefs-debugfs.c |  8 ++++----
 fs/orangefs/orangefs-sysfs.c   | 28 ++++++++++------------------
 2 files changed, 14 insertions(+), 22 deletions(-)
