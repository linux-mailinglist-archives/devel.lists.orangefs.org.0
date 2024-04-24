Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC448B11A2
	for <lists+devel-orangefs@lfdr.de>; Wed, 24 Apr 2024 20:03:12 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id 0B5B4383596
	for <lists+devel-orangefs@lfdr.de>; Wed, 24 Apr 2024 14:03:11 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1713981791; bh=q6S5pmCASJyGUUG0ulRx4SOz+3MV38xuPYwg1VcCAtQ=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D0YgWnKNFvJjB5Vc3JGwt3zqLJn1/GKOt/RqA9IKEJviZmS2lPMHkWdssdAZSwbcg
	 TzDRgSAE5uotNnLD4sJcjyxFY435fPc+eQqzdSZ+obazz/60cwKjwAZ2Q6drYV9lmW
	 wEaaTSe4aZQafAEkeWr9t1P5mMSdS+fI8BdmSRewZCdgHEd5lE4FIkY1PDLBd0gfmv
	 SvC4Ggi1kfzL0Z0GYPzCc+gC1bLNei3VJz5iq7INvHtqFhK4Na+HoWw7lT7RIcVl3p
	 6SpT5I7n7yjObJlFyuU91qkyckAR3oITzShp6tKnDcNYf6fJxrmI4whb/saMPeEtfp
	 VwCF4hK+I9VbQ==
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	by mm1.emwd.com (Postfix) with ESMTPS id 66A3038197D
	for <devel@lists.orangefs.org>; Wed, 24 Apr 2024 14:02:52 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="Iq9ZxjUi";
	dkim-atps=neutral
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-437610adf96so750321cf.3
        for <devel@lists.orangefs.org>; Wed, 24 Apr 2024 11:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713981772; x=1714586572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nevhvd1meTfPIZE67PSZAMSBr8400hsjebaOAXqzKS4=;
        b=mYRlAddpGzkWgT0oSsXZtRSPB9DB1h2oPygy6olVU0B6qeIiXFBEIzT78buPjar+K4
         ZdOjnDlqtO2pDU93tlwA6ZV0IorkK7uhakROGLUolRQIHtjaLfu9YS7TMAlFEKjkasgC
         f5FsnlB+I1rtbxWLcC6R5EjlqUYsobCLxW6rS1Dpi6IbPXjEoLVSzQpGikbwfVIt+cV1
         5uvT/NsnlJzN3HE9XqTqNGLfl1sX0SoiTpEZBQKr85Gd3zvGZuUFfOoMV71mbqA9N4p9
         Iy6PgqwGWintab9fZjngtBOeChnCkauNkMYCEBSp7+Pg7LeNxdfww8dFCAz2ygqCpOmL
         c6iA==
X-Forwarded-Encrypted: i=1; AJvYcCUCkXS8ndVU3BbGX4BpgtRVUz/Z8lbTsGKDeFcIjmqzTShiIfHmY1tue+TyiNAGL92VpXM90j2wqFkNQrXVuRVSJ55l4aN6/1g=
X-Gm-Message-State: AOJu0Yw2y0FnH8cYv2GpKbEM9160pfhRTjfkIAKN9tGOPFm31JUMf3A0
	PNtNnv/p/vO7/onvtytithW8/DQINhBggDvrPcRJVpojobChOJK6LRguK3jAFjMOODzo29BgpgE
	qmrlg6voPJcd0POpzu3jKXu5+t7LDbJsh4wpe
X-Google-Smtp-Source: AGHT+IEZLEzW3ErvXOcewusmOzUnrSjq9J/ZI/oRg4C/1s4sDda5QLQZ0cDtCyJKmkp6UYic0DRuHkQ5H49IAP+pnu0=
X-Received: by 2002:a05:622a:2c2:b0:432:dd26:e1db with SMTP id
 a2-20020a05622a02c200b00432dd26e1dbmr4728651qtx.59.1713981771923; Wed, 24 Apr
 2024 11:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240420025029.2166544-1-willy@infradead.org> <20240420025029.2166544-19-willy@infradead.org>
