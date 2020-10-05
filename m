Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 392CA2830D9
	for <lists+devel-orangefs@lfdr.de>; Mon,  5 Oct 2020 09:26:26 +0200 (CEST)
Received: from [::1] (port=32840 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1kPKt7-0004WS-0n
	for lists+devel-orangefs@lfdr.de; Mon, 05 Oct 2020 03:26:25 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44971)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <vedanshi@aptenia.in>) id 1kPKt5-0004W3-IV
 for devel@lists.orangefs.org; Mon, 05 Oct 2020 03:26:23 -0400
Received: by mail-pg1-f196.google.com with SMTP id 7so5428214pgm.11
 for <devel@lists.orangefs.org>; Mon, 05 Oct 2020 00:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aptenia-in.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version:thread-index
 :content-language;
 bh=CGxjdpgIwqhoJF9JVPNrZhOqxshHq5sdtN/fV1Jpkq8=;
 b=iIr9kXmY80HlTMh2hqznH6BUorABSz0jl53NLtxaQpSJEo735+1Mi9ZNFWZrpLoixe
 vx/Xq3th3w7JB5VFl+J1Tp5QAC/zX/razvnAvI9bL6P04dZ+0vv3F8ysG8bLNK6JQkd+
 rqutQClx3K1gnpqG6ZLK2BLDoOmiBA4clYKMCuJR1KM5Q3Yy3htlmZfWzRj0sQWhDl+v
 fA/2X7lK42mZMOlDkPMgkTX22fPJVqEyKeDfZDE8LUMEgUzPq47BkYHSeZSsKQj5BH6x
 dyJ6v8aBWlimrQlg2ujTA/TyNkwWUY3DMtiiys/p4wyPnaDECqVCj3XnQDuj/wBlohve
 pAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :thread-index:content-language;
 bh=CGxjdpgIwqhoJF9JVPNrZhOqxshHq5sdtN/fV1Jpkq8=;
 b=GiP51sKjHxh65mAYASnX8JVwRoBRsVCkmMtGw+MvkQg4R2IIO7KcO4nXB+n52PEScf
 cCSoGmisGqA5xQrJeFgFYgWaqqJh/lDWQZAm9m1aCREYv4FmihrWsSdjxCRQRBlRG/mE
 XWxgmoQ3tQrnqwBFizGMxDmgGjhX5xWYvxvjDkoQYyix1DBAICoe22gIuyzghz9d48Mi
 nG9wVmLpIAWHpM3lDWER16rWzW3+WUXB3awYrPD9coN3Y8ol/jEdGhgMnBo3VR+4dQcS
 d2TadJorXCbwWL5jdQ7r80btNe3pgMeKDl0B38Dc0Rf4cN5f2GrW1LG0+zzNMmGxvOWY
 ji7g==
X-Gm-Message-State: AOAM531MSfhvG5ulo6nTmRm/17SbjAijYJVRBt8f05y3gtjcub2tCeyX
 qs6oC7/IkbPWYBfO3loXA5tmwHd0AsfTsoN+
X-Google-Smtp-Source: ABdhPJx6jiZpk8Ayaw1i+87C8RPBcBA9JJ6M6Wkp16i2rfpLKFjZunCuY2V+Ujtp2gzHbPCtaX4iJQ==
X-Received: by 2002:aa7:8ad5:0:b029:142:2501:34df with SMTP id
 b21-20020aa78ad50000b0290142250134dfmr16155146pfd.56.1601882741600; 
 Mon, 05 Oct 2020 00:25:41 -0700 (PDT)
Received: from omPC ([106.215.28.225])
 by smtp.gmail.com with ESMTPSA id n5sm5649773pff.190.2020.10.05.00.25.40
 for <devel@lists.orangefs.org>
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Mon, 05 Oct 2020 00:25:40 -0700 (PDT)
From: "Vedanshi" <vedanshi@aptenia.in>
To: <devel@lists.orangefs.org>
Subject: Web Development Offer...
Date: Mon, 5 Oct 2020 12:54:58 -0700
Message-ID: <76e001d69b51$8168e5c0$843ab140$@in>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AdabTymgsRLv4qw+SwufsehXPkOx7w==
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

Hi devel@lists.orangefs.org,

    

I'm a web developer who builds amazing looking websites for small
businesses. I'd like to have the chance to show you how I can improve for
your business.

 

I'm an expert in the Wordpress website platform and many other platforms and
shopping carts.

 

I can upgrade your existing website or build you a new one completely that
has all of the modern features and functionality. Would you be available in
the next few days for a quick consultation?

 

I'd like to share with you my ideas and some expert advice, show you my past
work with other clients, get your feedback, and give you a proposal.

 

My rates are affordable.

 

Thank You.

 

Vedanshi,

 

Web Team.

