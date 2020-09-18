Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C0A26F528
	for <lists+devel-orangefs@lfdr.de>; Fri, 18 Sep 2020 06:35:41 +0200 (CEST)
Received: from [::1] (port=58382 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1kJ87X-0002Ey-Uk
	for lists+devel-orangefs@lfdr.de; Fri, 18 Sep 2020 00:35:39 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44863)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <poppy@cleversearch.info>)
 id 1kJ87W-0002E1-1r
 for devel@lists.orangefs.org; Fri, 18 Sep 2020 00:35:38 -0400
Received: by mail-pl1-f195.google.com with SMTP id j7so2300130plk.11
 for <devel@lists.orangefs.org>; Thu, 17 Sep 2020 21:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cleversearch.info; s=google;
 h=from:to:subject:date:message-id:mime-version:thread-index
 :content-language;
 bh=69r9cMJFdSv4c+Klfj/FZeYl3vgl8E9DzIHhVwkQ5Kk=;
 b=hkaJbznd0xFSHcXG+AzmUlfBsi9c0bEQxx2xsG3dJlZvja/+Nu3uawttp94mm8TRAZ
 aUShdnJ8Kv8udt5/wv3ZKX+PEs8LND7r/fuMCk7KJMKIFZYDw/eSMM2d8Sb52AJ2Cmcj
 Qno5qsNek9/QbAweKrSR0TyfpwCoZzeP4ionry1oUYVgoIjCmZ/pxwPaeltIXHABjJNe
 U04IISIB7/MhQcMB9MbVa0O5U2whuON+ypKtB+npwFD74KPr7dZBCDNfipyoKwT9F0bc
 lqNCJ92mvQRrjA8MjDliL7fWahnqN2u4N6pPVrPCxb9mDsyRvu0bQS9Wgef06wON6yXv
 m6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :thread-index:content-language;
 bh=69r9cMJFdSv4c+Klfj/FZeYl3vgl8E9DzIHhVwkQ5Kk=;
 b=HV2fgX7FtGLtwA0vNu79oWpSykwR7wfUGCXpSCs2VGB9Z1117cLl3o0OvjKGgwhXXr
 ujvVrr0/8GCVpcx5v43zEU30Aot/XtHrabnQVLncWUWQxYmvoYGRAjqc8bmvakMcJBpO
 Yob2Hbc9CETi2i3Vg3B1w4RlRbQ+hWwr/RycIS2ybd10AyepTi7prr2/hW84bzyNjedj
 lKEhywCBX+Z1OMlEitOMOOgtMLbK13K8mCWqemPdkC7sALwvoNP9tsaUY8pYp190lz/O
 BbfxZLxogn/0O5NoC7H1up8+SIxXdB8COwTshNOC/q2Tyj/znKYVXn650k0/Ao9LNmyp
 lU8Q==
X-Gm-Message-State: AOAM531119t9DpLtIPeIeBIYUsBlf7FWFPWT8BilQ6IgdWlZd+Tp8SHE
 5dWWydkxkULiEnWBpU2H62pNC2ZFLSEoyAtR
X-Google-Smtp-Source: ABdhPJwBmWRd6Cnto9DnzWWVn1B5tEMleAK7beL5K+yH/GYaWxARl2IOAFXvCBuWFUAl0Kddb8R5+Q==
X-Received: by 2002:a17:902:6ac7:b029:d0:89f3:28d1 with SMTP id
 i7-20020a1709026ac7b02900d089f328d1mr30637325plt.13.1600403696752; 
 Thu, 17 Sep 2020 21:34:56 -0700 (PDT)
Received: from a ([223.235.16.81])
 by smtp.gmail.com with ESMTPSA id hk17sm1151073pjb.14.2020.09.17.21.34.55
 for <devel@lists.orangefs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Sep 2020 21:34:56 -0700 (PDT)
From: "Poppy" <poppy@cleversearch.info>
To: <devel@lists.orangefs.org>
Subject: Website Designing
Date: Fri, 18 Sep 2020 10:02:32 +0530
Message-ID: <a4f101d68d75$0f546ed0$2dfd4c70$@cleversearch.info>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdaMzJZ6P7pfY7f+R/WVReRY20ozow==
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

I am Poppy, Web Development Manager in India and I work with 100+experienced
IT professionals who are into:

 

Website Designing, Web Development, PHP Development, e-Commerce solutions,
Sales Force solutions, iPhone And Android Apps Development.

 

May I know if you are interested in any of these services?

I would also like to recommend you our SEO service for better exposure and
branding.

 

If you are interested, then I can send you our past work details, company
information and an affordable quotation with the best offer.

 

For an effective conversation, please share your Phone Number, WhatsApp
Number or Skype ID, along with the preferred time to contact you. Someone
from our team will contact you according to your schedule.

  

Thanks & Regards

Poppy   

Web Development Manager

 

