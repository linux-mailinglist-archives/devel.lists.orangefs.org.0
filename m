Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C4E1EA281
	for <lists+devel-orangefs@lfdr.de>; Mon,  1 Jun 2020 13:14:48 +0200 (CEST)
Received: from [::1] (port=60898 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jfiP0-0004IF-U3
	for lists+devel-orangefs@lfdr.de; Mon, 01 Jun 2020 07:14:46 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:42118)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <hubcap@omnibond.com>) id 1jfiOz-0004Hm-8f
 for devel@lists.orangefs.org; Mon, 01 Jun 2020 07:14:45 -0400
Received: by mail-ua1-f67.google.com with SMTP id c15so3182155uar.9
 for <devel@lists.orangefs.org>; Mon, 01 Jun 2020 04:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=omnibond-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WXOAaMoBz4R8U5dwNZ1YfVLsYcbZLZ+dVXxKsEXRwXY=;
 b=ldYjGDwxIV0HzE2xVPpuBE0NOAVS/wx8H146GJymaAusL8tM4TbALmC5vckRW1Mz2h
 iYHXRI042v6RPOvV2TxuBXm7yKSuQ7eAGi19pRqoDsXPm3eaQdEDp4agW/pkDWzJvswX
 lHKPP/PrvdEZKioAgAXdN3Cj9R582GOgxZERyU0rXTDPVUz+dF01KRgtgKNI01FFXGls
 E+Qd4105igPjLgGxPH/nSEIxB87EZD8JPlhCjxUjxqOxlAp/6OMwg9lcHLUtH6ThPs3f
 BQyv/5nbSVdTe2MuD3wqDiKM6D164XduVY61OUE0kRFs1W0aTXn5NNNVEWXzqkBI1Y7y
 8nHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WXOAaMoBz4R8U5dwNZ1YfVLsYcbZLZ+dVXxKsEXRwXY=;
 b=Gty8g+IQWR5ddTshnnhDjdjxk6zWiIZo34VCrmWSdgAfVBNlvgkREjmUD7oD7Sd2Ub
 j3pMb1RT5UXX1yB83ZB6umJ+SozXJODwiOCwRGnllel/9blbtTc26/G1WycdSljgAJtZ
 TWsmXTvbTuoeon2n8h2n2oDAy6j5q8L4sO20S9fe0H713Rg5+grPJo4rQihtrL0fhNJz
 UawD/RoOtoe36wgqUQSbPW2O+ZFPCqJ1/Aw/c1xD3Yain3vvASKkz7q6X9M2vROaQH6a
 2RXqVFabVSTfQkg4hCqFoWKzuDcHU3xY1ktf5N22+yHqzNujiqh+RHV8GoGaphqefiFy
 NofA==
X-Gm-Message-State: AOAM5328MNdTzh/SR5lTbaPDfwbSTOOatWXQIuyg7+XNz5ZUIr6n/y5W
 I2lj13z+/xieW7o64IgU3O3U5MCpvwmz3o2rve6bzg==
X-Google-Smtp-Source: ABdhPJz8Ar6V60hnAAObpp+yduGb260FWlbMjEdQ4KdG8I/hXKgn7dO8wizKMxc1REqOfKGvnrW5O/i0ftzKsyinRv0=
X-Received: by 2002:a9f:22e1:: with SMTP id 88mr9356732uan.19.1591010044429;
 Mon, 01 Jun 2020 04:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200523035909.418683-1-jhubbard@nvidia.com>
 <89244e74-f619-e515-083a-3bf2586fa5c3@nvidia.com>
In-Reply-To: <89244e74-f619-e515-083a-3bf2586fa5c3@nvidia.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Mon, 1 Jun 2020 07:13:53 -0400
Message-ID: <CAOg9mSQYvPcjCOoTj5_zq-62pxe_XCnqxiaiNLefx10M-MSYuw@mail.gmail.com>
Subject: Re: [PATCH v2] orangefs: convert get_user_pages() --> pin_user_pages()
To: John Hubbard <jhubbard@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: devel@lists.orangefs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <devel.lists.orangefs.org>
List-Unsubscribe: <http://lists.orangefs.org/mailman/options/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=unsubscribe>
List-Archive: <http://lists.orangefs.org/pipermail/devel_lists.orangefs.org/>
List-Post: <mailto:devel@lists.orangefs.org>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Subscribe: <http://lists.orangefs.org/mailman/listinfo/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=subscribe>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, devel@lists.orangefs.org
Errors-To: devel-bounces@lists.orangefs.org
Sender: "Devel" <devel-bounces@lists.orangefs.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - mm1.emwd.com
X-AntiAbuse: Original Domain - lfdr.de
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lists.orangefs.org
X-Get-Message-Sender-Via: mm1.emwd.com: acl_c_authenticated_local_user: mailman/mailman
X-Authenticated-Sender: mm1.emwd.com: mailman@lists.orangefs.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi John.

