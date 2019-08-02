Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4C37FCDA
	for <lists+devel-orangefs@lfdr.de>; Fri,  2 Aug 2019 16:53:22 +0200 (CEST)
Received: from [::1] (port=60202 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1htYvp-0001N5-E8
	for lists+devel-orangefs@lfdr.de; Fri, 02 Aug 2019 10:53:21 -0400
Received: from mx2.suse.de ([195.135.220.15]:47526 helo=mx1.suse.de)
 by mm1.emwd.com with esmtps (TLSv1.2:AECDH-AES256-SHA:256)
 (Exim 4.92) (envelope-from <jack@suse.cz>) id 1htYvn-0001IE-UW
 for devel@lists.orangefs.org; Fri, 02 Aug 2019 10:53:20 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 80E69AF3F;
 Fri,  2 Aug 2019 14:52:38 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 09FD71E433B; Fri,  2 Aug 2019 16:52:27 +0200 (CEST)
Date: Fri, 2 Aug 2019 16:52:27 +0200
From: Jan Kara <jack@suse.cz>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 00/34] put_user_pages(): miscellaneous call sites
Message-ID: <20190802145227.GQ25064@quack2.suse.cz>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802091244.GD6461@dhcp22.suse.cz>
 <20190802124146.GL25064@quack2.suse.cz>
 <20190802142443.GB5597@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190802142443.GB5597@bombadil.infradead.org>
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, john.hubbard@gmail.com,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
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

On Fri 02-08-19 07:24:43, Matthew Wilcox wrote:
> On Fri, Aug 02, 2019 at 02:41:46PM +0200, Jan Kara wrote:
> > On Fri 02-08-19 11:12:44, Michal Hocko wrote:
> > > On Thu 01-08-19 19:19:31, john.hubbard@gmail.com wrote:
> > > [...]
> > > > 2) Convert all of the call sites for get_user_pages*(), to
> > > > invoke put_user_page*(), instead of put_page(). This involves dozens of
> > > > call sites, and will take some time.
> > > 
> > > How do we make sure this is the case and it will remain the case in the
> > > future? There must be some automagic to enforce/check that. It is simply
> > > not manageable to do it every now and then because then 3) will simply
> > > be never safe.
> > > 
> > > Have you considered coccinele or some other scripted way to do the
> > > transition? I have no idea how to deal with future changes that would
> > > break the balance though.
> > 
> > Yeah, that's why I've been suggesting at LSF/MM that we may need to create
> > a gup wrapper - say vaddr_pin_pages() - and track which sites dropping
> > references got converted by using this wrapper instead of gup. The
> > counterpart would then be more logically named as unpin_page() or whatever
> > instead of put_user_page().  Sure this is not completely foolproof (you can
> > create new callsite using vaddr_pin_pages() and then just drop refs using
> > put_page()) but I suppose it would be a high enough barrier for missed
> > conversions... Thoughts?
> 
> I think the API we really need is get_user_bvec() / put_user_bvec(),
> and I know Christoph has been putting some work into that.  That avoids
> doing refcount operations on hundreds of pages if the page in question is
> a huge page.  Once people are switched over to that, they won't be tempted
> to manually call put_page() on the individual constituent pages of a bvec.

Well, get_user_bvec() is certainly a good API for one class of users but
just looking at the above series, you'll see there are *many* places that
just don't work with bvecs at all and you need something for those.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

