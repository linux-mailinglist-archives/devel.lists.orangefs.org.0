Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD4B416B0
	for <lists+devel-orangefs@lfdr.de>; Tue, 11 Jun 2019 23:09:51 +0200 (CEST)
Received: from [::1] (port=43484 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hao1e-0002LM-8J
	for lists+devel-orangefs@lfdr.de; Tue, 11 Jun 2019 17:09:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:43640)
 by mm1.emwd.com with esmtps (TLSv1.2:AECDH-AES256-SHA:256)
 (Exim 4.92) (envelope-from <akpm@linux-foundation.org>)
 id 1hao1d-0002Hz-Ol
 for devel@lists.orangefs.org; Tue, 11 Jun 2019 17:09:49 -0400
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 542412080A;
 Tue, 11 Jun 2019 21:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560287348;
 bh=qmpEoNXO99XPF9xd/5iv2nDwyZYxG+9HqzTYNPT4KTw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EzYSNQ5VopjCkhJxjwzVG+3NUfKcn1X9cU/Ns4PV5yZIsnow5MRHYB73/Tl3T81K/
 SbRRApw7C7MWKpiNZqE5wCHVmQlPPOHtSxjsrM3RebqPsIl/mcOR/W6a0jpkC0UwOz
 rSPkBbLzTQO7F5VSs5bcQHmoWK/bst5kRMcBgC7c=
Date: Tue, 11 Jun 2019 14:09:07 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andreas Dilger <adilger@dilger.ca>
Subject: Re: [PATCH V2] include: linux: Regularise the use of FIELD_SIZEOF
 macro
Message-Id: <20190611140907.899bebb12a3d731da24a9ad1@linux-foundation.org>
In-Reply-To: <6DCAE4F8-3BEC-45F2-A733-F4D15850B7F3@dilger.ca>
References: <20190611193836.2772-1-shyam.saini@amarulasolutions.com>
 <20190611134831.a60c11f4b691d14d04a87e29@linux-foundation.org>
 <6DCAE4F8-3BEC-45F2-A733-F4D15850B7F3@dilger.ca>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: keescook@chromium.org, kvm@vger.kernel.org,
 kernel-hardening@lists.openwall.com, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, devel@lists.orangefs.org,
 linux-mips@vger.kernel.org, Shyam Saini <shyam.saini@amarulasolutions.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-sctp@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bpf@vger.kernel.org,
 linux-ext4 <linux-ext4@vger.kernel.org>, intel-gvt-dev@lists.freedesktop.org,
 Alexey Dobriyan <adobriyan@gmail.com>, linux-arm-kernel@lists.infradead.org,
 mayhs11saini@gmail.com
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

On Tue, 11 Jun 2019 15:00:10 -0600 Andreas Dilger <adilger@dilger.ca> wrote:

> >> to FIELD_SIZEOF
> > 
> > As Alexey has pointed out, C structs and unions don't have fields -
> > they have members.  So this is an opportunity to switch everything to
> > a new member_sizeof().
> > 
> > What do people think of that and how does this impact the patch footprint?
> 
> I did a check, and FIELD_SIZEOF() is used about 350x, while sizeof_field()
> is about 30x, and SIZEOF_FIELD() is only about 5x.

Erk.  Sorry, I should have grepped.

> That said, I'm much more in favour of "sizeof_field()" or "sizeof_member()"
> than FIELD_SIZEOF().  Not only does that better match "offsetof()", with
> which it is closely related, but is also closer to the original "sizeof()".
> 
> Since this is a rather trivial change, it can be split into a number of
> patches to get approval/landing via subsystem maintainers, and there is no
> huge urgency to remove the original macros until the users are gone.  It
> would make sense to remove SIZEOF_FIELD() and sizeof_field() quickly so
> they don't gain more users, and the remaining FIELD_SIZEOF() users can be
> whittled away as the patches come through the maintainer trees.

In that case I'd say let's live with FIELD_SIZEOF() and remove
sizeof_field() and SIZEOF_FIELD().

I'm a bit surprised that the FIELD_SIZEOF() definition ends up in
stddef.h rather than in kernel.h where such things are normally
defined.  Why is that?


