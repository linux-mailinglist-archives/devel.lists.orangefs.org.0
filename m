Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC941C0E4A
	for <lists+devel-orangefs@lfdr.de>; Fri,  1 May 2020 08:38:54 +0200 (CEST)
Received: from [::1] (port=40586 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jUPK1-0000ZK-SF
	for lists+devel-orangefs@lfdr.de; Fri, 01 May 2020 02:38:53 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53748)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <guoqing.jiang@cloud.ionos.com>)
 id 1jUPK0-0000YV-QM
 for devel@lists.orangefs.org; Fri, 01 May 2020 02:38:52 -0400
Received: by mail-wm1-f67.google.com with SMTP id k12so4982296wmj.3
 for <devel@lists.orangefs.org>; Thu, 30 Apr 2020 23:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=yXj2pdVP6i0fMstqZTjDinycQd6wkFMj6gwQt+noc8s=;
 b=igdtu79luKbp0ncnMlpcPUIFNLj09t5tdmXwPOynxALpGplpYNsCsKZ3TMVWdo9ixy
 9qcOgMNngF70aGp/iq6J334SDsCf0WvF+bfW4ShsvDr629zl7TV4YC0prPgNyXbEyMlW
 M1MwzmBX6wDzWgAHYgOPvyB2hfLG8XFlbXCydufpud/SGQ7MyIDh9SGccBouiyk8JPOD
 omSXRwL5PxUpdYANBC8EaED7ZmqMAkT/hWOPDTwnPPbIIdyI/RNn8FsVhdOgRXUne/0n
 FwcvzYyQzXR4siAZrRLlP9gvSaclMgDv8B/Qn8UpHmV/KeKMdWJCewHZdztoi6lv5/pf
 x8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=yXj2pdVP6i0fMstqZTjDinycQd6wkFMj6gwQt+noc8s=;
 b=oCgg/O5xVefFhBQhbU0A3cxr1PKCEMTkSasxZVD8hdscfZC5CKNUWC7OxNW+HIAGHo
 x2qYsTGBvf1n2Nfet9SaiTMf7pyJ0mT30cruNCzHBnMhfwQ2vrKSnAXE6r1dEEbcjHJ7
 FjaXgLWUXE+b5QF+Ra0RZANSuiB91YhfOLFaHldaaiRZRnAFda4Tpa6O+66q9Zizw4P5
 dGEBnynJREhK2un30il7rEZaSt/O+qL7B0hX5J+3RVQCjbvjiSPqub0kuz7TgLmHP20/
 xwUM6WJW1Lfk66ymhb58PPSMisFRXXr1kCO3HSUDsP02hldGU5YXRdmOCZwPcHmdyAi6
 ql9w==
X-Gm-Message-State: AGi0Pua2KtbumSvfKSlVozjyRBXzjDloMK9q6vb81b6Cuxr8C6LStZ5w
 9CIj3QOiQAvMpsVtiZvmefILEw==
X-Google-Smtp-Source: APiQypLtkGYIGGJq5BI6MtIPNjHZ3SCz/+s0PPQHI2w9oHJ8euTDIGJUWlFRjsunZB9rB6pxQ8UjcA==
X-Received: by 2002:a7b:cdf7:: with SMTP id p23mr2451834wmj.33.1588315091678; 
 Thu, 30 Apr 2020 23:38:11 -0700 (PDT)
Received: from ?IPv6:2001:16b8:48db:9b00:e80e:f5df:f780:7d57?
 ([2001:16b8:48db:9b00:e80e:f5df:f780:7d57])
 by smtp.gmail.com with ESMTPSA id x13sm2886685wmc.5.2020.04.30.23.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 23:38:11 -0700 (PDT)
Subject: Re: [RFC PATCH V2 1/9] include/linux/pagemap.h: introduce
 attach/clear_page_private
To: =?UTF-8?Q?Andreas_Gr=c3=bcnbacher?= <andreas.gruenbacher@gmail.com>
References: <20200430214450.10662-1-guoqing.jiang@cloud.ionos.com>
 <20200430214450.10662-2-guoqing.jiang@cloud.ionos.com>
 <CAHpGcMKdzSBGZTRwuoBTuCFUX44egmutvCr9LcjYW7KpWxmhHA@mail.gmail.com>
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Message-ID: <05178e19-8971-0f3d-69de-5542fcb6a2a8@cloud.ionos.com>
Date: Fri, 1 May 2020 08:38:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHpGcMKdzSBGZTRwuoBTuCFUX44egmutvCr9LcjYW7KpWxmhHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: devel@lists.orangefs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <devel.lists.orangefs.org>
List-Unsubscribe: <http://lists.orangefs.org/mailman/options/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=unsubscribe>
List-Archive: <http://lists.orangefs.org/pipermail/devel_lists.orangefs.org/>
List-Post: <mailto:devel@lists.orangefs.org>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Subscribe: <http://lists.orangefs.org/mailman/listinfo/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=subscribe>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Dave Chinner <david@fromorbit.com>, Song Liu <song@kernel.org>,
 Yafang Shao <laoar.shao@gmail.com>, Andreas Gruenbacher <agruenba@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Chris Mason <clm@fb.com>,
 willy@infradead.org, Christoph Hellwig <hch@infradead.org>,
 devel@lists.orangefs.org, Chao Yu <chao@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, linux-raid@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Anton Altaparmakov <anton@tuxera.com>, Andreas Dilger <adilger@dilger.ca>,
 Yang Shi <yang.shi@linux.alibaba.com>,
 William Kucharski <william.kucharski@oracle.com>,
 linux-ntfs-dev@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs <linux-xfs@vger.kernel.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 linux-btrfs@vger.kernel.org
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

