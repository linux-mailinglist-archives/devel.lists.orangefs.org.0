Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 257ACA489AD
	for <lists+devel-orangefs@lfdr.de>; Thu, 27 Feb 2025 21:18:46 +0100 (CET)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id EC8E9385835
	for <lists+devel-orangefs@lfdr.de>; Thu, 27 Feb 2025 15:18:44 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1740687524; bh=00JAUNRBO82Jpj6i/1z3tlutIj2CrE3y5m0nLjmSaZs=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mDPjoe7T6LGH5bwmCOTHZlKzAualx1HQfc2JFl0zqkRH2rzVDuxPqQ/fC3aZtVmL+
	 vo2toSG42BdJa7TD+LesBtIMZptvbKpdhvruvCtq3h7qC/uDqE+L21e3otPUQN6hFI
	 AopDPZBSMaDf1uF+AaMBMc0EP15YsWYD6A8rM+O9Zjqn5nXyAv4vBFTko2XczSwIAw
	 ZZD0EIpNWFsGoGM9T41g9PLM89/24BROzUDsAnVodyXUXWh4FL6arkjoB4s5W9yLVV
	 8IccXijl0IwM7xeYzZ2kvOTYR757ZWJhZwXMkbWrI13nP2yxD6l3e38bwBVo4iHzWK
	 S2TA/shdO2N1w==
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	by mm1.emwd.com (Postfix) with ESMTPS id 27D9138578F
	for <devel@lists.orangefs.org>; Thu, 27 Feb 2025 15:18:41 -0500 (EST)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="i2m1jA6T";
	dkim-atps=neutral
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22337bc9ac3so27344495ad.1
        for <devel@lists.orangefs.org>; Thu, 27 Feb 2025 12:18:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740687521; x=1741292321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tav4xqr1XQO33V7brGh1x4z4ojxCyIzenuMBnymkdj0=;
        b=czLrDnLiKUIIIUQAk8b+GGbAr6ikmgHtncDmA/iGP5bLKypjnLTSACWq6ydY7hnmLT
         8AjDYV3Lx6w09CUjIMZZeoXkXQZusl2FdILDYofADG3CO+DyqBVvypwJGPuS/oeNx9za
         6lhm2SnA+OkZoUUybchLHEO5JymJn5ExgFnlKQMApMo2A1w3x8vs4xsihhqY2hZ8g47H
         8jXbTOxOvzq/rNqlQLZyU54EIu+gAAEbnbD704aDc37JxxSfVHJSO1S7BePka6NeIx1L
         w05wElBPYkJhAAXiey5KSzPRMIlMcyneGmLpp0RSuPzHR/UWrA/n4WVXT9+BOSwRucUh
         gbTg==
X-Forwarded-Encrypted: i=1; AJvYcCWrW2KlsTkCC/ncV3xrIu4VdGwSvHly5ez/rroKqZP9QKfmeA1wvxQA+9+EPJgWrsruw2Seyw==@lists.orangefs.org
X-Gm-Message-State: AOJu0YzGrR9OEVo49BpvdcmitUMglwVvAf4FWa+VqruLJJYNkVCws9wg
	BF4NnfSwuGM9fBHoHOLuxfPsUzGPw9VVgCkI4VzeQ56msQHBvmafUaMQXff1/w6YdNqNe3ooxRT
	bMw19hqXjBakRjiR8t7QO9SfwVScXqQqs8Q94
X-Gm-Gg: ASbGncsERGeA/B3BAOaCNbZnEpZZN4CEpFOWOW9fap3jUATaFBQ4JyRps5Uk3eqTXuD
	uC34lubQGUoUgxvc20EKnZQPJtrMD9RdX/U41l7/f1Om1Ef9jBaF3k4eCFrKlEMddB9ApZuE9Uw
	sgstJm7KYXyVxraRq024s=
X-Google-Smtp-Source: AGHT+IEwPeSZd+nviOPAGSCL8vdQ/b8GSfSOVyaWhXhLX4EBlFjIM1euIMkWJiJ4yw1/u/ogtDQea2xftPItkEUVjDw=
X-Received: by 2002:a05:6a20:4326:b0:1ee:e6a5:e9ba with SMTP id
 adf61e73a8af0-1f2f4c98541mr704801637.9.1740687520989; Thu, 27 Feb 2025
 12:18:40 -0800 (PST)
MIME-Version: 1.0
References: <20250224180529.1916812-1-willy@infradead.org>
In-Reply-To: <20250224180529.1916812-1-willy@infradead.org>
From: Mike Marshall <hubcap@omnibond.com>
Date: Thu, 27 Feb 2025 15:18:30 -0500
X-Gm-Features: AQ5f1JrVpdhsBtW-z-FEoj6BWJVTUi2KV6HsBGiyAgHXFunOdlVyR66RkDE49jQ
Message-ID: <CAOg9mSQ2o0zaBhY37bBfR9CDKv=-EY3SzxEh0mFYiNvEjZaZKQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] Orangefs fixes for 6.15
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 577ZMYXDNCAO4CDHQGMOXZ64XUZYDVAL
X-Message-ID-Hash: 577ZMYXDNCAO4CDHQGMOXZ64XUZYDVAL
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org, linux-fsdevel@vger.kernel.org
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/577ZMYXDNCAO4CDHQGMOXZ64XUZYDVAL/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

Howdy Matthew... I got your patch and deciphered the note
about leaving out the include files. It is compiling on top of
 Linux 6.14-rc4 now, and I'll let you know how testing goes...

-Mike

On Mon, Feb 24, 2025 at 1:05=E2=80=AFPM Matthew Wilcox (Oracle)
<willy@infradead.org> wrote:
>
> The start of this was the removal of orangefs_writepage(), but it
> quickly spiralled out of hand.  The first patch is an actual bug fix.
> I haven't tagged it for backport, as I don't think we really care about
> 32-bit systems any more, but feel free to add a cc to stable.
>
> Patches 2 and 3 are compilation fixes for warnings which aren't enabled
> by default.
>
> Patches 4-9 are improvements which simplify orangefs or convert it
> from pages to folios.  There is still a little use of 'struct page'
> in orangefs, but it's not in the areas that deal with the page cache.
>
> Matthew Wilcox (Oracle) (9):
>   orangefs: Do not truncate file size
>   orangefs: Move s_kmod_keyword_mask_map to orangefs-debugfs.c
>   orangefs: make open_for_read and open_for_write boolean
>   orangefs: Remove orangefs_writepage()
>   orangefs: Convert orangefs_writepage_locked() to take a folio
>   orangefs: Pass mapping to orangefs_writepages_work()
>   orangefs: Unify error & success paths in orangefs_writepages_work()
>   orangefs: Simplify bvec setup in orangefs_writepages_work()
>   orangefs: Convert orangefs_writepages to contain an array of folios
>
>  fs/orangefs/file.c             |   4 +-
>  fs/orangefs/inode.c            | 149 ++++++++++++++-------------------
>  fs/orangefs/orangefs-debug.h   |  43 ----------
>  fs/orangefs/orangefs-debugfs.c |  43 ++++++++++
>  include/linux/mm_types.h       |   6 +-
>  include/linux/nfs_page.h       |   2 +-
>  include/linux/page-flags.h     |   6 +-
>  7 files changed, 116 insertions(+), 137 deletions(-)
>
> --
> 2.47.2
>
