Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 891E22DEDA1
	for <lists+devel-orangefs@lfdr.de>; Sat, 19 Dec 2020 08:05:07 +0100 (CET)
Received: from [::1] (port=44394 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1kqWIc-0006TF-Qe
	for lists+devel-orangefs@lfdr.de; Sat, 19 Dec 2020 02:05:06 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:13545)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <jhubbard@nvidia.com>) id 1kqWIb-0006Sc-NF
 for devel@lists.orangefs.org; Sat, 19 Dec 2020 02:05:05 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fdda5f80000>; Fri, 18 Dec 2020 23:04:24 -0800
Received: from [10.2.61.104] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 19 Dec
 2020 07:04:23 +0000
Subject: Re: set_page_dirty vs truncate
To: Matthew Wilcox <willy@infradead.org>
References: <20201218160531.GL15600@casper.infradead.org>
 <20201218220316.GO15600@casper.infradead.org>
 <20201219051852.GP15600@casper.infradead.org>
 <7a7c3052-74c7-c63b-5fe3-65d692c1c5d1@nvidia.com>
 <20201219065057.GR15600@casper.infradead.org>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <43f05a8f-25ce-a400-5825-d8fa159ee7f6@nvidia.com>
Date: Fri, 18 Dec 2020 23:04:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:84.0) Gecko/20100101
 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <20201219065057.GR15600@casper.infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1608361464; bh=A9fBx0IN5qsLyTEaO2K4aLwibDOVSe+bKLpimCocLwU=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=Bgc3aR4z753YGJlW70WoLrtQ1KN8IbRzq31juKs6PfBN2zkSGHtinWPesncivbs4W
 VzTsGi5zW6I314mN0sALuVKM7eV85d/U7RnCFRj/tuktF25zg4GPCpkEmzSS3hoUHK
 PP07gVgvL8A0z77WSBOvwn20T/s6MvL8eDcowYD4Rs6BCV3hJUYhWaiMpxkCZoQAqY
 RxKeghrOfimP4wXYxSRuO2xATbM6n5/MhNO06xr/el270Y+5EbFgXIlop0FK1iDT07
 VWPAhXQlelzCRLSGyvDrtBjTpyiR5AjbZTqDfGwl3tId3hrMABj+K1hpMKyp1AXgv6
 lwMu3rKNfv89A==
X-BeenThere: devel@lists.orangefs.org
X-Mailman-Version: 2.1.33
Precedence: list
List-Id: <devel.lists.orangefs.org>
List-Unsubscribe: <http://lists.orangefs.org/mailman/options/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=unsubscribe>
List-Archive: <http://lists.orangefs.org/pipermail/devel_lists.orangefs.org/>
List-Post: <mailto:devel@lists.orangefs.org>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Subscribe: <http://lists.orangefs.org/mailman/listinfo/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=subscribe>
Cc: linux-cifs@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
 Miklos Szeredi <miklos@szeredi.hu>, Dave Kleikamp <shaggy@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Dominique Martinet <asmadeus@codewreck.org>, linux-um@lists.infradead.org,
 linux-nfs@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>,
 Steve French <sfrench@samba.org>, linux-ntfs-dev@lists.sourceforge.net,
 Hans de Goede <hdegoede@redhat.com>, devel@lists.orangefs.org,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, Jeff Dike <jdike@addtoit.com>,
 Anton Altaparmakov <anton@tuxera.com>
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

On 12/18/20 10:50 PM, Matthew Wilcox wrote:
...
>>> Hmmm ... looks like __set_page_dirty_nobuffers() has a similar problem:
>>>
>>> {
>>>           lock_page_memcg(page);
>>>           if (!TestSetPageDirty(page)) {
>>>                   struct address_space *mapping = page_mapping(page);
>>>                   unsigned long flags;
>>>
>>>                   if (!mapping) {
>>>                           unlock_page_memcg(page);
>>>                           return 1;
>>>                   }
>>>
>>>                   xa_lock_irqsave(&mapping->i_pages, flags);
>>>                   BUG_ON(page_mapping(page) != mapping);
>>>
>>> sure, we check that the page wasn't truncated between set_page_dirty()
>>> and the call to TestSetPageDirty(), but we can truncate dirty pages
>>> with no problem.  So between the call to TestSetPageDirty() and
>>> the call to xa_lock_irqsave(), the page can be truncated, and the
>>> BUG_ON should fire.
>>>
>>> I haven't been able to find any examples of this, but maybe it's just a very
>>> narrow race.  Does anyone recognise this signature?  Adding the filesystems
>>> which use __set_page_dirty_nobuffers() directly without extra locking.
>>
>>
>> That sounds like the same *kind* of failure that Jan Kara and I were
>> seeing on live systems[1], that led eventually to the gup-to-pup
>> conversion exercise.
>>
>> That crash happened due to calling set_page_dirty() on pages that had no
>> buffers on them [2]. And that sounds like *exactly* the same thing as
>> calling __set_page_dirty_nobuffers() without extra locking. So I'd
>> expect that it's Just Wrong To Do, for the same reasons as Jan spells
>> out very clearly in [1].
> 
> Interesting.  It's a bit different, *but* Jan's race might be what's
> causing this symptom.  The reason is that the backtrace contains
> set_page_dirty_lock() which holds the page lock.  So there can't be
> a truncation race because truncate holds the page lock when calling
> ->invalidatepage.
> 
> That said, the syzbot reproducer doesn't have any O_DIRECT in it
> either.  So maybe this is some other race?

Jan's race can be also be reproduced *without* O_DIRECT. I first saw
it via a program that just did these steps on a normal ext4 filesystem:

a) pin ext4 file-backed pages, via get_user_pages(). Actually the way
it got here was due to using what *looked* like anonymous RAM to the
program, but was really file-backed RAM, because the admin had it
set up to mount ext4 on /tmp, instead of using tmpfs, to "save RAM",
but I digress. :)

b) wait a while, optionally do some DMA on the pages from a GPU, drink
coffee...

c) call set_pages_dirty()

d) unpin the pages

e) BUG_ON() in page_buffers().


thanks,
-- 
John Hubbard
NVIDIA

