Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6092CEAFE
	for <lists+devel-orangefs@lfdr.de>; Fri,  4 Dec 2020 10:36:21 +0100 (CET)
Received: from [::1] (port=53480 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1kl7Vk-00072z-NR
	for lists+devel-orangefs@lfdr.de; Fri, 04 Dec 2020 04:36:20 -0500
Received: from walmailout08.yourhostingaccount.com ([65.254.253.235]:35101)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from
 <SRS0=rPM7XY=FI=a3cube-inc.com=federico@yourhostingaccount.com>)
 id 1kl7Vk-00072g-6z
 for devel@lists.orangefs.org; Fri, 04 Dec 2020 04:36:20 -0500
Received: from mailscan01.yourhostingaccount.com ([10.1.15.1]
 helo=walmailscan01.yourhostingaccount.com)
 by walmailout08.yourhostingaccount.com with esmtp (Exim)
 id 1kl7V5-000527-Mm
 for devel@lists.orangefs.org; Fri, 04 Dec 2020 04:35:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=a3cube-inc.com; s=dkim; h=Sender:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UF/nXI0gsBL1DN/m/2HY3iyRHtossVXg5HZABcIxig0=; b=STAV7IYtCHJQOdfZqT37a+zZvZ
 WDvnH31w+LTQL7iLo6jw/6jOu+cLeZKG/JDJa1vGpWFxop69eezufxvdwXe0Zc4i7YJ8BM854Qra5
 YF00wPNPrQsCIK/QVwmuH7qhuUckZpoWhX9NnWWTmhYll0fF7EKNOUYuGG1eJ3OlkfNmBUKDPbETJ
 3fVwphPQO2z6ro06s2OXnala8tHBH8FvxA4Uz8uDdVLzjqhllAlsgkDmIpeCGHh0rXv45hIGCXFpU
 wAFoH/KvId0YoEHAGwFvo8iQWtqHOiwy4V8uSEfi/XLjrw6a6JR+9lB/NiH+5AoOIjy/HTDASL516
 yEskQkWA==;
Received: from [10.114.3.23] (helo=walimpout03)
 by walmailscan01.yourhostingaccount.com with esmtp (Exim)
 id 1kl7V5-0004uk-EL
 for devel@lists.orangefs.org; Fri, 04 Dec 2020 04:35:39 -0500
Received: from walauthsmtp57.yourhostingaccount.com ([10.1.18.57])
 by walimpout03 with 
 id 09bc240011Dsn0S019bfmP; Fri, 04 Dec 2020 04:35:39 -0500
X-Authority-Analysis: v=2.3 cv=VsS4/9+n c=1 sm=1 tr=0
 a=btOFxceCRkvPd4MWh4haiQ==:117 a=wwTng74EcZ0buN1tViw3lg==:17
 a=IkcTkHD0fZMA:10 a=zTNgK-yGK50A:10 a=ddCU1J1SIDsA:10 a=CETZypIUAAAA:20
 a=Y1QP9gsNRkLAOtNkkXkA:9 a=QEXdDO2ut3YA:10 a=yV-YU3GSW7DPt5tp1T4P:22
Received: from 195-72-210-229-static.intercom.it ([195.72.210.229]:41828
 helo=[192.168.1.147])
 by walauthsmtp57.yourhostingaccount.com with esmtpa (Exim)
 id 1kl7V2-0004KS-3K; Fri, 04 Dec 2020 04:35:36 -0500
Subject: Re: About redundancy apart heartbeat
To: Walt Ligon <walt@omnibond.com>
References: <ca2261a8-da13-889d-a846-6c5bac7e0615@a3cube-inc.com>
 <332abefd-9b61-2eaf-923d-9b6301d46357@omnibond.com>
Cc: devel@lists.orangefs.org
From: Federico Strati <federico@a3cube-inc.com>
Message-ID: <70714cb5-5eb9-9b13-eb82-8bea22fa28c2@a3cube-inc.com>
Date: Fri, 4 Dec 2020 10:35:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <332abefd-9b61-2eaf-923d-9b6301d46357@omnibond.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EN-UserInfo: 5e98131c36d934fff30f0e78511f000a:931c98230c6409dcc37fa7e93b490c27
X-EN-AuthUser: federico@a3cube-inc.com
X-EN-OrigIP: 195.72.210.229
X-EN-OrigHost: 195-72-210-229-static.intercom.it
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

Hello Walt,

thanks for your reply, I see that

https://github.com/waltligon/orangefs

is the official repository.

Can you point me to the branches (if not master) for V3 ?

Thanks in advance

Kind regards

Federico

On 03/12/20 23:14, Walt Ligon wrote:
> At one point we implemented a scheme that mirrored data files across 
> servers for files that were set immutable.  Since the file was 
> immutable there is no writing to the file, so no updating of copies.  
> This was useful for a people with certain problems.
>
> OFS Version 3 has full configurable redundancy for Trove objects - 
> both data and metadata.  Of course V3 is still being written and is 
> somewhat stalled since covid19.
>
> Walt
>
> On 12/3/20 8:30 AM, Federico Strati wrote:
>> Hello,
>>
>> is there some mirroring scheme available in OrangeFS 2.9.8 for 
>> redundancy ?
>>
>> Apart from the HA obtained via heartbeat.
>>
>> I see in the code the files "create-immutable-copies.sm" and 
>> "mirror.sm".
>>
>> Thanks in advance
>>
>> Kind regards
>>
>> Federico Strati
>>
>>

