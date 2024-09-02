Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD3C968B37
	for <lists+devel-orangefs@lfdr.de>; Mon,  2 Sep 2024 17:43:59 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id 9BFC1385275
	for <lists+devel-orangefs@lfdr.de>; Mon,  2 Sep 2024 11:43:57 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1725291837; bh=sEb+OcdC9gCNvNOC3NFpeSme4gxyvyjHtnQPYmlX2LA=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UbpLKw7GcuBWkg8M4UQ6GCjQub77WQDa1KR73edXm3If/dCEfrFDgnQU2VAmHHYpq
	 JDM60+WyPd/VFY9kA4PNTQDM/GJBMBlKpQ4GmCB+iOwDJQedifH0e/779nBDs8E4zR
	 +uRxFiwG7KaLOsaxGofprHjxL1+SuKU2ERL9y89qpGZAHK6f1XTPqvXAVy3z6MQQA7
	 iRyPL487X9vflTOCyckTMph8IIclabLRccTbA75d1rD2i1uABntO8m+iAFRieHmZqO
	 fxCI7bkMyOfHHwRLURvnN05txOEhS4ysmQwcX6y+GD0Ac9N513emS7+cOrAT3xNobr
	 HXra7V6cBGBtw==
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	by mm1.emwd.com (Postfix) with ESMTPS id 3284C3850F7
	for <devel@lists.orangefs.org>; Mon,  2 Sep 2024 11:43:53 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="uBXrlD2+";
	dkim-atps=neutral
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3df0dc53ec1so2528709b6e.1
        for <devel@lists.orangefs.org>; Mon, 02 Sep 2024 08:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725291833; x=1725896633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaMZuoyuMjVGXv0JBzZXwm4uNmeB/j0jqFPSyYjgGNU=;
        b=RThAqEGIY8a71y+gEUyDUhw8g7OFgye0fP+0raINDKibJyMyegpqJv4YGf04u+rQow
         tHX4DNPSbReGsh9SY+jsm8sLu12M/nX8bOPnTdjzsVPYdDEog7LRiHn4bFlUcOQgPK8e
         FrJJ928hPEy6HFJojaTTVOVICE7sk/KjuKkXKgk7eZJ9N9A3hrYVy3Cj7jxlksjt5NhD
         v+itEtLudIT/5/6/l6xTV61XSP8l8fra/60hFjOc8UkM2jupnBGEFgFAcAyiKCz9MTEC
         8bAumMYdxQ/aEbN/Vd1Gzse6aXo3Quo/o6px6Ek8a0iBQXrxw8EeHQtKImOmn2PI9OXO
         jKqg==
X-Forwarded-Encrypted: i=1; AJvYcCUIHXatNlOzoI1p4ehgPPYHm3g5VJ03XH3QAFqkioBVWBs1sQxevH1+yZyMGCDXd9OiZ23tKA==@lists.orangefs.org
X-Gm-Message-State: AOJu0YyjSdPAFX1b6xysMcwOsmDeqk0FeB8TUEVI5dBPHdqfxrXshhHI
	0Ts0OiOSiyKwJliuMgPnpp0r3e0hj3d2jmWTKIjzST/UkCGtOyhhkxmG526z7+AZoeKYkXHgMaM
	lt10gGOG4LesrKj8f5ouREPsbMI21I+VonCBr
X-Google-Smtp-Source: AGHT+IEWxPGfaDFWsNpdd4EG+IxUnWMe7NHb9ezQ65K83eSadMMQXw1y/wPLtjxaWQgduOUO88droN1b3VI5ag1d3wI=
X-Received: by 2002:a05:6808:2118:b0:3d5:63a2:6064 with SMTP id
 5614622812f47-3df1d6e4689mr9868226b6e.39.1725291833372; Mon, 02 Sep 2024
 08:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240826150418.3500117-1-huangxiaojia2@huawei.com>
In-Reply-To: <20240826150418.3500117-1-huangxiaojia2@huawei.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Mon, 2 Sep 2024 11:43:42 -0400
Message-ID: <CAOg9mSRc5gVCTEQOmcEKQN4=+T=-mFwHxCAsWJc9C422st4Tvg@mail.gmail.com>
Subject: Re: [PATCH -next] orangefs: Constify struct kobj_type
To: Huang Xiaojia <huangxiaojia2@huawei.com>, Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 3WV7RDGVP6Z2UNVS3J5MBHMOFY3L2A6M
X-Message-ID-Hash: 3WV7RDGVP6Z2UNVS3J5MBHMOFY3L2A6M
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: martin@omnibond.com, yuehaibing@huawei.com, devel@lists.orangefs.org
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/3WV7RDGVP6Z2UNVS3J5MBHMOFY3L2A6M/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

I looked at what your patch does and looked to see that other
filesystems have done the same thing. I ran xfstests on 6.11-rc5
with your patch applied and got no regressions. I'll ask Linus to
pull your patch in the next merge window unless you have another
plan...

