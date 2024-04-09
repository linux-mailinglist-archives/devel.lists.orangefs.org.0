Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AE089E054
	for <lists+devel-orangefs@lfdr.de>; Tue,  9 Apr 2024 18:26:27 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id 7AA673858B8
	for <lists+devel-orangefs@lfdr.de>; Tue,  9 Apr 2024 12:26:26 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1712679986; bh=ulQ6PWJvV5PaX5ZxY16FXaf8ZFkz5DuHJFEVcGtM+6s=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=2RYb4C0z+r+t4LHhWC3MIufCuxIbgwRjvymKbUNywLyTCo1pqTMnpvRt/S4x44HRh
	 zgZ0BlYsdrSji3UiiBJ0I0HwsqlZXtSQVHh8tSRe/+sofsGIvB0GiVLar47CHkzfbt
	 RfLOa+OeGqTBt9dudTfUf/TUpVaddlerXjqIzI7YI4rAkiJGy/YDXsgzhn0XfZOSrM
	 a3KJQ3+NG9ZmixYrcaAbWxQZf2frH0xhNlds1dXek/SH/ThqhcajDQh3hvys5wj6V6
	 cgFNcMHpC/z7y/gM9ESOCbNH47TMBixUYRcfe5nRN00CfCngRLdHfJ1nX/dXgytPMf
	 WmgmQXoNxvOWg==
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	by mm1.emwd.com (Postfix) with ESMTPS id DC84F38589F
	for <devel@lists.orangefs.org>; Tue,  9 Apr 2024 12:26:24 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="r+azfqJ1";
	dkim-atps=neutral
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c5f97ada37so488351b6e.3
        for <devel@lists.orangefs.org>; Tue, 09 Apr 2024 09:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712679984; x=1713284784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ty4BwWZvIxrkPVChPVI3LUwWVMwSnCumX0TJmcBbQqg=;
        b=TKrlpS+1ylt27MFZsnN/9bYxtaTj6CtlyIW86bfus095p4cMpWAU8qB3fOpC1Cm2kt
         k10M2emcZXmyHQpjLTMVsEwcJePMSwQL71JInrr5mt98HuhLC8Rty0y8dfoC1l6mL2tz
         q2crMKV+nVkxdQFNseBXM9yICqK17geehrTjUC4rrcAZ+vTbo62Sr7Q6wro07Jv7I5/f
         udmIsjmiHO7abepOjtT2fiu62cCQ02m68a4GNuEyvD0AIYMgnJAD3Uiw/dES5TmOhspC
         mxPtghgsZaRvHz3s+35YKf71nqSFEfiTelN2mGyk8SRj0Exos9gTC9VeIWR7yXna3iVd
         SCBA==
X-Forwarded-Encrypted: i=1; AJvYcCVRCqmlfIguwo4Xs0XxD0NdEpnEQ/E1FaSXoxznbv+MxZ5qtYP9qy7b2mY0esMjDqfYbpEVDSnnGl6Me+nioHOMuTQLruFZHrA=
X-Gm-Message-State: AOJu0Yxfw44sHg/mOb8/W46kUz1hUFUCml90PXMYs6yB1vNbe0+7p1Cn
	hbegQOq2KzqPcqYeek6kPx9yQmwBO4Gxg8CQoPnOe+ofOKsExfBPZIH6Jgw9P3LsDuBYhVdSdRB
	6E++g21aIBQB7RVWq94LjSHLEyXJ+8rMXqf5K
X-Google-Smtp-Source: AGHT+IGk9zeM/N1DPlYlaCC9lnhI09RgSyk5wLF389LHAoEWRcSGe8ivncZBC049o6kWoqphMSspeffsfT//EijA7Lc=
X-Received: by 2002:a05:6808:1a:b0:3c5:f51e:a0a1 with SMTP id
 u26-20020a056808001a00b003c5f51ea0a1mr6217029oic.51.1712679984020; Tue, 09
 Apr 2024 09:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240408075052.3304511-1-arnd@kernel.org> <20240408143623.t4uj4dbewl4hyoar@quack3>
 <CAFhGd8ohK=tQ+_qBQF5iW10qoySWi6MsGNoL3diBGHsgsP+n_A@mail.gmail.com> <96b55a64-2bcf-44da-a728-ae54e2a73343@app.fastmail.com>
In-Reply-To: <96b55a64-2bcf-44da-a728-ae54e2a73343@app.fastmail.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Tue, 9 Apr 2024 12:26:12 -0400
Message-ID: <CAOg9mSSMAao4WpZWmVhsqLwsn=sfs05XPVuHMdjH0wUyWET_WQ@mail.gmail.com>
Subject: Re: [PATCH] [RESEND] orangefs: fix out-of-bounds fsid access
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: WCJ77GBI3FYNUOVKA5T64VUADV5ZPCNJ
X-Message-ID-Hash: WCJ77GBI3FYNUOVKA5T64VUADV5ZPCNJ
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Justin Stitt <justinstitt@google.com>, Jan Kara <jack@suse.cz>, Arnd Bergmann <arnd@kernel.org>, linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org, Vlastimil Babka <vbabka@suse.cz>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/WCJ77GBI3FYNUOVKA5T64VUADV5ZPCNJ/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

I applied Arnd's patch on top of Linux 6.9-rc3 and
ran through xfstests with no issue.

Also, instead of Arnd's patch, I used Jan's idea:

+
+       buf->f_fsid.val[0] =3D ORANGEFS_SB(sb)->fs_id;
+       buf->f_fsid.val[1] =3D ORANGEFS_SB(sb)->id;
+

And ran that through as well, no issue.

Sorry for missing the earlier patch.

-Mike

On Tue, Apr 9, 2024 at 1:55=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Apr 8, 2024, at 23:21, Justin Stitt wrote:
> > On Mon, Apr 8, 2024 at 7:36=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
> >> Frankly, this initializer is hard to understand for me. Why not simple=
:
> >>
> >>         buf->f_fsid[0] =3D ORANGEFS_SB(sb)->fs_id;
> >>         buf->f_fsid[1] =3D ORANGEFS_SB(sb)->id;
> >>
> >
> > +1 for this idea, seems easier to read for me.
>
> Yes, good idea, I'll send this as v2 after my next round
> of build testing.
>
>       Arnd
