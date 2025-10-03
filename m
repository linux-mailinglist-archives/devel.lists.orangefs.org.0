Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id BE43ABB7404
	for <lists+devel-orangefs@lfdr.de>; Fri, 03 Oct 2025 16:56:36 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id 14ABF3859FE
	for <lists+devel-orangefs@lfdr.de>; Fri,  3 Oct 2025 10:56:35 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1759503395; bh=kRj9cnzzDxPKkfplHIrlfHEtlWfmNsk6zc5kNwv4ZXo=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=J4xFW6HYdZSy/nIbW4brpxpytgPT94/e8scNH24APC+XzaK8mHaUoiUOCm5dSY9ZE
	 5gnpLPyOAo2ejre0WKS+WHmiyvyaSYCcwxjf7icjCL5ySyz6fQwDVG60rB6w8XDbRT
	 c+tVW+QPhQnLFTuHUfc+TJ4UMXXFwSmFOadgWhSOonGq3TC2sR6fUFncyjD/ezYvp2
	 W2hIcK1xdhuhNVBy3R9ah7P/Pnoasf1tIt+zx/leBOZHjAzXWqY/vQZVPGnu8lO3O8
	 2X7AwFW9i+n8jOYjt4JF6qSc9S5am/zN/8TxHydghbiRC/6+F3EnWo/JPXIt43UBMf
	 hlYIhxj19PJQQ==
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	by mm1.emwd.com (Postfix) with ESMTPS id D2AFA3837A7
	for <devel@lists.orangefs.org>; Fri,  3 Oct 2025 10:56:32 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="yOD2+fcp";
	dkim-atps=neutral
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-33274fcf5c1so2483766a91.1
        for <devel@lists.orangefs.org>; Fri, 03 Oct 2025 07:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759503392; x=1760108192;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SD/Rf1gCAPCc5tsJMPCFcW90YTI81aVrrWFvusMY6q8=;
        b=iZH0rBYVB0yY9poXH75xSwWJpcXqyL+NmMK/KwkwjSxIv5NN8ggR7Kn/qMwtdtXZ0o
         aPHtSZUcJa35zZ7yr9ONh3Y0f0RJrgOn6h0SA7+uLiEPLV479tOBKLlnazcOCwbffUIc
         2SHfjwUh/DgOG1q/KXilCVK89m6qKAENimgNGSkJsadQaV5VOoVbx8/0595G0bUs1iGz
         k5BjWLhPQb66Tx5bYBep/qK/xn3hcjzLxbyKt3UaEpf0RgT726+NDPV7wuorWLKBUcYR
         Yb2fWunxhuM7XJFPNhj4qZXmDNoaU1cd3ff1mKYGeSj1i/CDy7XdQ2m5JC7DKdwg6mLa
         Ic2g==
X-Forwarded-Encrypted: i=1; AJvYcCVtO7lTbpDiPkcF0b9kshWC1/nzTktXQoVXYgp78vkidNpqT4iMiBEUWmdNWc48NToj17gy8A==@lists.orangefs.org
X-Gm-Message-State: AOJu0YwksgcxXrEmJCeCxhBeLCUP4qzSL5zuorOGXNFLASq/H42gpY/H
	qdvNPguSybemL32IHaExYx0c0k/hr9xb0uwaztHjJUcpCjFVUQvLSozdBfQLGh+oM3Qhm7h930P
	irx6aqn6FNBQ9BCpiL2WLsuePbubbiGRfUGsJo8Cl
X-Gm-Gg: ASbGncvF/txtgh0I9HUTMic8z7q4arsnJbiHFO3hsslQmi6jp/ymCq2DhnUnD3dpUw+
	cAyywMLrvSTvWkivEb5mXw95CoD9nWsT8dzT2d0YwrRjznVcNE9ZfFRkjzwXBKkbFvY26xDYtzb
	7ZidmUUG2h1gpFAgO0x0kzNobQpLdrmA3AsQ16sYJjVqdDMf8rLZHGHE1ZH3zDryPTLbhOM0Sec
	MKxBU+96fshvB4CzbEaWgdc4Rga+aytY52uQ42710oO1r75/5wdOg==
X-Google-Smtp-Source: AGHT+IEIrPOlEncwSJEitbVSigZrsUsg6UHectGuyzjvz1wPMpDHxQ4+vsg81mtHKrYIY+R8qpcCRCCgEzi7hqwVfa4=
X-Received: by 2002:a17:90b:4ac4:b0:332:2773:e7bf with SMTP id
 98e67ed59e1d1-339c278d70bmr3789915a91.18.1759503391675; Fri, 03 Oct 2025
 07:56:31 -0700 (PDT)
MIME-Version: 1.0
From: Mike Marshall <hubcap@omnibond.com>
Date: Fri, 3 Oct 2025 10:56:20 -0400
X-Gm-Features: AS18NWDh8ij92WhGeaq38hAaZiepUoHv1NoMS1-qtC_7rlKzcYiapsTFf99LenA
Message-ID: <CAOg9mSRFjtB4fSwU1Cv+V1vYJSppd4=5UcnO7M95yXnULMoZzg@mail.gmail.com>
Subject: [GIT PULL] orangefs pull request for 6.18
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, Mike Marshall <hubcap@omnibond.com>,
	devel@lists.orangefs.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: 546KZXJLKCMILGXQ274EUNIB57LWBBXD
X-Message-ID-Hash: 546KZXJLKCMILGXQ274EUNIB57LWBBXD
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/546KZXJLKCMILGXQ274EUNIB57LWBBXD/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

The following changes since commit f83ec76bf285bea5727f478a68b894f5543ca76e:

  Linux 6.17-rc6 (2025-09-14 14:21:14 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux.git
tags/for-linus-6.18-ofs1

for you to fetch changes up to 11f6bce77e27e82015a0d044e6c1eec8b139831a:

  fs/orangefs: Replace kzalloc + copy_from_user with memdup_user_nul
(2025-09-30 10:23:24 -0400)

----------------------------------------------------------------
orangefs: Two cleanups and a bug fix.

Remove unused type in macro fill_default_sys_attrs
  Zhen Ni <zhen.ni@easystack.cn>

Replace kzalloc + copy_from_user with memdup_user_nul
  Thorsten Blum <thorsten.blum@linux.dev>

fix xattr related buffer overflow...
  A message was forwarded to me from Disclosure <disclosure@aisle.com>
  indicating a problem with a loop condition in our xattr code. When I
  fixed the problem it exposed a related memory leak problem, and I
  fixed that too.

----------------------------------------------------------------
Mike Marshall (1):
      orangefs: fix xattr related buffer overflow...

Thorsten Blum (1):
      fs/orangefs: Replace kzalloc + copy_from_user with memdup_user_nul

Zhen Ni (1):
      orangefs: Remove unused type in macro fill_default_sys_attrs

 fs/orangefs/namei.c            | 10 +++-------
 fs/orangefs/orangefs-debugfs.c | 11 +++++------
 fs/orangefs/orangefs-kernel.h  |  2 +-
 fs/orangefs/xattr.c            | 12 +++++++-----
 4 files changed, 16 insertions(+), 19 deletions(-)
