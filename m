Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id CE643B0E23B
	for <lists+devel-orangefs@lfdr.de>; Tue, 22 Jul 2025 18:57:24 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id 0C2ED385332
	for <lists+devel-orangefs@lfdr.de>; Tue, 22 Jul 2025 12:57:18 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1753203438; bh=qIau4d6bEVUKXvPUTIztThtAX4c0si40RS1OFrHHDbU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=llfUWml01tCJZ3yZk7KKW61RxdnUls1k+Wkpk2ZheSJrab1b19a7ZfEypP8JLtRxa
	 yvi35DDMngcvk0FVBO+rAkmlr7nWNpW7qT5kKSkkELITfsbeNnjW5sNX8+uNqIbBg4
	 fRBtrr/n6bV7mAe8mqwcyecersOr5ZSyHZM86MXxkF/VIADqKPf8+eR2149O5NU32X
	 rfuPmotWumu1PwEo8DOwma9EbD1IT4jSAqBqgF6Sx1xd+gwJcB+0DsYvcY1zto0+6S
	 qqdQV+B3AYVj98t03neIarR7KsimrdqrQQm8pOg8aA544y51sFeBmb0+koybpGqiGd
	 vLRnlrvfyraKA==
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	by mm1.emwd.com (Postfix) with ESMTPS id B26DA38530F
	for <devel@lists.orangefs.org>; Tue, 22 Jul 2025 12:57:15 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="jGGqZdnB";
	dkim-atps=neutral
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so5731181a12.0
        for <devel@lists.orangefs.org>; Tue, 22 Jul 2025 09:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753203434; x=1753808234;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqluySG0nGW7fbdJM76wn5zr8fZ5BplUhXk3amoupz8=;
        b=Dh/8L6OZ19oF9zv1Kx0XsLrBXodVZeSzdfD+Ql0NLzW1n52vq1fqaIEAKjcmXYNLZO
         n8OVjIyFe6LM9jIoQDIsWGgC5569FL4wEhDYp/2tB+rRAFTD0bzXb4JXBjRTcACewkAR
         LLVsLilF/jEW0UnrPMUDI8g1UTi5JC2JJ1zh/OOyc2v6OJ9q8pm7y73YUYHtHBNvU1VW
         zOi1DIXfk+BWmpq4Jpgue0AXR60GiLZfX6zAkx4goyFHp7oftGI0oek/WPl+23N9siG4
         WvDFXPOb8Vd4aUnyMnv4rmY7WcNh27jWVP/RkA3sqAFEyGScMAaeH14E28Fxs1XOlCAK
         cG8A==
X-Forwarded-Encrypted: i=1; AJvYcCWLS2/Zs5dptpdDXWhMOsw7dj0y5phdXupSJ/bZDB5mvKEXd1QuB+3QGYOSLRi/IvpRqQ0WKw==@lists.orangefs.org
X-Gm-Message-State: AOJu0YyIRj7JoCo/FL3sd32MsBXBzTPtjue01JpbCAA+VMKrKDVwhKFV
	oHzr6ww2EojAQBz7LF7yOFEKisd4igMI/ZPlfZIhdrQxKUaVWY+wlMsDSSeIkYuuG+eeSoMbQYs
	VsBhtYoVQX7UeSuS3gnEtUwtH7n9Bzivgt21P1imU
X-Gm-Gg: ASbGncvd6AjRFnGsktG1hdOoZ3+HOvKn/AfQxq7cgQnFqtUyva8bEHEERipP2M19H7m
	njHUoW3Yu/9kL2LiKWwtPC/O1GYr+r/qT5/UCrIlsI/Xf+xstLAgv274OKKSnCiT//5cztg0rdv
	3WDYMz2b0v3PnvSc0EIkxOhJZgkMzEfLf9jv8HO/Lp1aXkATikMx79/dUae7NrTgh0NLAwvhei+
	WHQ7UqXJseivFnjJfs=
