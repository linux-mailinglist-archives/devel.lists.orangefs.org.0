Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D106C6AFA
	for <lists+devel-orangefs@lfdr.de>; Thu, 23 Mar 2023 15:30:50 +0100 (CET)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id 52D49383660
	for <lists+devel-orangefs@lfdr.de>; Thu, 23 Mar 2023 10:30:49 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1679581849; bh=tSq4xwz5iQtkRkcp5qug2DZeeriX3tfWo/pt2sBC7MI=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iGgK9nPsS2YiaG020ZF8pnCC0F4C6LZ0K4d1L/mpvBq3xZtyLxJ2IGRIUngjX3GEv
	 BFChXF/XjJ/sy+XvWfm/CLQafpDwGOOgrq1MrH4/WzPB+PRCZ72WWk5GXwYB1XmD2Z
	 u58dZDUC99PvU1sWVB3UmZ+tNBp+JQh4NyeoZlL51Hy1w/V0luY1EwNX/Sqe4Ltr6d
	 uphEyKtpi44N2L7CWwfPJGVQQgJBnyOKgMeiZK/reIQOgiU4HJP6xX/0evYRyFHYox
	 LSBFZA844Rc+qj7gtUk6aTkleHFOMbXNFYMK9nFVrZijYXJhZAKvs4zF5GGWasFcBY
	 aJNUAoSZFcGGQ==
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	by mm1.emwd.com (Postfix) with ESMTPS id D8CE4383634
	for <devel@lists.orangefs.org>; Thu, 23 Mar 2023 10:30:46 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20210112.gappssmtp.com header.i=@omnibond-com.20210112.gappssmtp.com header.b="uga6xPbl";
	dkim-atps=neutral
Received: by mail-qv1-f50.google.com with SMTP id m16so6811274qvi.12
        for <devel@lists.orangefs.org>; Thu, 23 Mar 2023 07:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond-com.20210112.gappssmtp.com; s=20210112; t=1679581846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DW5cWuSORuMPl9h4M/OMu4zN6Ab689Cgd2Jmn907uzA=;
        b=uga6xPblyjNwQ0nys0O9OMOnWPlxzoqUx0tub1g4jl3Ds7H0qu2WTey6xF5KYLxKjC
         SCNdX/4AXYIE5IhDdtecko+9IOBtUIc3U2CM4hPqaHHiSjJXBWP+o6JLCwKslIKRmAED
         TXE8V7Fa5Vj5MdO1Sgso1Toii0RePFj640IY5JVqwEa1uZwDrQZ5LDzFX93GFGZY9IjQ
         hb8Z808MK7gqHrpq+J6Wxii0pqN6Kedc0VTbCmzHxDcz5RluBsBf5YY47foQKVJ8WL5w
         Hhs7tyAu+HDhks/IkXKF2t4EX3GViwlbB8pSikG3+R69thN52bWR4mIjSGgorkjzAiC0
         GC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679581846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DW5cWuSORuMPl9h4M/OMu4zN6Ab689Cgd2Jmn907uzA=;
        b=cHDAsrdHNW0UPhEJTtCBOVE63p9kFb1AmNOQ8Fj2zFJQUt4ch1w1IOzHAc2TGHlo7N
         e7p0iNS7mYlNmiQJLFT0vrIAbGmW87qxGS+mdJHVXvwXy1/wo6Ghf0jHiKLJXt5coH/n
         hrZRSXXVVC/IYLdWACuv8RTVS3vRf82tKUEiFw64F/9bGJoGnbSifUNetYFY5p60Ep9q
         PjaVJ+aC1OYrufM9U1rLwHiYeqQ05MDwqoCHj/fubQ50wsJF+p3HLMed9hwD0gaDslX3
         x8MWd12e8Azhj5QFN2fejNycUAUO67zSrxMY1rHtuIytE+8UvG3ysVQM8MI6VUBre6NT
         V7kQ==
