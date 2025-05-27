Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D23DAC51D2
	for <lists+devel-orangefs@lfdr.de>; Tue, 27 May 2025 17:15:56 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id 43A1E3855BE
	for <lists+devel-orangefs@lfdr.de>; Tue, 27 May 2025 11:15:55 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1748358955; bh=vGDj5pABXAeCFpkMFGgn4hs7g7EIfL7sGyp3CAf/2Qk=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=T1zIrmWmft5Mja/4AmwFA03zUBSaiLdS3ifGeqgYSAxHcyELkyeQw+//W4jn0WcMU
	 8HOOwUNOHtmUoEukBKspKMmfhM3DM2w/OL4MisjQ3PdW4h4z8JAPhKVb6+wGBtkOqC
	 +EFJKgMzwkA9bqHRLwah1oR/B6ML4vGa3D9cDDknWtGeixSspT8sJ36tbSU2YAgo2E
	 l9nukeo42hSpqh1HjS2g8r7ZrAPEgfL1crdl+YGtMgg13tKqK4llim5GOjbrX6w+wm
	 F+XhGVYqyu7RyUxyJvuyn45ePoObPz06TToyRgo/czbPR37pgMu6VEzcwaGF5MHzfr
	 hOHqasTO1JwNQ==
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	by mm1.emwd.com (Postfix) with ESMTPS id 097033837F7
	for <devel@lists.orangefs.org>; Tue, 27 May 2025 11:15:52 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="0lXxD7+s";
	dkim-atps=neutral
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-31149f0393dso1846008a91.1
        for <devel@lists.orangefs.org>; Tue, 27 May 2025 08:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358952; x=1748963752;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rIugmyoGw3zvHwV1fRPYYpiTTTl+jifl2H0lpvLCKbU=;
        b=aT8dFyJwkn5KexqDOzhPGomJ0lfEwqdtXZ61VSLeQr1h89/7RSjh/akc9Cto4jff21
         Rz3wyr1PqwFpPdkIOP+w082cl/WaWX5FZ92KUJomDst4IyiHTHn7HOJWmi/e2FIKdBDd
         AWkJxhFt55B/+VVMYAEDDcPGlDCTLp0ldqnuBSGxh5NAZXdPTNJaqGkLA4HL6nyIrXFu
         1Bm+Lm+SEDD71O8Rgwsi9LqGMIUrFvgoLMVzOjkp7FC+SG1phHViox1AFY3VZArfj/w3
         blSIy4JcthTJ3ayqQLsHJf3wUWcL56Vpq9Ljbwyd4Nd3xr2KcKN1s8ZYgHjyeGwbU3GC
         mmhA==
X-Forwarded-Encrypted: i=1; AJvYcCWb88/c+5uK45pDxuvJU/ScNpdClj/JVcBFH/RkwtM5nTKlvQklRDbLChBdOjv7+zCbPrwcTg==@lists.orangefs.org
X-Gm-Message-State: AOJu0YzWbxNCBCAa8MDxLmRG0zd2zPsYAfBFJC0P6huz0pzeeMAgj9Th
	unMYm1OyfrICWIPCD2hfU8Gl1VDf6ZzEvDneA2qTcmPqoJc1vZzL8qD/Ld0PiIozdt51PHUAKjY
	7Rb5qI9ksxxkLdMhqZjcQmbT+neQ3oA8+y0a9XItj
X-Gm-Gg: ASbGncvKoHFP0C64k1MpOxDxooZu8Ia+xsJmXsDpwUepk8P/TUkDGHFVxs1jTjzs4XM
	hs3ShORQiwjGG4XOlZSRbHcUPJ5jibyN20+WlfBtY0X/MN8oVMyPFkQaMn6hnhMlZRt5yi3giSO
	N6lONNRe61tDDIkIUNUC/Dv5KjBXarR8vR+5ZdvZBVvOVU
X-Google-Smtp-Source: AGHT+IE/X3GdhsEW/x7VRoddhEu8kUlhQGXmgugA0xMq/n9VpZpJUYQtM6x+NWDLoXpt/qb758ukryChuZ2FRnQ+o38=
X-Received: by 2002:a17:90b:1997:b0:311:a54d:8492 with SMTP id
 98e67ed59e1d1-311a54d8584mr4071283a91.6.1748358951358; Tue, 27 May 2025
 08:15:51 -0700 (PDT)
MIME-Version: 1.0
From: Mike Marshall <hubcap@omnibond.com>
Date: Tue, 27 May 2025 11:15:40 -0400
X-Gm-Features: AX0GCFunyy3IXy04Uz8jd2XWSCwp-t6PJ3qY1jPqdzz8bIRRsa1gruXZqiylZjQ
Message-ID: <CAOg9mSSpgg2sKS18K3qZym+sKDY+xvwHP0S-V6T6GNgUUWJBbQ@mail.gmail.com>
Subject: [GIT PULL] orangefs pull request for 6.16
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, devel@lists.orangefs.org,
	Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: AZXXFF2VSOOSJI5GKXGWLNLWOOZYOKTW
X-Message-ID-Hash: AZXXFF2VSOOSJI5GKXGWLNLWOOZYOKTW
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/AZXXFF2VSOOSJI5GKXGWLNLWOOZYOKTW/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux.git
tags/for-linus-6.16-ofs1

for you to fetch changes up to 4dc784e92d4fcf22ae785ee5a7918458f11b06c0:

  orangefs: Convert to use the new mount API (2025-05-14 18:04:45 -0400)

----------------------------------------------------------------
orangefs: Convert to use the new mount API

Code from Eric Sandeen at redhat that converts orangefs over to the new
mount API.

----------------------------------------------------------------
Eric Sandeen (1):
      orangefs: Convert to use the new mount API

 fs/orangefs/orangefs-kernel.h |   8 +-
 fs/orangefs/orangefs-mod.c    |   3 +-
 fs/orangefs/super.c           | 189 +++++++++++++++++++++---------------------
 3 files changed, 102 insertions(+), 98 deletions(-)
