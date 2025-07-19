Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id F4199B0B043
	for <lists+devel-orangefs@lfdr.de>; Sat, 19 Jul 2025 15:29:58 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id B8A42385A36
	for <lists+devel-orangefs@lfdr.de>; Sat, 19 Jul 2025 09:29:57 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1752931797; bh=whJVn6VSMC2cD2DwHewKa7SpgnwQzzGtDP72KQTJahM=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=3fmOjfpHwD+wIoSWGHJ7rPikdmPhOcSU9Ae3tBX6MZJ38qgMJS3tqpnSwkgl6gMK6
	 lXwi0+q/i/4bRW1rYAVYZhK2Fi+wn4q2WQZrfU/cs5PDdtUC1vF47Oyrvcf1W+ZR0j
	 5QLgvUmt2WXu2QVnkOOfWl3HXugVw38aBqJ7l6+zsK6tcQ5LbkmsebK/10flKBKXoo
	 1WrWgSoD7yl69Tlfziy2ZGOpJC71TcnSvdD+kKBmFqh7mZHeq8FIHqA78POqpAblgw
	 b2N0y2jKifnX1R6t+9lgkQ0PP875yXXLFSLJuB/y+cma0xPkndT6NkMFfq+JQTx6AT
	 0zJGzcbYMyLnA==
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	by mm1.emwd.com (Postfix) with ESMTPS id 9317E385A33
	for <devel@lists.orangefs.org>; Sat, 19 Jul 2025 09:29:55 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="w3UXAXsn";
	dkim-atps=neutral
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso2377306a12.3
        for <devel@lists.orangefs.org>; Sat, 19 Jul 2025 06:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752931794; x=1753536594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZOOflxBKdTH5b7sIlGbxa3QYBsytIH9IOezkOXa6OE=;
        b=Bpg4vL1fwmo+RkLjayrnbKnm1YXYd5NzvDcApKspP148Cmk/MP2jTsveZ/u3WmrD9X
         LfXfUNk8kvpjlKPoyDrdk3VcSnidyU6zAnsAdYxvqS/5aOa2/Jp7FqXpdxEPB7cjUz7F
         Rr9yAxXBLdp35rpnnER+IjY7lSE+/RKzf+XuR7c0f5UQaWhGRE/gVc/QevXpwod1IsO0
         z8/OiiiZDxuEcetKiSCy20XcNk/Bp0J8pyo3I1s+e2207S5yFcFRQaG1Cf1JVFGaxp2G
         Uhwq1KBA76ZMkREGTD/vfkc5whgqZ5VSXU8J5UzLF8M5E382yayf/t1fyR+NwayOGvs5
         nGvg==
X-Forwarded-Encrypted: i=1; AJvYcCVxRhCDbJHLx8OytvMR0Le0j6XDP2+LK/E+VgUDlrXM6n9UOrRgUAWXRm/3TjLFoftQq5q+Ug==@lists.orangefs.org
X-Gm-Message-State: AOJu0Yz2PiU+vA/nQ8WMX7Fz6s0nqiaAth4lFmPiLFXGKe5DstU3sI6w
	uJ6n4MU96cqPTPFf/yzDDEoRgvNbNpPkY2NrMUJQZNFUUCUzNwbftXT5f73NOZJoiz3X6T4+nSB
	+UFGgzNLT0Hw6WNIdQ8mTyJhBTrhdGFmIWwOmrhrH
X-Gm-Gg: ASbGncvPGkx5VzTtcEbKnAN3iaCzi+dI/uzbXkJ5rnmtO2j/J61X4CPQpmIpMkqQMAZ
	Te3rvUNyAXeuiTs5yo6u1L1BGFHOLCLO+3TVRAvAIGF34r8Lh8dl/MsL/Qy9PUF7Ge3UoyCdzLk
	gmgw1erhS2uwa8HlRn8bAIXaqehZwsWyhrvJOtWS3dOrbOvtzwBN7F3J4nCSSibm/PBfgVREkjA
	tADejFgTuB/vxFB6C+Wu/YR9+Avjw==
