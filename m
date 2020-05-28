Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 3875A1E5B0A
	for <lists+devel-orangefs@lfdr.de>; Thu, 28 May 2020 10:40:35 +0200 (CEST)
Received: from [::1] (port=37906 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jeE5a-0001Wd-6D
	for lists+devel-orangefs@lfdr.de; Thu, 28 May 2020 04:40:34 -0400
Received: from mail-ed1-f49.google.com ([209.85.208.49]:44860)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <guoqing.jiang@cloud.ionos.com>)
 id 1jeE5Y-0001Uj-Vy
 for devel@lists.orangefs.org; Thu, 28 May 2020 04:40:33 -0400
Received: by mail-ed1-f49.google.com with SMTP id d24so22483004eds.11
 for <devel@lists.orangefs.org>; Thu, 28 May 2020 01:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=XDdmB/aDu7vmw0I5lDV1Q4+gB4BypwighQ3lORBH3wc=;
 b=CAf+Dz0VmWC9ztDzhIYSQC5YVbiHg299UsxRcMebMK3XVuQcskr9cr//obYizUBr+R
 SKVtD55+vPtxiw53ri8K5USs5DFmuFlSazeRgHvcrAmaaeDFhJ+uUJtwxZQnq+7B6oyM
 zWNmnMPBYfdRFb5U/GUekJn3HfUFhIrm4XixJSRFtA4ymOC7zXxK8WJ1BHqFmaae6lXT
 5Us1elbOj6TDt69XYXExD6KadgdBL4mBFR+6Aa96MYHUMH84S/tkiyI5vphWCawc22pK
 pe1eEI8Hp4dBVsvnANDTySVLCVBzOApuuVA4YBL8FRi/ElxKqW5yqqKIUBMAI6Szc5cX
 vk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XDdmB/aDu7vmw0I5lDV1Q4+gB4BypwighQ3lORBH3wc=;
 b=i4RLLLns4zahk9gW4Rdws5d+TzwYnWe0EFX2IkENe4i5ZnclnnvaTrNe4tMWGrCpwW
 82kXqBKRnenkyPZsIn2cwsrIV+27e2eyevqs2Zalxc0OHCZ/ldpYy/0ekXR6cCdeYQ1d
 8gSalYwBV71W+BnkIc4it0V6VeLAf1YZW+5+DKx70zuY6I/VqmC2kjw1jHyjQUB5h8ww
 kaq7VROUrYjZps9ZFQ20qoE6LorkbNWYF/x8udXTIGO6SZoXxb3b0Oh/3DileMpFdHDK
 UqKMaf8UcYgS9hgQzqDick2Oj4OmGFsMxusCk+YqqvHIrqp+7IYIxkfignJPmL1R/Vm1
 hmHw==
X-Gm-Message-State: AOAM531P5kY9BpRVeOpmFuM8eLU9FrQPOcYdurE0hpePjQMEDpclS7YU
 t+TtCzWiE9RfPqHVoyiFaQ7FZD/UNGp43w==
X-Google-Smtp-Source: ABdhPJzvS0PuIZ3CoJAyjzLsVMlgK6IFKiAxLwcj9LsbX/47TMdsJOcP881ALFfWIKg9AldDIGqiIA==
X-Received: by 2002:a50:d715:: with SMTP id t21mr1892086edi.194.1590655191533; 
 Thu, 28 May 2020 01:39:51 -0700 (PDT)
Received: from ?IPv6:2001:16b8:4811:7000:e80e:f5df:f780:7d57?
 ([2001:16b8:4811:7000:e80e:f5df:f780:7d57])
 by smtp.gmail.com with ESMTPSA id r9sm4367835edg.13.2020.05.28.01.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2020 01:39:50 -0700 (PDT)
Subject: Re: [PATCH 08/10] orangefs: use attach/detach_page_private
To: Mike Marshall <hubcap@omnibond.com>
References: <20200517214718.468-1-guoqing.jiang@cloud.ionos.com>
 <20200517214718.468-9-guoqing.jiang@cloud.ionos.com>
 <CAOg9mSQ+nGCD-k2OwWWd6Ze_PAh3mhSOwYcLugD-SQHCb0ymWw@mail.gmail.com>
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Message-ID: <bd3495e7-1820-6268-1a5a-76f54421fb16@cloud.ionos.com>
Date: Thu, 28 May 2020 10:39:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAOg9mSQ+nGCD-k2OwWWd6Ze_PAh3mhSOwYcLugD-SQHCb0ymWw@mail.gmail.com>
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
Cc: Dave Chinner <david@fromorbit.com>, LKML <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, devel@lists.orangefs.org
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

On 5/26/20 11:54 PM, Mike Marshall wrote:
> I apologize for not mentioning that I ran this patch set
> through orangefs xfstests at 5.7 rc5 with no problems
> or regressions.

Glad to hear that, thanks for your effort.

Thanks,
Guoqing

