Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F2328C816
	for <lists+devel-orangefs@lfdr.de>; Tue, 13 Oct 2020 07:03:45 +0200 (CEST)
Received: from [::1] (port=53434 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1kSCTP-0003zu-Ra
	for lists+devel-orangefs@lfdr.de; Tue, 13 Oct 2020 01:03:43 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43322)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <alondra@nitroinfotech.info>)
 id 1kSCTO-0003rW-5I
 for devel@lists.orangefs.org; Tue, 13 Oct 2020 01:03:42 -0400
Received: by mail-pg1-f193.google.com with SMTP id r10so16715855pgb.10
 for <devel@lists.orangefs.org>; Mon, 12 Oct 2020 22:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nitroinfotech.info; s=google;
 h=from:to:subject:date:message-id:mime-version:thread-index
 :content-language;
 bh=VKfPIHmvV9poDlftPu6vNCPWEFtZ0HiWPyVr0O7X5Hk=;
 b=SxNOonfLeaQ6Cv7EITWubq4qcV33N8doQDGqqGEa3PjNVq6HqVmx2I0lW7fdoc9iD2
 9VYpnOpmxG7SszqrMTY2CzYkK9/cuEZfnrb92RkPYEeiJrUAz5wDmcDzaXAJDIPm3dIO
 RONmAKyBLh62C68JiesRAA9Aacv/2WulSYT1UXndmBSMAil0SVDSmh8tMEQ5icQKmc/6
 zPw6HaCmtEhFrbcl7a2iIW6I53HHH8SjtsiGoCfRkEnnAwJ3eds1O5JEUttn8xVQNNTL
 j+Teg5FBfKsw84zH0y0b3wQ3hJVeKeXtOuYnLXIa7R83nlebIFnkJgCawQqSd3Ct8aju
 jwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :thread-index:content-language;
 bh=VKfPIHmvV9poDlftPu6vNCPWEFtZ0HiWPyVr0O7X5Hk=;
 b=UYEdbbUbifYEYA/WU15ERDQk+JVqy4pWD0EuIYSi0h4gKCCWQ/YCmtykNppVoMT907
 lxprOROLgqXiO48b7n7SESIuRo4rlhuagyQgGjvhprA0NbDXBrBPL5zrxo7tbOwWc2fr
 c6ZTWxmT/TD/TkIoamnh/kN0420elMsYYhKBr8WY/WZB6mLp3LkNOdTtkaKhMbr08Dq8
 PWvgJITMPvxwMCOgwvSRsH1d+cpQzAhnKmh+3RN9V+3/KZpnM43dThimo+Y5zwMuC5KP
 NItlJJbG48bdD8xy0NvW5sA9O9n0L3XllDwpHuO3tEQJRhNrDuuMjApxM6/e3o09+UVg
 mRaA==
X-Gm-Message-State: AOAM531lJHdJKlkyGY4GhjtrNfbqaISPgo9VZHrxyDYeqLnuOn8jNMfC
 d3yfI6moMo3HoCitP5+gyA1sHJbg4UWTsXtg
X-Google-Smtp-Source: ABdhPJy93oJTbhLHUzgQisisK0f6PbiPqhL/u0JatofZSAxsmOjCInlODSnStsvv1yFq1JPOW+dVaA==
X-Received: by 2002:a17:90a:1050:: with SMTP id
 y16mr10176684pjd.164.1602565381276; 
 Mon, 12 Oct 2020 22:03:01 -0700 (PDT)
Received: from AkkiJanya ([180.151.94.49])
 by smtp.gmail.com with ESMTPSA id y4sm5609510pgs.0.2020.10.12.22.02.59
 for <devel@lists.orangefs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Oct 2020 22:03:00 -0700 (PDT)
From: Alondra <alondra@nitroinfotech.info>
X-Google-Original-From: "Alondra" <Alondra@nitroinfotech.info>
To: <devel@lists.orangefs.org>
Subject: Website Designing 
Date: Tue, 13 Oct 2020 10:25:53 +0530
Message-ID: <74ffe01d6a11e$1e6a92c0$5b3fb840$@info>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AdagllLFeiqVFd8FQaCXpH66hshLJg==
Content-Language: en-in
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

I am Alondra, Web Development Manager in India and I work with
100+experienced IT professionals who are into:


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
Alondra
Web Development Manager

 

 

