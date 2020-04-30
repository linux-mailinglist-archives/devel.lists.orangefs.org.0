Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5D31C072A
	for <lists+devel-orangefs@lfdr.de>; Thu, 30 Apr 2020 21:58:12 +0200 (CEST)
Received: from [::1] (port=60346 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jUFJz-0002h5-Cp
	for lists+devel-orangefs@lfdr.de; Thu, 30 Apr 2020 15:58:11 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:36690)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <vitor@massaru.org>) id 1jUFJx-0002f6-4d
 for devel@lists.orangefs.org; Thu, 30 Apr 2020 15:58:09 -0400
Received: by mail-qt1-f194.google.com with SMTP id w29so6167136qtv.3
 for <devel@lists.orangefs.org>; Thu, 30 Apr 2020 12:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=LQzvuTiDzxPg8UH93cWpbzSYrqHmgu+qFCbwAwEqzrw=;
 b=XqTNUK6OjR2wnrjL1ekQ59FruO/L9hC7avESb1TAex4GM8KYVyffZ4+yeO3rgDBoUD
 2JM7qmOtjmkqyIbqGgDTxKdj5aKTTJrwcU2x+hGF68kCCaX1o+7t6EjfKZLsbCSKeyi/
 dQ37o9HIVVPZfBhMBhSOAOf3H+zo6qz7bd/Bkc8SWtEUNLvc8F8e6AQAX5CaQouOqCU+
 W1at4ORGUGKKdS6YPURLv15trAp09e+ejrSOJV3YzgCUzRS0zVOUOGVjXAk1yqsJ5q8O
 8OAtOt19hNTrv9zqMmpE7gQlUN9IC7CQpFeBjFDh661QROIIOSonPON3ipKsxtySNr/F
 2IQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=LQzvuTiDzxPg8UH93cWpbzSYrqHmgu+qFCbwAwEqzrw=;
 b=t6tyCf4HhU4tHEKX8KOxjQXb96XyMj6aTIHx3Lfk+jt8pYVJEeOhRIZADI/vJE4eH7
 aPOcMpYcyn9J6EY4oHdgPkr/Ofi7fb5H/KJTo34177ReyltD09PzY+0bM6ExdKIhGhvE
 wqrf4f7RLj4efa8wuFTjaUIxmUI7p60mkn9ImRJVYeV1tBwBVaJC31Mh4i9mDv3y4W76
 d+7qEHAwORSvAJo1/Yu+s+ivw7Y3DFRidKbAilkKCRusJTS97JCU6MEqdva8SuKHW74u
 I78H78rhPo5FpEMj0ujFIhZ7OR8qIPD7jsD8w6nBBGjVuZ1Yy4F275MbfGTNG+YccvXB
 k7Rw==
X-Gm-Message-State: AGi0Pub3ObVAwCMcC25NT46zd9pLTgGuH/r/iw9x++HMXOkn16+UKywI
 Nx6VtNTYijPYmVg52ZP5dE6Mvw==
X-Google-Smtp-Source: APiQypLeHtVRo31TWgHmb+0zDjdx4VCsPKzmGa+gDrrI/ELs5FpHmKX0AdnqBHMTMiWGBPap150b5Q==
X-Received: by 2002:ac8:470e:: with SMTP id f14mr151315qtp.87.1588276648462;
 Thu, 30 Apr 2020 12:57:28 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id b19sm861386qkg.72.2020.04.30.12.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 12:57:28 -0700 (PDT)
Message-ID: <07d33cf9937c89519bafc9210a98dab42579e681.camel@massaru.org>
Subject: Re: [PATCH] docs: filesystems: fix `make htmldocs` warning
From: Vitor Massaru Iha <vitor@massaru.org>
To: Jonathan Corbet <corbet@lwn.net>
Date: Thu, 30 Apr 2020 16:57:24 -0300
In-Reply-To: <20200430134704.236c612b@lwn.net>
References: <20200430190737.80950-1-vitor@massaru.org>
 <20200430134704.236c612b@lwn.net>
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

Hi Jon,

On Thu, 2020-04-30 at 13:47 -0600, Jonathan Corbet wrote:
> On Thu, 30 Apr 2020 16:07:37 -0300
> Vitor Massaru Iha <vitor@massaru.org> wrote:
> 
> > make htmldocs
> > Documentation/filesystems/orangefs.rst:124: WARNING: Literal block
> > expected; none found.
> > 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > ---
> >  Documentation/filesystems/orangefs.rst | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/filesystems/orangefs.rst
> > b/Documentation/filesystems/orangefs.rst
> > index e41369709c5b..628dc220567e 100644
> > --- a/Documentation/filesystems/orangefs.rst
> > +++ b/Documentation/filesystems/orangefs.rst
> > @@ -119,9 +119,7 @@ it comes to that question::
> >  
> >      /opt/ofs/bin/pvfs2-genconfig /etc/pvfs2.conf
> >  
> > -Create an /etc/pvfs2tab file::
> > -
> > -Localhost is fine for your pvfs2tab file:
> > +Create an /etc/pvfs2tab file. Localhost is fine for your pvfs2tab
> > file::
> >  
> >      echo tcp://localhost:3334/orangefs /pvfsmnt pvfs2
> > defaults,noauto 0 0 > \
> >  	/etc/pvfs2tab
> 
> Thanks, but this has already been fixed in docs-next.

Sorry about that. I searched but I didn't find the documentation tree.
Could you point me to the git url?

Thanks,
Vitor


