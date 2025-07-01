Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B38AEFE03
	for <lists+devel-orangefs@lfdr.de>; Tue,  1 Jul 2025 17:24:18 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id EDC0B385376
	for <lists+devel-orangefs@lfdr.de>; Tue,  1 Jul 2025 11:24:13 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1751383453; bh=KA9ODyRRf+UBfYBzhhZp8RYRH1PTEq1C15fpPH4METo=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N+oHHte9cEfBwyCiTBGvrMFDv3XR0/7Z8vb0Fh48nCa9sAaP17dflRl5pkuJifNv6
	 WvYdPHPhyIaONT2xIUMHWm/9EimTiYJKPdiwifge8OZQ/qVBG3VldL7Hfo7+nQ6dZ4
	 0Eg9z+lSOgWjTnJU7dSDwPTmcxberF3hBmGsxlAd8OoXkW3Byc604pulezk/SQFRU0
	 6ngttBv/xs91zApzMpD57YPPepsJ58DNT9Wg7cItbutcGEIbtR8OJVGO/CuBupxE76
	 YDaNSIdiJCUrXDzkIAetI7K2xJqjg7hsacaMm/0meUOq23OnuG3wQrbUF3VkY5xnWj
	 2rsmWWIwG9Jyw==
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	by mm1.emwd.com (Postfix) with ESMTPS id 1EC7E380AF7
	for <devel@lists.orangefs.org>; Tue,  1 Jul 2025 11:24:11 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="lPQbKEGm";
	dkim-atps=neutral
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3122a63201bso2310412a91.0
        for <devel@lists.orangefs.org>; Tue, 01 Jul 2025 08:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383451; x=1751988251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtMZYsy2INz7OM+nmuG6EuPPR9OM94xwy6B8MUHX1WY=;
        b=I5IXCjF7JXC0j9HrO4INQjfJSUegXHSBwYhF5XAX07olNymW/fps/9hQXqgdQD6CWi
         tKTwFJVzu5y/2N8hqFxenjG5l8Ms4eI1N+8e0AsAQ6kEhUoYtJKRilDieKepf/fH2dLb
         zWdZRjJiuW8VVP8ZurjxoD1WhDFoWpIZDpLBzkhudoM8NqRtS5dao3kbDNCOzotADCMq
         8T77+GAMpRytVKDNPTvqprwvOndMXKLAmzIIUcF2D+NGKZ4CxZVH12mJ0dBL50RrNYwg
         rNN9wJPwZYyqc44NTLWzjlbScEdoeiZFY05RA7+fAhD97jzBPd/0sju05KRVY1cQ79EE
         bUsQ==
X-Gm-Message-State: AOJu0Yw/B/kWCJFZjNjAAuSkAcqRfeAtc5hy4mo8W7W4VgCOyQRU3Mwe
	1LfAHvBzDJc4CMJO3HqWiuW7/gByNO1ru7yXeI7QTVNe61288sL4S+8ezFJaP/qhR/kkcsmszCT
	2hY07w1ROQ5TCuKLPrl+RfKKlEjqxXgsdCuhHFSbt
X-Gm-Gg: ASbGncuhGoe/ZsQ33yh5/mhHyv4yHBq8Oixlm7kJ1T25lduf3yxgwv+e5pSqd6gVBSc
	VqzPeZuUOOMmLb+b6x4AHeUNY4s6hVtXmcXXpVTIunhWUZjNHLvES3V1LG+XdUUzovb+H3n0YOQ
	DluTojESLPuMm3/XVjUsrPWdJgsCNfmeAWKkJPbT4X+mCII7OOyXXQSEg=
X-Google-Smtp-Source: AGHT+IHI0Dve+NCFkA17jJsHD2vjpfbyP+YtEvQH8vjGVnJrWzDYwPZNbMLX1MSm5FQn0EApBiwCpvGbWtB2BSHF5/Q=
X-Received: by 2002:a17:90b:2dd1:b0:311:f05b:869b with SMTP id
 98e67ed59e1d1-318c930f9e9mr21667197a91.30.1751383450909; Tue, 01 Jul 2025
 08:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250624152545.36763-1-shankari.ak0208@gmail.com> <CAPRMd3kM8Eaf64vdMd+43cuV-QTBca9Zxm+Ou4S-DFCY5ovDBQ@mail.gmail.com>
In-Reply-To: <CAPRMd3kM8Eaf64vdMd+43cuV-QTBca9Zxm+Ou4S-DFCY5ovDBQ@mail.gmail.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Tue, 1 Jul 2025 11:23:59 -0400
X-Gm-Features: Ac12FXyZ5SO4i36eiyT3nJ2ClMSI9KR9oOEBuBstY0HrkZKGrIFtXNJsB9FYKdM
Message-ID: <CAOg9mST4S-d=Fcio64MLVHouSmNi2P7r9Fc8pMHL1HyWCYnT0A@mail.gmail.com>
Subject: Re: [PATCH v2] fs: orangefs: replace scnprintf() with sysfs_emit()
To: Shankari Anand <shankari.ak0208@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: QBZ3LB3CZRJNN234BEGDRRX46TR7IYQS
X-Message-ID-Hash: QBZ3LB3CZRJNN234BEGDRRX46TR7IYQS
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devel@lists.orangefs.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/QBZ3LB3CZRJNN234BEGDRRX46TR7IYQS/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

I have it xfstested and plan to upload it along with a couple of other
patches to my linux-next tree soon...

