Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id E892355774
	for <lists+devel-orangefs@lfdr.de>; Tue, 25 Jun 2019 20:56:04 +0200 (CEST)
Received: from [::1] (port=55470 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hfqbs-0004QE-4W
	for lists+devel-orangefs@lfdr.de; Tue, 25 Jun 2019 14:56:04 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:41077)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <hubcap@omnibond.com>) id 1hfqbr-0004PI-HR
 for devel@lists.orangefs.org; Tue, 25 Jun 2019 14:56:03 -0400
Received: by mail-yw1-f68.google.com with SMTP id y185so7994630ywy.8
 for <devel@lists.orangefs.org>; Tue, 25 Jun 2019 11:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=omnibond-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YoWQjtvkCeSVA1kdmqc11ysNxmHPU03GqQotMHxDp2U=;
 b=JYQNOBN93vshA1tG3sDASUASg0IgzYx8xGpNBbiFRHkUwh3oZdl9OlCx6jtrKyS1PA
 CrWyYZ0jKnkrirlUqW6deRq7Fi6sW4Rq7eUgopdxHjU0QgcSHpvnnweYhXypKLiZZ8vR
 cuf6eyKxBAOFtGHE/zKQbWG3mZn2Wr8Hi+aiv/FAG+RF4izFWbaYnBMO5ymEVTPlxI6o
 GvXxL0SVizG6nae8EeWBXNJsx5f76Ti+nvMB1QSd1ziILN0yR33OlN0W+m7qyFqpJ5Sg
 HCuiwnpaCzlQslCfLzZHyriG7QbIAsi4t7cY765LFqIKVeUOnfdvuu6dRL8/eLhFKxJD
 9o4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YoWQjtvkCeSVA1kdmqc11ysNxmHPU03GqQotMHxDp2U=;
 b=LM6rw6GVBTCvvqjx5BKslKaBx87+Ojh2CVtz0KJMxHiCDm4BrT+ZzKqr5gwCGcYqol
 DLDvH9SrEPj933FWiaOOfgtE52Dnm0dP50hF9CWnBfx01alimVyMNqBrqoRId8CosdMp
 zphC+pfa9HPsPqGZVcezUp4nDL3oz0aSAqoZz4ccREoWlaQDZcO8z1kuaQxT7Nki4nqP
 LDAJLAG8YV4/yyih5fdiOpwuKIvgQNMcHCyLHbnMe61VNGJxHqrb0CTUPntW/tAG/Ea6
 fRcyxOO5VIzk/wo/gCatEhfK81B/wNz7/wGOtGmlv7zpUB5xX6iHUKJLo2pz5pOmJJYE
 Sqmg==
X-Gm-Message-State: APjAAAVeK4xvB2l3j3Euw0TjNaNs6pvqlCT2w3OLGLRMwL3nHs4qmjgi
 cBdaFOVOomGlrRyzDV539As+Ij3CtGNWRyUTos42tQ==
X-Google-Smtp-Source: APXvYqzrnRLAsUllxL7vPOP5CM7N8fL1sWjlkqRDPfbOcLxlOi/xZjJsQ1aD+hFTQ8G5wxrFE8DwHOAM7ic7kFMTk6c=
X-Received: by 2002:a81:5cd6:: with SMTP id q205mr121944ywb.13.1561488922875; 
 Tue, 25 Jun 2019 11:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190511132700.4862-1-colin.king@canonical.com>
 <CAOg9mSQt42NQu-3nwZOCGOPx45y7G8aaiDaVe4SwotGnD9iY1A@mail.gmail.com>
 <20190521150311.GL31203@kadam>
In-Reply-To: <20190521150311.GL31203@kadam>
From: Mike Marshall <hubcap@omnibond.com>
Date: Tue, 25 Jun 2019 14:55:11 -0400
Message-ID: <CAOg9mSQmV=BDMpTNLJvb4QBr=f96qg4Hr9qu=bB6xZubB+1LZQ@mail.gmail.com>
Subject: Re: [PATCH] orangefs: remove redundant assignment to variable
 buffer_index
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Mike Marshall <hubcap@omnibond.com>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Colin King <colin.king@canonical.com>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, devel@lists.orangefs.org
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

>> The only explanation I can think of is that you guys are discussing
>> different code. :P

My response contained several conflations :-) ...

The code in file.c that Colin has flagged does indeed have buffer_index
being initialized needlessly, and the assignment noted by Dan is also
needless. There's even a second needless assignment done in another
place in the same function. While the code around them has changed over
time, these now needless manipulations of buffer_index are not new. I'll
get rid of them.

>> You often send these patches before they hit linux-next so I had skipped
>> reviewing this one when you sent it.

I know Linus is likely to refuse pull requests for stuff that
has not been through linux-next, so I make sure stuff has been
there at least a few days before asking for it to be pulled.
"A few days" is long enough for robots to see it, perhaps not
long enough for humans. I especially appreciate the human review. One of
the good things about Orangefs is that it is easy to install and configure,
especially for testing. Documentation/filesystems/orangefs.txt has
instructions for dnf installing orangefs on Fedora, and also how to download
a source tarball and install from that.

-Mike

On Tue, May 21, 2019 at 11:04 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Thu, May 16, 2019 at 12:06:31PM -0400, Mike Marshall wrote:
> > Hi Colin...
> >
> > Thanks for the patch. Before I initialized buffer_index, Dan Williams sent
> > in a warning that a particular error path could try to use ibuffer_index
> > uninitialized. I could induce the problem he described with one
> > of the xfstests resulting in a crashed kernel. I will try to refactor
> > the code to fix the problem some other way than initializing
> > buffer_index in the declaration.
> >
>
> The only explanation I can think of is that you guys are discussing
> different code.  :P
>
> regards,
> dan carpenter
>