In-Reply-To: <20240420025029.2166544-19-willy@infradead.org>
From: Mike Marshall <hubcap@omnibond.com>
Date: Wed, 24 Apr 2024 14:02:40 -0400
Message-ID: <CAOg9mSQtqXWF400L9K4=FC453vBwrvj6Ps3PUM_V0Q5-TGoP8w@mail.gmail.com>
Subject: Re: [PATCH 18/30] orangefs: Remove calls to set/clear the error flag
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: GRS42AREWXF77XDNDIC3OTZZUVSDOZIE
X-Message-ID-Hash: GRS42AREWXF77XDNDIC3OTZZUVSDOZIE
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-fsdevel@vger.kernel.org, Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/GRS42AREWXF77XDNDIC3OTZZUVSDOZIE/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

I added this patch to 6.9.0-rc5 and ran it through xfstests with no problem=
s...

-Mike

On Fri, Apr 19, 2024 at 10:50=E2=80=AFPM Matthew Wilcox (Oracle)
<willy@infradead.org> wrote:
>
> Nobody checks the error flag on orangefs folios, so stop setting and
> clearing it.  We can also use folio_end_read() to simplify
> orangefs_read_folio().
>
> Cc: Mike Marshall <hubcap@omnibond.com>
> Cc: Martin Brandenburg <martin@omnibond.com>
> Cc: devel@lists.orangefs.org
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/orangefs/inode.c           | 13 +++----------
>  fs/orangefs/orangefs-bufmap.c |  4 +---
>  2 files changed, 4 insertions(+), 13 deletions(-)
>
> diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
> index 085912268442..fdb9b65db1de 100644
> --- a/fs/orangefs/inode.c
> +++ b/fs/orangefs/inode.c
> @@ -56,7 +56,6 @@ static int orangefs_writepage_locked(struct page *page,
>         ret =3D wait_for_direct_io(ORANGEFS_IO_WRITE, inode, &off, &iter,=
 wlen,
>             len, wr, NULL, NULL);
>         if (ret < 0) {
> -               SetPageError(page);
>                 mapping_set_error(page->mapping, ret);
>         } else {
>                 ret =3D 0;
> @@ -119,7 +118,6 @@ static int orangefs_writepages_work(struct orangefs_w=
ritepages *ow,
>             0, &wr, NULL, NULL);
>         if (ret < 0) {
>                 for (i =3D 0; i < ow->npages; i++) {
> -                       SetPageError(ow->pages[i]);
>                         mapping_set_error(ow->pages[i]->mapping, ret);
>                         if (PagePrivate(ow->pages[i])) {
>                                 wrp =3D (struct orangefs_write_range *)
> @@ -303,15 +301,10 @@ static int orangefs_read_folio(struct file *file, s=
truct folio *folio)
>         iov_iter_zero(~0U, &iter);
>         /* takes care of potential aliasing */
>         flush_dcache_folio(folio);
> -       if (ret < 0) {
> -               folio_set_error(folio);
> -       } else {
> -               folio_mark_uptodate(folio);
> +       if (ret > 0)
>                 ret =3D 0;
> -       }
> -       /* unlock the folio after the ->read_folio() routine completes */
> -       folio_unlock(folio);
> -        return ret;
> +       folio_end_read(folio, ret =3D=3D 0);
> +       return ret;
>  }
>
>  static int orangefs_write_begin(struct file *file,
> diff --git a/fs/orangefs/orangefs-bufmap.c b/fs/orangefs/orangefs-bufmap.=
c
> index b501dc07f922..edcca4beb765 100644
> --- a/fs/orangefs/orangefs-bufmap.c
> +++ b/fs/orangefs/orangefs-bufmap.c
> @@ -274,10 +274,8 @@ orangefs_bufmap_map(struct orangefs_bufmap *bufmap,
>                 gossip_err("orangefs error: asked for %d pages, only got =
%d.\n",
>                                 bufmap->page_count, ret);
>
> -               for (i =3D 0; i < ret; i++) {
> -                       SetPageError(bufmap->page_array[i]);
> +               for (i =3D 0; i < ret; i++)
>                         unpin_user_page(bufmap->page_array[i]);
> -               }
>                 return -ENOMEM;
>         }
>
> --
> 2.43.0
>