Thanks!

-Mike

On Tue, Jul 1, 2025 at 2:13=E2=80=AFAM Shankari Anand <shankari.ak0208@gmai=
l.com> wrote:
>
> Hello, can this patch be picked for review?
>
> On Tue, Jun 24, 2025 at 8:56=E2=80=AFPM Shankari Anand
> <shankari.ak0208@gmail.com> wrote:
> >
> > Documentation/filesystems/sysfs.rst mentions that show() should only
> > use sysfs_emit() or sysfs_emit_at() when formating the value to be
> > returned to user space. So replace scnprintf() with sysfs_emit().
> >
> > Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> > ---
> > v1 -> v2: Fix minor parameter error
> > ---
> >  fs/orangefs/orangefs-sysfs.c | 28 ++++++++++------------------
> >  1 file changed, 10 insertions(+), 18 deletions(-)
> >
> > diff --git a/fs/orangefs/orangefs-sysfs.c b/fs/orangefs/orangefs-sysfs.=
c
> > index 04e15dfa504a..b89e516f9bdc 100644
> > --- a/fs/orangefs/orangefs-sysfs.c
> > +++ b/fs/orangefs/orangefs-sysfs.c
> > @@ -217,36 +217,31 @@ static ssize_t sysfs_int_show(struct kobject *kob=
j,
> >
> >         if (!strcmp(kobj->name, ORANGEFS_KOBJ_ID)) {
> >                 if (!strcmp(attr->attr.name, "op_timeout_secs")) {
> > -                       rc =3D scnprintf(buf,
> > -                                      PAGE_SIZE,
> > +                       rc =3D sysfs_emit(buf,
> >                                        "%d\n",
> >                                        op_timeout_secs);
> >                         goto out;
> >                 } else if (!strcmp(attr->attr.name,
> >                                    "slot_timeout_secs")) {
> > -                       rc =3D scnprintf(buf,
> > -                                      PAGE_SIZE,
> > +                       rc =3D sysfs_emit(buf,
> >                                        "%d\n",
> >                                        slot_timeout_secs);
> >                         goto out;
> >                 } else if (!strcmp(attr->attr.name,
> >                                    "cache_timeout_msecs")) {
> > -                       rc =3D scnprintf(buf,
> > -                                      PAGE_SIZE,
> > +                       rc =3D sysfs_emit(buf,
> >                                        "%d\n",
> >                                        orangefs_cache_timeout_msecs);
> >                         goto out;
> >                 } else if (!strcmp(attr->attr.name,
> >                                    "dcache_timeout_msecs")) {
> > -                       rc =3D scnprintf(buf,
> > -                                      PAGE_SIZE,
> > +                       rc =3D sysfs_emit(buf,
> >                                        "%d\n",
> >                                        orangefs_dcache_timeout_msecs);
> >                         goto out;
> >                 } else if (!strcmp(attr->attr.name,
> >                                    "getattr_timeout_msecs")) {
> > -                       rc =3D scnprintf(buf,
> > -                                      PAGE_SIZE,
> > +                       rc =3D sysfs_emit(buf,
> >                                        "%d\n",
> >                                        orangefs_getattr_timeout_msecs);
> >                         goto out;
> > @@ -256,14 +251,12 @@ static ssize_t sysfs_int_show(struct kobject *kob=
j,
> >
> >         } else if (!strcmp(kobj->name, STATS_KOBJ_ID)) {
> >                 if (!strcmp(attr->attr.name, "reads")) {
> > -                       rc =3D scnprintf(buf,
> > -                                      PAGE_SIZE,
> > +                       rc =3D sysfs_emit(buf,
> >                                        "%lu\n",
> >                                        orangefs_stats.reads);
> >                         goto out;
> >                 } else if (!strcmp(attr->attr.name, "writes")) {
> > -                       rc =3D scnprintf(buf,
> > -                                      PAGE_SIZE,
> > +                       rc =3D sysfs_emit(buf,
> >                                        "%lu\n",
> >                                        orangefs_stats.writes);
> >                         goto out;
> > @@ -497,19 +490,18 @@ static ssize_t sysfs_service_op_show(struct kobje=
ct *kobj,
> >                 if (strcmp(kobj->name, PC_KOBJ_ID)) {
> >                         if (new_op->upcall.req.param.op =3D=3D
> >                             ORANGEFS_PARAM_REQUEST_OP_READAHEAD_COUNT_S=
IZE) {
> > -                               rc =3D scnprintf(buf, PAGE_SIZE, "%d %d=
\n",
> > +                               rc =3D sysfs_emit(buf, "%d %d\n",
> >                                     (int)new_op->downcall.resp.param.u.
> >                                     value32[0],
> >                                     (int)new_op->downcall.resp.param.u.
> >                                     value32[1]);
> >                         } else {
> > -                               rc =3D scnprintf(buf, PAGE_SIZE, "%d\n"=
,
> > +                               rc =3D sysfs_emit(buf, "%d\n",
> >                                     (int)new_op->downcall.resp.param.u.=
value64);
> >                         }
> >                 } else {
> > -                       rc =3D scnprintf(
> > +                       rc =3D sysfs_emit(
> >                                 buf,
> > -                               PAGE_SIZE,
> >                                 "%s",
> >                                 new_op->downcall.resp.perf_count.buffer=
);
> >                 }
> >
> > base-commit: 78f4e737a53e1163ded2687a922fce138aee73f5
> > --
> > 2.34.1
> >
