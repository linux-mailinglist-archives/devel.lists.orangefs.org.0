Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 216F763F329
	for <lists+devel-orangefs@lfdr.de>; Thu,  1 Dec 2022 15:54:50 +0100 (CET)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id C3F513849C7
	for <lists+devel-orangefs@lfdr.de>; Thu,  1 Dec 2022 09:54:48 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1669906488; bh=ORl4hEpjTG8TO16ayw88erOhxC5VtE1FBPr2JIVRuA4=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F+2V1de7qJS+w6iSfjYg0NTOK1nMFUFRD/0Iv3kXPdwG58HBVGUYTwv9MASMA64GB
	 gQrKsZ1XVMdO1fzJTE5o75u0PyEtjKmq/SJb/6G/s/IulD3PzBDHQmOLs/XiVN2vtY
	 UVdTmJ08kvTRrxibZ+ooqCNFyIruU3nCF6uW+WLwE5C2WEWFRRZqP/lnL0Pd4QlKdJ
	 DSsXOuJ0btJgw3oy9AUlMVYxMLVgr/HDTQemdjlcu+9Yq4C0vNddfisOMRHwgYiTZf
	 5rJkChyQedkzy437d3mkGUw/PZKdB3JFN/Kw/iGnd04oO2Jt0U+2ph8pqwl6Sd7sp+
	 nONky91AE9Y1g==
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	by mm1.emwd.com (Postfix) with ESMTPS id 572E138414E
	for <devel@lists.orangefs.org>; Thu,  1 Dec 2022 09:54:46 -0500 (EST)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20210112.gappssmtp.com header.i=@omnibond-com.20210112.gappssmtp.com header.b="05RRT9h2";
	dkim-atps=neutral
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-3691e040abaso19493437b3.9
        for <devel@lists.orangefs.org>; Thu, 01 Dec 2022 06:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mgILPj6YlVYMz9mNkAtSfNEKlZlLXzmDmVWH3GNz5OQ=;
        b=05RRT9h2U2pxZd/Pw/gCD7JozZfbmA2lGkJEMPmhM42QcRotpIpXQFu+Gb87znLnmn
         Ab1zsDGz4pfLvvUAI41az+swDjn3rVndSEehwZi4SSzOH6GzajO1qNXSWFHltmwrajco
         G/Uh64r1+OV5Nf5w+SidgAlWAM781Es2J9aefLqTcoi5JrzGMIuwB9Uzc9KO9GeR2/oC
         rBJmsnLUM22wR524doHEoDMHX/c507aF3W2Vatgk++KGamGxSMHnYxrchGMYxdoe61HJ
         I41wxfFYoCduWdfEzYfItzKASdtgfKSdxgeoufPz01nP0d/+cBSD7lSo3n/Lkpxw+YrS
         uaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mgILPj6YlVYMz9mNkAtSfNEKlZlLXzmDmVWH3GNz5OQ=;
        b=QPx0rJIDgtndbnxFXnHRem8w/cXn85h5l+pZ8LyMeV4i4Ofuf+m2I09Ks4/xXW6GI/
         yInzsqtzqnGpYQjLLpIqMAV+ZBxlWIj0p7MjlnX0HbkAAl9WtleuaD7xWdg9bRMnokI0
         mwEgGSfkhxS6n5oG9cPuKWGNDp/zsD96kBWYKhq6pEECXX0wdMA6W0NME84BKRn2CYlN
         Gf2I7FFO6xvsd2nMJV5gXy/Hh18QaXsSakOsSl14JVAn1V60d8CoN7fOTxRzg4LpaNEt
         w05ZrsUpIQczcKW9zsTxphDDAQHeCOeuvHJ6SRa0i/eCw20a6J3Zr+rMYc04MWxhNxPp
         xw9A==
X-Gm-Message-State: ANoB5pkUySuNbAPrGt8gaiwcYB+5DOV/2btl1/A4zIdT4L1vK3xXLh1p
	hJ8ROIyvlOr9T25bzyR3om34kb3g3gBsVuWCgZOq5w==
X-Google-Smtp-Source: AA0mqf51m5HaDH1La8mvQJR0+JnNZYvXebPlMjYaEvi5nYBDGylEcv80JjlF5iG50ghBfOzUAMUIBiJDu55ZRmrgdJc=
X-Received: by 2002:a05:690c:58b:b0:3ce:e06a:942c with SMTP id
 bo11-20020a05690c058b00b003cee06a942cmr13626877ywb.37.1669906485631; Thu, 01
 Dec 2022 06:54:45 -0800 (PST)
MIME-Version: 1.0
References: <20221018044007.907751-1-zhangxiaoxu5@huawei.com>
In-Reply-To: <20221018044007.907751-1-zhangxiaoxu5@huawei.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Thu, 1 Dec 2022 09:54:34 -0500
Message-ID: <CAOg9mSSnGkuMtp0c7iGxTNNCT7iH4eug+ozsF3bjztz0xW3H-A@mail.gmail.com>
Subject: Re: [PATCH 0/4] Fix some problem about the sysfs/debugfs
To: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: ULETIOGYKTYW55VPOXEKWGGHUCZG2JBV
X-Message-ID-Hash: ULETIOGYKTYW55VPOXEKWGGHUCZG2JBV
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devel@lists.orangefs.org, martin@omnibond.com
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/ULETIOGYKTYW55VPOXEKWGGHUCZG2JBV/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

Hello Zhang...

Thanks for your patches. Not only do they make sense to me and cause no
xfstests regressions, they reliably cause generic/438 to pass (instead of
failing or hanging)...

I have most recently compared 6.1.0-rc7 and 6.1.0-rc7+your-patches.

Are you going to submit them during the merge window, or should I?

-Mike

On Mon, Oct 17, 2022 at 11:38 PM Zhang Xiaoxu <zhangxiaoxu5@huawei.com> wrote:
>
>
> Zhang Xiaoxu (4):
>   orangefs: Fix sysfs not cleanup when dev init failed
>   orangefs: Fix kmemleak in orangefs_prepare_debugfs_help_string()
>   orangefs: Fix kmemleak in orangefs_sysfs_init()
>   orangefs: Fix kmemleak in orangefs_{kernel,client}_debug_init()
>
>  fs/orangefs/orangefs-debugfs.c | 29 +++-----------
>  fs/orangefs/orangefs-mod.c     |  8 ++--
>  fs/orangefs/orangefs-sysfs.c   | 71 ++++++++++++++++++++++++++++++----
>  3 files changed, 73 insertions(+), 35 deletions(-)
>
> --
> 2.31.1
>
