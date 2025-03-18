Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 753D7A677FD
	for <lists+devel-orangefs@lfdr.de>; Tue, 18 Mar 2025 16:35:46 +0100 (CET)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id 39222385669
	for <lists+devel-orangefs@lfdr.de>; Tue, 18 Mar 2025 11:35:45 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1742312145; bh=rjSHBZfvGbuKnjb6orx+Eag32m8zChJL/2d4fmNqHEE=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Pd+iI7GdM2LzBMkWYZHVnhbS01TZBdWXY5MjvXmgXkvdQJg5MX/+7Khryjfay7KK3
	 0m/+QJ767NVSuLTKUXMKVd2L3tlntFzEw+EWnDLRZuSnbJOP9lJ/8PtnZlg/e5Q3oS
	 0Uj5l0KqtgPGa6ibJyblUmHuByY/LZsnQsEJXWpQFANrEnKG7VgJGLHnXBmXbJiNWB
	 0/xvUzIiQLsUgVByUuTkmT/YXeWhHJtlGXWCFjZ0e9z2bwI5pGqcIPnZSdPO6GESRv
	 HwhT4zbUIaXjtipmuchyQYjxsrh2h8aq99AXZX7GrRUd6XZsVcC3hN3LIr2uZYJ1Nq
	 f+c+hPehlyB/g==
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	by mm1.emwd.com (Postfix) with ESMTPS id 575B538562F
	for <devel@lists.orangefs.org>; Tue, 18 Mar 2025 11:35:43 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="e04FMo0H";
	dkim-atps=neutral
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d57143ee39so16304685ab.1
        for <devel@lists.orangefs.org>; Tue, 18 Mar 2025 08:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742312142; x=1742916942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TB4wQt+hXwTfKdBYmNtfrnfOJ/tSYMzGg+erg760nKo=;
        b=TNuxHGfiImkWSz2WVvuUTeUPalp+vV8RsMwI5zfE99MNPcCBhKfqDB50NHiMS1euU/
         pP3ZbxskBoOMgYFCqVfmkb6LcAGIWkO1sHRerVR0VkjFQyvDdV8QYet/gNJw5etJI4Zl
         Pf5vdJMVWJ4vo/6nxUdpjF6ar3xgwpykeljJtoy1tuqbOV26IAELB2QWQ0UgdD8bTu9X
         NKIPNA5si2uFwM9berrQzlBS4TMDhsKbttNB0jD1aHVQDhTSMxqEx1+NUPuRLizzGyLo
         kd+G3C2EkOvLx7nN8Pg2YgTK+cXp0KemRz0SyvQccH+16ihcbx7jB1IqkOUchckcGmM9
         OVOw==
X-Forwarded-Encrypted: i=1; AJvYcCXgK084Ls8eogNOCYF/cgV7HYbbKNaeCM3s7sxj6PCe62UXlWE/mZIKsBnJFJJGeHXE7kU3bg==@lists.orangefs.org
X-Gm-Message-State: AOJu0Yxh8HcRpMGiE7Ots9MN7IGsFOG9GMjWiEI83Xc8JxVyWWsohOox
	UsAq3wbVNbo1se/qyADDRUUobVN38IPVgqDDbmRVnUyQszUWIFRBlTP3H/DAuLDga0GXcaYplgf
	o/7SQhkRJU/QmWUdA0tJbDt7ziTJ5cFlsapAM
X-Gm-Gg: ASbGncvhXBZgQNQ1Q3fIAliDoWRYQE6gWGMc+ZOPLB2S6sk70CLjNVf2Rlrf3aYn+cV
	PiIpu0bWWzyHJdpoVnyURbchw1mZeTe4SzhfeRu4uUKvitxIKxyAEHmvN3X2vdEM2ZFwQ9jyYPi
	25tI2DVMmd3mc9GpZ1r0OIHTYDmBZP9EjHvhrHU1YRcJ8UjCWy
X-Google-Smtp-Source: AGHT+IFZmDZErlEvObrUGR6mGQcHglkPZoGXLncV/C2NMKSfWfeDM2JWDi/aOM6Xz2HZbZtdQ92cvp5wJKGQSQZxVCQ=
X-Received: by 2002:a05:6e02:3397:b0:3d3:dd60:bc37 with SMTP id
 e9e14a558f8ab-3d483a90667mr218164675ab.22.1742312142567; Tue, 18 Mar 2025
 08:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250305204734.1475264-1-willy@infradead.org> <20250305204734.1475264-2-willy@infradead.org>
In-Reply-To: <20250305204734.1475264-2-willy@infradead.org>
From: Mike Marshall <hubcap@omnibond.com>
Date: Tue, 18 Mar 2025 11:35:31 -0400
X-Gm-Features: AQ5f1JryUbGq_KnBzTvU7679Ld-7xoa3_KkN0meSuXXj53OlWjhXwmBWtUg-ChA
Message-ID: <CAOg9mSS3Hy4nG396jo2EPfFoQxGLo42c_nu4BEM7Y0Z-WbZARw@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] orangefs: Do not truncate file size
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: U5NF5WSTLCZC5YEHZAGTL3H3DSKSKZV5
X-Message-ID-Hash: U5NF5WSTLCZC5YEHZAGTL3H3DSKSKZV5
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Christian Brauner <brauner@kernel.org>, devel@lists.orangefs.org, linux-fsdevel@vger.kernel.org
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/U5NF5WSTLCZC5YEHZAGTL3H3DSKSKZV5/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

Hi Matthew... I've run version 2 of your "orangefs folio" patch
through xfstests with no regressions...

-Mike

On Wed, Mar 5, 2025 at 3:47=E2=80=AFPM Matthew Wilcox (Oracle)
<willy@infradead.org> wrote:
>
> 'len' is used to store the result of i_size_read(), so making 'len'
> a size_t results in truncation to 4GiB on 32-bit systems.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Tested-by: Mike Marshall <hubcap@omnibond.com>
> ---
>  fs/orangefs/inode.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
> index aae6d2b8767d..63d7c1ca0dfd 100644
> --- a/fs/orangefs/inode.c
> +++ b/fs/orangefs/inode.c
> @@ -23,9 +23,9 @@ static int orangefs_writepage_locked(struct page *page,
>         struct orangefs_write_range *wr =3D NULL;
>         struct iov_iter iter;
>         struct bio_vec bv;
> -       size_t len, wlen;
> +       size_t wlen;
>         ssize_t ret;
> -       loff_t off;
> +       loff_t len, off;
>
>         set_page_writeback(page);
>
> @@ -91,8 +91,7 @@ static int orangefs_writepages_work(struct orangefs_wri=
tepages *ow,
>         struct orangefs_write_range *wrp, wr;
>         struct iov_iter iter;
>         ssize_t ret;
> -       size_t len;
> -       loff_t off;
> +       loff_t len, off;
>         int i;
>
>         len =3D i_size_read(inode);
> --
> 2.47.2
>
