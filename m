Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id E25B88083B
	for <lists+devel-orangefs@lfdr.de>; Sat,  3 Aug 2019 22:03:49 +0200 (CEST)
Received: from [::1] (port=56610 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hu0Fo-0005jI-QP
	for lists+devel-orangefs@lfdr.de; Sat, 03 Aug 2019 16:03:48 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:10533)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <jhubbard@nvidia.com>) id 1hu0Fn-0005iz-GU
 for devel@lists.orangefs.org; Sat, 03 Aug 2019 16:03:47 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d45e87a0000>; Sat, 03 Aug 2019 13:03:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Sat, 03 Aug 2019 13:03:06 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Sat, 03 Aug 2019 13:03:06 -0700
Received: from [10.110.48.28] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 3 Aug
 2019 20:03:05 +0000
Subject: Re: [PATCH 06/34] drm/i915: convert put_page() to put_user_page*()
From: John Hubbard <jhubbard@nvidia.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, <john.hubbard@gmail.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-7-jhubbard@nvidia.com>
 <156473756254.19842.12384378926183716632@jlahtine-desk.ger.corp.intel.com>
 <7d9a9c57-4322-270b-b636-7214019f87e9@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <22c309f6-a7ca-2624-79c3-b16a1487f488@nvidia.com>
Date: Sat, 3 Aug 2019 13:03:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7d9a9c57-4322-270b-b636-7214019f87e9@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1564862587; bh=ilU/8cKxAxLoWjJW9QtQ++HPyf9Kp7C47ReaMR8aBDk=;
 h=X-PGP-Universal:Subject:From:To:CC:References:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=I2YSIJHtEvh6s6ys5+qZOy9oK09e18lfnMQt77fXZCyrgzqntxCUGfZ7oWikmHJt5
 4V1+y4MySAejsYy1JLbf4x7KQ0hiidb6jg5xsakkPPG/MxjywoS180jIN6uhV11y/O
 011sP6dgxSCe7CPHZfVmc5h9v3h4EFz6CzWGnO3zjeLQA+xNf7n8Aq4VIo5dqejc1s
 ogxZqWO3QmjUKVwNVzjjVrVg9ptoPI8+f8bAuuTtyZ6ixyHn7fxeF7f3r5zkr6u4id
 LKe10E8R/74E4Fa+DG9GwiVmNsBu++raNIZCy4+8RyCJBTlO14Pl8lc8yCIpDgUHCO
 oxDfeJ3aA6pnw==
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

On 8/2/19 11:48 AM, John Hubbard wrote:
> On 8/2/19 2:19 AM, Joonas Lahtinen wrote:
>> Quoting john.hubbard@gmail.com (2019-08-02 05:19:37)
>>> From: John Hubbard <jhubbard@nvidia.com>
...
> In order to deal with the merge problem, I'll drop this patch from my ser=
ies,
> and I'd recommend that the drm-intel-next take the following approach:

Actually, I just pulled the latest linux.git, and there are a few changes:

>=20
> 1) For now, s/put_page/put_user_page/ in i915_gem_userptr_put_pages(),
> and fix up the set_page_dirty() --> set_page_dirty_lock() issue, like thi=
s
> (based against linux.git):
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_userptr.c
> index 528b61678334..94721cc0093b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> @@ -664,10 +664,10 @@ i915_gem_userptr_put_pages(struct drm_i915_gem_obje=
ct *obj,
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_sgt_page(page, sgt_it=
er, pages) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (obj->mm.dirty)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_page_dirty=
(page);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_page_dirty=
_lock(page);

I see you've already applied this fix to your tree, in linux.git already.

>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 mark_page_accessed(page);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 put_page(page);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 put_user_page(page);

But this conversion still needs doing. So I'll repost a patch that only doe=
s=20
this (plus the other call sites).=20

That can go in via either your tree, or Andrew's -mm tree, without generati=
ng
any conflicts.

thanks,
--=20
John Hubbard
NVIDIA

