Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 757BDDF543
	for <lists+devel-orangefs@lfdr.de>; Mon, 21 Oct 2019 20:42:55 +0200 (CEST)
Received: from [::1] (port=45566 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1iMcdq-0005Sq-5I
	for lists+devel-orangefs@lfdr.de; Mon, 21 Oct 2019 14:42:54 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44942)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <andrew.morris@leadsdataset.com>)
 id 1iMcdo-0005Sc-Hb
 for devel@lists.orangefs.org; Mon, 21 Oct 2019 14:42:52 -0400
Received: by mail-pf1-f195.google.com with SMTP id q21so8944795pfn.11
 for <devel@lists.orangefs.org>; Mon, 21 Oct 2019 11:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leadsdataset.com; s=google;
 h=return-receipt-to:from:to:subject:date:message-id:mime-version
 :thread-index:content-language:disposition-notification-to;
 bh=AqZdsFKqWs2IHvEbHBn6Fu8qhH2jMjjR0kRLDQys4Zw=;
 b=vRLcqOY2BpaTodn0B9pAhN06Sj5SthY8V5nbzT0wwF70LzhfA5mJPwydzk123Ej/bV
 +GZMVnVY4/h08HZBHQnXnl15b+4jLiSgL+I2ZdXtYm9r1uMd8Ak16+4x/kXA1P5PAOQL
 z2CqHww1tefKVOYRsw79/g4MEWqpXZZrOQD5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:return-receipt-to:from:to:subject:date
 :message-id:mime-version:thread-index:content-language
 :disposition-notification-to;
 bh=AqZdsFKqWs2IHvEbHBn6Fu8qhH2jMjjR0kRLDQys4Zw=;
 b=noeaEBUv0HHcYPXSQsIYMxrvIdwqGfrc0y9uRzyhUHofrsi8Lac1I48iIbohDiGG/1
 o1dVEhrKd7hu4SWDFHIBvm9iIu6lGOgyb+gvDwjP1lQivQiHAQQfvn131yZwoty4KnS1
 T5pDoLgKcFIRtZZb6WcgJKDlPGAcXztactGTF7IbzNKkbtkPnmcTLiRGD8JdvI1OZHl7
 vG3HSJwEr3bI9ymRUp0abU2lBzfIVgLjSdy7q54O4lLHxKYK4WYksqjEcx8zRa5LvkHf
 2GsJJ0B+5X6nUBDXP+1Ms04Q5+C9fkaJMfFkXY7+37y/4do7PDcre5sT11A4BmCul0WT
 tBOQ==
X-Gm-Message-State: APjAAAW/edy+SxTNpStDVS4GXu9rvme8oO9uPKzoOYoVS/Nnns/Ty2Oc
 0CLyTDj2W76vVR4hseaVoLEbdEdKcag=
X-Google-Smtp-Source: APXvYqyse0Pufn1JMSlmE/kGoxlcEGilVzt+3mpxGJ8DvPiMCH240Xr/CKxATjMG+k24GMsGl9YVEw==
X-Received: by 2002:a17:90a:6508:: with SMTP id
 i8mr30864353pjj.44.1571683330832; 
 Mon, 21 Oct 2019 11:42:10 -0700 (PDT)
Received: from Praneet ([103.89.171.94])
 by smtp.gmail.com with ESMTPSA id l6sm27867675pje.28.2019.10.21.11.42.08
 for <devel@lists.orangefs.org>
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 21 Oct 2019 11:42:10 -0700 (PDT)
From: "Andrew Morris" <andrew.morris@leadsdataset.com>
To: <devel@lists.orangefs.org>
Subject: 2019 Supercomputing Conference and  Expo
Date: Tue, 22 Oct 2019 00:12:04 +0530
Message-ID: <191501d5883f$47a17b20$d6e47160$@leadsdataset.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AdWIPxzX3UAGg1GWRKmAWUGoipYRwg==
Content-Language: en-in
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.27
X-BeenThere: devel@lists.orangefs.org
X-Mailman-Version: 2.1.27
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

 

Would you like to acquire attendee email list of 2019 Supercomputing
Conference & Expo - Colorado happening from 17-22 Nov, 2019?

 

Reach out to: Scientists, Engineers, Researchers, Educators, Programmers,
System Administrators and Developers.

 

Acquire the list for your marketing benefits.

 

Let me know if you need more information on counts, pricing and samples.


 

Looking forward to hearing from you.

 

Regards,

 

Andrew Morris | Lead Generation Executive 

  

 

 

 

 

P.S.: If this email is unwelcome, I'd like to apologize. Please let me know
with a reply of "UNSUBSCRIBE" & I won't email you again.

 

 

 

