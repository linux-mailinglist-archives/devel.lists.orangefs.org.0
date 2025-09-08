Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B22EB48D91
	for <lists+devel-orangefs@lfdr.de>; Mon,  8 Sep 2025 14:32:38 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id EF1353859D6
	for <lists+devel-orangefs@lfdr.de>; Mon,  8 Sep 2025 08:32:33 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1757334753; bh=bc9uU9H3gR3NuPKdHokEU+VY1IV93gptQcoAS/TdUdQ=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=z+/dBlV6CrArerrRPdsOiOr8VZjyGRe2gIF4cN8BDxEYmOzjdp2Air/0JcbUISoXH
	 qU2I8k7acELD56ErHkT5om34aSY8aQrnWBPFBxd6pf8FtnFJt3XyCd1vXqjdjcMdUl
	 6Lm2+2WELWDMKIS8db00sB3BnQiBDj/fDO7MX7Cw8xeWFiumVI8SK2mYvkhY7gO7U5
	 DJRbe0Iu35yl2NwR2DRy0D9YfeXHJdk9HvdfMUJLLDKYlHOXPLkHcvtYX3o4cyYW25
	 7jyGqmDqsJx0fAcBBpJfJQ0aTB4sdskCZw+zUP1amr6ijGUYRnDUQaetXVIVnZE5mB
	 GN6041ULoI6IA==
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	by mm1.emwd.com (Postfix) with ESMTPS id 2177D3859C0
	for <devel@lists.orangefs.org>; Mon,  8 Sep 2025 08:32:30 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="PrmfE6i8";
	dkim-atps=neutral
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso3672385a12.3
        for <devel@lists.orangefs.org>; Mon, 08 Sep 2025 05:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757334750; x=1757939550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ir+vos1BZa+dXNoYRWaKB8GwBMnEKHvOAm2dhdQz5R8=;
        b=oM2e5VddtWcsvu3jlsgUz6sfbErThPlilou0I9YiaApnfRJWKPPumKe20kHeyn/a6R
         OAoQg7Cv21glDl3x68h6hBnQeb+7bJYDIHn6n/ONIaF0B0+FRZxwyrH6JTC/nG//5sSy
         2weruRCmX7OGl21qLWHik9IKNngI+8LuDmeOhBXutvwNG2J3y2TQRa0woeDQ7cr94RSI
         N5unp+eCDaTyEewGGVSv1gl4R5im7XhBMF7tsV2f7qO3MK5OO/n9S8Zo9IEB1C8x0L6x
         QTN0u86MplpVcMh79MIX/+pnb+8W58X/J2oSkcA1pU3/H7XEDx7bGHEp3LUl1vRrflla
         Lvxw==
X-Forwarded-Encrypted: i=1; AJvYcCXWSmJu6yUevoRzFjclx4jyPutcOP8hcaXCT+pJbBFI1fcG4DD6bbmaN+U4pFDonBG5TJ2wFQ==@lists.orangefs.org
X-Gm-Message-State: AOJu0YzIBeo/UnLQp4RCtBwLYCmwScX0d9ekHFNkLasPTv91ZVZg17Li
	BmhWzIFX+tvMXJXyvbghRUsGTceGnFDY5o3xTFcvxP6Pu9oZWT45siGEuRUAsOgTlBtDxVjTnri
	8qPfpAm81ZeRtoFVyRLq9pFWYGPwi2emKNJ3wG4pj
X-Gm-Gg: ASbGncv/eQzuAa6EKul7y5oDX60XUrwMq9hhsnrTpmbPvUeadfKTxPoiWdA7etpigKO
	Z1zuDPJJZpxGgm7G5Wtvyap9SGV32Y88E3CInOdAgzPt9G/6UFGqc/Ng9DKvVaH9kCQLIfcfLPN
	5SQXoa0ph7YeF0obYjonq5WSSzBNou+WpnpLLkth1fwctrfLWehfOH2kOd32W2NGpRqHtX7leyy
	YjblIO6CPioD//I2tRligfkkf40XA==
X-Google-Smtp-Source: AGHT+IED+V8B0BJhWOGuFt2kxMe3gZOdFrbtqrhzBgmvbbkDWk21p3J98bLPNKoGuctDAkeWHsjRN5YjidCJOLO3p70=
X-Received: by 2002:a17:902:ec8f:b0:24c:7862:41e2 with SMTP id
 d9443c01a7336-25171cbdecemr126429645ad.31.1757334749936; Mon, 08 Sep 2025
 05:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <1ae9e8e9-596d-4510-89b7-799a735d390fn@aisle.com> <20250905153149.GC32734@1wt.eu>
