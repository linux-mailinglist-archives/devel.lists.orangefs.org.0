Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 504BB29F202
	for <lists+devel-orangefs@lfdr.de>; Thu, 29 Oct 2020 17:46:46 +0100 (CET)
Received: from [::1] (port=47044 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1kYB4X-0007L8-1K
	for lists+devel-orangefs@lfdr.de; Thu, 29 Oct 2020 12:46:45 -0400
Received: from mail-qk1-f197.google.com ([209.85.222.197]:34718)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from
 <3yvGaXxIJBR0834B7GG7.M39KHVTUa9F3BE.5HF67O7EEBLML.HK3G978L.HK9@trix.bounces.google.com>)
 id 1kYB4V-0007KA-Di
 for devel@lists.orangefs.org; Thu, 29 Oct 2020 12:46:43 -0400
Received: by mail-qk1-f197.google.com with SMTP id n23so1046094qkn.1
 for <devel@lists.orangefs.org>; Thu, 29 Oct 2020 09:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:message-id:date:subject:from:to;
 bh=EW9xRMqmNQ8svIduin5JsUPd6Mf9TTX4G33XdlBjvmY=;
 b=aIiqbwvclp0kUpXYf+NeACxwrH/YxWfSrKBbQ2XHwTmwXb10seRcyOiPhQTUEPowfM
 3zfUl4qlMZzs0YyxuyraxjPdY0fsUSte+ZRCx4vmZzRNJNaM+lRKey/m7H4x3d3SIrde
 jPfGzWWI4WeagBl6ew/fIgqUTXRd5rfR5cSC4pxQ/ba/GF3yVuXeiG2m0ANBxEzw96Jq
 jIi+pcKQCQ1I23/Gjprmayp8RqUOz1WW+XJmRtfieamr7QbGXhxBGHQUoMewuRfdojZv
 TivlKxR2jhN9K4lfuYFAZP3f6DHXiOObgZATeV/nO7uhGOLQoaAAV1RljzsU8SoK+RWg
 FI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:message-id:date:subject
 :from:to;
 bh=EW9xRMqmNQ8svIduin5JsUPd6Mf9TTX4G33XdlBjvmY=;
 b=EAqcgWWGwHijdr7XrvI7LimWQxxWKERQUTkgYEmko3Mx9JfVnPRSJrK8+yESyehYic
 h+SAAjcs4Shv+GTx1ffO1xtB0tAkb80OY4qcL7KZseOGpJReabc0wwZwRjC8Q1HrGlRV
 Twg1ZG2VN5gIVIH6Wy/t7YYscuk52DrGvhp1ISs/MdfbM5wB3APE5cJO710FPsqeAXTG
 tNIkEsqBMIIczbeHte+u72+10ax/fn8kGLWGRoniQ6EuhTajLeS1zfscO2RVchoef+nO
 vdJVekanXQ6jBDMnWkkFnL88JyXJ/e+NqBRqrskAHmYx1yvrBKreuUuoT+pch4b+JR9P
 p2Iw==
X-Gm-Message-State: AOAM531ee868+wxRJaT+eL/Wzrx2f8h+ZZWKnWp5i4AQ/eG1nE5uvAWx
 2xx89/2Pl6YVzz5ZS5OgMxlmbb6SL8GJQBA2y5b2
MIME-Version: 1.0
X-Received: by 2002:aed:2dc5:: with SMTP id i63mt488481qtd.209.1603989962438; 
 Thu, 29 Oct 2020 09:46:02 -0700 (PDT)
X-No-Auto-Attachment: 1
Message-ID: <000000000000ef449405b2d20334@google.com>
Date: Thu, 29 Oct 2020 16:46:02 +0000
Subject: Could you help me in this transaction?
From: fabienne.tagro2017@gmail.com
To: devel@lists.orangefs.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
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
Reply-To: fabienne.tagro2017@gmail.com
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

I've invited you to fill out the following form:
Untitled form

To fill it out, visit:
https://docs.google.com/forms/d/e/1FAIpQLSe1wBhXSQ5Skw4YywgnRWiOLeNuYO0dbmnMnsDvN4YAMDRi3A/viewform?vc=0&amp;c=0&amp;w=1&amp;flr=0&amp;usp=mail_form_link

Hello Dear,

I am very sorry that my letter may come as a surprise to you since we have  
never met each other before. I am Miss Nidal Aoussa. I am the only daughter  
of Cheikh Ag Aoussa, the President of (HCUA) in Mali who was assasinated on  
the octobre 2016.

https://www.jeuneafrique.com/365432/politique/mali-sait-on-mort-de-cheikh-ag-aoussa/
https://fr.wikipedia.org/wiki/Cheikh_Ag_Aoussa

I have a business transaction which i solicit your help. It is all about a  
fund to be transferred in your country for urgent investment on important  
projects. I want you to guide me and invest this money in your country.  
This fund amount to Eleven Millions Five Hundred Thousand United States  
dollars which i inherited from my late dad.. If you are capable of handling  
or participate in this transaction, kindly respond quickly through my  
private emails to enable me give you more details about this fund and how  
this project shall be carried out. I will accord you 20% of the total fund  
for your kind assistance. Respond through this my private emails addresses  
below.

Miss Nidal Aoussa
Email: ( nidal.kong1998@gmail.com )

Google Forms: Create and analyze surveys.
