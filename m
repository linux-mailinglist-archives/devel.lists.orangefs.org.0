Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFD830A243
	for <lists+devel-orangefs@lfdr.de>; Mon,  1 Feb 2021 07:59:15 +0100 (CET)
Received: from [::1] (port=60220 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1l6TB4-0005VX-6X
	for lists+devel-orangefs@lfdr.de; Mon, 01 Feb 2021 01:59:14 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35759)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <daisy@growthrecords.com>)
 id 1l6TB2-0005Ti-95
 for devel@lists.orangefs.org; Mon, 01 Feb 2021 01:59:12 -0500
Received: by mail-pl1-f196.google.com with SMTP id g3so9439792plp.2
 for <devel@lists.orangefs.org>; Sun, 31 Jan 2021 22:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=growthrecords.com; s=google;
 h=from:to:subject:date:message-id:mime-version:thread-index
 :content-language;
 bh=CQQIU/s8/DuoKBrspRep4Zrts5nRfqG429oApVzxoSA=;
 b=SkKyO5whF0ak7Luff0mXsIXTcL+S8/RpBjRbjPv1bU0otbJOkhNdPbREWWVlGZV/Vt
 cxzmsypXcioshtTECKeqrQpW14Ibj7fatW5na0zZm7JZC5HfJrt6+lQ5Qs6t8lo3Fftr
 Ty1tbTuzsOaRbAWwa0nihvDGGFpPVPw/Vu49furWbCSjcdPkQjcaoLkj9O4eEbi/8l95
 aRthRlfa0SzmVOE6gcPRDKyGzswg0oYXwLmuzkdD8gUYomJQ75bq6oMTa244a53EWRaM
 qjHOP3JIMI11BK5q3w9H2pXo7feflRx8VwcogkflcV4otTJxAVa4PfXqZkvGicF08NlP
 V0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :thread-index:content-language;
 bh=CQQIU/s8/DuoKBrspRep4Zrts5nRfqG429oApVzxoSA=;
 b=L1wV2Avgo9MCjGjCL8xHXL1XbAKT+SvnZckvBN6cZ53zmSGPvu2ufns8XyQwm9afb+
 C7CLcFeAwlKFg4HwnVz2F9SOSidCIuRRN2TjnDm2mTjAfdqfrUN5duh1SDhhbemtWPlu
 RGBEYyI21DRDBNn/By/LX7bioagJnVm9Nr3ynLdFf1DLeqw7Tl9MJtPIFKj1kfRUp/c3
 NE5frVKMXsupE6MXXEofsNy39FINyefUPj0t0JbmmZlrciPM8QZO0jMDpAc/pxLHKdaM
 RYbw4miifo0CvJdmlkg3seveCnw0bPrR7GpHHzb7j71trXS+y4CTdcYhSD8ibc6AVRMN
 hang==
X-Gm-Message-State: AOAM530jZRWpgweRHs6k0P9vajxqMi+yApUCTxk5kAWVsWSwR5ortgrK
 YG3tl76aP080OoPfKx0XvByQhbVBSmUOvg==
X-Google-Smtp-Source: ABdhPJyqABcyNtMGYl3Fd2dl/HxgvvyZoBp0swnsscEI/SxuzjthcddbFnYJG6e4MZOlwzOzAW8nUw==
X-Received: by 2002:a17:90b:e14:: with SMTP id
 ge20mr1528542pjb.207.1612162710742; 
 Sun, 31 Jan 2021 22:58:30 -0800 (PST)
Received: from jeetuPC ([203.122.30.136])
 by smtp.gmail.com with ESMTPSA id r30sm15360378pjg.43.2021.01.31.22.58.29
 for <devel@lists.orangefs.org>
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Sun, 31 Jan 2021 22:58:30 -0800 (PST)
From: Daisy <daisy@growthrecords.com>
X-Google-Original-From: "Daisy" <Daisy@growthrecords.com>
To: <devel@lists.orangefs.org>
Subject: Website Designing 
Date: Mon, 1 Feb 2021 12:25:35 +0530
Message-ID: <2783f01d6f867$9f3d4140$ddb7c3c0$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Adb26ME+5OWDkcttRT+bTsO2igObBQ==
Content-Language: en-us
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.33
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

Hi, 

I am Daisy, Web Development Manager in India and I work with 100+experienced
IT professionals who are into:


Our Specialization


Website Designing 

Web Development 

PHP Development


e-Commerce solutions

Wordpress Development

Web Applications


iOS and Android Apps Development

Sales Force solutions


Technology Version Upgrade

Website Redesign


Shopify 

Magento

Joomla


SEO

SMO

PPC

May I know if you are interested in any of these services?

If you are interested, then I can send you our past work details, company
information and an affordable quotation.

For an effective conversation, please share your Phone Number, WhatsApp
Number or Skype ID, along with the preferred time to contact you. Someone
from our team will contact you according to your schedule.

Thanks & Regards
Daisy
Web Development Manager

 

 

