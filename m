Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEDB1C076D
	for <lists+devel-orangefs@lfdr.de>; Thu, 30 Apr 2020 22:08:48 +0200 (CEST)
Received: from [::1] (port=33662 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jUFUF-0003CT-IK
	for lists+devel-orangefs@lfdr.de; Thu, 30 Apr 2020 16:08:47 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:41155)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <vitor@massaru.org>) id 1jUFUE-0003CB-82
 for devel@lists.orangefs.org; Thu, 30 Apr 2020 16:08:46 -0400
Received: by mail-qk1-f194.google.com with SMTP id n143so7133119qkn.8
 for <devel@lists.orangefs.org>; Thu, 30 Apr 2020 13:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Ok16EsO/ISAsEJIxQSbChy5pO1QqgpEPtp1JMK5qicY=;
 b=q6Caj39qklQ+cMsmLSSD8BCgquSyU51XfuP2wwrqiVW6b36fQcsg0ufYNBYoggqogy
 YwZ+GVhOioys/L4NHy20h7Dr1yqFyImrq0+d5ifynClSfFHra+UosMjEMZ6C1nNcVbEb
 nyAMYCbrZv2nEjrYhZzYCuPmAW2kNMvpQXZp2UmKoJRWRdmWwsCdAplNQS3reKCocxz8
 q8jknBR33fIvnEqQRSOPlTAF7t18vMbHMRsgBfKOcz8AViAsn7YJlVk2EGX3Ouurzezd
 mwr7QLY5OHN1MmTIs4pSRDlozgTyBbt1BL2J4W4Mbo8COXC5TT1R5fjSX3FNsgaSayMz
 w2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Ok16EsO/ISAsEJIxQSbChy5pO1QqgpEPtp1JMK5qicY=;
 b=seFrePYBl7dCn14yrSOvlkvK+ewPSa9r1E2mLluaWrMPkiiLaYK2U+6ZIK+tpcega6
 NSYycy3J9XlbuetbtxJn8vXhiakefi+NKeTW/JaYmkmZwpO9xxI7fDzUj/Yi73JUAbn3
 KW9vwOpcu6cBa0WEvRurlsMidsqv5XSLzWsysI6hhQKc+EKL6UufHBkteGnpVi1xpyxR
 cHJ0v9BSptGmtCjBN9ysD0yA7wIH3eaHcmor1BZDmZE9KOIRUFrg5G+0bAJl+pNfIGS4
 pVsqU/JqHARzor3Rng1t7MFv+ipEZTEl/vTJ+PVBpyDdBDGwcy2HRpZYdOfi9uMPWAxS
 9h7w==
X-Gm-Message-State: AGi0PuYukwGcEiIlU41iOxvhfWiOdicxUXX447HFok2DG8W0PYPFw8Xj
 2E81jLfiWU4Uwsr1TgOox7XkVg==
X-Google-Smtp-Source: APiQypIYsFkIRlq5IN9jj4U8w9Kol8rc9/N9rWY/GS/z5sFI9as51Gma038GxqW1OegRDrgR4FfTFw==
X-Received: by 2002:a05:620a:16cf:: with SMTP id
 a15mr241173qkn.156.1588277285654; 
 Thu, 30 Apr 2020 13:08:05 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id b11sm638844qti.50.2020.04.30.13.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 13:08:04 -0700 (PDT)
Message-ID: <8e52829575f430721113c646f07f9dca280a025b.camel@massaru.org>
Subject: Re: [PATCH] docs: filesystems: fix `make htmldocs` warning
From: Vitor Massaru Iha <vitor@massaru.org>
To: Jonathan Corbet <corbet@lwn.net>
Date: Thu, 30 Apr 2020 17:08:01 -0300
In-Reply-To: <20200430140412.7d4c692d@lwn.net>
References: <20200430190737.80950-1-vitor@massaru.org>
 <20200430134704.236c612b@lwn.net>
 <07d33cf9937c89519bafc9210a98dab42579e681.camel@massaru.org>
 <20200430140412.7d4c692d@lwn.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linux-doc@vger.kernel.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, devel@lists.orangefs.org
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

On Thu, 2020-04-30 at 14:04 -0600, Jonathan Corbet wrote:
> On Thu, 30 Apr 2020 16:57:24 -0300
> Vitor Massaru Iha <vitor@massaru.org> wrote:
> 
> > Sorry about that. I searched but I didn't find the documentation
> > tree.
> > Could you point me to the git url?
> 
> The MAINTAINERS file is always the place to look for such things:
> 
> > T:	git git://git.lwn.net/linux.git docs-next
> 
> jon

Thanks Jon!


