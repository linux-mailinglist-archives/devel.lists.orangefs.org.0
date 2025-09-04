Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D56B43D16
	for <lists+devel-orangefs@lfdr.de>; Thu,  4 Sep 2025 15:25:59 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id 096173858FF
	for <lists+devel-orangefs@lfdr.de>; Thu,  4 Sep 2025 09:25:58 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1756992358; bh=FET2Dy1eMz1dRzV3Gr4YyXmMJL5wm2911UuIhuaWBW4=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lG2qISUjFi9JQ8/gR9rXdnIFdkvDSm18QqperHL8w84FlzKs8gAaStJFTG3j83i4S
	 8x4MLIKMJsaQKnZ0ws8nQGBwqnGA08RcBW4IJT6omBxJ2svDeUoYX1vdt7WMlFSzO6
	 PR+ljhNBdkil0aT8Wd/xiJMMQrhsdoqAOh8NTjR37M4NkBwy0F1fp+BOmTJZYnE0PF
	 Ftic2SK0yvE56liC7kPNgbiib9aCn+oY/rIlmpfF7XG7lvYb6L8SamLnLVVlrTT2Rt
	 EBuUH9U8gtDcCPFyw2aDyxrpGfp1pbOP94ee/Ss4BcO2jIWHEp/FgNsJku1itDv2xW
	 no5vq7GgtUciQ==
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	by mm1.emwd.com (Postfix) with ESMTPS id 64A93385717
	for <devel@lists.orangefs.org>; Thu,  4 Sep 2025 09:25:55 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="TnwQZoxF";
	dkim-atps=neutral
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77246079bc9so1223918b3a.3
        for <devel@lists.orangefs.org>; Thu, 04 Sep 2025 06:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756992354; x=1757597154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NRZZq6/C5qBPfOaeYft44zNifMSmgG4Y7WNM0zdplV4=;
        b=EWjYbqx6R8fKK6m6hjcYDL71bu0XtSpZJwdRcORbWSKXg3aCHuetTNSAY0wqxF/oUP
         FQOQ2ycORRrMX1iepECR8k+huAJ+dAFqPu4de6rEJQBiUdLuFrDPHzmWN/xbYSnBXqjg
         UrFOwT5M99jSD4qquanmlFfjK8N+Ldwxb0w33PcXB0pTDPjjHDVQ0Q5TvRbxW8vZDkCM
         I683ryj4QSc0iFkJvR4zmwid7PfLAHNYaBzmWu4jp7wgsqcvFE5mHZdD708LTO5Gr9oE
         Mvff/bQj+okBz3knJo/d0tvNdoBSfnk2ZksmZDbZB/yS6yUG7TsG9wBr4GLSGrG+8SSf
         CltQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFY8wo/7v7Pcsd8ZXylBKeA2AB7E3PnajkA+IPNqFU7bVErcPsghk+KmWtMbSC7JNCAO8yeQ==@lists.orangefs.org
X-Gm-Message-State: AOJu0Yyhor8rqXBQBe5aqAgs0AkomYSyPNNoYrrsKQeHcyZp7yD0MZr3
	z+6B8M2Vfq/3Kq9vu+6JlH90iTrmOifeQozrYplqjc9eK5xHDJmdmUaX/o8w2ffwiO2fM5S8SLK
	Huijq+oxJNyUy5bsXuhmNkGett/yNqcIs4rHqJMvE
X-Gm-Gg: ASbGncvdvYj/gqu3Yd1YgDrE6R3lE/SZ8L8wgn/MaGvR6wImxOr2EbNH85mo4SDGSjB
	SRfwxyB8BEIbYL1zJUa896lxBpZb0rwlKBoBa5rn83yabbEvjgWDsMVQ+poih7DNTcpoklq+rW2
	s5hrZiBdmI2xZOdQjbmcDmncEnDs/8QKAFsEYNfk0kcnt++4tuIIgFIUHN9OWAoFrWbn4DgKUEA
	HMdrHZOMS1iKGSfG5/f8Q3FSQoH
X-Google-Smtp-Source: AGHT+IGyiaYMzvi5j9aruCus8bcNEeFokwTjPIWrKQsm/18pntw68s2I1AyQF2Zxt8FhEfkvbqWfXrg/jqslKhTHXNQ=
X-Received: by 2002:a05:6a21:6daa:b0:243:a857:4377 with SMTP id
 adf61e73a8af0-243d6dd15b4mr26631320637.4.1756992353176; Thu, 04 Sep 2025
 06:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250901025818.1761146-1-zhen.ni@easystack.cn>
