Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF7F416E7
	for <lists+devel-orangefs@lfdr.de>; Tue, 11 Jun 2019 23:28:52 +0200 (CEST)
Received: from [::1] (port=44740 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1haoK3-00031l-Rk
	for lists+devel-orangefs@lfdr.de; Tue, 11 Jun 2019 17:28:51 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43046)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <mayhs11saini@gmail.com>)
 id 1haoK2-0002yj-Nh
 for devel@lists.orangefs.org; Tue, 11 Jun 2019 17:28:50 -0400
Received: by mail-ot1-f68.google.com with SMTP id i8so13373532oth.10
 for <devel@lists.orangefs.org>; Tue, 11 Jun 2019 14:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yfYsg0/cES0OHcG6fX5W9snm90ggOgAM9kXY3QBEhu4=;
 b=uikxw7UtyOptEVyjeY2qK4xy247KZZSlixb4FYF44cy5IOYuGfhYNz0auK7eAN3lSf
 RDykMi53c/UWnKOss3Gbf99f02SgcsLInyU9jZT7mZ9OHg9hKC6fNrTncVfEUwMvFzyT
 LcQoyh1B+GWH1wcVdCBdLQqRjW9xbNzL/XHVXJwKNd+h41OfOLBnxXrK/w2EGMY7Sdql
 Ev+iISe8afAaHYadIsKtGIEgMDX6CnpwHgbsBe+aUSzQIjTpiqosNwjLo3ub7MMP5bSh
 sv6W0b+fg0PHcDLs3IdJMwn13c7joqsHqAOaS3kYpN0/uUkfhOoBhUB3X+c5vOw3dtMp
 LbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yfYsg0/cES0OHcG6fX5W9snm90ggOgAM9kXY3QBEhu4=;
 b=FrNAVixYMcfjjbMmcpivexQAZUm7qwV/54DLllNv7+una4w53Lov0vrRcZDuuBqJek
 njGS029QFUiAg91Bitb1ZQc/i0HfQOloLF9j+qrVmD38TaK++pO6GpT9QbwDedfsw/P+
 qogxoqoB2zoQQqLEdIvxHuN6FpZktBW1ZQ/+O9dgEx1TaBx2o3lLT48ycHnLrHYYFlRa
 o3Bm/1450YUjtVGOrcm9NEbc0YahboJQDUjgbqMQuym914ZGI3JYFrQdK4kh/f6PB/gu
 0Rl++qNtr5PyMcbwCuT6vWIwRLBV9RHgsphvh8yGscXzxIXu5Tc4PC2QC/DqILwfJES7
 faDA==
X-Gm-Message-State: APjAAAXIICFSqPt29kOEvUD2kfDE5IyiVb1eTzaOhUcb/umeJufRbFGz
 v5BrEW8JCB51wv+VPFnaMKp75qOCy64yGJxkaz8=
X-Google-Smtp-Source: APXvYqwZE6DuGW97Wtdkbau380s5wncliqmuWNA2I8e3nRFVHn0Gyt7oiNVh7GBK4ctz/0QIVrifVcW0qHRMDnaPYKk=
X-Received: by 2002:a9d:7b43:: with SMTP id f3mr18847440oto.337.1560288490020; 
 Tue, 11 Jun 2019 14:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190611193836.2772-1-shyam.saini@amarulasolutions.com>
 <20190611134831.a60c11f4b691d14d04a87e29@linux-foundation.org>
 <6DCAE4F8-3BEC-45F2-A733-F4D15850B7F3@dilger.ca>
 <20190611140907.899bebb12a3d731da24a9ad1@linux-foundation.org>
In-Reply-To: <20190611140907.899bebb12a3d731da24a9ad1@linux-foundation.org>
From: Shyam Saini <mayhs11saini@gmail.com>
Date: Wed, 12 Jun 2019 02:57:58 +0530
Message-ID: <CAOfkYf5_HTN1HO0gQY9iGchK5Anf6oVx7knzMhL1hWpv4gV20Q@mail.gmail.com>
Subject: Re: [PATCH V2] include: linux: Regularise the use of FIELD_SIZEOF
 macro
To: Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: devel@lists.orangefs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: <devel.lists.orangefs.org>
List-Unsubscribe: <http://lists.orangefs.org/mailman/options/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=unsubscribe>
List-Archive: <http://lists.orangefs.org/pipermail/devel_lists.orangefs.org/>
List-Post: <mailto:devel@lists.orangefs.org>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Subscribe: <http://lists.orangefs.org/mailman/listinfo/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=subscribe>
Cc: Andreas Dilger <adilger@dilger.ca>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Kernel Hardening <kernel-hardening@lists.openwall.com>,
 Network Development <netdev@vger.kernel.org>, intel-gfx@lists.freedesktop.org,
 devel@lists.orangefs.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Shyam Saini <shyam.saini@amarulasolutions.com>, linux-mips@vger.kernel.org,
 linux-mm <linux-mm@kvack.org>, linux-sctp@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, bpf <bpf@vger.kernel.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, intel-gvt-dev@lists.freedesktop.org,
 Alexey Dobriyan <adobriyan@gmail.com>, linux-arm-kernel@lists.infradead.org
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

Hi Andrew,

>
> On Tue, 11 Jun 2019 15:00:10 -0600 Andreas Dilger <adilger@dilger.ca> wrote:
>
> > >> to FIELD_SIZEOF
> > >
> > > As Alexey has pointed out, C structs and unions don't have fields -
> > > they have members.  So this is an opportunity to switch everything to
> > > a new member_sizeof().
> > >
> > > What do people think of that and how does this impact the patch footprint?
> >
> > I did a check, and FIELD_SIZEOF() is used about 350x, while sizeof_field()
> > is about 30x, and SIZEOF_FIELD() is only about 5x.
>
> Erk.  Sorry, I should have grepped.
>
> > That said, I'm much more in favour of "sizeof_field()" or "sizeof_member()"
> > than FIELD_SIZEOF().  Not only does that better match "offsetof()", with
> > which it is closely related, but is also closer to the original "sizeof()".
> >
> > Since this is a rather trivial change, it can be split into a number of
> > patches to get approval/landing via subsystem maintainers, and there is no
> > huge urgency to remove the original macros until the users are gone.  It
> > would make sense to remove SIZEOF_FIELD() and sizeof_field() quickly so
> > they don't gain more users, and the remaining FIELD_SIZEOF() users can be
> > whittled away as the patches come through the maintainer trees.
>
> In that case I'd say let's live with FIELD_SIZEOF() and remove
> sizeof_field() and SIZEOF_FIELD().
>
> I'm a bit surprised that the FIELD_SIZEOF() definition ends up in
> stddef.h rather than in kernel.h where such things are normally
> defined.  Why is that?

Thanks for pointing out this, I was not aware if this is a convention.
Anyway, I'll keep FIELD_SIZEOF definition in kernel.h in next version.

