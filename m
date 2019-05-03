Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id F08A81297C
	for <lists+devel-orangefs@lfdr.de>; Fri,  3 May 2019 10:05:28 +0200 (CEST)
Received: from [::1] (port=40236 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.91)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hMTCB-0006JY-On
	for lists+devel-orangefs@lfdr.de; Fri, 03 May 2019 04:05:27 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46666)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.91) (envelope-from <anushka@webtrangle.us>)
 id 1hMTCA-0006I1-RQ
 for devel@lists.orangefs.org; Fri, 03 May 2019 04:05:26 -0400
Received: by mail-pf1-f195.google.com with SMTP id j11so2488812pff.13
 for <devel@lists.orangefs.org>; Fri, 03 May 2019 01:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=webtrangle.us; s=google;
 h=from:to:subject:date:message-id:mime-version:thread-index
 :content-language;
 bh=3/m0A4Vm/BJcgNSfCK562gdaIq5BisTmgq7HVw7w93A=;
 b=CV5tDf2sSjB7jz7GYUlr50/mI4877x63QdrBFphJcjsPve3/Bqz51YG4/Y3XCghDw/
 pT+Az2AgIOFzm99/FC6CUkHe6fb/kGki5zwoXJ6KhCaHt1fvam/7fG6a3ExrWHXFDXgL
 pnmEanAHKRWG3mpQqCnhsFm8KUgt+kWUt+EOA/un+vrvXV9tmlYLFYQZxYwKsCTtuPe0
 rwwnGglhLN7X8NPzgXCzkNxeGSxhxXaCLgfeDartFzh7yDg8at2tSPQ11a0SArH0FpgE
 q8Aa/8W858cCtf2Gzp1S8JcFvXb8Bt7B0iYWpMp4HYlEy1sN/N+X0kFTrJlhFrgjGQQQ
 eMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :thread-index:content-language;
 bh=3/m0A4Vm/BJcgNSfCK562gdaIq5BisTmgq7HVw7w93A=;
 b=clDHoEaR0SgOJBnZYt2YOq36tnukoY4rzVQRAOGqJrHqJeHdBT85XSAhYQ0Hf/7laM
 U0mbokd/FaiGlivB3VZnK7qf3cHVDxI7JEV0W/2uGFbliC6wuWyVgc5Um9klylEfZ/DZ
 qp+lWX1RoFyLq5TbEsWK9hRQsKCKgz9phpK5SnBZG6bj0zEwdPhwlYkgcK7AMlCQ18zy
 q9xuV2G2meCJ9KVkYClmPl2RCFsD7XQJ1asq8jBO2I3kreDW7CBQwlX6/X/L+760+gJH
 xAxd/ZpeKTYmbOa2wYJfLUetjdfxxXJc//1aJQFvZf0T00bWwzdlIVUY5RnfIYa8Lb8B
 R9gw==
X-Gm-Message-State: APjAAAUDzwy4kT0eyUWWhAAAK2IXKNUtRANQCf7TpOmhTSWazobdV/Jg
 PiXRVddx+2xXFzXKK5Vp4dFNkij266U=
X-Google-Smtp-Source: APXvYqw6pTylo/hxn8RzTJbRhCzbNTAJxVffsoccF1DDfA/bcgDiEfQQkIRZnWo3knLRj+sYM89npA==
X-Received: by 2002:a62:2a55:: with SMTP id q82mr6453832pfq.90.1556870685507; 
 Fri, 03 May 2019 01:04:45 -0700 (PDT)
Received: from omPC ([223.179.146.50])
 by smtp.gmail.com with ESMTPSA id m131sm3629317pfc.25.2019.05.03.01.04.43
 for <devel@lists.orangefs.org>
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 03 May 2019 01:04:44 -0700 (PDT)
From: "Anushka" <anushka@webtrangle.us>
To: <devel@lists.orangefs.org>
Subject: Proposal-iOS & Android Apps
Date: Fri, 3 May 2019 13:34:32 +0530
Message-ID: <54a101d50186$f6b266f0$e41734d0$@us>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AdUBhsJkDAlK3w3BTBGvhGwJrp0H9A==
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

 

My name is Anushka, and we are a team of Professional IOS & Android Apps
developer with 10+ years' experience based in India. Do you need a great App
adjusted or built from scratch?

 

Reply me if you need any kinds of help in mobile Apps.

 

Thanks & Regards,

Anushka,  

Web Development Manager

