Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E2B54E82
	for <lists+devel-orangefs@lfdr.de>; Tue, 25 Jun 2019 14:13:17 +0200 (CEST)
Received: from [::1] (port=44308 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hfkK3-00039r-VI
	for lists+devel-orangefs@lfdr.de; Tue, 25 Jun 2019 08:13:15 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36507)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <agruenba@redhat.com>) id 1hfkK2-000396-KS
 for devel@lists.orangefs.org; Tue, 25 Jun 2019 08:13:14 -0400
Received: by mail-oi1-f194.google.com with SMTP id w7so12305518oic.3
 for <devel@lists.orangefs.org>; Tue, 25 Jun 2019 05:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xtX13vSVbmx57mGL/Q0hXK8kpnRo7HFPa5oOdLxipaM=;
 b=Pm9OZ/BSzmMOFjgNbXKK/3+syqY6ag1xqcJxcngtNK2L51SFQ1nkVeSPhhVhhIqzmq
 pafTCowOAOUlOAeMgjAkokXeHnJt+aoFtlRf2XvRoWGEkMQPOMZdvahMM9mX4O9fXoBy
 LTyOCJkNb9PGsByCagcZQZMOZbanvpmBzzEoGo8Jk/qhkjdhx1V2/jvkK3Wf2w8MgBi8
 npzkGFuMUYnfHbwbL6S+4aODQTai1WRhDswCBWtHT+21Q+A7cfUWl4JEemzrmUxne73y
 UnZdyJKyUVvVw27/01C69P2qr5FFylvmRy8rkHjdq83ymaAkDenMZFqekY8hIg4MYseW
 iglA==
X-Gm-Message-State: APjAAAUTl5OOmhWH6uqt7RfJnZihCeoWZzx074/sw6e/4ltCx0AG74IH
 dG8HD8bqOx3YFXn1QNGSzJ59wAIB4Kn+dye0+SyxYQ==
X-Google-Smtp-Source: APXvYqzIF0shhnL3kTWbxYnFTIfJoQ9NWdzzlYJbdr7wT1RELz57W5jZU6ihqAiJYZbsgta0nM0Q5SDLuZyhNwwIoP0=
X-Received: by 2002:aca:b58b:: with SMTP id
 e133mr14182998oif.147.1561464753642; 
 Tue, 25 Jun 2019 05:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190624165012.GH3436@hirez.programming.kicks-ass.net>
 <CAHc6FU7j5iW7WQoxN_OSfvK4zxv_MxTWJpiNsqFW8TEDMX1rjw@mail.gmail.com>
 <20190625103430.GW3402@hirez.programming.kicks-ass.net>
In-Reply-To: <20190625103430.GW3402@hirez.programming.kicks-ass.net>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 25 Jun 2019 14:12:22 +0200
Message-ID: <CAHc6FU6zUCdQZ1AfN2KYcPYVKc5bwvc0bD7=-KZpFXws+F9QZQ@mail.gmail.com>
Subject: Re: [RFC][PATCH] wake_up_var() memory ordering
To: Peter Zijlstra <peterz@infradead.org>
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
Cc: linux-cachefs@redhat.com, Mike Snitzer <snitzer@redhat.com>,
 linux-aio@kvack.org, David Airlie <airlied@linux.ie>,
 samba-technical <samba-technical@lists.samba.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, keyrings@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-afs@lists.infradead.org, Alasdair Kergon <agk@redhat.com>,
 linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, James Morris <jmorris@namei.org>,
 cluster-devel <cluster-devel@redhat.com>, Antti Palosaari <crope@iki.fi>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Paul McKenney <paulmck@linux.vnet.ibm.com>, intel-gfx@lists.freedesktop.org,
 devel@lists.orangefs.org, "Serge E. Hallyn" <serge@hallyn.com>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 Johan Hedberg <johan.hedberg@gmail.com>, Marcel Holtmann <marcel@holtmann.org>,
 Sean Wang <sean.wang@mediatek.com>, Josef Bacik <josef@toxicpanda.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Sterba <dsterba@suse.com>,
 MauroCarvalho Chehab <mchehab@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 linux-arm-kernel@lists.infradead.org, "J. Bruce Fields" <bfields@fieldses.org>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>, netdev@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Steve French <sfrench@samba.org>,
 linux-bluetooth@vger.kernel.org, LSM <linux-security-module@vger.kernel.org>,
 Benjamin LaHaise <bcrl@kvack.org>, Daniel Vetter <daniel@ffwll.ch>,
 Bob Peterson <rpeterso@redhat.com>, linux-media@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org
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

On Tue, 25 Jun 2019 at 12:36, Peter Zijlstra <peterz@infradead.org> wrote:
> On Tue, Jun 25, 2019 at 11:19:35AM +0200, Andreas Gruenbacher wrote:
> > > diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> > > index cf4c767005b1..666629ea5da7 100644
> > > --- a/fs/gfs2/glops.c
> > > +++ b/fs/gfs2/glops.c
> > > @@ -227,6 +227,7 @@ static void gfs2_clear_glop_pending(struct gfs2_inode *ip)
> > >                 return;
> > >
> > >         clear_bit_unlock(GIF_GLOP_PENDING, &ip->i_flags);
> > > +       smp_mb__after_atomic();
> > >         wake_up_bit(&ip->i_flags, GIF_GLOP_PENDING);
> >
> > This should become clear_and_wake_up_bit as well, right? There are
> > several more instances of the same pattern.
>
> Only if we do as David suggested and make clean_and_wake_up_bit()
> provide the RELEASE barrier.

(It's clear_and_wake_up_bit, not clean_and_wake_up_bit.)

> That is, currently clear_and_wake_up_bit() is
>
>         clear_bit()
>         smp_mb__after_atomic();
>         wake_up_bit();
>
> But the above is:
>
>         clear_bit_unlock();
>         smp_mb__after_atomic();
>         wake_up_bit()
>
> the difference is that _unlock() uses RELEASE semantics, where
> clear_bit() does not.
>
> The difference is illustrated with something like:
>
>         cond = true;
>         clear_bit()
>         smp_mb__after_atomic();
>         wake_up_bit();
>
> In this case, a remote CPU can first observe the clear_bit() and then
> the 'cond = true' store. When we use clear_bit_unlock() this is not
> possible, because the RELEASE barrier ensures that everything before,
> stays before.

Now I'm confused because clear_and_wake_up_bit() in mainline does use
clear_bit_unlock(), so it's the exact opposite of what you just said.

Thanks,
Andreas

