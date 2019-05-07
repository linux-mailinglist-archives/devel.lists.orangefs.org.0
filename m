Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id F3217161EB
	for <lists+devel-orangefs@lfdr.de>; Tue,  7 May 2019 12:26:14 +0200 (CEST)
Received: from [::1] (port=44642 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.91)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hNxIb-0008Vt-MS
	for lists+devel-orangefs@lfdr.de; Tue, 07 May 2019 06:26:13 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39580)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.91) (envelope-from <haseeb@webtrangle.us>)
 id 1hNxIa-0008Ur-SG
 for devel@lists.orangefs.org; Tue, 07 May 2019 06:26:12 -0400
Received: by mail-pl1-f196.google.com with SMTP id g9so547227plm.6
 for <devel@lists.orangefs.org>; Tue, 07 May 2019 03:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=webtrangle.us; s=google;
 h=from:to:subject:date:message-id:mime-version:thread-index
 :content-language;
 bh=2W6hIkXELppAvvr54N7RrTLVbgj+3qPyuGkeQsX2mLU=;
 b=kSvLj/qXzPXD2AbHW/6LxGMUwes+QUCt0T0rdKPa8Xdpaa7z8SB5CgIujd8UwzEQxQ
 hdyoMBsPVf6Ry56r/u7OnoX9i16tUkmOysR7p2Jc1Oe3XqxucopXu2t1QUThTWp2Ac7Y
 6CSFIZJhtOsxKg1/O38rXbLpAXxCCY1swH5LxY4Cl5gye/OyKUD9oPtv0ALhDzgXygi7
 ZANDjtf9J3CCYH4V8TW9fX2bkZMm782IOwdzdvHimYkTd7V3Nh+hrQ95PVXh1Ws4DTEs
 zsdHFZvDW1mpwB2tFGESz/5ZcCklKyzOP+e+bAW/zQL8c+RfF8VkVv1kFhM+OI4mkrHN
 vnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :thread-index:content-language;
 bh=2W6hIkXELppAvvr54N7RrTLVbgj+3qPyuGkeQsX2mLU=;
 b=srVJ44wTGQv26f8y8PIjw06hGdEQC+VvsYRPRCQfIxYsV5d6SPFp6sFgflf5dEW3ly
 WGmUgS3U6h0eFN5KBzMaa33DOthkasYn5wzfzXeHbggtmJGl/t6XRx0J3P6sjudiBM2/
 GiQdGqzS4UkJzqoNdxx6KNS4HeBQudmwLHSCpSU7GgMRvlKbaeQxb9uQr7C0Ydlc8Bms
 MqY2GB4N+BPOxYGLvMHjz0ngEtAtsbKtWBafuQ3+cYraorOO80P0B4opZBt76hWyJT0H
 oVM4OLda90YY/bPAWf4aPwOv/KW7NUWpFAelfQMD+NvOpCTRVjgnQT3KA6kduziE5Kjn
 H5IA==
X-Gm-Message-State: APjAAAV9HXDIpLTUQXUPVmUAKTaRre5IqValvD48eOhM8+SuMnvuv7dx
 41alCrCU5SRlgFHeBND2qDAnXQgNJ4Y=
X-Google-Smtp-Source: APXvYqwPdOvhhh1q5puCbqK2DAiEBDNrBDsEpBODhvpfFr3kyOBVzW0p+51vkOfUGbxq4XwPN70Ang==
X-Received: by 2002:a17:902:e305:: with SMTP id
 cg5mr39071410plb.112.1557224731479; 
 Tue, 07 May 2019 03:25:31 -0700 (PDT)
Received: from omPC ([106.215.52.51])
 by smtp.gmail.com with ESMTPSA id z187sm9188788pfb.132.2019.05.07.03.25.29
 for <devel@lists.orangefs.org>
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 07 May 2019 03:25:30 -0700 (PDT)
From: "Haseeb" <haseeb@webtrangle.us>
To: <devel@lists.orangefs.org>
Subject: Proposal-iOS & Android Apps
Date: Tue, 7 May 2019 15:52:09 +0530
Message-ID: <444801d504bf$5a7cf160$0f76d420$@us>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AdUEuuRY4iP0jxPvRwer+wYWU7kQmg==
Content-Language: en-us
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

Hello devel@lists.orangefs.org,

 

My name is Haseeb, and we are a team of Professional IOS & Android Apps
developer with 10+ years' experience based in India. Do you need a great App
adjusted or built from scratch?

 

Reply me if you need any kinds of help in mobile Apps.

 

Thanks & Regards,

Haseeb,  

Web Development Manager

