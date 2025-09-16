Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B46B598C8
	for <lists+devel-orangefs@lfdr.de>; Tue, 16 Sep 2025 16:08:13 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id 3B9CB385905
	for <lists+devel-orangefs@lfdr.de>; Tue, 16 Sep 2025 10:08:02 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1758031682; bh=kRQcsK9SAd4pyDFqtntutLf4Eii0iqU6mX7lc27YYAg=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mC1QzDdKP3fn/urA3jbdMv1wxe0l+DPvzlID2h7XT18aQxdMs3Obo4IOkNdEZKJn7
	 Mdd7QrBQdyTENVQtwKKfsXebh0sEc31PmmaChYCfe86NeYYZbrEaCfnpPOWYowf4B+
	 2KEag0X9S1Mx/AZ34BTeZMIi2ZJECFRs+uVGKRpJdv6f9/JYbnn/N++amW1WEmVRP6
	 ZBk0jxtPtFEMOsyRya4ExLtWrjLIJRcCaPn22xN4hEVYcu7JeSc3AXKLZyK0zA94GS
	 9PrObZ4O+Bz+HLbHi0TXzVveWZ0BFe+thsEnUTQKTiWQTGF0uhzFhImtFIggfB2EOF
	 zOm64SKLxOI2A==
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	by mm1.emwd.com (Postfix) with ESMTPS id 8E80D38574E
	for <devel@lists.orangefs.org>; Tue, 16 Sep 2025 10:07:59 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="0ee4TW/2";
	dkim-atps=neutral
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-32e1288eb0cso2240561a91.3
        for <devel@lists.orangefs.org>; Tue, 16 Sep 2025 07:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758031678; x=1758636478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zziBEVuk7a5aOxS+Jo12rA99I9jzlIEUx+qXY0Q3Bc=;
        b=cCWGx3teBkiBMbkf2Lh/uoi4PrP+7A/SgHCdE5iSB6EN8a17CaJkh6qbT3h15lp6bS
         VIbd0GfmKknA6qYR7xdzH+5wXk7JQQQUvOu5N3g8ihru7/DFXvuKVwypj2XPsfHtHXAx
         YHjhxrP4izYvPzYbiZ7yJ62MctFqelGasEG9yi1rGsc4CDcj6B56G7fWNy/SY0lhX3hg
         hRuqsY7N7zJlztmV/pqSZQZnZXQ3dxyn6rtCNxzCemNsbOA1nJFd/os9u1FZgQe8LM+Y
         OZ6wMgJQzAC8GpY2fUGceLW1Whs044TNGbFhUObTdHJDaTZsFsjr+w1ABxwyygdIppEx
         ZycA==
X-Forwarded-Encrypted: i=1; AJvYcCVQHpyL+N7hgu1/aa/G35TnE12KiwIQJ8QbzEgPPVAr9j4LWgKelNN2YgyyQkysq77AqlP+yA==@lists.orangefs.org
X-Gm-Message-State: AOJu0YwmOmwfKT3/irA3oVkDPcvoQprc6CQIP0Hq9P5R6Izmo3A+d4tp
	MNsmhToDgyTBbVd8WcCIyWDSQQNvIKkPg6Pt+BTFOFx4Dp10GosXZlF2CfdPBoHURM1lq0DElFS
	+JB0aT1Jv0UrSAXsZ8KxM7rqcluGCLkLp5dYwuuYL
X-Gm-Gg: ASbGnct7YFjVJMCAjIMCkuK1azkFJj7wBma0NDhx2kBO2kPT69qcp1/cb4AJ3jb/CRW
	zQJlVEsued/njUdeKe0xQ/Tk/Kj4sKWZIrUFp40IeNlyD0boV70BOABwH9IrE8QA22W7SFhDhjX
	tZ0SRG9rXLOgkTRVTl2EqsfqTSVHkvtvThV476khtqW1slVJxCAfOXGbO57zOYlcP+6BmDTQMPu
	BHZw7ieQK8NZfvFJRs=
X-Google-Smtp-Source: AGHT+IEGoGAOtPQiRPxN3yQnEwgHzHqJP/qJT/eOYTxY20OQn9yF9cXboTP1/wrfV1rsMg/Dd1HJRF7XmfmTjc/9bh4=
X-Received: by 2002:a17:90a:c10e:b0:32e:6bf4:5435 with SMTP id
 98e67ed59e1d1-32e6bf4594dmr8448105a91.18.1758031678279; Tue, 16 Sep 2025
 07:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <1ae9e8e9-596d-4510-89b7-799a735d390fn@aisle.com> <20250905153149.GC32734@1wt.eu>
In-Reply-To: <20250905153149.GC32734@1wt.eu>
From: Mike Marshall <hubcap@omnibond.com>
Date: Tue, 16 Sep 2025 10:07:47 -0400
X-Gm-Features: AS18NWBWOQ2mQi36YDt9ZaAkxYgTeciwlA8D8ztUKYj8negFkpomaA3bnaNPA6I
Message-ID: <CAOg9mSRNS0f1ui9GJeCGZ_AovvcCvV-3vVjDm=FXGwtbLA3jjQ@mail.gmail.com>
Subject: Re: [Security] OrangeFS: infinite loop in xattr_key() enables local DoS
To: Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: QGCIUGFM2Y2MQXPYIKWZYBQDBYFANVSZ
X-Message-ID-Hash: QGCIUGFM2Y2MQXPYIKWZYBQDBYFANVSZ
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Disclosure <disclosure@aisle.com>, security@kernel.org, devel@lists.orangefs.org
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/QGCIUGFM2Y2MQXPYIKWZYBQDBYFANVSZ/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

Thanks for the report on the orangefs xattr problem.

I easily reproduced this with setfattr and getfattr, causing a kernel
oops, hung user processes and corrupted orangefs files. I created a
patch with Disclosure's suggested fix.

After xattr_key started working right, xfstest generic/069 exposed an
xattr related memory leak that lead to OOM. xattr_key returns
a hashed key.  When adding xattrs to the orangefs xattr cache, orangefs
used hash_add, a kernel hashing macro. hash_add also hashes the key using
hash_log which resulted in additions to the xattr cache going to the wrong
hash bucket. (A side effect of?) generic/069 tortures a single file
with getattrs for a non-existent xattr: "security.capability". Orangefs
negative caches on getattrs which includes a kmalloc. Since adds to the
xattr cache were going to the wrong bucket, every getattr for
"security.capability" resulted in another kmalloc, none of which were
ever freed.

I changed the two uses of hash_add to hlist_add_head instead
and the memory leak ceased and generic/069 quit throwing furniture.

I'll have this patch in my linux-next tree shortly.

-Mike Marshall

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
