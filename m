Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C7B800ED
	for <lists+devel-orangefs@lfdr.de>; Fri,  2 Aug 2019 21:27:23 +0200 (CEST)
Received: from [::1] (port=47894 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1htdD0-00053J-RG
	for lists+devel-orangefs@lfdr.de; Fri, 02 Aug 2019 15:27:22 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:17237)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <jhubbard@nvidia.com>) id 1htdCz-00052U-Q6
 for devel@lists.orangefs.org; Fri, 02 Aug 2019 15:27:21 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d448e710000>; Fri, 02 Aug 2019 12:26:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 02 Aug 2019 12:26:39 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 02 Aug 2019 12:26:39 -0700
Received: from [10.2.171.217] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Aug
 2019 19:26:39 +0000
Subject: Re: [PATCH 20/34] xen: convert put_page() to put_user_page*()
To: "Weiny, Ira" <ira.weiny@intel.com>, Juergen Gross <jgross@suse.com>,
 "john.hubbard@gmail.com" <john.hubbard@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-21-jhubbard@nvidia.com>
 <4471e9dc-a315-42c1-0c3c-55ba4eeeb106@suse.com>
 <d5140833-e9ee-beb5-ff0a-2d13a4fe819f@nvidia.com>
 <d4931311-db01-e8c3-0f8c-d64685dc2143@suse.com>
 <2807E5FD2F6FDA4886F6618EAC48510E79E66216@CRSMSX101.amr.corp.intel.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <746b2412-f48a-9722-2763-253a1b9c899d@nvidia.com>
Date: Fri, 2 Aug 2019 12:25:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2807E5FD2F6FDA4886F6618EAC48510E79E66216@CRSMSX101.amr.corp.intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1564774001; bh=rRhheBqnK3+cjDjuz6CHnpsz5YflbO5z8PXp1A2YK5w=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=byi/JLB7CNtV06561y8XoJ3SAPfLWvMAReG7pbHQL4vyYMWIeKNh0N7pvRnXFQG1L
 qdrcKeqyYLdfyHlBvNt3iltX04f4l9yslTmpDdtWvq1t3b7bkuO+rrbkZHys+WsmhV
 6Aa9W+8qQAz5X83c7tyDcDc6Mg36wKOuzq27pabbfn+69ez0SBMHEuaNtlKh20Fcaj
 gTip6LdymKj+uFDjnVTxb7sYVNWRS9rebCu5gBiFOf/CT8TUXKtD/8+Sk9b10OKO7l
 1Y0kk6maXEh1JdSy6qqRDc1JYyIdeVQu9Kdnt4cKXn6PzYq3IXSks/FI+pwJb3dRVj
 9ZhtT6T5hfRNQ==
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "Williams, Dan
 J" <dan.j.williams@intel.com>,
 "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "devel@lists.orangefs.org" <devel@lists.orangefs.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
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

On 8/2/19 9:09 AM, Weiny, Ira wrote:
>>
>> On 02.08.19 07:48, John Hubbard wrote:
>>> On 8/1/19 9:36 PM, Juergen Gross wrote:
>>>> On 02.08.19 04:19, john.hubbard@gmail.com wrote:
>>>>> From: John Hubbard <jhubbard@nvidia.com>
>>> ...
>>> If that's not the case (both here, and in 3 or 4 other patches in this
>>> series, then as you said, I should add NULL checks to put_user_pages()
>>> and put_user_pages_dirty_lock().
>>
>> In this case it is not correct, but can easily be handled. The NULL case can
>> occur only in an error case with the pages array filled partially or not at all.
>>
>> I'd prefer something like the attached patch here.
> 
> I'm not an expert in this code and have not looked at it carefully but that patch does seem to be the better fix than forcing NULL checks on everyone.
> 

OK, I'll use Juergen's approach, and also check for that pattern in the
other patches.


thanks,
-- 
John Hubbard
NVIDIA

