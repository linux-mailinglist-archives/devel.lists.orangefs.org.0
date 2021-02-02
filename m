Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB0530BB0C
	for <lists+devel-orangefs@lfdr.de>; Tue,  2 Feb 2021 10:36:10 +0100 (CET)
Received: from [::1] (port=56886 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1l6s6T-0001e5-Kw
	for lists+devel-orangefs@lfdr.de; Tue, 02 Feb 2021 04:36:09 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:37858)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <mya@searchranknow.com>)
 id 1l6s6S-0001d5-94
 for devel@lists.orangefs.org; Tue, 02 Feb 2021 04:36:08 -0500
Received: by mail-pj1-f65.google.com with SMTP id g15so1999706pjd.2
 for <devel@lists.orangefs.org>; Tue, 02 Feb 2021 01:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=searchranknow-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version:thread-index
 :content-language;
 bh=7T5pbcbwWl0lYHkjXrAOvIGOk6aqPEOA9GFhuWn8TY0=;
 b=KKzcTQC403vSpvl1yVe/YUs9lQ0irB9/1zVOkVDd9z0uPPkifkyhAMgaimO115iso5
 oJIyCTGtX6rGhNZx6ftpDYNDVqE0iIj+pOtuIdjkg60XBrfCdH6rSF/NQrvEwF3OvGoR
 0m1Va6R7WMLfDFBIYO1X01dYFrnsKUZRjYbMLzq+AAg5xtvxSQ3GjII87daGfHWrRFl+
 1VtEnNpfLU139n6Is+2MEoTS9HxtLED4EB1tIzAUF0k/xxUK7DlpziCmHMAZeX6w1swb
 G4wLuUbZsRJGZ09zO35QOELkvYlEKtlcljXRx2jEM0WAMS0zc3JqIqRox6OVq7RBXo/O
 sjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :thread-index:content-language;
 bh=7T5pbcbwWl0lYHkjXrAOvIGOk6aqPEOA9GFhuWn8TY0=;
 b=ZW5/dw6HYHTLPWjTkZnZgD8xGvbvXCcAZqPKnXb+OpE1hQsowvhtpw3BWcOJxGMSl/
 a0yF64hDZemZ41cG8OlNcACapq3HEzaYfGs4DC/jKr608v5x2uUsZwztLh1NDeCXhARA
 OKrwIWLB/W7lknX6kTZc6zapMuYFoYX6y7OO1qfd3QbG2+YMUa2IhyGCogm6diHIN5xx
 L/QtS6GUEFfz2UbFI4FJTk241STTNUb1ZpAtuM8bkBRSEPJr3iW+kBboqoqW95x8xl8v
 v5TBAmIltpIfqwWblW4WL4OJLysFM/t0GRjE78c4/rJaWCIPVWSrsReUaBzN+jO3j8Qk
 XoAw==
X-Gm-Message-State: AOAM5339cAlhYVpSKVLmFS+oWHNS8Ui2OQbTPbhlI7eUs237iapwQTOn
 W6Evyu1PmebKK5veUVZQHcDvZjhNOjRveA==
X-Google-Smtp-Source: ABdhPJzHurruyNg08RLhbq7PweT5htu6uKlhmDukOgqmHp4b3BBMobuTHpG/eccnFdMXKS9ZDjSQ0A==
X-Received: by 2002:a17:902:b688:b029:dc:240a:2bd7 with SMTP id
 c8-20020a170902b688b02900dc240a2bd7mr21407514pls.50.1612258526908; 
 Tue, 02 Feb 2021 01:35:26 -0800 (PST)
Received: from DESKTOP481PC44 ([180.151.91.189])
 by smtp.gmail.com with ESMTPSA id q24sm21092251pfs.72.2021.02.02.01.35.25
 for <devel@lists.orangefs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Feb 2021 01:35:26 -0800 (PST)
From: "Mya" <mya@searchranknow.com>
To: <devel@lists.orangefs.org>
Subject: Website Designing 
Date: Tue, 2 Feb 2021 15:03:01 +0530
Message-ID: <1e6ae01d6f946$bd747040$385d50c0$@searchranknow.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Adb4eyw6IgvmEJ8PTuehbJPIHKbVFQ==
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

I am Mya, Web Development Manager in India and I work with 100+experienced
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
Mya
Web Development Manager

 

