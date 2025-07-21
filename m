Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F73B0C6B5
	for <lists+devel-orangefs@lfdr.de>; Mon, 21 Jul 2025 16:43:33 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id 215F0380B50
	for <lists+devel-orangefs@lfdr.de>; Mon, 21 Jul 2025 10:43:30 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1753109010; bh=uFYdqfmR/GtGhSxa64UDHgvx+jlce/ONTLuYHQeYmMM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=jDJf8bOay6VBGcLcwXaj/8g4p+nYUyJEP7W6lnx8bmu5JSEg6PGeU0qX6t3hz9tXB
	 j+10+vY/IDIAjbbc4bF+cQ0gIUwQenqeV0NeUITtI0+xcki5LVJctXztuQpY2Lq1WA
	 VYByrQDgMn93JsOZZ8ygtALQH7lPj4zfBiVdK9AXdPNjfI54mZdpos2Q601yslA+xp
	 BeGA1XsUjiDsFvzSmMyxazSDgrHEBMJSC/BUssA6yBPMHwqtDElES02oz8s34TJvDD
	 g+U0t0FxEK7XFyKvueE68d64EY49Y6vQJvDXUUuRpFE5xZlMZZQ6JNDo50PJvLuUMt
	 +iQ6RqzjKMAvA==
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	by mm1.emwd.com (Postfix) with ESMTPS id 7F9863800A2
	for <devel@lists.orangefs.org>; Mon, 21 Jul 2025 10:43:27 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="hpW61Jsd";
	dkim-atps=neutral
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3134c67a173so4467665a91.1
        for <devel@lists.orangefs.org>; Mon, 21 Jul 2025 07:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753109006; x=1753713806;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7r2SkxECnUJkDnS6JC8xLFbSodRTdpZc+YDcMVWggjg=;
        b=WLFp7HpeLupFUPpPDOhKg5rGlIOlNFfnHqWfHji08YxCfqeUw7/YyrRKG9L/cLSWRF
         SX9VfHvlmyXUIVftgXGg28fTdxXZBsx/hx2t0N+lX4fh5+aowmDcBNz+BGtkAIvdJdgk
         TWCITUrxbJCt3zLvlWpkG5D2kkQo5aVzOH+QG7cmpmoJiCr00Bfj392MnIqKQhVbCG+w
         6LFY7yYh2z8KPZdlJV4l4OuQ2gHPKnu8GpmYZZEAxB/t11Ibg4l9mE9cBtd+xOWmrtHi
         nhWW35boom8UrJc1PLhDY1xOVU83gLABDqTeanmO0RonwckO44ozCos2ykVerVJ3l9T/
         iueg==
X-Forwarded-Encrypted: i=1; AJvYcCWsElVI0aMZZtOntAaEysbQdfpFqXc1/vMJ13syxndwIx1F+An0957HDI730OsoqrpOItde8w==@lists.orangefs.org
X-Gm-Message-State: AOJu0YyN/DqGnnzfUjP1FCESVl3U3FcH2mvYew4PszWgxt1FwrstYL6q
	xodzJuONGQy2tpqWvoHmmt0gxUta1a4rmiHZlk2iM4HG6IBmUHab82a8ZqtbMPxX1jrmyoeB+7+
	SXh17svBYfkZ+GQRx01UQWyTdgS0yekxj1tnd4ZsAci/D4DAll5GMAA==
X-Gm-Gg: ASbGncvZC3hjZ8TBrrJK0QAz6wyRuuw5pXtViHWrhFfAv6qvE48wz29eE6O34KGmSpC
	nA6EufQ1yHN4JxjdFNjcRG4BwA936A85Ec2jsGI5K5USSD9GhRYZ8hsqyYQ1SsEx4J4NrGjlFpq
	q/cQ47r80j3Lm0RKk/85bZFAG3F/Eh9UBcqkhVsHM9cdQ7UA8lr4qwtfyeAIfOqGKLIWVFhnDqs
	9CyYMSFOYzEvpl5BnA=
X-Google-Smtp-Source: AGHT+IFgyQrkWWTl5Gnzd9f+K8Xn44yKcrOie2VLyVx/KyhJj1xUN4caxQbCjiT3CFCnWaAh56FF8dIa9ZUUmwtAoWw=
X-Received: by 2002:a17:90b:50ce:b0:313:d79e:1f48 with SMTP id
 98e67ed59e1d1-31c9f45e198mr31772721a91.16.1753109006415; Mon, 21 Jul 2025
 07:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <CADf5TKvB3FUKvvQVwhzHmLahJRO1rc6oteQmASi_JhBigJT0rg@mail.gmail.com>
In-Reply-To: <CADf5TKvB3FUKvvQVwhzHmLahJRO1rc6oteQmASi_JhBigJT0rg@mail.gmail.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Mon, 21 Jul 2025 10:43:15 -0400
X-Gm-Features: Ac12FXzCjxwA9xFfGo5XClt7gsxqRNWI1EL2UurgTrV1hZJAtM4ZXbnpPFa5Ilo
Message-ID: <CAOg9mSQ+BQtxOp_Oz=dgUPFhCnPcnooQeBdWO9WrizUQq5LzaQ@mail.gmail.com>
Subject: Re: The Orangefs memory corruption bug
To: Amir Mohammad Jahangirzad <a.jahangirzad@gmail.com>, Mike Marshall <hubcap@omnibond.com>,
	devel@lists.orangefs.org, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: LQJF6UEQD4JDBSDAG66G3TDCO7IZBYHA
X-Message-ID-Hash: LQJF6UEQD4JDBSDAG66G3TDCO7IZBYHA
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/LQJF6UEQD4JDBSDAG66G3TDCO7IZBYHA/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

Hi Amir...

I have had your patch in my linux-next tree for a week or two. Dan
Carpenter saw it and suggested to change snprintf to scnprintf,
today I am making that change and xfstesting it. I've never written
an xfstest before, but your patch prompted me to write an
orangefs-specific xfstest that pumps all kinds of valid and invalid
strings into /sys/kernel/debug/orangefs/kernel-debug.

Anyhow, I plan to modify your patch with Dan's suggestion and that's
probably what I'll submit to Linus in the merge window.

I think you should do whatever you think is good for Linux as far
as your inclination of reporting it to the Linux CVE team goes. When
I wrote the original code years ago I did many manual buffer-overflow
tests on it and I think it is good as is. I also think your suggestion
and Dan's suggestion are superior since using standard tools like
s(c)nprintf is better practice than my "open coded" solution.

You can see your patch at:
  https://web.git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux.git
... in my linux-next branch and by tomorrow you will be able to
see if I added Dan's suggestion.

-Mike

On Sun, Jul 20, 2025 at 10:33=E2=80=AFAM Amir Mohammad Jahangirzad
<a.jahangirzad@gmail.com> wrote:
>
> Hi Mike,
>
> As you know, I recently submitted a patch for a memory corruption
> bug in the orangefs module. I'm considering reporting it to the
> Linux CVE team, but I'm unsure if the bug is actually triggerable
> from user space.
>
> I wanted to check with you first to better understand the impact
> before proceeding.
>
> Would appreciate any thoughts or guidance you might have.
>
> Best regards,
> Amir Mohammad Jahangirzad
