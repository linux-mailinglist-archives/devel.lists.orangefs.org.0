Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 58588AE662B
	for <lists+devel-orangefs@lfdr.de>; Tue, 24 Jun 2025 15:23:43 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id A4354385629
	for <lists+devel-orangefs@lfdr.de>; Tue, 24 Jun 2025 09:23:39 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1750771419; bh=IuvfTRWcw42Ym0aPQ7gGNG+5NmBkQ1NhgmjRDPxdEGo=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=amT3eShRkOrcjoZDHj25aU7dNydBh2ggNVXP4s0iONc1qyDWlmJ4Z54HgSfme0WK0
	 POYVs7UKgQ+f6TASUM82wHkTDo79Q07kjiRNoSUtbV6x+sWsJk7V1T1otOpBS/8EXY
	 MdbXqAGQp9qq1b1GcKIVS5Bvl0f5Jr9wj7EJvt78DplLvk4FqRAWpLWefGGWlHDh9/
	 CKOtbFkn5zHzIoMCk5W/UuGcl5wRt/cW6Igtd4gjaWWv5DkHE95tS9JBPDuzK9+iUl
	 Xo3zbxY7UDO7H1o8rWf6Q12DkfLzcekxpLxgde2oxfeRjsdsZtRPRwygY6CXZTarUM
	 7Azn9qUG7QVsw==
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	by mm1.emwd.com (Postfix) with ESMTPS id 310F23814AE
	for <devel@lists.orangefs.org>; Tue, 24 Jun 2025 09:23:38 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="bqk7oTl8";
	dkim-atps=neutral
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b1fd59851baso3591657a12.0
        for <devel@lists.orangefs.org>; Tue, 24 Jun 2025 06:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771417; x=1751376217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vK3v+dzajwUArxdlJwkG3bUFbOurxUTsoEipFxjDTpc=;
        b=Pxh7ZtzAiFViJh5zxoCID1X6gP1v5jKu3D59xQl31u4yAFInHMPwP2MOUB/glhWE6Q
         Pej6G2eByoIGKtvn9Ebqu4dywolNyEFYipCWcsBxZ5mSYtb7USpMBG6lnMv57RTLTFD5
         UYNgxuD6IMliXLvmyDeTFMWvy1N3Wrzi2zJz8giXD0ILr/ml+R2KJgNetEtlSYSpntTn
         GL08miw/n13zhTY+QAvB6qxho3NKGMxsEL19dAKe8zjkPceeiIoMg0cp8XrCDAsCHvMy
         WAHoeuhK8r+nmNUYbUMT7K5N1e7IJsesHnTAdPrRlFeiSFA7tKMadgE900ZYhxY6q2MA
         KoDA==
X-Gm-Message-State: AOJu0YxTwIv5iqzZG/YpjsDErfBG9feeaE5dq1iXoqjLcK28tfZxNyYb
	iNiyQjQa73ptUUnSNx+jBXH6BQPOt4qP+5HxNNEGtv+FOkQ98UEzYR+DVrDCB1UhcE9Je+d5H+Q
	M1DfpHzyroC99NwozLeiduPKUS5W5/rhe4GV57w+a
X-Gm-Gg: ASbGnctlsUXsXnAVWYnaH2AlisW/8+gJBQFUxxU3GAdWES40cYS9Usws9VuN3h+Gr7Y
	MpbjR38o7K4HhK1kBYWr8jpgY7iG5sj5fwGb9hZW7SSRTWfbfRfwzp6OAO99kBxKI4jt4ukt0+i
	m1kY0GBASE/Ypxcc5NduRixXgk04O2GCP6UaP9D3PlmcoXqxglbPBfHqYvjKPhQV+KGA==
X-Google-Smtp-Source: AGHT+IGLTtSmdenihweMYdpjZ+WIai1GeVbGiaMYgIbcWlYL0/1d71RBZv9vNYhiQnMgC0X6X8uAD4hDPxnfJvOR8jc=
X-Received: by 2002:a17:90b:4c42:b0:311:e8cc:4264 with SMTP id
 98e67ed59e1d1-3159d64a714mr30296359a91.12.1750771416928; Tue, 24 Jun 2025
 06:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250620101530.440224-1-shankari.ak0208@gmail.com>
In-Reply-To: <20250620101530.440224-1-shankari.ak0208@gmail.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Tue, 24 Jun 2025 09:23:25 -0400
X-Gm-Features: AX0GCFsZiBuF-vyqJ7jNd_gSmW4BeAkPHdH-PJpIi3XIkUXu5xyRPsBTJp_Zt4E
Message-ID: <CAOg9mSSRizL99eROAzp8OyNiqBmo77o5XUU0R_Fv3+CnUWcPbw@mail.gmail.com>
Subject: Re: [PATCH] fs: orangefs: replace scnprintf() with sysfs_emit()
To: Shankari Anand <shankari.ak0208@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: DJ6VAFCA7RVTBQ5FARWXN42MMM4ERXS7
X-Message-ID-Hash: DJ6VAFCA7RVTBQ5FARWXN42MMM4ERXS7
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devel@lists.orangefs.org, martin@omnibond.com
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/DJ6VAFCA7RVTBQ5FARWXN42MMM4ERXS7/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

