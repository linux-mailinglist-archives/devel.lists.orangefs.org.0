Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EF77EC50
	for <lists+devel-orangefs@lfdr.de>; Fri,  2 Aug 2019 07:50:40 +0200 (CEST)
Received: from [::1] (port=55436 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1htQSd-0003Mb-Ar
	for lists+devel-orangefs@lfdr.de; Fri, 02 Aug 2019 01:50:39 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:2989)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <jhubbard@nvidia.com>) id 1htQSb-0003LX-3I
 for devel@lists.orangefs.org; Fri, 02 Aug 2019 01:50:37 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d43cf030000>; Thu, 01 Aug 2019 22:49:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 01 Aug 2019 22:49:54 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 01 Aug 2019 22:49:54 -0700
Received: from [10.2.171.217] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Aug
 2019 05:49:53 +0000
Subject: Re: [PATCH 20/34] xen: convert put_page() to put_user_page*()
To: Juergen Gross <jgross@suse.com>, <john.hubbard@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-21-jhubbard@nvidia.com>
 <4471e9dc-a315-42c1-0c3c-55ba4eeeb106@suse.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <d5140833-e9ee-beb5-ff0a-2d13a4fe819f@nvidia.com>
Date: Thu, 1 Aug 2019 22:48:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4471e9dc-a315-42c1-0c3c-55ba4eeeb106@suse.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1564724995; bh=OWvjPY2RJnSXiNaT1G8Eyahp8MUAsm98cTkExQmaDUY=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=g4+wbBM5eRNl11+v4FSAl8PrvEnWACjbjTJMUv4Ewv3g+h7PgD8hueH5dPeoF8sW5
 c20eFrVi38BUjWugKSUxA2GH7CM3A3OrXQMppFfNCHg/NTgln/g1EuAeIEfsheR70J
 47ajhTYRdBziMz0qVCHRjvKDjLN869T+rpjyKMqZQbhfLl80UOF5a6wxQMkyYeuu5C
 +SnQBQbOJUSigTfdZ2ZjmuC0GsGJhOMqTD72slI2rg2m1d7LKmLad2tBrS2UUN+9aI
 ixGXEdOyIH0YMQhEWsNGgp8xCyCNq0cOZ0EzzfGMekaZZJReXbXnLe2japHjsnQzSN
 gxuwPmkfTC8TQ==
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
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

On 8/1/19 9:36 PM, Juergen Gross wrote:
> On 02.08.19 04:19, john.hubbard@gmail.com wrote:
>> From: John Hubbard <jhubbard@nvidia.com>
...
>> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
>> index 2f5ce7230a43..29e461dbee2d 100644
>> --- a/drivers/xen/privcmd.c
>> +++ b/drivers/xen/privcmd.c
>> @@ -611,15 +611,10 @@ static int lock_pages(
>> =C2=A0 static void unlock_pages(struct page *pages[], unsigned int nr_pa=
ges)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 unsigned int i;
>> -
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!pages)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> -=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < nr_pages; i++) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pages[i])
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 put_=
page(pages[i]);
>> -=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 put_user_pages(pages, nr_pages);
>=20
> You are not handling the case where pages[i] is NULL here. Or am I
> missing a pending patch to put_user_pages() here?
>=20

Hi Juergen,

You are correct--this no longer handles the cases where pages[i]
is NULL. It's intentional, though possibly wrong. :)

I see that I should have added my standard blurb to this
commit description. I missed this one, but some of the other patches
have it. It makes the following, possibly incorrect claim:

"This changes the release code slightly, because each page slot in the
page_list[] array is no longer checked for NULL. However, that check
was wrong anyway, because the get_user_pages() pattern of usage here
never allowed for NULL entries within a range of pinned pages."

The way I've seen these page arrays used with get_user_pages(),
things are either done single page, or with a contiguous range. So
unless I'm missing a case where someone is either

a) releasing individual pages within a range (and thus likely messing
up their count of pages they have), or

b) allocating two gup ranges within the same pages[] array, with a
gap between the allocations,

...then it should be correct. If so, then I'll add the above blurb
to this patch's commit description.

If that's not the case (both here, and in 3 or 4 other patches in this
series, then as you said, I should add NULL checks to put_user_pages()
and put_user_pages_dirty_lock().


thanks,
--=20
John Hubbard
NVIDIA

