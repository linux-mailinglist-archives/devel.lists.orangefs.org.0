Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D40B52FFF
	for <lists+devel-orangefs@lfdr.de>; Tue, 25 Jun 2019 12:35:54 +0200 (CEST)
Received: from [::1] (port=56500 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hfinp-0004rR-RL
	for lists+devel-orangefs@lfdr.de; Tue, 25 Jun 2019 06:35:53 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:57202)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <peterz@infradead.org>)
 id 1hfinp-0004qF-9q
 for devel@lists.orangefs.org; Tue, 25 Jun 2019 06:35:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=udd2XNj0YQOu5KwyPQP6GFnOEKmvMvFG7ADPEjU+Kkg=; b=WTUrhABTI+04Ecv/wTwMGFqws
 h83jvImwQjRmpyswq4BLoUHmZ/DO4bIEFAWliQdhwR/IO5JwBpD6O9oUE9Yt3/EcpTG5W4F2mq7SF
 c7WS4oVyW9z145U5z78har86EvY1kK6Lil5ieALtK5onJber42zkPbtfhiair4Re5myMU3gel2cqN
 uf9du978Erbf8539T8MoEAoS+G4wKslSYBqFobc7ljDTEpU1p7Mn56HfucBU9QbV6NE5dRj+JG3Ud
 4UM2Y/FCVMBrsWlW8F5U1zQyfO9PgP1dZ1yVWXeHngUJ2VaQczuyJ2JukZNJjtMD8Unmum78t1eK+
 pqthdEtBg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hfimX-0008Ce-Ev; Tue, 25 Jun 2019 10:34:33 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 11FC12063D031; Tue, 25 Jun 2019 12:34:30 +0200 (CEST)
Date: Tue, 25 Jun 2019 12:34:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Subject: Re: [RFC][PATCH] wake_up_var() memory ordering
Message-ID: <20190625103430.GW3402@hirez.programming.kicks-ass.net>
References: <20190624165012.GH3436@hirez.programming.kicks-ass.net>
 <CAHc6FU7j5iW7WQoxN_OSfvK4zxv_MxTWJpiNsqFW8TEDMX1rjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHc6FU7j5iW7WQoxN_OSfvK4zxv_MxTWJpiNsqFW8TEDMX1rjw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Tue, Jun 25, 2019 at 11:19:35AM +0200, Andreas Gruenbacher wrote:
> > diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> > index cf4c767005b1..666629ea5da7 100644
> > --- a/fs/gfs2/glops.c
> > +++ b/fs/gfs2/glops.c
> > @@ -227,6 +227,7 @@ static void gfs2_clear_glop_pending(struct gfs2_inode *ip)
> >                 return;
> >
> >         clear_bit_unlock(GIF_GLOP_PENDING, &ip->i_flags);
> > +       smp_mb__after_atomic();
> >         wake_up_bit(&ip->i_flags, GIF_GLOP_PENDING);
> 
> This should become clear_and_wake_up_bit as well, right? There are
> several more instances of the same pattern.

Only if we do as David suggested and make clean_and_wake_up_bit()
provide the RELEASE barrier.

That is, currently clear_and_wake_up_bit() is

	clear_bit()
	smp_mb__after_atomic();
	wake_up_bit();

But the above is:

	clear_bit_unlock();
	smp_mb__after_atomic();
	wake_up_bit()

the difference is that _unlock() uses RELEASE semantics, where
clear_bit() does not.

The difference is illustrated with something like:

	cond = true;
	clear_bit()
	smp_mb__after_atomic();
	wake_up_bit();

In this case, a remote CPU can first observe the clear_bit() and then
the 'cond = true' store. When we use clear_bit_unlock() this is not
possible, because the RELEASE barrier ensures that everything before,
stays before.

> >  }
> >

