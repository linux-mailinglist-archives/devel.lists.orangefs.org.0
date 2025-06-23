Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1DAAE4B8F
	for <lists+devel-orangefs@lfdr.de>; Mon, 23 Jun 2025 19:02:53 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id 44C3C385685
	for <lists+devel-orangefs@lfdr.de>; Mon, 23 Jun 2025 13:02:52 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1750698172; bh=MhMfGlmeM4C5z3L/kbBx76/f30XBbi13AwE8phWRKp8=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u5bGFjcYHoCWvpIhCMMcy6mG+jIywl6sXb5OyW9fVYsFb0k+a1W+y9gfHYhxXu/GZ
	 BZyNLjWZ1e3v5++5xkQJfL8f2UrltdZk22k7duLeWQQQRWJdqX3SLRgFtw0EiYcU64
	 ZEbvW5tQi7SEoxM4bGOs2ZoRSaPhXXph5435sae06dNSwZcq6yx9MvwJkPS2ur4sT4
	 Xd/p24tUdDS6aT0Me+x5gULOEiInrUyT6X6r/tL3TYmGIAs5T0MgayiNkc9zEcFtUm
	 YpO2Bms14ojL/mfcf3xCnQZmZcILbBqAJwRcfLClNzeVPF6YnJkveL2/Zawg38Mi3f
	 OpiIkUyiVCCYQ==
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	by mm1.emwd.com (Postfix) with ESMTPS id 01E953835D7
	for <devel@lists.orangefs.org>; Mon, 23 Jun 2025 13:02:50 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="fTRJ22Me";
	dkim-atps=neutral
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so3303257a12.3
        for <devel@lists.orangefs.org>; Mon, 23 Jun 2025 10:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750698170; x=1751302970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MhMfGlmeM4C5z3L/kbBx76/f30XBbi13AwE8phWRKp8=;
        b=VA0/FJTG4kpysE0MBRpX3pAHBD+HEkQrdO/I0lPrjbyy8ies/oYJSNnISx8jxajykd
         G6XKNCQfNCJHiNTbjpMB0lMryOBWJmtDBLGst5DEKF9P/Bj/XhdYVm5c9jfoeANYGuQ4
         zaHJHAAoaP45SvpZIkjL96ZaDOJLhQ6VMxxd7wZuME98zEh7TaPzSsKs9+5Ag8B1hji7
         fLYzXsV3RhImqF5aIWWvbHI1OhD7ejisuDayOT6IcAAMK5QCbHzV4kwEnSHwp626MSFV
         uxDdGtlZlamBLxtI2mNQBmxhJqx7HCLHUEmXiR1OvQ36RayZgcv9xtY/+9cLN8qrZvMn
         MOZg==
X-Forwarded-Encrypted: i=1; AJvYcCVoiIH9+VMO7SajSejON3duSyT3Fl5N+o3imv7lksaiDuKwdxFVM5V+0mA80SYjOj3BI2XjfQ==@lists.orangefs.org
X-Gm-Message-State: AOJu0YyicxwiZ4OHv6fqkcTQRmU3f4jdKQXFcKZW4C+ydVmq0KkpsrWx
	u3f+1GuwnviE60MVNrIc4+Yb27irIhw6PVMWQTmqR6vqBD6iYCZbsQZKBiwwDjojRqKZB2Hizb+
	TXjeaQp64MnxGybR7s/FXHN3qLwhYwfzMEwxrTrdN
X-Gm-Gg: ASbGncvaKTfD6RP0377s+paHUiupjDvcZHbFg0ICns1PQs6xD2fGOO+fjZCqda7sOnG
	8ae/ZRdAV4CUTSWNCYF3JdzZtVrMazZeAISh/KWKCEQNph98/19JMdv5yorPjUIe1NQ40xcS50x
	XDbE5PuSg4SCf1OijYzcI+YwQbns3W+GoLqeK+QTzq+vDP2Im7p1JBcgU=
X-Google-Smtp-Source: AGHT+IHBUhmZyoZ2ZPKvz6pdpo2lOZcsTUG0V9m5Av3tGsK3wA1iQ6MlrsQOgQpjnluNSPr5QeZvuKJclzIuyQKHVno=
X-Received: by 2002:a17:90b:2f0d:b0:311:9c9a:58c5 with SMTP id
 98e67ed59e1d1-3159d643c15mr24825115a91.12.1750698169856; Mon, 23 Jun 2025
 10:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250608163559.36401-1-a.jahangirzad@gmail.com>
 <CADf5TKvyKvaP3eZUR81ND6JQUfVqUEroCrXp=joZ8GHdu2EBbA@mail.gmail.com>
 <20250622184815.GW1880847@ZenIV> <CADf5TKvorgeCJ=6u6=jhxetUhDx3SCnUBe+cpbUQu5gADqRRCg@mail.gmail.com>
In-Reply-To: <CADf5TKvorgeCJ=6u6=jhxetUhDx3SCnUBe+cpbUQu5gADqRRCg@mail.gmail.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Mon, 23 Jun 2025 13:02:38 -0400
X-Gm-Features: AX0GCFtkqpzhmG4Q49Iqw-ox40GRzXvAovLgprfA4QlL9qfM2t5DZn7sHmIPDQk
Message-ID: <CAOg9mSQGNOrA0p4q+9Q_tLCMtBnCuEc5d+TYXdV+7XT4pqOQNg@mail.gmail.com>
Subject: Re: [PATCH] fs/orangefs: use snprintf() instead of sprintf()
To: Amir Mohammad Jahangirzad <a.jahangirzad@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VE7JDEIKM3P5YGLFIMUCLV37GK7HZL5T
X-Message-ID-Hash: VE7JDEIKM3P5YGLFIMUCLV37GK7HZL5T
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Al Viro <viro@zeniv.linux.org.uk>, martin@omnibond.com, devel@lists.orangefs.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/VE7JDEIKM3P5YGLFIMUCLV37GK7HZL5T/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

Hi Y'all...

I was about to add Amir's patch on top of 6.16-rc3 and run it through
xfstests, when I saw Al's comment.

Al patched a similar bit of code in orangefs-debugfs.c without
removing sprintf:

45063097 - "don't open-code file_inode()"

When I look at orangefs_debug_read as it is now, I might be trusting
file->private_data's length too much and Amir's patch might risk sending
a bad sprintf_ret to simple_read_from_buffer. Al, could you be
more explicit?

-Mike

On Sun, Jun 22, 2025 at 4:10=E2=80=AFPM Amir Mohammad Jahangirzad
<a.jahangirzad@gmail.com> wrote:
>
> On Sun, Jun 22, 2025 at 10:18=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk=
> wrote:
> >
> > On Sun, Jun 22, 2025 at 10:09:58PM +0330, Amir Mohammad Jahangirzad wro=
te:
> >
> > > > Replace sprintf() with snprintf() for copying the debug string
> > > > into a temporary buffer, using ORANGEFS_MAX_DEBUG_STRING_LEN as
> > > > the maximum size to ensure safe formatting and prevent memory
> > > > corruption in edge cases.
> >
> > Out of curiosity - have you actually looked at the format used there?
>
> No, I just found this through static analysis. Is there any issue with it=
?
