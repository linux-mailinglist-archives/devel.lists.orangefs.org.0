Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 870491830C7
	for <lists+devel-orangefs@lfdr.de>; Thu, 12 Mar 2020 14:02:45 +0100 (CET)
Received: from [::1] (port=40948 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jCNU4-0002gr-59
	for lists+devel-orangefs@lfdr.de; Thu, 12 Mar 2020 09:02:44 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44724)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <shivam@seogurusllc.com>)
 id 1jCNU2-0002Ty-KO
 for devel@lists.orangefs.org; Thu, 12 Mar 2020 09:02:42 -0400
Received: by mail-pl1-f195.google.com with SMTP id d9so2632309plo.11
 for <devel@lists.orangefs.org>; Thu, 12 Mar 2020 06:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=seogurusllc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version:thread-index
 :content-language;
 bh=hVKWgkOEPxXi+3SdqYMMZNyXLLMLVI++lfnDgDgeelY=;
 b=e8j3ZfxgOme/Ydo0hQLx0OBj0R0eWLH1x2vrUXQqhSJCXK8/OjJ7ctoLW2Hqh0HSkh
 emhjN/T+MaM7OW4eVokrvzKWllAZKs9UCHJ7wbMf73VIWOIRi58GAAu6orZvAWaDvJ76
 sJFKTCgL/EepVuuBnMVo6nhW1KGPB06Clw+iHJAH+Q5n9K/Gx9VtIbCxXj+BcgXm/wSP
 T7UdSCiV57yvyo5yzyRVkG1dn9l1nazgYqR4v1V1tDuh4pKAfxg0UzaIe0LcF6g622Jk
 blWWaKQGIGehCo5DTTm6MdswNlPZQl6LoPRtFpuAB2YvshC4JTFdj7LMphu69QNt8e8q
 C2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :thread-index:content-language;
 bh=hVKWgkOEPxXi+3SdqYMMZNyXLLMLVI++lfnDgDgeelY=;
 b=VEgS9dS4FSbRLcZjSeHKkTNqTqnPTeXXhTgIAS67nqN4W70pt4CNAQQeECU+u4TMre
 xBEWPH3wJSuNuieAxzCfeFMJESpXf5esbMD/b6gOJxL2S26WppXUiXwA8tWa/+t2j+y2
 U18LMlNLzKFAbcd0DOuPhiFrATHDQxcK4nfcte1fxziBxNTJqm/Aw1x2vfaaUG+sHO2w
 YYUdUfjBCMYWUReZN5iwsi2gyfaVWU5RF5Y7KlI1MpiZJdDmqI4wUOjeTHb+ULcL4XNE
 3/+xnMJDAYRF6RrWoJzxp9cHfWhyJSeyHE+8i6Zh9JkAtnFA6aiQbMib1FZlgDfDd7QI
 pAhA==
X-Gm-Message-State: ANhLgQ3Lb3kLUzPwl+htN5B+YYhnvgWOion6m1hEsZlNNTh9407V3W2B
 DmN6zTJ2c3kkdJK5fWFqimFLzKuOW7U=
X-Google-Smtp-Source: ADFU+vuKObzOtIQYcavWtslS038rmslAmvgGsdLAzeSCRMubYCqB3UQJvpWdWX7U+idzkL1Zco+xxw==
X-Received: by 2002:a17:902:b206:: with SMTP id
 t6mr7223121plr.75.1584018119980; 
 Thu, 12 Mar 2020 06:01:59 -0700 (PDT)
Received: from omPC ([106.201.5.189])
 by smtp.gmail.com with ESMTPSA id x70sm44680655pgd.37.2020.03.12.06.01.58
 for <devel@lists.orangefs.org>
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 12 Mar 2020 06:01:59 -0700 (PDT)
From: "Shivam" <shivam@seogurusllc.com>
To: <devel@lists.orangefs.org>
Subject: Web design and App development
Date: Thu, 12 Mar 2020 18:26:00 -0700
Message-ID: <1a28c01d5f8d7$403ffc90$c0bff5b0$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AdX41d5RZLWrokmxRrGTNwwvn7dTbw==
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

Hi devel@lists.orangefs.org,

 

We have bunch of expert developers who can customize and create a site from
scratch as per your needs. Our web services use the best host in the
internet. We also provide premium themes from various word press theme
makers and create your site in a best price. 

 

Our development related services that include: 

 

1 .Website redesign with highly responsive features

2 .E-commerce and M-commerce

3. Responsive web design

4. Web Design/Development

5. Mobile Apps Development (iOS and Android)

6. Joomla, Magento, Wordpress, PHP and other Content Management System. 

7. SEO (Search Engine Optimization)

 

Thanks & Regards, 

 

Shivam,

 

Business Development Executive - (India)

