Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC187F050
	for <lists+devel-orangefs@lfdr.de>; Fri,  2 Aug 2019 11:20:17 +0200 (CEST)
Received: from [::1] (port=52154 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1htTjU-0000UX-FR
	for lists+devel-orangefs@lfdr.de; Fri, 02 Aug 2019 05:20:16 -0400
Received: from mga18.intel.com ([134.134.136.126]:2968)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <joonas.lahtinen@linux.intel.com>)
 id 1htTjT-0000U5-72
 for devel@lists.orangefs.org; Fri, 02 Aug 2019 05:20:15 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2019 02:19:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,337,1559545200"; d="scan'208";a="178105348"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.3.11])
 by orsmga006.jf.intel.com with ESMTP; 02 Aug 2019 02:19:23 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Andrew Morton <akpm@linux-foundation.org>, john.hubbard@gmail.com
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
In-Reply-To: <20190802022005.5117-7-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-7-jhubbard@nvidia.com>
Message-ID: <156473756254.19842.12384378926183716632@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.7
Subject: Re: [PATCH 06/34] drm/i915: convert put_page() to put_user_page*()
Date: Fri, 02 Aug 2019 12:19:22 +0300
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
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 linux-block@vger.kernel.org,
 =?utf-8?b?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org
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

Quoting john.hubbard@gmail.com (2019-08-02 05:19:37)
> From: John Hubbard <jhubbard@nvidia.com>
> =

> For pages that were retained via get_user_pages*(), release those pages
> via the new put_user_page*() routines, instead of via put_page() or
> release_pages().
> =

> This is part a tree-wide conversion, as described in commit fc1d8e7cca2d
> ("mm: introduce put_user_page*(), placeholder versions").
> =

> Note that this effectively changes the code's behavior in
> i915_gem_userptr_put_pages(): it now calls set_page_dirty_lock(),
> instead of set_page_dirty(). This is probably more accurate.

We've already fixed this in drm-tip where the current code uses
set_page_dirty_lock().

This would conflict with our tree. Rodrigo is handling
drm-intel-next for 5.4, so you guys want to coordinate how
to merge.

Regards, Joonas