X-Google-Smtp-Source: AGHT+IGTMsKtP2G3Wisl71duPg2R8F8xhT5SbykvwIvTBfZDhFArqc4cu/N0+DDO+BgZ49g18kmBZYIKUOKMHB/tIAs=
X-Received: by 2002:a17:90b:3d8c:b0:316:3972:b9d0 with SMTP id
 98e67ed59e1d1-31c9e5fcacfmr22074724a91.0.1752931794326; Sat, 19 Jul 2025
 06:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <7c4eef67-7bbc-4a4d-ba10-ccf30c6afcdb@sabinyo.mountain>
In-Reply-To: <7c4eef67-7bbc-4a4d-ba10-ccf30c6afcdb@sabinyo.mountain>
From: Mike Marshall <hubcap@omnibond.com>
Date: Sat, 19 Jul 2025 09:29:43 -0400
X-Gm-Features: Ac12FXwk323ZxD0gV07N4nak0N32Rmf-A61cgZKPwrhzUMCykchXRr8i91VBpZ4
Message-ID: <CAOg9mSSnnLf_uoM1pQp4yMjd4e=q07PjBWw62ch3P+V1c--+Dw@mail.gmail.com>
Subject: Re: [PATCH next] fs/orangefs: Use scnprintf() instead of snprintf()
To: Dan Carpenter <dan.carpenter@linaro.org>, Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: NSYKVFHVOZ3XHJ52KJHWSDPSGFFW3EZ3
X-Message-ID-Hash: NSYKVFHVOZ3XHJ52KJHWSDPSGFFW3EZ3
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Amir Mohammad Jahangirzad <a.jahangirzad@gmail.com>, Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/NSYKVFHVOZ3XHJ52KJHWSDPSGFFW3EZ3/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

Thanks. I noticed the "returns the number of bytes
which *would* have been copied" issue when I read the
snprintf man page while looking at the patch. I'll see
about making this change in my "next" before the
rc period is over...

Also, while looking at this patch, I made
an xfstest that includes buffer overflow attempts
and other bogus input. It would be, of course,
an orangefs specific xfstest... I wonder if I
should try to get it pulled into the main xfstests
repo?

-Mike

On Fri, Jul 18, 2025 at 5:24=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> We recently changed this code from using sprintf() to using snprintf()
> as a kernel hardening measure.  However, that's still not ideal.  The
> snprintf() function returns the number of bytes which *would* have been
> copied if we had enough space while the snprintf() function returns the
> number of bytes which are *actually* copied.
>
> So if there were an overflow, the conversion to snprintf() would prevent
> memory corruption but it would still leave an information leak where we
> would read beyond the end of "buf".  Use scnprintf() to fix both the
> write overflow and the read overflow.
>
> Fixes: fc08e0b8f099 ("fs/orangefs: use snprintf() instead of sprintf()")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  fs/orangefs/orangefs-debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugf=
s.c
> index a5fad515815e..e463d3c73533 100644
> --- a/fs/orangefs/orangefs-debugfs.c
> +++ b/fs/orangefs/orangefs-debugfs.c
> @@ -396,7 +396,7 @@ static ssize_t orangefs_debug_read(struct file *file,
>                 goto out;
>
>         mutex_lock(&orangefs_debug_lock);
> -       sprintf_ret =3D snprintf(buf, ORANGEFS_MAX_DEBUG_STRING_LEN, "%s"=
, (char *)file->private_data);
> +       sprintf_ret =3D scnprintf(buf, ORANGEFS_MAX_DEBUG_STRING_LEN, "%s=
", (char *)file->private_data);
>         mutex_unlock(&orangefs_debug_lock);
>
>         read_ret =3D simple_read_from_buffer(ubuf, count, ppos, buf, spri=
ntf_ret);
> --
> 2.47.2
>
