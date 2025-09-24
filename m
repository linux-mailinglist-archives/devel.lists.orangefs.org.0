Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 239C0B9A1E7
	for <lists+devel-orangefs@lfdr.de>; Wed, 24 Sep 2025 15:56:05 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id CE8A9385967
	for <lists+devel-orangefs@lfdr.de>; Wed, 24 Sep 2025 09:56:03 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1758722163; bh=ujEzAbhMAzaWS5a8Q68eG96tR7K2Da3jAUXEFVNDAhc=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=02LR7IJjxntOCzs4ghNP3cNzyVk29JeamHN6a5YijmNeaZOzm47OsfK/dHauXY5rn
	 W3fyHJUotX1Aj29aZ3X54t6XP27ka9p3LEiAfNcDO4tIdQ8lh+Y0x3QahNf4rJza81
	 hRSYXurERP5EO5nFIbmYmPDlD8pDsnElR/HyvyOgFdsluvmlNMlgqp1a3r9pyH/g4O
	 nELLpwffVxbNtIQc1Mjw2lx50XUNEgOJmz50N6qAtItPX9ar5Soavdk1A2RmC4M657
	 TwVD4E/q108OW0+VD9glN1/fRN2oEs82oAKY6N9A0Qpszn/m8Qmnzl9nXWJYY1vq3h
	 p0zZyTbFw4+Fg==
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	by mm1.emwd.com (Postfix) with ESMTPS id B8848385956
	for <devel@lists.orangefs.org>; Wed, 24 Sep 2025 09:56:00 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="uFKcAV3g";
	dkim-atps=neutral
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-32b8919e7c7so7778423a91.2
        for <devel@lists.orangefs.org>; Wed, 24 Sep 2025 06:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758722159; x=1759326959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4DZQg31vv1EGe7YHwiBVuSS1/ZU1wpTEBVNkfgNEhE=;
        b=PFv1Svmp3n8Mi3AMvsVX+OgmrmTWqEPm3ZYq9JJ3uYt1vwQavJvFQru8RT0W2uzKGL
         qc8tfF9mnzd4LVnlh03HVsJzdviN/LPVAqnH7oqJleYA4EZS5sfRdzAgqStESOp4jfR8
         UchtIfnVxucZLdXmmg+4Vsqh9ooZNGGT3v0V5DEEB+glZ2kDuqpmdOXEe16WB4Qc/dS8
         2WyVo92fvWtPyCthY1NRW6STeqcETCVcvl7Bzi5tSyJhpkyDEHLCp8gC4TnoqlsikniD
         jB4FfRL119dVaEXsKKyRUE7pJEg3bAYBzEpsScQUsLUf6XO5Q84B/4itA5xIPbXj5i60
         HgnA==
X-Forwarded-Encrypted: i=1; AJvYcCVW2l5dz0ZQ2uGbg69z1IckrbN8BUFWuDAmcvgMrmA+QPiSdd+eDwmFon4HWUsSq9+EdyTQIA==@lists.orangefs.org
X-Gm-Message-State: AOJu0YwHuILlyrcAzUeQ8jMZDgG7I1nFxRrx4dxYKLAyhuI4Afc6m+8z
	D1aNVUSmHSJ7/utl+vCWV5Dc/mYtsJt/YYpe9sFcTFUP9kiYPiNEEkbB67DKuEm1qHlW5EoKUIt
	SF4tS8LzgHS2NrftXKaL8VnMRFBS2nvTBLLXh5POO
X-Gm-Gg: ASbGncs14HPwTLyGK0RfYiOmTUywFZvFqy9etZytjwxrxMWAXkAqaS7XNqnmrR0AcDA
	BRzPsDOkN5wURV6rNm7bUJRjlDioOQRJUMY0afjtcFqOvxNurlWGAgaph28O/6FOlkvm0wuwuOX
	t9QGIa1rVUki4no6hI+Erbua9LQXE/Aif7mYxSkIooe96MGF4WMJmhZUBYa3D1jdRjmVpmiQYWY
	64riWaPc7TU3HRA8hU=
X-Google-Smtp-Source: AGHT+IHXbY4TxwtVWknJYQ/5Bht7+LECqN/91gP590u8montoaQ+gGtcVF5NMOWukYG+NKgo0+ZGo6Sxvl/LKJemuHI=
X-Received: by 2002:a17:90b:4c45:b0:32e:a59f:b25d with SMTP id
 98e67ed59e1d1-332a9705e25mr7813584a91.30.1758722159437; Wed, 24 Sep 2025
 06:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250918150811.259596-1-thorsten.blum@linux.dev>
In-Reply-To: <20250918150811.259596-1-thorsten.blum@linux.dev>
From: Mike Marshall <hubcap@omnibond.com>
Date: Wed, 24 Sep 2025 09:55:47 -0400
X-Gm-Features: AS18NWBdTWkiF1IRVXYt0unyFSpP7neFh7jhnbWQjRR_W61SWXUjoIYrMw2FMpM
Message-ID: <CAOg9mSTEV9A7s_MYK+msgJRzvUS_R6FB+dOvvkDOmeDrUH92Wg@mail.gmail.com>
Subject: Re: [PATCH] fs/orangefs: Replace kzalloc + copy_from_user with memdup_user_nul
To: Thorsten Blum <thorsten.blum@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: S7FMXAUE5F64N5FRHPWKG6MH5ERXJHPW
X-Message-ID-Hash: S7FMXAUE5F64N5FRHPWKG6MH5ERXJHPW
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/S7FMXAUE5F64N5FRHPWKG6MH5ERXJHPW/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

Thanks, that looks better in several ways. I ran it through xfstests,
and have added it to my linux-next tree...

-Mike

On Thu, Sep 18, 2025 at 11:08=E2=80=AFAM Thorsten Blum <thorsten.blum@linux=
.dev> wrote:
>
> Replace kzalloc() followed by copy_from_user() with memdup_user_nul() to
> simplify and improve orangefs_debug_write(). Allocate only 'count' bytes
> instead of the maximum size ORANGEFS_MAX_DEBUG_STRING_LEN, and set 'buf'
> to NULL to ensure kfree(buf) still works.
>
> No functional changes intended.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  fs/orangefs/orangefs-debugfs.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugf=
s.c
> index 1c375fb65018..79267b3419f2 100644
> --- a/fs/orangefs/orangefs-debugfs.c
> +++ b/fs/orangefs/orangefs-debugfs.c
> @@ -440,14 +440,13 @@ static ssize_t orangefs_debug_write(struct file *fi=
le,
>                 count =3D ORANGEFS_MAX_DEBUG_STRING_LEN;
>         }
>
> -       buf =3D kzalloc(ORANGEFS_MAX_DEBUG_STRING_LEN, GFP_KERNEL);
> -       if (!buf)
> -               goto out;
> -
> -       if (copy_from_user(buf, ubuf, count - 1)) {
> +       buf =3D memdup_user_nul(ubuf, count - 1);
> +       if (IS_ERR(buf)) {
>                 gossip_debug(GOSSIP_DEBUGFS_DEBUG,
> -                            "%s: copy_from_user failed!\n",
> +                            "%s: memdup_user_nul failed!\n",
>                              __func__);
> +               rc =3D PTR_ERR(buf);
> +               buf =3D NULL;
>                 goto out;
>         }
>
> --
> 2.51.0
>
