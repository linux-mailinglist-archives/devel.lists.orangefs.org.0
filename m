Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEB4858BE
	for <lists+devel-orangefs@lfdr.de>; Thu,  8 Aug 2019 05:47:34 +0200 (CEST)
Received: from [::1] (port=47648 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hvZOn-0007b4-Fi
	for lists+devel-orangefs@lfdr.de; Wed, 07 Aug 2019 23:47:33 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:14418)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <jhubbard@nvidia.com>) id 1hvZOm-0007aw-MZ
 for devel@lists.orangefs.org; Wed, 07 Aug 2019 23:47:32 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d4b9b2c0000>; Wed, 07 Aug 2019 20:46:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 07 Aug 2019 20:46:51 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 07 Aug 2019 20:46:51 -0700
Received: from ngvpn01-164-84.dyn.scz.us.nvidia.com (172.20.13.39) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Thu, 8 Aug 2019 03:46:50 +0000
Subject: Re: [PATCH 00/34] put_user_pages(): miscellaneous call sites
To: Ira Weiny <ira.weiny@intel.com>, Michal Hocko <mhocko@kernel.org>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802091244.GD6461@dhcp22.suse.cz>
 <20190802124146.GL25064@quack2.suse.cz>
 <20190802142443.GB5597@bombadil.infradead.org>
 <20190802145227.GQ25064@quack2.suse.cz>
 <076e7826-67a5-4829-aae2-2b90f302cebd@nvidia.com>
 <20190807083726.GA14658@quack2.suse.cz>
 <20190807084649.GQ11812@dhcp22.suse.cz>
 <20190808023637.GA1508@iweiny-DESK2.sc.intel.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <e648a7f3-6a1b-c9ea-1121-7ab69b6b173d@nvidia.com>
Date: Wed, 7 Aug 2019 20:46:50 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808023637.GA1508@iweiny-DESK2.sc.intel.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1565236013; bh=oa/UlzMF1BY8hfwSUK2E34E4BK86wv0rI2GL87o8kWQ=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=caNdsK+H718e8IaMHboxAo7N5kSDjdO0aPPP7qMD/uXC6LIuseTU5yocCYztoyhLS
 A8theOeNn9DFbaKSyltNZVy/0B3VPZPEr/7HwHnfipqBI1W9E/1RXgk4cYboMCcd2v
 K1AubOjDxM7RJmlTd1q1ZO/DARZkbUQqfdDa7AtzCGn8CgjUMfboXlhtit5supcfVJ
 t3SF5BlWoOZ+ktHQ+Gy0QbysjhXaepl4K0zI9Pv3YsYauPp0cOOqMsTfKIdJYZp847
 qDjXLEk745BEl9a58mwF6yYg4Z7StCZBL718mfzBDBCPCwNZsIoTbJbWCkazTDd50+
 NvHzitKycTv2g==
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
 amd-gfx@lists.freedesktop.org, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
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

On 8/7/19 7:36 PM, Ira Weiny wrote:
> On Wed, Aug 07, 2019 at 10:46:49AM +0200, Michal Hocko wrote:
>> On Wed 07-08-19 10:37:26, Jan Kara wrote:
>>> On Fri 02-08-19 12:14:09, John Hubbard wrote:
>>>> On 8/2/19 7:52 AM, Jan Kara wrote:
>>>>> On Fri 02-08-19 07:24:43, Matthew Wilcox wrote:
>>>>>> On Fri, Aug 02, 2019 at 02:41:46PM +0200, Jan Kara wrote:
>>>>>>> On Fri 02-08-19 11:12:44, Michal Hocko wrote:
>>>>>>>> On Thu 01-08-19 19:19:31, john.hubbard@gmail.com wrote:
  [...]
> Before I go on, I would like to say that the "imbalance" of get_user_pages()
> and put_page() bothers me from a purist standpoint...  However, since this
> discussion cropped up I went ahead and ported my work to Linus' current master
> (5.3-rc3+) and in doing so I only had to steal a bit of Johns code...  Sorry
> John...  :-(
> 
> I don't have the commit messages all cleaned up and I know there may be some
> discussion on these new interfaces but I wanted to throw this series out there
> because I think it may be what Jan and Michal are driving at (or at least in
> that direction.
> 
> Right now only RDMA and DAX FS's are supported.  Other users of GUP will still
> fail on a DAX file and regular files will still be at risk.[2]
> 
> I've pushed this work (based 5.3-rc3+ (33920f1ec5bf)) here[3]:
> 
> https://github.com/weiny2/linux-kernel/tree/linus-rdmafsdax-b0-v3
> 
> I think the most relevant patch to this conversation is:
> 
> https://github.com/weiny2/linux-kernel/commit/5d377653ba5cf11c3b716f904b057bee6641aaf6
> 

ohhh...can you please avoid using the old __put_user_pages_dirty()
function? I thought I'd caught things early enough to get away with
the rename and deletion of that. You could either:

a) open code an implementation of vaddr_put_pages_dirty_lock() that
doesn't call any of the *put_user_pages_dirty*() variants, or

b) include my first patch ("") are part of your series, or

c) base this on Andrews's tree, which already has merged in my first patch.


thanks,
-- 
John Hubbard
NVIDIA

