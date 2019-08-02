Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C6E80072
	for <lists+devel-orangefs@lfdr.de>; Fri,  2 Aug 2019 20:50:30 +0200 (CEST)
Received: from [::1] (port=41910 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1htcdJ-0002qe-6T
	for lists+devel-orangefs@lfdr.de; Fri, 02 Aug 2019 14:50:29 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:15267)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <jhubbard@nvidia.com>) id 1htcdI-0002lR-1L
 for devel@lists.orangefs.org; Fri, 02 Aug 2019 14:50:28 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d4485cb0000>; Fri, 02 Aug 2019 11:49:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 02 Aug 2019 11:49:46 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 02 Aug 2019 11:49:46 -0700
Received: from [10.2.171.217] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Aug
 2019 18:49:45 +0000
Subject: Re: [PATCH 06/34] drm/i915: convert put_page() to put_user_page*()
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, <john.hubbard@gmail.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-7-jhubbard@nvidia.com>
 <156473756254.19842.12384378926183716632@jlahtine-desk.ger.corp.intel.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <7d9a9c57-4322-270b-b636-7214019f87e9@nvidia.com>
Date: Fri, 2 Aug 2019 11:48:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156473756254.19842.12384378926183716632@jlahtine-desk.ger.corp.intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1564771787; bh=S6tEtRzvj2UDxwZj4cj8eQvbGOkT9/8mALKEDpv4kUk=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Y3fHk+98nOh18vMhIm6oxYzfGEP8O2OFNum6iQoB2YYU2gm7Ou5mcASXhMaNa0kba
 BTSi3qY+ef5NxNUgS+af9aZz1Xc0xlcalUQEIFNZpatz8EG3c4tRcTzbThhIfTheTe
 KUIJTej9BZ3lpHo5Yb8ku9IclBxYdC+NGE9oZ9fgbh7w5eghYXLn/xfb7XAp0GzwuH
 IJ6d9B7kXtD+UvM1BqXw9xtNu+yigVn+igq6/71hO2kl6CxZVC/aFF46g+y63m13bY
 ASWUBsfN5BXUM2Pu5Zj4LSXQjLICQo96hEH38MKObK2sbDPzzqMyeBnMmqRYo7/r9E
 eYoSABVJVs3oQ==
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
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
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

On 8/2/19 2:19 AM, Joonas Lahtinen wrote:
> Quoting john.hubbard@gmail.com (2019-08-02 05:19:37)
>> From: John Hubbard <jhubbard@nvidia.com>
>>
>> For pages that were retained via get_user_pages*(), release those pages
>> via the new put_user_page*() routines, instead of via put_page() or
>> release_pages().
>>
>> This is part a tree-wide conversion, as described in commit fc1d8e7cca2d
>> ("mm: introduce put_user_page*(), placeholder versions").
>>
>> Note that this effectively changes the code's behavior in
>> i915_gem_userptr_put_pages(): it now calls set_page_dirty_lock(),
>> instead of set_page_dirty(). This is probably more accurate.
> 
> We've already fixed this in drm-tip where the current code uses
> set_page_dirty_lock().
> 
> This would conflict with our tree. Rodrigo is handling
> drm-intel-next for 5.4, so you guys want to coordinate how
> to merge.
> 

Hi Joonas, Rodrigo,

First of all, I apologize for the API breakage: put_user_pages_dirty_lock()
has an additional "dirty" parameter.

In order to deal with the merge problem, I'll drop this patch from my series,
and I'd recommend that the drm-intel-next take the following approach:

1) For now, s/put_page/put_user_page/ in i915_gem_userptr_put_pages(),
and fix up the set_page_dirty() --> set_page_dirty_lock() issue, like this
(based against linux.git):

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c 
b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 528b61678334..94721cc0093b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -664,10 +664,10 @@ i915_gem_userptr_put_pages(struct drm_i915_gem_object *obj,

         for_each_sgt_page(page, sgt_iter, pages) {
                 if (obj->mm.dirty)
-                       set_page_dirty(page);
+                       set_page_dirty_lock(page);

                 mark_page_accessed(page);
-               put_page(page);
+               put_user_page(page);
         }
         obj->mm.dirty = false;


That will leave you with your original set_page_dirty_lock() calls
and everything works properly.

2) Next cycle, move to the new put_user_pages_dirty_lock().

thanks,
-- 
John Hubbard
NVIDIA


> Regards, Joonas
> 

