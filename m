Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D787EC77
	for <lists+devel-orangefs@lfdr.de>; Fri,  2 Aug 2019 08:10:54 +0200 (CEST)
Received: from [::1] (port=57094 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1htQmD-0004DX-Ve
	for lists+devel-orangefs@lfdr.de; Fri, 02 Aug 2019 02:10:53 -0400
Received: from mx2.suse.de ([195.135.220.15]:51608 helo=mx1.suse.de)
 by mm1.emwd.com with esmtps (TLSv1.2:AECDH-AES256-SHA:256)
 (Exim 4.92) (envelope-from <jgross@suse.com>) id 1htQmB-0004D3-DW
 for devel@lists.orangefs.org; Fri, 02 Aug 2019 02:10:51 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 95267B634;
 Fri,  2 Aug 2019 06:10:09 +0000 (UTC)
Subject: Re: [PATCH 20/34] xen: convert put_page() to put_user_page*()
To: John Hubbard <jhubbard@nvidia.com>, john.hubbard@gmail.com,
 Andrew Morton <akpm@linux-foundation.org>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-21-jhubbard@nvidia.com>
 <4471e9dc-a315-42c1-0c3c-55ba4eeeb106@suse.com>
 <d5140833-e9ee-beb5-ff0a-2d13a4fe819f@nvidia.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <d4931311-db01-e8c3-0f8c-d64685dc2143@suse.com>
Date: Fri, 2 Aug 2019 08:10:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d5140833-e9ee-beb5-ff0a-2d13a4fe819f@nvidia.com>
Content-Language: de-DE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.27
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

On 02.08.19 07:48, John Hubbard wrote:
> On 8/1/19 9:36 PM, Juergen Gross wrote:
>> On 02.08.19 04:19, john.hubbard@gmail.com wrote:
>>> From: John Hubbard <jhubbard@nvidia.com>
> ...
>>> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
>>> index 2f5ce7230a43..29e461dbee2d 100644
>>> --- a/drivers/xen/privcmd.c
>>> +++ b/drivers/xen/privcmd.c
>>> @@ -611,15 +611,10 @@ static int lock_pages(
>>>   static void unlock_pages(struct page *pages[], unsigned int nr_pages)
>>>   {
>>> -    unsigned int i;
>>> -
>>>       if (!pages)
>>>           return;
>>> -    for (i = 0; i < nr_pages; i++) {
>>> -        if (pages[i])
>>> -            put_page(pages[i]);
>>> -    }
>>> +    put_user_pages(pages, nr_pages);
>>
>> You are not handling the case where pages[i] is NULL here. Or am I
>> missing a pending patch to put_user_pages() here?
>>
> 
> Hi Juergen,
> 
> You are correct--this no longer handles the cases where pages[i]
> is NULL. It's intentional, though possibly wrong. :)
> 
> I see that I should have added my standard blurb to this
> commit description. I missed this one, but some of the other patches
> have it. It makes the following, possibly incorrect claim:
> 
> "This changes the release code slightly, because each page slot in the
> page_list[] array is no longer checked for NULL. However, that check
> was wrong anyway, because the get_user_pages() pattern of usage here
> never allowed for NULL entries within a range of pinned pages."
> 
> The way I've seen these page arrays used with get_user_pages(),
> things are either done single page, or with a contiguous range. So
> unless I'm missing a case where someone is either
> 
> a) releasing individual pages within a range (and thus likely messing
> up their count of pages they have), or
> 
> b) allocating two gup ranges within the same pages[] array, with a
> gap between the allocations,
> 
> ...then it should be correct. If so, then I'll add the above blurb
> to this patch's commit description.
> 
> If that's not the case (both here, and in 3 or 4 other patches in this
> series, then as you said, I should add NULL checks to put_user_pages()
> and put_user_pages_dirty_lock().

In this case it is not correct, but can easily be handled. The NULL case
can occur only in an error case with the pages array filled partially or
not at all.

I'd prefer something like the attached patch here.


Juergen
