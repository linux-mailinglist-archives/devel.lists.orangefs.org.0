Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 331F85E53CD
	for <lists+devel-orangefs@lfdr.de>; Wed, 21 Sep 2022 21:30:20 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id 7790138446E
	for <lists+devel-orangefs@lfdr.de>; Wed, 21 Sep 2022 15:30:19 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=harmony;
	t=1663788619; bh=63SlgQZTRncG55Ep7bzFqtBLqSxrd8Fn1j7cPQ01YVo=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d1KENwPoocQ/+MYM+g55BzXjoxaqfZWT1BntI2aFQUi/Bg2Flu51cAj68vtcNhtqc
	 9cVpRq3xYTgWxVoqezwa9oW9ZZsj4kHdFjBzdChOBWEN5bkh4EniC6c983IfgEhcFn
	 XimSXZ+YTDOz+opZGQOBtD62K0El9U61TKQK585rNm5oCyZVNHWBgrBK9aW4cCVYlG
	 C1zCdMW8AgQogolPI7+mxYfnEOAymBHGFn5QTeeizJDGy/oB0VRYdCsrGcnm7DQhMz
	 as8mG7gF516lAPz1YgT8bjs+4c18wYiFN259+zpLVWI6WWCJP/9jZ+k/TA2iuX6QuK
	 LHHaSL6jQLq6A==
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	by mm1.emwd.com (Postfix) with ESMTPS id B9016384413
	for <devel@lists.orangefs.org>; Wed, 21 Sep 2022 15:30:17 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20210112.gappssmtp.com header.i=@omnibond-com.20210112.gappssmtp.com header.b="LGZQUM5u";
	dkim-atps=neutral
Received: by mail-lf1-f48.google.com with SMTP id a2so10915611lfb.6
        for <devel@lists.orangefs.org>; Wed, 21 Sep 2022 12:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=dUp34wU+rIvE4FOjS5Am/ggzUEg/7JO0XLgISf2jrDw=;
        b=LGZQUM5uwNtvfEAnEipVUgYMt8A/QPJi5hFGTf7gwQ6wrDOPADB7dHS4qztxecH83g
         HN3PlnCcmM2S+9Dqtj0e+4k76s3izpY45yp+vTPj8lW+5Mom7CnGmud1TWNxhpcltpO6
         iFtf5vWOUHTxYoSdIlX6Ak9KxNt8fv7V2e3dDVnJiM0PRIWjNgt308OIYxchyRJc22xa
         wfsr2ZsmSJ3yLWEMyGQalEMQ94cejM8fZMnVDqI3muwy09C3+DpcLntI/iBAN1nPVKhU
         OBcnz7eyyomdZ6/bWSyPqffGe/B9xUM7LHpFZ/BgygwY/J42u0tcpHt1xz2lweAogtPN
         2pYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=dUp34wU+rIvE4FOjS5Am/ggzUEg/7JO0XLgISf2jrDw=;
        b=VB9D045lO8dJw6fC7b6tKcmLO/yDB9oy0mH7iFW1pOpTJIvhi1RDcutoek9ZOQk5Go
         0MOLcZcUcz0eJ3wL22Xhdt5rVk2BuIyByfolpItGLWe4MjNT6cYUcItZ8pn2zbCfmKbE
         q+JJmMpIvuNdn3zW7qUzj0Dcne064T8qOWt5uX60PUNhESe7VZxpGcO5rOx3/siluHVM
         7AyRIIzKzp/X2D96TFVsmOmNDn2G8yIL8EgttNqjVsEv0V3355VPEW9Raqd7jxOhlgue
         P0wE6FI+mljumKeIYNDSfeLsSIAzMLEXNvXPuA7pZGnhMGl8N+97fPKrSPNkv0CATyGv
         Tjuw==
X-Gm-Message-State: ACrzQf0s56kuNeLYC7a+jOlP/kkG/OgIbTeNY7WkPuXYd4j/BDfO9S23
	2jZwiXBIG9p6Z4e55ephU8c+NY+yuDwBduZp4fb/Fg==
X-Google-Smtp-Source: AMsMyM4UjQA3cdxDZHWf6B8Ig1L9lp1kN2mKmfQIDi7llbNq2QI0D/11Csj2bu9m2IEMtgRC8FBiF9mNgEoT6WvdSzo=
X-Received: by 2002:a05:6512:12d6:b0:49f:48d4:a1c4 with SMTP id
 p22-20020a05651212d600b0049f48d4a1c4mr10901513lfg.52.1663788616355; Wed, 21
 Sep 2022 12:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <YwFANLruaQpqmPKv@ZenIV> <YwFCIkDT7sFO1D9N@ZenIV>
In-Reply-To: <YwFCIkDT7sFO1D9N@ZenIV>
From: Mike Marshall <hubcap@omnibond.com>
Date: Wed, 21 Sep 2022 15:30:05 -0400
Message-ID: <CAOg9mSQwjKVDJLCHLTpQyAWkCoaAA37U0LkyG6AqvmYdZP_JnA@mail.gmail.com>
Subject: Re: [PATCH 8/8] orangefs: use ->f_mapping
To: Al Viro <viro@zeniv.linux.org.uk>, Mike Marshall <hubcapsc@gmail.com>,
	devel@lists.orangefs.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: 7UGXYZ5HSLTNXF4YGF6HY5OHWRQERTR7
X-Message-ID-Hash: 7UGXYZ5HSLTNXF4YGF6HY5OHWRQERTR7
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-fsdevel@vger.kernel.org
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/7UGXYZ5HSLTNXF4YGF6HY5OHWRQERTR7/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

I added this patch to one of the 6.0 rc's that I've been
running through xfstests, no regressions... so...

You can add tested by me if you'd like...

Thanks!

-Mike


On Sat, Aug 20, 2022 at 4:20 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> ... and don't check for impossible conditions - file_inode() is
> never NULL in anything seen by ->release() and neither is its
> ->i_mapping.
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>  fs/orangefs/file.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/fs/orangefs/file.c b/fs/orangefs/file.c
> index 86810e5d7914..732661aa2680 100644
> --- a/fs/orangefs/file.c
> +++ b/fs/orangefs/file.c
> @@ -417,9 +417,7 @@ static int orangefs_file_release(struct inode *inode, struct file *file)
>          * readahead cache (if any); this forces an expensive refresh of
>          * data for the next caller of mmap (or 'get_block' accesses)
>          */
> -       if (file_inode(file) &&
> -           file_inode(file)->i_mapping &&
> -           mapping_nrpages(&file_inode(file)->i_data)) {
> +       if (mapping_nrpages(file->f_mapping)) {
>                 if (orangefs_features & ORANGEFS_FEATURE_READAHEAD) {
>                         gossip_debug(GOSSIP_INODE_DEBUG,
>                             "calling flush_racache on %pU\n",
> --
> 2.30.2
>
