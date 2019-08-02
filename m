Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FA77EE51
	for <lists+devel-orangefs@lfdr.de>; Fri,  2 Aug 2019 10:07:19 +0200 (CEST)
Received: from [::1] (port=42666 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1htSas-0004T0-H1
	for lists+devel-orangefs@lfdr.de; Fri, 02 Aug 2019 04:07:18 -0400
Received: from merlin.infradead.org ([205.233.59.134]:32930)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <peterz@infradead.org>)
 id 1htSan-0004SN-Ka
 for devel@lists.orangefs.org; Fri, 02 Aug 2019 04:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oQGkgX+xjP5mcvxvnZUNTJDjzsROZ8JGq6RAdmO4uPA=; b=Kn7zyiwFYY1w4GG19f5Z+fxXG
 rpdCjyayz/9gviyRYspgLpeSBWC2GfVoCY+63/ODQnmLa1Ss8JkqUpftu3V0chMAiw/KlU2kDYgEh
 oR5YKgy/zWb5/EAWdvNxCcTyybQ/h6IZloFk2u58KpdWjALZ6VxSlYgO9NyD6ORVH0k4+/SJs5gc5
 s9u9DnNkq+UczyxB+jcY/9wLHc7m1xooYunausG0HwlgSx5YAgAGjYk+/D776D8302Y3gySch17HH
 NqaNqFjlPIzia2+bWk3vao3mV6/a02u4eJ9MN9jE/yE1oy7yiEOCMpBpQIwm2mrZk60vD3Q8D3Ve6
 97+ImnTKw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1htSZZ-0007h0-0W; Fri, 02 Aug 2019 08:05:57 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8B3D42029F4CB; Fri,  2 Aug 2019 10:05:54 +0200 (CEST)
Date: Fri, 2 Aug 2019 10:05:54 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: john.hubbard@gmail.com
Subject: Re: [PATCH 00/34] put_user_pages(): miscellaneous call sites
Message-ID: <20190802080554.GD2332@hirez.programming.kicks-ass.net>
References: <20190802021653.4882-1-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190802021653.4882-1-jhubbard@nvidia.com>
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
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

On Thu, Aug 01, 2019 at 07:16:19PM -0700, john.hubbard@gmail.com wrote:

> This is part a tree-wide conversion, as described in commit fc1d8e7cca2d
> ("mm: introduce put_user_page*(), placeholder versions"). That commit
> has an extensive description of the problem and the planned steps to
> solve it, but the highlites are:

That is one horridly mangled Changelog there :-/ It looks like it's
partially duplicated.

Anyway; no objections to any of that, but I just wanted to mention that
there are other problems with long term pinning that haven't been
mentioned, notably they inhibit compaction.

A long time ago I proposed an interface to mark pages as pinned, such
that we could run compaction before we actually did the pinning.

