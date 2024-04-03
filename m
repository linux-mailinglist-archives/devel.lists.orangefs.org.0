Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 720F7896FF2
	for <lists+devel-orangefs@lfdr.de>; Wed,  3 Apr 2024 15:15:12 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id 336303853CF
	for <lists+devel-orangefs@lfdr.de>; Wed,  3 Apr 2024 09:15:11 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1712150111; bh=m8vRG88FNKwizdEjO/c/t64mIYd2qCldOAH8zF37jpU=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B3Lm/VsSXhkhNm7vh2ym+D8hbni/KaYCSLdX0hHZNZQxUT96WEPey7DlnpWNl0des
	 FUC+EsUBJ1ep+/snFZA+1rBZDneWOtIZv3CUVpMWifYm/vcJ8x+d3eLUjPZoXEMQd1
	 HYJ4N/Nm5JJ0vOdzQcoONa9dLl4nIentcRAMPw0la1MPv3IXmSOUdb1UavYvd7zlgd
	 8sgdO1Snpf3vnWVUx+x+fgOwZT8EJDLenHfXXXR+N6WTGG+ir81NuPpyRJo+ts3pqs
	 6IB6lL8x9sCiug96fu0XBdV3nne3DrhMxiQupQvMG2yf9hE8PIRdVo/7YOgMBzSVEZ
	 r7Is5SwdOrbmA==
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	by mm1.emwd.com (Postfix) with ESMTPS id 874E43853CE
	for <devel@lists.orangefs.org>; Wed,  3 Apr 2024 09:15:08 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="CpJGbjQo";
	dkim-atps=neutral
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5a7bbafb946so1291208eaf.2
        for <devel@lists.orangefs.org>; Wed, 03 Apr 2024 06:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150107; x=1712754907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPbrOyf+WH3LEFByBVjd+RN6Vyy+2vOeO98hIRaqQ9s=;
        b=jb3P1v/wAL3j626xJgHKhP0hkbGLFSoweier01RNQK0AbWdeHPXBC8KgxJia+i9Bjf
         ateI9nZZhfjRqGVLiRLePFw5cPGe/zlZEXxjNyQSqEFfX5CvK5HKTEkAM52hLMK4V3xw
         cQznx5b/fXkT4rDQ1EC4gKVbBsZWmpfIcCG/3Wxs/CH/0wtWEvBJoZZjHnnQf3bjPX7N
         4PhwGmf2WrmclHN61rpC8c9wIdojQfXZNJwEUVWc0ET+Dix2vxIdQIkwaBf+W0EE/BG1
         rARmVBz3rMbfMpLBjdZmqOdC4yAFLLWEjJYtVJuE6SH6HudI/hYxZCivuxiWK8CTdg0Z
         dqVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA0jt7HZgtxWnOByr7zpl89tZOTf1IwZfXvHXrUs6P4Ik+ouToAphiXET610nJkqvL5TjkLl4oTB+tvL+gdnDn6O47jlbWtUw=
X-Gm-Message-State: AOJu0YwKAazgIMp2U4JvEsUXdOmDFKRh3GGaCyPMjhNrdxGXolmNwVxB
	og0PrZ3O5fl46eLmw9pQd1kJG/he48mUNt6nBJhDxcHv/ZFRgeD/ctKaYOAIZo/kdT595PCLuKW
	zVam0nvIV4V4HSnkhXzlKIZ2x2N42977UjxBM
X-Google-Smtp-Source: AGHT+IHynG/6vnesdgrFbSespFgf+tjzJxeuEecAnZ9LoEzbZsyl/DJ98pbGh+3WDjfxscRbv5KPEGx2DICPSrmMYeg=
X-Received: by 2002:a4a:dc98:0:b0:5a4:ae86:118f with SMTP id
 g24-20020a4adc98000000b005a4ae86118fmr11506801oou.8.1712150107554; Wed, 03
 Apr 2024 06:15:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240322-strncpy-fs-orangefs-dcache-c-v1-1-15d12debbf38@google.com>
 <20240401-redewendung-retten-132ff0ea272d@brauner>
In-Reply-To: <20240401-redewendung-retten-132ff0ea272d@brauner>
From: Mike Marshall <hubcap@omnibond.com>
Date: Wed, 3 Apr 2024 09:14:56 -0400
Message-ID: <CAOg9mSRa0PnFHSJAjOO=kjJKEG1_usREYO5QM+_Wt0VYsbVf8w@mail.gmail.com>
Subject: Re: [PATCH] orangefs: cleanup uses of strncpy
To: Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 7EDN4KBKALIEI45BJ7DEXEY47PMWOTE4
X-Message-ID-Hash: 7EDN4KBKALIEI45BJ7DEXEY47PMWOTE4
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Martin Brandenburg <martin@omnibond.com>, Justin Stitt <justinstitt@google.com>, devel@lists.orangefs.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/7EDN4KBKALIEI45BJ7DEXEY47PMWOTE4/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

Hi...

I b4'd this patch (I love b4) and applied it to 6.9.0-rc2
and ran it through xfstests with no regressions, so please
add a tested-by for hubcap@omnibond.com.

Thanks...

-Mike Marshall

On Mon, Apr 1, 2024 at 4:53=E2=80=AFAM Christian Brauner <brauner@kernel.or=
g> wrote:
>
> On Fri, 22 Mar 2024 21:41:18 +0000, Justin Stitt wrote:
> > strncpy() is deprecated for use on NUL-terminated destination strings
> > [1] and as such we should prefer more robust and less ambiguous string
> > interfaces.
> >
> > There is some care taken to ensure these destination buffers are
> > NUL-terminated by bounding the strncpy()'s by ORANGEFS_NAME_MAX - 1 or
> > ORANGEFS_MAX_SERVER_ADDR_LEN - 1. Instead, we can use the new 2-argumen=
t
> > version of strscpy() to guarantee NUL-termination on the destination
> > buffers while simplifying the code.
> >
> > [...]
>
> If this needs to go separately from the vfs trees let me know.
>
> ---
>
> Applied to the vfs.misc branch of the vfs/vfs.git tree.
> Patches in the vfs.misc branch should appear in linux-next soon.
>
> Please report any outstanding bugs that were missed during review in a
> new review to the original patch series allowing us to drop it.
>
> It's encouraged to provide Acked-bys and Reviewed-bys even though the
> patch has now been applied. If possible patch trailers will be updated.
>
> Note that commit hashes shown below are subject to change due to rebase,
> trailer updates or similar. If in doubt, please check the listed branch.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
> branch: vfs.misc
>
> [1/1] orangefs: cleanup uses of strncpy
>       https://git.kernel.org/vfs/vfs/c/fc10fed37526
