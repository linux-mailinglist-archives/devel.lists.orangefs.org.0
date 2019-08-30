Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id DA99AA2C41
	for <lists+devel-orangefs@lfdr.de>; Fri, 30 Aug 2019 03:29:06 +0200 (CEST)
Received: from [::1] (port=32962 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1i3Vis-0006L0-3P
	for lists+devel-orangefs@lfdr.de; Thu, 29 Aug 2019 21:29:06 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:42811)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <hubcap@omnibond.com>) id 1i3Viq-0006JT-B1
 for devel@lists.orangefs.org; Thu, 29 Aug 2019 21:29:04 -0400
Received: by mail-yw1-f67.google.com with SMTP id i207so1834739ywc.9
 for <devel@lists.orangefs.org>; Thu, 29 Aug 2019 18:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=omnibond-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1NLtIL4mp2qHTi5hOVwYkkuVD4cT9jE/SqJqjf/988o=;
 b=VG0l1vYyTezDPmlCvZndRIN9LUTbWs54StnMoM5QDy30R0ucZcLzwxswfDoZtpnlOK
 1Cn9bB+eo4i0CRn4cIw+rkjxoattmez+qzoUIwYTnUwZ3PrFjH+lSqxGM91y3T/L34PQ
 PfUfgNwwPbaHkWk+jPiQLcVFmTLRnk6rBWI9J+dmL5xrFrcvgcTKZTVqfTpBOEGW2g44
 7S7FxyM9Q82HBm0zDP68iNu7Hqv6I19hJhprYadc8KLBGhokzbTe/k3V/E2GtBx4H1E+
 +6pZI0RNf392b8ubW4W6QhPl7i/M2W8TIlUBUF4Jc3Ddz9hn+VqKeomr1VwbGFgMINpx
 YRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1NLtIL4mp2qHTi5hOVwYkkuVD4cT9jE/SqJqjf/988o=;
 b=q4JVyx3oGrty9ZRu928qkyONLusZtOrASBVP66WirD++6ndc2Q0HhovRSNvt8HNyF2
 Dd3kVcWIV1DWZM2ZXT1LeNe/pYr+9JjgCAUmTM6b/hs/4jIMknvYt/+VNgcvlmvZ+TNb
 zgUv8RpaMyU+7UQQMYtypMWgWezfPox1C5fHMV5NVO6OVyJo1zrLc0zNyeruohqaFA7l
 wy2AX608kDOdNnlYIidzagDUYrRojK8mGQvkjgFAHyt2mqaHgx5CNCrul6Q3uf5oLoGT
 R/vfaqq7VnmHfK4M9JzK8RPiNJP0u7N7G4YRyYvb6lz0oxhe15PjiHSJKiKTcWR+BsrA
 PGMQ==
X-Gm-Message-State: APjAAAXuKcgxR/jlEEG33F5yClqaITZIRMAKwRZ3ano/m/PqBFHGJ7LO
 raUn28O8tu28yQKyO6ufyh7vVkLEbUIDpi2YEzYsfQ==
X-Google-Smtp-Source: APXvYqxkzIoMrgZQcoeF5OyznXISdWtNE6TK2VXrJ5iLriqjHOYy8eIx/6czv4xAZj/ROALVBLVs+udVCrq/v//vKKQ=
X-Received: by 2002:a81:6a8a:: with SMTP id f132mr9756614ywc.358.1567128503715; 
 Thu, 29 Aug 2019 18:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190813105359eucas1p2c4fecf74be23d3e7739a61c55050bc89@eucas1p2.samsung.com>
 <20190813105337.3065-1-a.swigon@partner.samsung.com>
In-Reply-To: <20190813105337.3065-1-a.swigon@partner.samsung.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Thu, 29 Aug 2019 21:28:12 -0400
Message-ID: <CAOg9mSTCwb6fd0SfWYgVGoQ9gsSjPGNYwBDHMV3b9hBzGFHQgg@mail.gmail.com>
Subject: Re: [PATCH] orangefs: Add octal zero prefix
To: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: devel@lists.orangefs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: <devel.lists.orangefs.org>
List-Unsubscribe: <http://lists.orangefs.org/mailman/options/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=unsubscribe>
List-Archive: <http://lists.orangefs.org/pipermail/devel_lists.orangefs.org/>
List-Post: <mailto:devel@lists.orangefs.org>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Subscribe: <http://lists.orangefs.org/mailman/listinfo/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=subscribe>
Cc: LKML <linux-kernel@vger.kernel.org>, devel@lists.orangefs.org
Errors-To: devel-bounces@lists.orangefs.org
Sender: "Devel" <devel-bounces@lists.orangefs.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - mm1.emwd.com
X-AntiAbuse: Original Domain - lfdr.de
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lists.orangefs.org
X-Get-Message-Sender-Via: mm1.emwd.com: acl_c_authenticated_local_user: mailman/mailman
X-Authenticated-Sender: mm1.emwd.com: mailman@lists.orangefs.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Thanks for catching this, I added this patch on top of Linux 5.3-rc6 and
ran xfstests on orangefs with no regressions.

Acked-by: Mike Marshall <hubcap@omnibond.com>

-Mike



On Tue, Aug 13, 2019 at 6:54 AM Artur =C5=9Awigo=C5=84
<a.swigon@partner.samsung.com> wrote:
>
> This patch adds a missing zero to mode 755 specification required to
> express it in octal numeral system.
>
> Reported-by: =C5=81ukasz Wrochna <l.wrochna@samsung.com>
> Signed-off-by: Artur =C5=9Awigo=C5=84 <a.swigon@partner.samsung.com>
> ---
>  fs/orangefs/namei.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/orangefs/namei.c b/fs/orangefs/namei.c
> index 1dd710e5f376..3e7cf3d0a494 100644
> --- a/fs/orangefs/namei.c
> +++ b/fs/orangefs/namei.c
> @@ -224,7 +224,7 @@ static int orangefs_symlink(struct inode *dir,
>         struct orangefs_object_kref ref;
>         struct inode *inode;
>         struct iattr iattr;
> -       int mode =3D 755;
> +       int mode =3D 0755;
>         int ret;
>
>         gossip_debug(GOSSIP_NAME_DEBUG, "%s: called\n", __func__);
> --
> 2.17.1
>