In-Reply-To: <20250901025818.1761146-1-zhen.ni@easystack.cn>
From: Mike Marshall <hubcap@omnibond.com>
Date: Thu, 4 Sep 2025 09:25:42 -0400
X-Gm-Features: Ac12FXyUTqP87HbJx0OsmqMmk3-PK5czW85B2xMBFthFFBv1XtjYNEQcBXQ1Gq4
Message-ID: <CAOg9mSS7-CCu6vw0WTFiMfo7TSRvmtV01atJpGsS-0Gu5kkGQA@mail.gmail.com>
Subject: Re: [PATCH] orangefs: Remove unused type in macro fill_default_sys_attrs
To: Zhen Ni <zhen.ni@easystack.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: A6Y6B25VJPXYQV6G24UI5UEOEVK6VFPH
X-Message-ID-Hash: A6Y6B25VJPXYQV6G24UI5UEOEVK6VFPH
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: martin@omnibond.com, devel@lists.orangefs.org
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/A6Y6B25VJPXYQV6G24UI5UEOEVK6VFPH/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

Hi, I studied your patch. It made me curious to see how
the code got that way so I looked all the way back to the
out-of-tree version... anyhow, thanks, and I'll xfstest it and
plan to put it in my linux-next tree...

-Mike

On Sun, Aug 31, 2025 at 10:58=E2=80=AFPM Zhen Ni <zhen.ni@easystack.cn> wro=
te:
>
> Remove the unused type parameter from the macro definition and all its
> callers, making the interface consistent with its actual usage.
>
> Fixes: 69a23de2f3de ("orangefs: clean up fill_default_sys_attrs")
> Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
> ---
>  fs/orangefs/namei.c           | 10 +++-------
>  fs/orangefs/orangefs-kernel.h |  2 +-
>  2 files changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/fs/orangefs/namei.c b/fs/orangefs/namei.c
> index 82395fe2b956..bec5475de094 100644
> --- a/fs/orangefs/namei.c
> +++ b/fs/orangefs/namei.c
> @@ -38,8 +38,7 @@ static int orangefs_create(struct mnt_idmap *idmap,
>
>         new_op->upcall.req.create.parent_refn =3D parent->refn;
>
> -       fill_default_sys_attrs(new_op->upcall.req.create.attributes,
> -                              ORANGEFS_TYPE_METAFILE, mode);
> +       fill_default_sys_attrs(new_op->upcall.req.create.attributes, mode=
);
>
>         strscpy(new_op->upcall.req.create.d_name, dentry->d_name.name);
>
> @@ -240,9 +239,7 @@ static int orangefs_symlink(struct mnt_idmap *idmap,
>
>         new_op->upcall.req.sym.parent_refn =3D parent->refn;
>
> -       fill_default_sys_attrs(new_op->upcall.req.sym.attributes,
> -                              ORANGEFS_TYPE_SYMLINK,
> -                              mode);
> +       fill_default_sys_attrs(new_op->upcall.req.sym.attributes, mode);
>
>         strscpy(new_op->upcall.req.sym.entry_name, dentry->d_name.name);
>         strscpy(new_op->upcall.req.sym.target, symname);
> @@ -316,8 +313,7 @@ static struct dentry *orangefs_mkdir(struct mnt_idmap=
 *idmap, struct inode *dir,
>
>         new_op->upcall.req.mkdir.parent_refn =3D parent->refn;
>
> -       fill_default_sys_attrs(new_op->upcall.req.mkdir.attributes,
> -                             ORANGEFS_TYPE_DIRECTORY, mode);
> +       fill_default_sys_attrs(new_op->upcall.req.mkdir.attributes, mode)=
;
>
>         strscpy(new_op->upcall.req.mkdir.d_name, dentry->d_name.name);
>
> diff --git a/fs/orangefs/orangefs-kernel.h b/fs/orangefs/orangefs-kernel.=
h
> index 3e153c2f6b82..29c6da43e396 100644
> --- a/fs/orangefs/orangefs-kernel.h
> +++ b/fs/orangefs/orangefs-kernel.h
> @@ -462,7 +462,7 @@ int service_operation(struct orangefs_kernel_op_s *op=
,
>         ((ORANGEFS_SB(inode->i_sb)->flags & ORANGEFS_OPT_INTR) ? \
>                 ORANGEFS_OP_INTERRUPTIBLE : 0)
>
> -#define fill_default_sys_attrs(sys_attr, type, mode)                   \
> +#define fill_default_sys_attrs(sys_attr, mode)                 \
>  do {                                                                   \
>         sys_attr.owner =3D from_kuid(&init_user_ns, current_fsuid()); \
>         sys_attr.group =3D from_kgid(&init_user_ns, current_fsgid()); \
> --
> 2.20.1
>
