Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 398459FF2A5
	for <lists+devel-orangefs@lfdr.de>; Wed,  1 Jan 2025 01:10:45 +0100 (CET)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id 3F2373853B2
	for <lists+devel-orangefs@lfdr.de>; Tue, 31 Dec 2024 19:10:43 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1735690243; bh=sH7vUZeXg6kjI5/VazDxOZamWZgUUvVrbXkMHX4mJh4=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UR+OacQbjxGZpfbVEXTmyvlgbftLfQHhTEeM7LUF4FYj0Uyy3i8vACgkcBoAQ6wlv
	 29gP8dOKGJbZ5vvdWB4KXSGcbsUs5hgNEK6xtNbfpKjZGSZTFdj00IrqxPLVdLAMFy
	 aUXroFSXgfAK1RWu/FX0b7W8RjMmD3Mlltlo6kGSttENLCvGCd9tMF8hjrq5619jvG
	 48EF2mME6PS9vHoHSTgxfpkJ891VetSwwbgDddVdi1gBTdCnhX3ddjAIF0AT7CzweZ
	 d8d/dK+Jvq/9FX81LFcG4F8mK+hQf/tgMFCjFghk+XQNS7H35K3TEHmSivuToxU10P
	 YdTQxwvmzELGg==
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	by mm1.emwd.com (Postfix) with ESMTPS id E9B28385392
	for <devel@lists.orangefs.org>; Tue, 31 Dec 2024 19:10:40 -0500 (EST)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="CX2Iiuyn";
	dkim-atps=neutral
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee74291415so11315092a91.3
        for <devel@lists.orangefs.org>; Tue, 31 Dec 2024 16:10:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735690240; x=1736295040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iWsbIHSxHp/8XP19+VdnK1LhM0aqc30LSYc/EvUzwvQ=;
        b=eSheZNiGetT64UHq7gmgvo5LOuIkWD9IF3UMUVTKdNGVbSAtR+Gqa4ArOg1VKQ/kRL
         choB64C7oeiSCIZBZvCrY+At3G+O8ZMxfsGa8gWTC3jAu/ZEWHSM84gfUbuVWysO5QsX
         AB1UKKdMz7lxLqYQXAIqxTB6VD/5DmkE4JKV2y6N0WxYFTNp0oE5oZ/Ww9qUhdxIwokU
         YvZQ8C0Yn7DvddyR0Vq3DgsHCE856HDcsANhnR1Az5hpQ+TL8T07fXhpHInWrKFBtdFL
         sk8AD2S09GudilMoyK9vQR2YUpdYDFd2Rk4eYH7e94Q4gClNV+VmDNyc+trSS3MsyWm4
         5ebQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdwbSx66KsuHnny5mW43bMCwrt+m9eIlR5ueogshydgMru2WgB2G3vY026b3WT0l3yZ1CEtQ==@lists.orangefs.org
X-Gm-Message-State: AOJu0Yw9eDA+ehmhCK+wYPJyVJse0z27wTa3yzAXjsMNRfwMipNy/FM6
	ikyh54sGpa/Qys0mzDFMitr5Rq17Ul3WvPi34Ch2EV3V7U6tyJU9J84FZ6iclq9Pa0x2PCPBUyn
	QBk5YsrHsAvYkOFVXmH8gZ1KacjoAQugAex2I
X-Gm-Gg: ASbGncsmu0qY2SVJOzw1UHrvAzu++VF4HM+tR0Gz30m2vh7Pi/VANrk7nHWEaB9WfoJ
	/VPUpWSc0jJVG2aAI1A1RXggAW2EF58T3lajj7xRWJ4H6DnBHMQ==
X-Google-Smtp-Source: AGHT+IFqdnhhQwG8yGZ7u4C9v4WxXrCNAVpj3Wn07+1rLwm/04ve6+w/0FXRILlZxBUUcgfUOR8LKEEc6a+adrYMIDc=
X-Received: by 2002:a17:90b:54cb:b0:2ee:ba84:5cac with SMTP id
 98e67ed59e1d1-2f452dfd2eamr62199123a91.7.1735690239783; Tue, 31 Dec 2024
 16:10:39 -0800 (PST)
MIME-Version: 1.0
References: <6767aabc.050a0220.25abdd.0136.GAE@google.com> <tencent_10DB52C0066E89812EDE2ECC0CB0E7EE4606@qq.com>
 <20241222103522.GE1977892@ZenIV>
In-Reply-To: <20241222103522.GE1977892@ZenIV>
From: Mike Marshall <hubcap@omnibond.com>
Date: Tue, 31 Dec 2024 19:10:28 -0500
Message-ID: <CAOg9mSSSD3xg9CjtbWYaYTcrLOhdfF4=_pPbO6Dp+cC1jn3Skw@mail.gmail.com>
Subject: Re: [PATCH] orangefs: fix a oob in orangefs_debug_write
To: Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: HT7KNFP7JXJA5YXPXFEUAFNL42Q74AXJ
X-Message-ID-Hash: HT7KNFP7JXJA5YXPXFEUAFNL42Q74AXJ
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Edward Adam Davis <eadavis@qq.com>, syzbot+fc519d7875f2d9186c1f@syzkaller.appspotmail.com, devel@lists.orangefs.org, linux-kernel@vger.kernel.org, martin@omnibond.com, syzkaller-bugs@googlegroups.com
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/HT7KNFP7JXJA5YXPXFEUAFNL42Q74AXJ/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

I used Al's suggestion on top of 6.13.0-rc5 and ran
it through xfstests with no problem. Since I doubt xfstests
runs down this code path I also did some other tests.

I made some files with comma separated debug settings and
catted them onto /sys/kernel/debug/orangefs/kernel-debug.

When I caused the file to be longer than
ORANGEFS_MAX_DEBUG_STRING_LEN
I could see that execution flowed down the
code path with Al's suggested changes, and
the proper thing happened.

Anywho... I'll send this up in the merge window unless
someone else (Edward?) plans to...

-Mike

On Sun, Dec 22, 2024 at 5:35=E2=80=AFAM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
>
> On Sun, Dec 22, 2024 at 04:14:13PM +0800, Edward Adam Davis wrote:
> > syzbot report a slab-out-of-bounds Read in orangefs_debug_write. [1]
> >
> > The string passed in from userspace is not terminated with a NULL chara=
cter,
> > which causes strlen to go out of bounds.
> >
> > Use kstrndup to replace kstrdup.
>
> Better to replace
>         if (count > ORANGEFS_MAX_DEBUG_STRING_LEN + 1) {
>                 silly =3D count;
>                 count =3D ORANGEFS_MAX_DEBUG_STRING_LEN + 1;
>         }
> with
>         if (count > ORANGEFS_MAX_DEBUG_STRING_LEN) {
>                 silly =3D count;
>                 count =3D ORANGEFS_MAX_DEBUG_STRING_LEN;
>         }
> instead, so that we wouldn't have to deal with lack of NUL anywhere.