X-Google-Smtp-Source: AGHT+IHxKgBH5aFojjSvEn0wVe4PvgbV7DEyFFVAOU7P9P+DZKmUxbChlgg6OtnUgSk9zIbGVLFCwP5qKYMCNKNCecM=
X-Received: by 2002:a17:90a:d2cc:b0:31e:4e36:bfcf with SMTP id
 98e67ed59e1d1-31e4e36bfddmr742936a91.30.1753203434243; Tue, 22 Jul 2025
 09:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <CADf5TKvB3FUKvvQVwhzHmLahJRO1rc6oteQmASi_JhBigJT0rg@mail.gmail.com>
 <CAOg9mSQ+BQtxOp_Oz=dgUPFhCnPcnooQeBdWO9WrizUQq5LzaQ@mail.gmail.com>
In-Reply-To: <CAOg9mSQ+BQtxOp_Oz=dgUPFhCnPcnooQeBdWO9WrizUQq5LzaQ@mail.gmail.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Tue, 22 Jul 2025 12:57:03 -0400
X-Gm-Features: Ac12FXxiVNUJKVeSdKM6DcF3YZ2nZ4TAMbr33nPZa1cY_3v8uqPEDGKeX4Y10w4
Message-ID: <CAOg9mSSAPZ1Ph1OO3N2vzPspcxu0n0K7CFpiuu3BtzUTMfPKiA@mail.gmail.com>
Subject: Re: The Orangefs memory corruption bug
To: Amir Mohammad Jahangirzad <a.jahangirzad@gmail.com>, Mike Marshall <hubcap@omnibond.com>,
	devel@lists.orangefs.org, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: KCS5D437MYUTLJ4CZ4IMB4INSTF56NQI
X-Message-ID-Hash: KCS5D437MYUTLJ4CZ4IMB4INSTF56NQI
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/KCS5D437MYUTLJ4CZ4IMB4INSTF56NQI/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

I updated my xfstest to test the client debug mask code
and changed Amir's patch to use scnprintf. It is on linux-next
now for testing, and I added a patch that Dan sent. I edited
the commit message in Amir's patch to mention Dan's
suggested change. If either of you are unhappy with the
commit message (edited commit message, no sign-off by
Dan) let me know... and thanks!

https://web.git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux.git/

-Mike

On Mon, Jul 21, 2025 at 10:43=E2=80=AFAM Mike Marshall <hubcap@omnibond.com=
> wrote:
>
> Hi Amir...
>
> I have had your patch in my linux-next tree for a week or two. Dan
> Carpenter saw it and suggested to change snprintf to scnprintf,
> today I am making that change and xfstesting it. I've never written
> an xfstest before, but your patch prompted me to write an
> orangefs-specific xfstest that pumps all kinds of valid and invalid
> strings into /sys/kernel/debug/orangefs/kernel-debug.
>
> Anyhow, I plan to modify your patch with Dan's suggestion and that's
> probably what I'll submit to Linus in the merge window.
>
> I think you should do whatever you think is good for Linux as far
> as your inclination of reporting it to the Linux CVE team goes. When
> I wrote the original code years ago I did many manual buffer-overflow
> tests on it and I think it is good as is. I also think your suggestion
> and Dan's suggestion are superior since using standard tools like
> s(c)nprintf is better practice than my "open coded" solution.
>
> You can see your patch at:
>   https://web.git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux.git
> ... in my linux-next branch and by tomorrow you will be able to
> see if I added Dan's suggestion.
>
> -Mike
>
> On Sun, Jul 20, 2025 at 10:33=E2=80=AFAM Amir Mohammad Jahangirzad
> <a.jahangirzad@gmail.com> wrote:
> >
> > Hi Mike,
> >
> > As you know, I recently submitted a patch for a memory corruption
> > bug in the orangefs module. I'm considering reporting it to the
> > Linux CVE team, but I'm unsure if the bug is actually triggerable
> > from user space.
> >
> > I wanted to check with you first to better understand the impact
> > before proceeding.
> >
> > Would appreciate any thoughts or guidance you might have.
> >
> > Best regards,
> > Amir Mohammad Jahangirzad