In-Reply-To: <20250905153149.GC32734@1wt.eu>
From: Mike Marshall <hubcap@omnibond.com>
Date: Mon, 8 Sep 2025 08:32:19 -0400
X-Gm-Features: Ac12FXxlO1CxhYUi0paPaVVnXAUlrmQQeu3iHrgyc3e07C2MwHjsC7IjvZU9Y6U
Message-ID: <CAOg9mSR6omZ71t8azP3ffY-CjampUq_c_gmaT8g9iimuSmHE_Q@mail.gmail.com>
Subject: Re: [Security] OrangeFS: infinite loop in xattr_key() enables local DoS
To: Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: IGHYG5AQ6EVVLRXUGC5PETQTD6PMSDI2
X-Message-ID-Hash: IGHYG5AQ6EVVLRXUGC5PETQTD6PMSDI2
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Disclosure <disclosure@aisle.com>, security@kernel.org, devel@lists.orangefs.org
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/IGHYG5AQ6EVVLRXUGC5PETQTD6PMSDI2/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

Hello...

I see the message about the DOS attack on orangefs. I'll
look into it and post back to this thread...

-Mike Marshall (maintainer)

On Fri, Sep 5, 2025 at 11:31=E2=80=AFAM Willy Tarreau <w@1wt.eu> wrote:
>
> Hello,
>
> thanks for your report. OrangeFS maintainer CCed, and I'm keeping the
> rest of the original message intact below.
>
> Willy
>
> On Thu, Sep 04, 2025 at 11:17:55AM -0700, Disclosure wrote:
> > Dear Linux kernel security team,
> >
> > We believe we have identified a local denial-of-service issue in Orange=
FS
> > xattr handling and would like to report it for your assessment.
> >
> > ### Summary
> > - **Component**: `fs/orangefs/xattr.c`
> > - **Issue**: Infinite loop in `xattr_key()` due to testing the pointer
> > value instead of the character contents
> > - **Impact**: Local denial of service via spinning/hung kernel thread
> > during OrangeFS xattr operations
> > - **Reachability**: Unprivileged users interacting with an OrangeFS-mou=
nted
> > filesystem (standard xattr syscalls)
> > - **Gating**: Requires `CONFIG_ORANGEFS_FS` and an OrangeFS mount in us=
e
> >
> > ### Technical details
> > The helper `xattr_key()` uses the pointer variable in the loop conditio=
n
> > rather than dereferencing it. As `key` is incremented, it remains non-N=
ULL
> > (until it runs into unmapped memory), so the loop does not terminate on
> > valid C strings and will walk memory indefinitely, consuming CPU or han=
ging
> > the thread.
> >
> > ```c
> > static unsigned int xattr_key(const char *key)
> > {
> >     unsigned int i =3D 0;
> >     while (key)
> >         i +=3D *key++;
> >     return i % 16;
> > }
> > ```
> >
> > This function is used by multiple xattr paths, making the bug trivially
> > reachable:
> >
> > ```c
> > h =3D &orangefs_inode->xattr_cache[xattr_key(key)];
> > hash_add(orangefs_inode->xattr_cache, &cx->node, xattr_key(cx->key));
> > ```
> >
> > ### Affected versions
> > - Present in current mainline (v6.x). The function appears to date back=
 to
> > OrangeFS upstreaming (around v4.15-rc1). Precise introduction not bisec=
ted.
> >
> > ### Proposed fix (minimal, safe)
> > Check for NULL and test the pointed-to character to terminate on NUL as
> > expected.
> >
> > ```diff
> > diff --git a/fs/orangefs/xattr.c b/fs/orangefs/xattr.c
> > index abcdef0..1234567 100644
> > --- a/fs/orangefs/xattr.c
> > +++ b/fs/orangefs/xattr.c
> > @@ -54,7 +54,11 @@ static unsigned int xattr_key(const char *key)
> >  {
> >   unsigned int i =3D 0;
> > - while (key)
> > + if (!key)
> > + return 0;
> > + while (*key)
> >   i +=3D *key++;
> >   return i % 16;
> >  }
> > ```
> >
> > This preserves behavior for normal strings and yields a defined value f=
or
> > `key =3D=3D NULL`.
> >
> > ### CVSS 3.1 estimate: 6.1 (MEDIUM)
> > - **Vector**: `CVSS:3.1/AV:L/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H`
> > - **Rationale**:
> >   - Local attacker on a system with OrangeFS mounted (AV:L)
> >   - Trivial to trigger via standard xattr syscalls (AC:L, UI:N)
> >   - No special privileges required beyond access to the mount (PR:N)
> >   - Availability impact only (A:H), no C/I impact (C:N/I:N), scope
> > unchanged (S:U)
> >
> > ### Notes
> > - The issue is configuration-gated and specific to OrangeFS deployments=
,
> > but is trivially reachable where enabled.
> > - The change is small, low risk, and self-contained.
> >
> > Please let us know if you have any questions or need any clarification!
> >
> > Best wishes,
> > Stanislav Fort
> > Aisle Research
> >
>
