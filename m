Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 578796CF2CC
	for <lists+devel-orangefs@lfdr.de>; Wed, 29 Mar 2023 21:10:19 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id CE171383E03
	for <lists+devel-orangefs@lfdr.de>; Wed, 29 Mar 2023 15:10:17 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1680117017; bh=pvuwFXbgUAZbOJPeg//uwBjMCt7EFsCpzym2Ulfy8+Y=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NCz8FOgi6ZYSOlealDwj7PPveipIdaTxLpjGWrHRturlfLYU3AzT7dDwdwZiPzqnc
	 Ys16eRyLNW6j7ewybLQITMCTn9ldnM0B29XcgBxNtPdJjxv1yyjcOejR4xQ9rmmIlk
	 b3aUXKCEZVb76tU0m4tGKIGsGPW0G+qo450b03djq04BdRjsVXCfzCPxf4yyqt1BNm
	 y1HlkBi2t28hFh+0Cxgh7MjJnCtlvFiSUPO4uNqt68kOMSHsTnARfN8TnaSrx4hF7E
	 HUrxauQua93iuziV9Qnduoeq5fRrsFzjL3jiv8K1s+ky925HX7rVSg/dUZIPHlV3FK
	 LK+cN3ZHu6qfQ==
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	by mm1.emwd.com (Postfix) with ESMTPS id 4DBE7383DEE
	for <devel@lists.orangefs.org>; Wed, 29 Mar 2023 15:10:15 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20210112.gappssmtp.com header.i=@omnibond-com.20210112.gappssmtp.com header.b="ebtARkhW";
	dkim-atps=neutral
Received: by mail-qk1-f169.google.com with SMTP id bs13so5102001qkb.0
        for <devel@lists.orangefs.org>; Wed, 29 Mar 2023 12:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond-com.20210112.gappssmtp.com; s=20210112; t=1680117014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvuwFXbgUAZbOJPeg//uwBjMCt7EFsCpzym2Ulfy8+Y=;
        b=ebtARkhWyJHfb4xtYmoYLGrX90kc/jqbKsnTc1bFtUGbeXJTTtNSjWPR/37szx/txC
         HSK5H/HTOxvPW/DiblqMtvOIpwMd8KJMsw1Yrs44z/1hzgwbP/BeOHDbFz5apnBTrbpL
         9xMWAlkZ1hlrdu7JYlxAnGZu2sdiaP5L9M6tuvAqST9HmN+Xo8ZbZPu1cbZH2fDDxMMp
         RNR0rco3qMLpRaOrC4bpW4AixtA46YIItjBLMPwTA2K4hehu6SOF4jHGMGoJSREa9atw
         /D43mJK5uSjS3KTSTM7H4HFaxALEIBTlBWYpk56E7grKxlsje3B5HOWznCjKAZqya0AN
         Wgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680117014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvuwFXbgUAZbOJPeg//uwBjMCt7EFsCpzym2Ulfy8+Y=;
        b=iuonvhlmn88U/CMw3c4bOsUZA0bzJemU4cntrAxtMVxobaU90RrkAKb2X87l/P9sUn
         SxpttEyG4pdrurL91uRTBPfRdHv8atrqy7/ZkueGJ0DIO6S4HknR1hjSbuyHk6HzPI7Y
         n5EOJCTDG4+eEDfwEGVmuF9zYcdGI/kkAHA8erTDZCgAdESDXfTYLcw4i4Bca8blzlvp
         xxwtucliLNksXxeKC7+BBpneuOplTUlWf2QlAxvKOrsj9ki54UW+urw26aTLKRH35Vh6
         tyjf72uYjGI/WsDamzUAT+a+OkDUygM0Hi4tx8VEgKUTfGGyNBcR72pF2zi8A1ss1Qkg
         fEfQ==
X-Gm-Message-State: AO0yUKVZ95fvllA2FN2FFsJ9EVnkS1qoXRbe8LFYDgt+0s0xWv3WkphP
	fRrNy3Zju6g/n0nm1aCcNBROjGEdc4cJe/QOE+Dmng==
X-Google-Smtp-Source: AK7set/Yb2wuao9kPPFNja0Rt/lA/InUM3qkLAM9YZSn3q+PyxYrIVFQqkC65KODw3TvQ6tAHSedKs/4ZupBKHOYc20=
X-Received: by 2002:a05:620a:4154:b0:745:32ab:4d2a with SMTP id
 k20-20020a05620a415400b0074532ab4d2amr4017411qko.14.1680117014615; Wed, 29
 Mar 2023 12:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230328112716.50120-1-p.raghav@samsung.com> <CGME20230328112718eucas1p263dacecb2a59f5fce510f81685f9d497@eucas1p2.samsung.com>
 <20230328112716.50120-3-p.raghav@samsung.com> <ZCMF+QjynkdSHbn0@casper.infradead.org>
 <970b8475-a52e-9adc-65cf-5a95220bd35b@samsung.com>
In-Reply-To: <970b8475-a52e-9adc-65cf-5a95220bd35b@samsung.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Wed, 29 Mar 2023 15:10:03 -0400
Message-ID: <CAOg9mSRqNJUmKWaAkZZ_h1T_n1PDN2oPGHfH0z+vfGTUZD=Yow@mail.gmail.com>
Subject: Re: [PATCH 2/5] orangefs: use folios in orangefs_readahead
To: Pankaj Raghav <p.raghav@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: MH3FUFM3ZPETV2RZ37XULBRMMYQTB3HE
X-Message-ID-Hash: MH3FUFM3ZPETV2RZ37XULBRMMYQTB3HE
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Matthew Wilcox <willy@infradead.org>, martin@omnibond.com, axboe@kernel.dk, minchan@kernel.org, akpm@linux-foundation.org, viro@zeniv.linux.org.uk, senozhatsky@chromium.org, brauner@kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, mcgrof@kernel.org, linux-block@vger.kernel.org, gost.dev@samsung.com, linux-mm@kvack.org, devel@lists.orangefs.org
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/MH3FUFM3ZPETV2RZ37XULBRMMYQTB3HE/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

I thought telling you that I tested it was good :-) ...

Please do put a tested-by me in there...

-Mike

On Tue, Mar 28, 2023 at 12:02=E2=80=AFPM Pankaj Raghav <p.raghav@samsung.co=
m> wrote:
>
> On 2023-03-28 17:21, Matthew Wilcox wrote:
> > On Tue, Mar 28, 2023 at 01:27:13PM +0200, Pankaj Raghav wrote:
> >> Convert orangefs_readahead() from using struct page to struct folio.
> >> This conversion removes the call to page_endio() which is soon to be
> >> removed, and simplifies the final page handling.
> >>
> >> The page error flags is not required to be set in the error case as
> >> orangefs doesn't depend on them.
> >>
> >> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> >
> > Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> >
> > Shouldn't Mike's tested-by be in here?
>
> I mentioned that he tested in my cover letter as I didn't receive a Teste=
d-by
> tag from him.