X-Gm-Message-State: AO0yUKV9M8FUfcPQbPJosnytZ5JuUP6xLe0397fUDKs64kOxFeyohHm4
	jtcmnBMXzx1BrqV6nCQBnJlIur83rU0Cb+1zRRp9kw==
X-Google-Smtp-Source: AK7set/trVllkfcEi+yg3oqpS8DY+A/uEckTTWNRYDqUdJd5erFFIJB2DTR1p2z4pS/Mo+VlMX55/q/gvrdpE0I/XKA=
X-Received: by 2002:a05:6214:8c7:b0:537:7476:41f7 with SMTP id
 da7-20020a05621408c700b00537747641f7mr1552535qvb.3.1679581846154; Thu, 23 Mar
 2023 07:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20230322135015eucas1p2ff980e76159f0ceef7bf66934580bd6c@eucas1p2.samsung.com>
 <20230322135013.197076-1-p.raghav@samsung.com>
In-Reply-To: <20230322135013.197076-1-p.raghav@samsung.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Thu, 23 Mar 2023 10:30:35 -0400
Message-ID: <CAOg9mSRvPDysNF-GV_ZGf8bu1-50wA5y7L=LuZwGp+vEVzsu1Q@mail.gmail.com>
Subject: Re: [RFC v2 0/5] remove page_endio()
To: Pankaj Raghav <p.raghav@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: Q6BW4MF2V4OSPDNH6QU7E6UXDIVMLMNY
X-Message-ID-Hash: Q6BW4MF2V4OSPDNH6QU7E6UXDIVMLMNY
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: senozhatsky@chromium.org, viro@zeniv.linux.org.uk, axboe@kernel.dk, willy@infradead.org, brauner@kernel.org, akpm@linux-foundation.org, minchan@kernel.org, martin@omnibond.com, mcgrof@kernel.org, devel@lists.orangefs.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org, gost.dev@samsung.com
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/Q6BW4MF2V4OSPDNH6QU7E6UXDIVMLMNY/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

I have tested this patch on orangefs on top of 6.3.0-rc3, no
regressions.

It is very easy to build a single host orangefs test system on
a vm. There are instructions in orangefs.rst, and also I'd
be glad to help make them better...

-Mike

On Wed, Mar 22, 2023 at 9:50=E2=80=AFAM Pankaj Raghav <p.raghav@samsung.com=
> wrote:
>
> It was decided to remove the page_endio() as per the previous RFC
> discussion[1] of this series and move that functionality into the caller
> itself. One of the side benefit of doing that is the callers have been
> modified to directly work on folios as page_endio() already worked on
> folios.
>
> mpage changes were tested with a simple boot testing. zram and orangefs i=
s
> only build tested. No functional changes were introduced as a part of
> this AFAIK.
>
> Open questions:
> - Willy pointed out that the calls to folio_set_error() and
>   folio_clear_uptodate() are not needed anymore in the read path when an
>   error happens[2]. I still don't understand 100% why they aren't needed
>   anymore as I see those functions are still called in iomap. It will be
>   good to put that rationale as a part of the commit message.
>
> [1] https://lore.kernel.org/linux-mm/ZBHcl8Pz2ULb4RGD@infradead.org/
> [2] https://lore.kernel.org/linux-mm/ZBSH6Uq6IIXON%2Frh@casper.infradead.=
org/
>
> Pankaj Raghav (5):
>   zram: remove zram_page_end_io function
>   orangefs: use folios in orangefs_readahead
>   mpage: split bi_end_io callback for reads and writes
>   mpage: use folios in bio end_io handler
>   filemap: remove page_endio()
>
>  drivers/block/zram/zram_drv.c | 13 +----------
>  fs/mpage.c                    | 44 ++++++++++++++++++++++++++++-------
>  fs/orangefs/inode.c           |  9 +++----
>  include/linux/pagemap.h       |  2 --
>  mm/filemap.c                  | 30 ------------------------
>  5 files changed, 42 insertions(+), 56 deletions(-)
>
> --
> 2.34.1
>
