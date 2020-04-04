Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id B46E019E7AA
	for <lists+devel-orangefs@lfdr.de>; Sat,  4 Apr 2020 22:58:20 +0200 (CEST)
Received: from [::1] (port=46444 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jKprv-0007Eo-Gi
	for lists+devel-orangefs@lfdr.de; Sat, 04 Apr 2020 16:58:19 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:44624)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <hubcap@omnibond.com>) id 1jKprt-00073l-62
 for devel@lists.orangefs.org; Sat, 04 Apr 2020 16:58:17 -0400
Received: by mail-vs1-f66.google.com with SMTP id e138so7249238vsc.11
 for <devel@lists.orangefs.org>; Sat, 04 Apr 2020 13:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=omnibond-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2x0AYyTRYtjT/SYXHm491NxzEChiRCQRcx9Z4KQvNzM=;
 b=ej6WMCwTFQHydwUw6G9KDNeQDdC/rj6vgjWFms54iDg1013xe9eqy6DrcQP5pszcji
 GnVFhEip7i+yTACoFhEqXPLV0MH50kK2C5IW2L3ZlpwFJg8p9CPq9AYci1IlVpVQzxAJ
 LGcr/ujlyBVvNeV/37rxZGR15+y2WXfZIj5GcNARTZoNAskehPNFoW3nV7f0TJZ1FmSj
 V8BZ/NS/WTBKEkdj02J8wiT5m5g3h0gyX6vPc/BLhTJGMI7nGa0bbSTqEVymhLFET42p
 YYm4a4T8YLMQBsRMTKJ30beRQ2gxhQJCKVQZxM5xRuKBwKY01JgL1CotVW4uYo/869dJ
 8qwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2x0AYyTRYtjT/SYXHm491NxzEChiRCQRcx9Z4KQvNzM=;
 b=WuxZtffqlWSWp82JyzCLBwX52SaBrG7R2SdTDp72lFAUNLU3qIZ65JIUkdM2A3I9PA
 ljJ8d9I3l1nsl8O/v88m0q04HjYthGyLhKC9gAnBkwQZYubrgBNi1UEio8crp5MJk85q
 XevTB4oNbyYHTQvOuheF0RvciF8dycJaX9I/ViZUxvt9OMXoxiwDoATC9YU0Yn6ooMDE
 FEhNI8dyKhAko8rmibvueAJXia9B3DUQ3eEYhyOOg/APqiz060sDZlvgZeoU4Ec4A0Uo
 fHmPfb7S4qa8TRXEs1KQV9mIml53rIGJyIudQgBsQH3JH088tUSs4A2/ByAGUWLNAP/j
 9KkA==
X-Gm-Message-State: AGi0Puaj4X6ctdR7woblBkZK8/676iXm3GkeIOENjhldKA4QDSjNwoWT
 JPCMzeXm83jwsBcKq6Vm26KoPi1DRnWJR2AvjdBodA==
X-Google-Smtp-Source: APiQypKxSTctjde1rLaR9pQPNwTSYPcH+H8+UEHrzbwI5KHm9VdOy5JtmGnRHHKU00mqqR//qEfeFV/mIpHn6qqq14M=
X-Received: by 2002:a67:33cb:: with SMTP id
 z194mr11260819vsz.155.1586033856230; 
 Sat, 04 Apr 2020 13:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200326170705.1552562-2-hch@lst.de>
 <20200404162826.181808-1-hubcap@kernel.org>
 <20200404174346.GU21484@bombadil.infradead.org>
In-Reply-To: <20200404174346.GU21484@bombadil.infradead.org>
From: Mike Marshall <hubcap@omnibond.com>
Date: Sat, 4 Apr 2020 16:57:24 -0400
Message-ID: <CAOg9mSSrJp2dqQTNDgucLoeQcE_E_aYPxnRe5xphhdSPYw7QtQ@mail.gmail.com>
Subject: Re: [PATCH] orangefs: complete Christoph's "remember count" reversion.
To: Matthew Wilcox <willy@infradead.org>
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>, hubcap@kernel.org,
 Christoph Hellwig <hch@lst.de>, devel@lists.orangefs.org
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

Matthew>  So yes, I think within the next year, you should be
Matthew>  able to tell the page cache to allocate 4MB pages.

I can't find the ascii thumbs up emoji :-) ...

-Mike

On Sat, Apr 4, 2020 at 1:43 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Sat, Apr 04, 2020 at 12:28:26PM -0400, hubcap@kernel.org wrote:
> > As an aside, the page cache has been a blessing and a curse
> > for us. Since we started using it, small IO has improved
> > incredibly, but our max speed hits a plateau before it otherwise
> > would have. I think because of all the page size copies we have
> > to do to fill our 4 meg native buffers. I try to read about all
> > the new work going into the page cache in lwn, and make some
> > sense of the new code :-). One thing I remember is when
> > Christoph Lameter said "the page cache does not scale", but
> > I know the new work is focused on that. If anyone has any
> > thoughts about how we could make improvments on filling our
> > native buffers from the page cache (larger page sizes?),
> > feel free to offer any help...
>
> Umm, 4MB native buffers are ... really big ;-)  I wasn't planning on
> going past PMD_SIZE (ie 2MB on x86) for the readahead large pages,
> but if a filesystem wants that, then I should change that plan.
>
> What I was planning for, but don't quite have an implementation nailed
> down for yet, is allowing filesystems to grow the readahead beyond that
> wanted by the generic code.  Filesystems which implement compression
> frequently want blocks in the 256kB size range.  It seems like OrangeFS
> would fit with that scheme, as long as I don't put a limit on what the
> filesystem asks for.
>
> So yes, I think within the next year, you should be able to tell the
> page cache to allocate 4MB pages.  You will still need a fallback path
> for when memory is too fragmented to allocate new pages, but if you're
> using 4MB pages, then hopefully we'll be able to reclaim a clean 4MB
> pages from elsewhere in the page cache and supply you with a new one.