On 5/1/20 12:10 AM, Andreas Grünbacher wrote:
> Hi,
>
> Am Do., 30. Apr. 2020 um 23:56 Uhr schrieb Guoqing Jiang
> <guoqing.jiang@cloud.ionos.com>:
>> The logic in attach_page_buffers and  __clear_page_buffers are quite
>> paired, but
>>
>> 1. they are located in different files.
>>
>> 2. attach_page_buffers is implemented in buffer_head.h, so it could be
>>     used by other files. But __clear_page_buffers is static function in
>>     buffer.c and other potential users can't call the function, md-bitmap
>>     even copied the function.
>>
>> So, introduce the new attach/clear_page_private to replace them. With
>> the new pair of function, we will remove the usage of attach_page_buffers
>> and  __clear_page_buffers in next patches. Thanks for the new names from
>> Christoph Hellwig.
>>
>> Suggested-by: Matthew Wilcox <willy@infradead.org>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: "Darrick J. Wong" <darrick.wong@oracle.com>
>> Cc: William Kucharski <william.kucharski@oracle.com>
>> Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>> Cc: Andreas Gruenbacher <agruenba@redhat.com>
>> Cc: Yang Shi <yang.shi@linux.alibaba.com>
>> Cc: Yafang Shao <laoar.shao@gmail.com>
>> Cc: Song Liu <song@kernel.org>
>> Cc: linux-raid@vger.kernel.org
>> Cc: Chris Mason <clm@fb.com>
>> Cc: Josef Bacik <josef@toxicpanda.com>
>> Cc: David Sterba <dsterba@suse.com>
>> Cc: linux-btrfs@vger.kernel.org
>> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>> Cc: Chao Yu <chao@kernel.org>
>> Cc: linux-f2fs-devel@lists.sourceforge.net
>> Cc: Christoph Hellwig <hch@infradead.org>
>> Cc: linux-xfs@vger.kernel.org
>> Cc: Anton Altaparmakov <anton@tuxera.com>
>> Cc: linux-ntfs-dev@lists.sourceforge.net
>> Cc: Mike Marshall <hubcap@omnibond.com>
>> Cc: Martin Brandenburg <martin@omnibond.com>
>> Cc: devel@lists.orangefs.org
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>> Cc: Roman Gushchin <guro@fb.com>
>> Cc: Andreas Dilger <adilger@dilger.ca>
>> Signed-off-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
>> ---
>> RFC -> RFC V2:  Address the comments from Christoph Hellwig
>> 1. change function names to attach/clear_page_private and add comments.
>> 2. change the return type of attach_page_private.
>>
>>   include/linux/pagemap.h | 35 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>
>> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
>> index a8f7bd8ea1c6..2e515f210b18 100644
>> --- a/include/linux/pagemap.h
>> +++ b/include/linux/pagemap.h
>> @@ -205,6 +205,41 @@ static inline int page_cache_add_speculative(struct page *page, int count)
>>          return __page_cache_add_speculative(page, count);
>>   }
>>
>> +/**
>> + * attach_page_private - attach data to page's private field and set PG_private.
>> + * @page: page to be attached and set flag.
>> + * @data: data to attach to page's private field.
>> + *
>> + * Need to take reference as mm.h said "Setting PG_private should also increment
>> + * the refcount".
>> + */
>> +static inline void attach_page_private(struct page *page, void *data)
>> +{
>> +       get_page(page);
>> +       set_page_private(page, (unsigned long)data);
>> +       SetPagePrivate(page);
>> +}
>> +
>> +/**
>> + * clear_page_private - clear page's private field and PG_private.
>> + * @page: page to be cleared.
>> + *
>> + * The counterpart function of attach_page_private.
>> + * Return: private data of page or NULL if page doesn't have private data.
>> + */
>> +static inline void *clear_page_private(struct page *page)
>> +{
>> +       void *data = (void *)page_private(page);
>> +
>> +       if (!PagePrivate(page))
>> +               return NULL;
>> +       ClearPagePrivate(page);
>> +       set_page_private(page, 0);
>> +       put_page(page);
>> +
>> +       return data;
>> +}
>> +
> I like this in general, but the name clear_page_private suggests that
> this might be the inverse operation of set_page_private, which it is
> not. So maybe this can be renamed to detach_page_private to more
> clearly indicate that it pairs with attach_page_private?

Yes, the new name is better, thank you!

Cheers,
Guoqing

