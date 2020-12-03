Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C39B2CD6CC
	for <lists+devel-orangefs@lfdr.de>; Thu,  3 Dec 2020 14:31:15 +0100 (CET)
Received: from [::1] (port=40734 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1kkohW-0000Fa-1a
	for lists+devel-orangefs@lfdr.de; Thu, 03 Dec 2020 08:31:14 -0500
Received: from walmailout08.yourhostingaccount.com ([65.254.253.235]:56233)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from
 <SRS0=tcadRR=FH=a3cube-inc.com=federico@yourhostingaccount.com>)
 id 1kkohU-0000F0-Ek
 for devel@lists.orangefs.org; Thu, 03 Dec 2020 08:31:12 -0500
Received: from mailscan02.yourhostingaccount.com ([10.1.15.2]
 helo=walmailscan02.yourhostingaccount.com)
 by walmailout08.yourhostingaccount.com with esmtp (Exim)
 id 1kkogp-0006d7-Th
 for devel@lists.orangefs.org; Thu, 03 Dec 2020 08:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=a3cube-inc.com; s=dkim; h=Sender:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:To:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fRQVWpyaSsMEApa9apkYdp+wSRAq6jWNpNncYbFppO0=; b=WepJxd8X+AYMA1V6sF6uKeLoM+
 qVp554GIDbWd8l5VIbXrRMAeS0yN3zHTNYk6JPTAzD3lILbYUgYppChSuOTwO4QuzaPuOX3qcQ3VL
 76B0Ax2/muDLSE1ELqMkkpwVJjQ7DP0vL8HxN/KbtIrzzfnWYk+YIxYMwfx516Oe23JoK4e4IpnFm
 9s8LxxiV27If99RtdlAEN5glUilk2dORmwr0o4IoaM9/JGMvl/vb2P+ZDAVSn0f8fMrPi6eIxnBX3
 rQkcgA36UM70IgTaqRtjxAaejPao9sqTGRl/u+fJ+OWA+I2KhUZMlxS8ZbJ27lxAT5e0Lz2s68yQa
 8k1erIQA==;
Received: from [10.114.3.21] (helo=walimpout01)
 by walmailscan02.yourhostingaccount.com with esmtp (Exim)
 id 1kkogp-0006as-L7
 for devel@lists.orangefs.org; Thu, 03 Dec 2020 08:30:31 -0500
Received: from walauthsmtp57.yourhostingaccount.com ([10.1.18.57])
 by walimpout01 with 
 id zpWU230041Dsn0S01pWXfQ; Thu, 03 Dec 2020 08:30:31 -0500
X-Authority-Analysis: v=2.3 cv=Q5RJH7+a c=1 sm=1 tr=0
 a=btOFxceCRkvPd4MWh4haiQ==:117 a=wwTng74EcZ0buN1tViw3lg==:17
 a=IkcTkHD0fZMA:10 a=zTNgK-yGK50A:10 a=ddCU1J1SIDsA:10
 a=If22vhhw9Mc4Ff1N9fgA:9 a=QEXdDO2ut3YA:10 a=ZxKL5li47UoA:10
Received: from 195-72-210-229-static.intercom.it ([195.72.210.229]:39360
 helo=[192.168.1.147])
 by walauthsmtp57.yourhostingaccount.com with esmtpa (Exim)
 id 1kkogm-0002xj-A3
 for devel@lists.orangefs.org; Thu, 03 Dec 2020 08:30:28 -0500
To: devel@lists.orangefs.org
From: Federico Strati <federico@a3cube-inc.com>
Subject: About redundancy apart heartbeat
Message-ID: <ca2261a8-da13-889d-a846-6c5bac7e0615@a3cube-inc.com>
Date: Thu, 3 Dec 2020 14:30:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hello,

is there some mirroring scheme available in OrangeFS 2.9.8 for redundancy ?

Apart from the HA obtained via heartbeat.

I see in the code the files "create-immutable-copies.sm" and "mirror.sm".

Thanks in advance

Kind regards

Federico Strati


