Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E1F1B99AC
	for <lists+devel-orangefs@lfdr.de>; Mon, 27 Apr 2020 10:19:15 +0200 (CEST)
Received: from [::1] (port=59298 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jSyyw-0004hd-Km
	for lists+devel-orangefs@lfdr.de; Mon, 27 Apr 2020 04:19:14 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55211)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <guoqing.jiang@cloud.ionos.com>)
 id 1jSyyv-0004h3-Ba
 for devel@lists.orangefs.org; Mon, 27 Apr 2020 04:19:13 -0400
Received: by mail-wm1-f67.google.com with SMTP id h4so5234665wmb.4
 for <devel@lists.orangefs.org>; Mon, 27 Apr 2020 01:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=nexsKNIAawz43xJ/+27exH8imkbeH1NfQDDNoT4uP+g=;
 b=M7xEpjZ3CessG+SINts/wDYLCwIEjZ4vyzamIT03NbDgDQXm+ZOncvEv2SnYwT6aIg
 t1+8LpZogfYOGM8hM5Tz6Yf5qJLRMrGdBROuGvMxDi/Q8ktk52fOF/q+xl0y73qhm5HI
 zftiw88FUwfmzj4EAsz+nQmqhzhCSc5x+MtGROadcU381AyVJwfq6DqCQIXzcyw738r1
 XqZzFXY1oZkg3bNwEJOXnfmxWG0/2pzBnQV4HNPIJeJixxQ5Vfe1k05lhwbd8/Eqm9yr
 /H2yQ+EOYTGig1gCYO+lUKlIlLkypKs9QMQZyixX30bsql7iQpFbenJF2PG2FMxU3oIR
 TvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=nexsKNIAawz43xJ/+27exH8imkbeH1NfQDDNoT4uP+g=;
 b=jPjFFp0lgeRHOs6izhMsFB5Z93xabHC/8zUw1yj6IGx94A3X8HyJOoVP9xHqF8wso3
 KBsTClGvQLKRFDkUKqaM9tQ3WnWez6POA/lDsbCddcbFBDinqf6h5x1bA/snKZXxy6S1
 7oYKxsaPVc8ds1rFpjhDvdGIBVlZ/iDcUB76y7s/8YUQXf7KbjCRQDNtU7yYmx/hoOwk
 I4yZX6/YcWfZpH+OZNTZc8TDPZZ4QqFwjvr3Z8DUPsc0xaDkj71tLouNeCzbxOBCqRvG
 5CoI/tTEIhU1VYrMsQnbbLrHDLg6uUf8OfnQYT+bvH5OHpnXRVXVvoNYjEIz5Wzesxs5
 K3gg==
X-Gm-Message-State: AGi0PuY/NmnqZ6jgosLHZMTT4Ymyzk/RRSiClZfz2vH8fFDiTBc62/xg
 LONyZ2W8IRR1tcbjlfFpcJQbvQChrYpKLX8Z
X-Google-Smtp-Source: APiQypLDYwqKL13+uGJEVkrYOMe2jJVaaMrDZ7cNTTbGJGhFOHOdAk1CPY8M9TMIs5nGg5KfyVuhdQ==
X-Received: by 2002:a1c:1d4b:: with SMTP id d72mr23965375wmd.19.1587975512127; 
 Mon, 27 Apr 2020 01:18:32 -0700 (PDT)
Received: from ?IPv6:2001:16b8:4886:8400:6d4b:554:cd7c:6b19?
 ([2001:16b8:4886:8400:6d4b:554:cd7c:6b19])
 by smtp.gmail.com with ESMTPSA id p16sm19639474wro.21.2020.04.27.01.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2020 01:18:31 -0700 (PDT)
Subject: Re: [RFC PATCH 8/9] orangefs: use set/clear_fs_page_private
To: Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>
References: <20200426214925.10970-1-guoqing.jiang@cloud.ionos.com>
 <20200426214925.10970-9-guoqing.jiang@cloud.ionos.com>
 <20200426222455.GB2005@dread.disaster.area>
 <20200427001234.GB29705@bombadil.infradead.org>
 <20200427022709.GC2005@dread.disaster.area>
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Message-ID: <ac7728a0-c184-214a-70a9-ae219db72331@cloud.ionos.com>
Date: Mon, 27 Apr 2020 10:18:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427022709.GC2005@dread.disaster.area>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, devel@lists.orangefs.org
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

Hi Mattew and Dave,

On 4/27/20 4:27 AM, Dave Chinner wrote:
> On Sun, Apr 26, 2020 at 05:12:34PM -0700, Matthew Wilcox wrote:
>> On Mon, Apr 27, 2020 at 08:24:55AM +1000, Dave Chinner wrote:
>>>> @@ -460,17 +456,13 @@ static void orangefs_invalidatepage(struct page *page,
>>>>   
>>>>   	if (offset == 0 && length == PAGE_SIZE) {
>>>>   		kfree((struct orangefs_write_range *)page_private(page));
>>>> -		set_page_private(page, 0);
>>>> -		ClearPagePrivate(page);
>>>> -		put_page(page);
>>>> +		clear_fs_page_private(page);
>>> Ditto:
>>> 		wr = clear_fs_page_private(page);
>>> 		kfree(wr);
>> You don't want to be as succinct as the btrfs change you suggested?
>>
>> 		kfree(clear_fs_page_private(page));
> That could be done, yes. I was really just trying to point out the
> use after free that was occurring here rather than write compact
> code...

Really appreciate for your review, thanks.

Best Regards,
Guoqing