Thanks for the patch, and the testing, and the reference to the
lwn article.

I have also applied your patch to 5.7-rc7 and have run xfstests.

I applied your patch to the orangefs for-next tree.

-Mike

On Sat, May 30, 2020 at 3:39 AM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 2020-05-22 20:59, John Hubbard wrote:
> > This code was using get_user_pages*(), in a "Case 1" scenario
> > (Direct IO), using the categorization from [1]. That means that it's
> > time to convert the get_user_pages*() + put_page() calls to
> > pin_user_pages*() + unpin_user_pages() calls.
> >
> > There is some helpful background in [2]: basically, this is a small
> > part of fixing a long-standing disconnect between pinning pages, and
> > file systems' use of those pages.
> >
> > [1] Documentation/core-api/pin_user_pages.rst
> >
> > [2] "Explicit pinning of user-space pages":
> >      https://lwn.net/Articles/807108/
> >
> > Cc: Mike Marshall <hubcap@omnibond.com>
> > Cc: Martin Brandenburg <martin@omnibond.com>
> > Cc: devel@lists.orangefs.org
> > Cc: linux-fsdevel@vger.kernel.org
> > Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> > ---
> >
> > Hi,
> >
> > Note that I have only compile-tested this patch, although that does
> > also include cross-compiling for a few other arches.
>
> An update on the run-time testing: Just now, I got basic orangefs tests
> running in xfstests, with this patch applied, and it all looks normal.
>
> thanks,
> --
> John Hubbard
> NVIDIA
>
> >
> > Changes since v1 [3]: correct the commit description, so that
> > it refers to "Case 1" instead of "Case 2".
> >
> >
> > [3] https://lore.kernel.org/r/20200518060139.2828423-1-jhubbard@nvidia.com
> >
> > thanks,
> > John Hubbard
> > NVIDIA
> >
> >   fs/orangefs/orangefs-bufmap.c | 9 +++------
> >   1 file changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/fs/orangefs/orangefs-bufmap.c b/fs/orangefs/orangefs-bufmap.c
> > index 2bb916d68576..538e839590ef 100644
> > --- a/fs/orangefs/orangefs-bufmap.c
> > +++ b/fs/orangefs/orangefs-bufmap.c
> > @@ -168,10 +168,7 @@ static DEFINE_SPINLOCK(orangefs_bufmap_lock);
> >   static void
> >   orangefs_bufmap_unmap(struct orangefs_bufmap *bufmap)
> >   {
> > -     int i;
> > -
> > -     for (i = 0; i < bufmap->page_count; i++)
> > -             put_page(bufmap->page_array[i]);
> > +     unpin_user_pages(bufmap->page_array, bufmap->page_count);
> >   }
> >
> >   static void
> > @@ -268,7 +265,7 @@ orangefs_bufmap_map(struct orangefs_bufmap *bufmap,
> >       int offset = 0, ret, i;
> >
> >       /* map the pages */
> > -     ret = get_user_pages_fast((unsigned long)user_desc->ptr,
> > +     ret = pin_user_pages_fast((unsigned long)user_desc->ptr,
> >                            bufmap->page_count, FOLL_WRITE, bufmap->page_array);
> >
> >       if (ret < 0)
> > @@ -280,7 +277,7 @@ orangefs_bufmap_map(struct orangefs_bufmap *bufmap,
> >
> >               for (i = 0; i < ret; i++) {
> >                       SetPageError(bufmap->page_array[i]);
> > -                     put_page(bufmap->page_array[i]);
> > +                     unpin_user_page(bufmap->page_array[i]);
> >               }
> >               return -ENOMEM;
> >       }
> >
>