Hello Shankari...

Thanks for the patch, it seems to be the right thing to do... your patch
doesn't compile, though... looks like a cut-and-paste error... I fixed the
error, added your patch to 6.16.0-rc3 and ran it through xfstests with
no problems. If you'd like me to submit this to be pulled in the merge
window, please send me a corrected version...

-Mike

On Fri, Jun 20, 2025 at 6:15=E2=80=AFAM Shankari Anand
<shankari.ak0208@gmail.com> wrote:
>
> Documentation/filesystems/sysfs.rst mentions that show() should only
> use sysfs_emit() or sysfs_emit_at() when formating the value to be
> returned to user space. So replace scnprintf() with sysfs_emit().
>
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> ---
>  fs/orangefs/orangefs-sysfs.c | 28 ++++++++++------------------
>  1 file changed, 10 insertions(+), 18 deletions(-)
>
> diff --git a/fs/orangefs/orangefs-sysfs.c b/fs/orangefs/orangefs-sysfs.c
> index 04e15dfa504a..b89e516f9bdc 100644
> --- a/fs/orangefs/orangefs-sysfs.c
> +++ b/fs/orangefs/orangefs-sysfs.c
> @@ -217,36 +217,31 @@ static ssize_t sysfs_int_show(struct kobject *kobj,
>
>         if (!strcmp(kobj->name, ORANGEFS_KOBJ_ID)) {
>                 if (!strcmp(attr->attr.name, "op_timeout_secs")) {
> -                       rc =3D scnprintf(buf,
> -                                      PAGE_SIZE,
> +                       rc =3D sysfs_emit(buf,
>                                        "%d\n",
>                                        op_timeout_secs);
>                         goto out;
>                 } else if (!strcmp(attr->attr.name,
>                                    "slot_timeout_secs")) {
> -                       rc =3D scnprintf(buf,
> +                       rc =3D sysfs_emit(buf,
>                                        PAGE_SIZE,
> -                                      "%d\n",
>                                        slot_timeout_secs);
>                         goto out;
>                 } else if (!strcmp(attr->attr.name,
>                                    "cache_timeout_msecs")) {
> -                       rc =3D scnprintf(buf,
> -                                      PAGE_SIZE,
> +                       rc =3D sysfs_emit(buf,
>                                        "%d\n",
>                                        orangefs_cache_timeout_msecs);
>                         goto out;
>                 } else if (!strcmp(attr->attr.name,
>                                    "dcache_timeout_msecs")) {
> -                       rc =3D scnprintf(buf,
> -                                      PAGE_SIZE,
> +                       rc =3D sysfs_emit(buf,
>                                        "%d\n",
>                                        orangefs_dcache_timeout_msecs);
>                         goto out;
>                 } else if (!strcmp(attr->attr.name,
>                                    "getattr_timeout_msecs")) {
> -                       rc =3D scnprintf(buf,
> -                                      PAGE_SIZE,
> +                       rc =3D sysfs_emit(buf,
>                                        "%d\n",
>                                        orangefs_getattr_timeout_msecs);
>                         goto out;
> @@ -256,14 +251,12 @@ static ssize_t sysfs_int_show(struct kobject *kobj,
>
>         } else if (!strcmp(kobj->name, STATS_KOBJ_ID)) {
>                 if (!strcmp(attr->attr.name, "reads")) {
> -                       rc =3D scnprintf(buf,
> -                                      PAGE_SIZE,
> +                       rc =3D sysfs_emit(buf,
>                                        "%lu\n",
>                                        orangefs_stats.reads);
>                         goto out;
>                 } else if (!strcmp(attr->attr.name, "writes")) {
> -                       rc =3D scnprintf(buf,
> -                                      PAGE_SIZE,
> +                       rc =3D sysfs_emit(buf,
>                                        "%lu\n",
>                                        orangefs_stats.writes);
>                         goto out;
> @@ -497,19 +490,18 @@ static ssize_t sysfs_service_op_show(struct kobject=
 *kobj,
>                 if (strcmp(kobj->name, PC_KOBJ_ID)) {
>                         if (new_op->upcall.req.param.op =3D=3D
>                             ORANGEFS_PARAM_REQUEST_OP_READAHEAD_COUNT_SIZ=
E) {
> -                               rc =3D scnprintf(buf, PAGE_SIZE, "%d %d\n=
",
> +                               rc =3D sysfs_emit(buf, "%d %d\n",
>                                     (int)new_op->downcall.resp.param.u.
>                                     value32[0],
>                                     (int)new_op->downcall.resp.param.u.
>                                     value32[1]);
>                         } else {
> -                               rc =3D scnprintf(buf, PAGE_SIZE, "%d\n",
> +                               rc =3D sysfs_emit(buf, "%d\n",
>                                     (int)new_op->downcall.resp.param.u.va=
lue64);
>                         }
>                 } else {
> -                       rc =3D scnprintf(
> +                       rc =3D sysfs_emit(
>                                 buf,
> -                               PAGE_SIZE,
>                                 "%s",
>                                 new_op->downcall.resp.perf_count.buffer);
>                 }
> --
> 2.34.1
>
