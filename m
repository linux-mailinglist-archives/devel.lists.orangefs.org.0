Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id D7995AB6E3C
	for <lists+devel-orangefs@lfdr.de>; Wed, 14 May 2025 16:38:47 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id 889E93837A7
	for <lists+devel-orangefs@lfdr.de>; Wed, 14 May 2025 10:38:46 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1747233526; bh=6XWdJgSEvyLJSh3QnLL5Y/Q+Mj3leHuMtjRqxY0hleY=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=4olgUNNr0uDBPZDeFJ50/VfOI0CKZr6AnIVdTMro+zj7BHqkFzYJZYoT6BnEJ8qE9
	 Avzz5AAO7WUyoKiJUAgIXABY70dAur/ujbnecmyPe0OVdbkpzQjiXuIDTxycvLnrvR
	 XCogcd1u1PQhKxJ2ULjc8y+51xQpQsWnVV0+WfSFLkeZ/rSNdYXXafoIU5hSHRLRvz
	 FLWxH/xiDtLkLXi4WI5UG6oMBQ3trjsDgObyPsxc4Td0ebM1PBJ02iafbaqJSiWHaT
	 IszVI3F8gylY897Au+jo7r47X0vzdZenKw9MwAWW/da9JpUK+p1sEhCi1OcI1j0Axk
	 lj4U+rqM+C8WQ==
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	by mm1.emwd.com (Postfix) with ESMTPS id EBD32380AB8
	for <devel@lists.orangefs.org>; Wed, 14 May 2025 10:38:44 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="UAZBCawo";
	dkim-atps=neutral
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af6a315b491so5979745a12.1
        for <devel@lists.orangefs.org>; Wed, 14 May 2025 07:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747233524; x=1747838324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qj7RgkMhTner4sa4FzvrC5A/c9e3z4cp04U9TUzXCKQ=;
        b=uW8H8egxLLfh1k1pbaU9AfXGC2Wx7w/yLS1DCgbD+JpwZzIV9E9yfMy3zEbb9T6sWN
         zkCCe/aQOl70uT0Gwn7bjaDAv78oDsPao//fobZUoIlp+Z+3yda2n1pn8No3vPmaG55L
         0aaKA4Wn01GSH46ZFcDE662TOw7wZs3yKTOb2y67AxeHT2XTaZBqORS64cL5zkLKfz/r
         DAJAoNT7cG5T1FCGPppgf8VtsF9kxFhOFYw9AzJk0LWGIBorvHy8tCWRVeSqJI15Qb+L
         JrEM61n7BOmDgXFjk3CikLul+vkhNOyLaSjI1CqNxoPhHaCGV1ruMuTgVs73WHA5E0K2
         LZKw==
X-Forwarded-Encrypted: i=1; AJvYcCUoYzKGADPHxdKdEktL8hNniJQr5XxCGaR7vhKixPQExy/twikuJptPxgwJEeE34nG3xR4OTQ==@lists.orangefs.org
X-Gm-Message-State: AOJu0Yx1FdvplKKx17Jx2XW0oj2rf5Khf4DKRgPZvYMyqox4lNBvazCr
	LZ2ze+lF0NIWpI/IhpCid2BZ7/wcHrlED2TA8RiPIKHxbbJ+3gkS4LcJalW/pWjkaDka2YdoHzh
	/IBCjtjYk+npj1095kbk5JQrE4Fp47umbDYA9
X-Gm-Gg: ASbGncvVBr5z/7rOypn092OBUEop93vXyUKVbhsAW5gItC4OI4ah+2ch9GEl3Ryqfiv
	Vj8C/a/J23NbS0lDGtNXI/8PjVokjmNUwFGtbBiZI4H3IIaa0uipaf8WhrehG+mQr2RS3yVHz1L
	G6qldaRDKczp19Flp68TuZMT/JJF5ljgkdhUjLWKD7SnWP
X-Google-Smtp-Source: AGHT+IHO56y3whAPbyDBos/nG5P8QVbcKxtQtxBWdOxCDl+TWWVSVhAzjBKh0bUXG+wCV2qXJganXjU7BA7habYytao=
X-Received: by 2002:a17:90b:38c6:b0:2ee:b2e6:4276 with SMTP id
 98e67ed59e1d1-30e2e62a163mr5644528a91.27.1747233523636; Wed, 14 May 2025
 07:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAOg9mSTLUOEobom72-MekLpdH-FuF0S+JkU4E13PK6KzNqT1pw@mail.gmail.com>
 <2040f153-c50e-49ea-acb6-72914c62fecb@intel.com> <CAOg9mSRPok2NR5UNkkyBb8nGgZxQo36dfvL0ZWSpMZ3pT5884Q@mail.gmail.com>
 <86a9656f-211c-4af5-9d19-9565e83fb56d@intel.com>