Thanks!

-Mike

On Mon, Aug 26, 2024 at 10:56=E2=80=AFAM Huang Xiaojia <huangxiaojia2@huawe=
i.com> wrote:
>
> 'struct kobj_type' is not modified. It is only used in kobject_init()
> which takes a 'const struct kobj_type *ktype' parameter.
>
> Constifying this structure moves some data to a read-only section,
> so increase over all security.
>
> On a x86_64, compiled with defconfig:
> Before:
> =3D=3D=3D=3D=3D=3D
>    text    data     bss     dec     hex filename
>    7036    2136      56    9228    240c fs/orangefs/orangefs-sysfs.o
>
> After:
> =3D=3D=3D=3D=3D=3D
>    text    data     bss     dec     hex filename
>    7484    1880      56    9420    24cc fs/orangefs/orangefs-sysfs.o
>
> Signed-off-by: Huang Xiaojia <huangxiaojia2@huawei.com>
> ---
>  fs/orangefs/orangefs-sysfs.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/fs/orangefs/orangefs-sysfs.c b/fs/orangefs/orangefs-sysfs.c
> index be4ba03a01a0..04e15dfa504a 100644
> --- a/fs/orangefs/orangefs-sysfs.c
> +++ b/fs/orangefs/orangefs-sysfs.c
> @@ -904,7 +904,7 @@ static void orangefs_obj_release(struct kobject *kobj=
)
>         orangefs_obj =3D NULL;
>  }
>
> -static struct kobj_type orangefs_ktype =3D {
> +static const struct kobj_type orangefs_ktype =3D {
>         .sysfs_ops =3D &orangefs_sysfs_ops,
>         .default_groups =3D orangefs_default_groups,
>         .release =3D orangefs_obj_release,
> @@ -951,7 +951,7 @@ static void acache_orangefs_obj_release(struct kobjec=
t *kobj)
>         acache_orangefs_obj =3D NULL;
>  }
>
> -static struct kobj_type acache_orangefs_ktype =3D {
> +static const struct kobj_type acache_orangefs_ktype =3D {
>         .sysfs_ops =3D &orangefs_sysfs_ops,
>         .default_groups =3D acache_orangefs_default_groups,
>         .release =3D acache_orangefs_obj_release,
> @@ -998,7 +998,7 @@ static void capcache_orangefs_obj_release(struct kobj=
ect *kobj)
>         capcache_orangefs_obj =3D NULL;
>  }
>
> -static struct kobj_type capcache_orangefs_ktype =3D {
> +static const struct kobj_type capcache_orangefs_ktype =3D {
>         .sysfs_ops =3D &orangefs_sysfs_ops,
>         .default_groups =3D capcache_orangefs_default_groups,
>         .release =3D capcache_orangefs_obj_release,
> @@ -1045,7 +1045,7 @@ static void ccache_orangefs_obj_release(struct kobj=
ect *kobj)
>         ccache_orangefs_obj =3D NULL;
>  }
>
> -static struct kobj_type ccache_orangefs_ktype =3D {
> +static const struct kobj_type ccache_orangefs_ktype =3D {
>         .sysfs_ops =3D &orangefs_sysfs_ops,
>         .default_groups =3D ccache_orangefs_default_groups,
>         .release =3D ccache_orangefs_obj_release,
> @@ -1092,7 +1092,7 @@ static void ncache_orangefs_obj_release(struct kobj=
ect *kobj)
>         ncache_orangefs_obj =3D NULL;
>  }
>
> -static struct kobj_type ncache_orangefs_ktype =3D {
> +static const struct kobj_type ncache_orangefs_ktype =3D {
>         .sysfs_ops =3D &orangefs_sysfs_ops,
>         .default_groups =3D ncache_orangefs_default_groups,
>         .release =3D ncache_orangefs_obj_release,
> @@ -1132,7 +1132,7 @@ static void pc_orangefs_obj_release(struct kobject =
*kobj)
>         pc_orangefs_obj =3D NULL;
>  }
>
> -static struct kobj_type pc_orangefs_ktype =3D {
> +static const struct kobj_type pc_orangefs_ktype =3D {
>         .sysfs_ops =3D &orangefs_sysfs_ops,
>         .default_groups =3D pc_orangefs_default_groups,
>         .release =3D pc_orangefs_obj_release,
> @@ -1165,7 +1165,7 @@ static void stats_orangefs_obj_release(struct kobje=
ct *kobj)
>         stats_orangefs_obj =3D NULL;
>  }
>
> -static struct kobj_type stats_orangefs_ktype =3D {
> +static const struct kobj_type stats_orangefs_ktype =3D {
>         .sysfs_ops =3D &orangefs_sysfs_ops,
>         .default_groups =3D stats_orangefs_default_groups,
>         .release =3D stats_orangefs_obj_release,
> --
> 2.34.1
>
