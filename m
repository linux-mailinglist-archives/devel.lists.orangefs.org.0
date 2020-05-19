Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id C17E91D956D
	for <lists+devel-orangefs@lfdr.de>; Tue, 19 May 2020 13:39:42 +0200 (CEST)
Received: from [::1] (port=43026 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jb0az-0002BF-JK
	for lists+devel-orangefs@lfdr.de; Tue, 19 May 2020 07:39:41 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:34900)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <sooraj@inhouseweb.tech>)
 id 1jb0ax-00028u-KX
 for devel@lists.orangefs.org; Tue, 19 May 2020 07:39:39 -0400
Received: by mail-pj1-f66.google.com with SMTP id 5so1282918pjd.0
 for <devel@lists.orangefs.org>; Tue, 19 May 2020 04:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inhouseweb.tech; s=google;
 h=from:to:subject:date:message-id:mime-version:thread-index
 :content-language;
 bh=BdAYlS7TC3xIwzw+MxDwoF0S4E10WzwsrsKBCu4yU28=;
 b=WwJ8oGi1ycuZ9awyGcETJXYssgiXEeEhcYwnzCqNvcyoZCNb8Z6qW3qcsRSN9k67xB
 rkoZgCevZsZYiHMu7HwS1wv4xUBh9iSZ4ivsU306yOokzPmMWEHL1s2vc7MmFm4JriN0
 hqsDWCdqIlpKHLZxC2csOJvmxjPS4OFfdzNQQm0l6k0Zw3vfh04jpbhWVywArq+JIvkP
 sM4OO4YrudyTDhqQiKb0T4+nT8IJlG8YowW+zXhszmebKAdpC9NEerg3WzyoYhgu4E4a
 5JWtMQRdNCWAP0fYPp/3/JZMjTcpcDrqKU0S0BMdPGgIV/hmzODc0et6+y7utiyvBBwt
 8nVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :thread-index:content-language;
 bh=BdAYlS7TC3xIwzw+MxDwoF0S4E10WzwsrsKBCu4yU28=;
 b=IztACaLuEZO2NNcsfkxwmX1GRDKRdQuEwy5GYLSrkURhaxccMY+OYejUXNBqyAF8e0
 StIc4mOxUt6+EO1yDfZh1WivLjEM+hdqZethDbdAXxbwcGX3Ff9wHPw/5FMSPO5WTqNd
 T5uSmmX6z2JXeWqSXz8BpJV6Tgf+Nd0dfahZPo3xw9HS2VMDGR5l9j9s7dkJqY1W1oxz
 2wdYRXl0qdPaWi4M0sMLcW4G8EfR93wAjBBeMzM6lGXNcieGhR/GXqdCb0CaRDLe5IGo
 yTeOFg8+SdK+ujLjQ23eF/L2mdRVHxIMVVlQFS8f2Py77/0e4vrpQmB4hr4nltLghQKn
 wd3g==
X-Gm-Message-State: AOAM530yF3aTmZbovMqGRGv2cTeAyZifi9Zd7apmcAObA5bRPvjB+SEx
 UIyu+CrPd0PfI7C2yeM6/08XWcGIqjc=
X-Google-Smtp-Source: ABdhPJxh7VTVF0JQogGzejcM8rjXO2n7QOcgf92UzGYnu/qYzldWYN1crXJLxhMPoTX6gW92kx7oTQ==
X-Received: by 2002:a17:90a:2009:: with SMTP id
 n9mr4158327pjc.81.1589888338477; 
 Tue, 19 May 2020 04:38:58 -0700 (PDT)
Received: from jeetuPC ([163.53.85.196])
 by smtp.gmail.com with ESMTPSA id y23sm1032799pgc.78.2020.05.19.04.38.57
 for <devel@lists.orangefs.org>
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Tue, 19 May 2020 04:38:58 -0700 (PDT)
From: "Sooraj" <sooraj@inhouseweb.tech>
To: <devel@lists.orangefs.org>
Subject: Web Design
Date: Tue, 19 May 2020 17:00:12 +0530
Message-ID: <243101d62dd2$14ad6ba0$3e0842e0$@tech>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AdYtonPrUHItl3ikSD6Ab+1/aMVt/g==
Content-Language: en-us
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

 

I found your web contact email from INTERNET devel@lists.orangefs.org.

 

I am Sooraj, (Web Designer) and I am working with a Digital Marketing Agency
from India.

 

We are providing Web Design and Web Development Service at affordable
prices.

 

We developed sites for various industries:

1. Website designs

2. Website development

3. Graphic designs

4. Facebook cover page design

 

If you are interested, then I can send you our price list, company
information and an affordable quotation with the best offer. And we work on
new technology.

 

Our pricing is very reasonable.

 

Thank you

Sooraj