In-Reply-To: <86a9656f-211c-4af5-9d19-9565e83fb56d@intel.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Wed, 14 May 2025 10:38:32 -0400
X-Gm-Features: AX0GCFvV9hEv_DN2oszsfzUa0XcZe0oaBaPATVHKSE2v_h_Ny7B-LPQSIHfESK8
Message-ID: <CAOg9mSS55ocm8G-obQj8C=e7YcMT5nrMAUXAVm6uOfVad7A_Ew@mail.gmail.com>
Subject: Re: [REGRESSION] orangefs: page writeback problem in 6.14 (bisected
 to 665575cf)
To: Dave Hansen <dave.hansen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: Y2MYDWICFYL4B2AA5RRC6DQAS5COYFYF
X-Message-ID-Hash: Y2MYDWICFYL4B2AA5RRC6DQAS5COYFYF
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-fsdevel <linux-fsdevel@vger.kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, devel@lists.orangefs.org
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/Y2MYDWICFYL4B2AA5RRC6DQAS5COYFYF/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

I believe I have a couple of adjustments to the counters that make
things flow properly again, including through xfstests numerous times on
top of 6.15-rc6.

I guess we had this bug all along, I'm glad Dave's patch uncovered it.
I think Dave's patch probably should have been pulled during a merge
window instead of halfway through rc7 though. Maybe it got talked
about a lot and I missed it.. I don't see where it has caused any other
problems but 6.14 is on Fedora 42... orangefs is broken there.

-Mike

diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
index 5ac743c6bc2e..08a6f372a352 100644
--- a/fs/orangefs/inode.c
+++ b/fs/orangefs/inode.c
@@ -32,12 +32,13 @@ static int orangefs_writepage_locked(struct folio *foli=
o,
        len =3D i_size_read(inode);
        if (folio->private) {
                wr =3D folio->private;
-               WARN_ON(wr->pos >=3D len);
                off =3D wr->pos;
-               if (off + wr->len > len)
+               if ((off + wr->len > len) && (off <=3D len))
                        wlen =3D len - off;
                else
                        wlen =3D wr->len;
+               if (wlen =3D=3D 0)
+                       wlen =3D wr->len;
        } else {
                WARN_ON(1);
                off =3D folio_pos(folio);
@@ -46,8 +47,6 @@ static int orangefs_writepage_locked(struct folio *folio,
                if (wlen > len - off)
                        wlen =3D len - off;
        }
-       /* Should've been handled in orangefs_invalidate_folio. */
-       WARN_ON(off =3D=3D len || off + wlen > len);

        WARN_ON(wlen =3D=3D 0);
        bvec_set_folio(&bv, folio, wlen, offset_in_folio(folio, off));
@@ -320,6 +319,8 @@ static int orangefs_write_begin(struct file *file,
                        wr->len +=3D len;
                        goto okay;
                } else {
+                       wr->pos =3D pos;
+                       wr->len =3D len;
                        ret =3D orangefs_launder_folio(folio);
                        if (ret)
                                return ret;

On Wed, Apr 30, 2025 at 5:06=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> On 4/30/25 13:43, Mike Marshall wrote:
> > [ 1991.319111] orangefs_writepage_locked: wr->pos:0: len:4080:
> > [ 1991.319450] service_operation: file_write returning: 0 for 000000001=
8e1923a.
> > [ 1991.319457] orangefs_writepage_locked: wr->pos:4080: len:4080:
>
> Is that consistent with an attempt to write 4080 bytes that failed,
> returned a 0 and then encountered the WARN_ON()?
>
> While I guess it's possible that userspace might be trying to write
> 4080 bytes twice, the wr->pos:4080 looks suspicious. Is it possible
> that wr->pos inadvertently got set to 4080 during the write _failure_?
> Then, the write (aiming to write the beginning of the file) retries
> but pos=3D=3D4080 and not 0.
>
> > [ 1991.319581] Call Trace:
> > [ 1991.319583]  <TASK>
> ...
> > [ 1991.319613]  orangefs_launder_folio+0x2e/0x50 [orangefs]
> > [ 1991.319619]  orangefs_write_begin+0x87/0x150 [orangefs]
> > [ 1991.319624]  generic_perform_write+0x81/0x280
> > [ 1991.319627]  generic_file_write_iter+0x5e/0xe0
> > [ 1991.319629]  orangefs_file_write_iter+0x44/0x50 [orangefs]
> > [ 1991.319633]  vfs_write+0x240/0x410
> > [ 1991.319636]  ksys_write+0x52/0xc0
> > [ 1991.319638]  do_syscall_64+0x62/0x180
> > [ 1991.319640]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > [ 1991.319643] RIP: 0033:0x7f218b134f44
>
> This is the path I was expecting. Note that my hackish patch will just
> lift the old (pre-regression) faulting from generic_file_write_iter()
> up to its caller: orangefs_file_write_iter().
>
> So now I'm doubly curious if that also hides the underlying bug.
