Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 2737614EEE6
	for <lists+devel-orangefs@lfdr.de>; Fri, 31 Jan 2020 16:00:46 +0100 (CET)
Received: from [::1] (port=53612 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1ixXml-0003Xb-O7
	for lists+devel-orangefs@lfdr.de; Fri, 31 Jan 2020 10:00:43 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:33876)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <hubcap@omnibond.com>) id 1ixXmk-0003Wd-An
 for devel@lists.orangefs.org; Fri, 31 Jan 2020 10:00:42 -0500
Received: by mail-vs1-f67.google.com with SMTP id g15so4547919vsf.1
 for <devel@lists.orangefs.org>; Fri, 31 Jan 2020 07:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=omnibond-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wtDVFnZTZb2FqVUYaYHNHbe/9DiGEj7PGSDS1G/YiEY=;
 b=fXGTUdwdUlBhb0SOBjtpi0kvtF0S1mxM8IBSZFsDsBAn9cipHIzWDJ5jbIVooECg/q
 Q7u+nTWvlOuKGPfxGvBMPrE9OAyYfB97VhLkRPGtyc3FY1c0k519bdJjmRJLAdZfadlE
 bLjtgBe8Sw8tlB2hqK6harQI5z7NOFjLILyHIj9qvO4VrlA7yWpnpp/WucWw3Expgv6t
 0UkoecKQvpQW5CemtN7d90FjPd11plBoP46NLPnAwQi2ksKqBOekbpH7guw/THvkHRwL
 iCg0CJVKp2cPq9Bav+u3ZJqhOZ/AsyFR3xSlUVyDDJ0pPCSeNGMzzi6p6gneya+Df6Zf
 n+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wtDVFnZTZb2FqVUYaYHNHbe/9DiGEj7PGSDS1G/YiEY=;
 b=sw5n39P2pvgDMffx/Dh1bzo71zoxcZlqwyRUAoBjrXsQC3Ed8MLiAKi2obYXqZt7S2
 7Pmga+DQbCp7tjm44Mu+n2B9ghg3N4ypvDemdusMAl3FiFjc9hn6lW4PVDvGMzAH/rF0
 fqTVaSrN5Dx6Q1HC6Zx+Fncex8TceiZbP1Y7ahozCGQBO4NMopjq+s7pBd4btiykjLA2
 udNWZCawhXnhQ4OiMr3PWpmOEVM6QUiue3/SpioSR0RWpnMWIZ/X0PGCLBOV2yP6t0dH
 5YjkwIQbjhuH0STClPJ8gzSJQ3oA0u8YvT2nEIMt1nXGT23fhaCT/OGKnCDA0G8Dt7l1
 TE0A==
X-Gm-Message-State: APjAAAXk1ycYqTfhBm0s/sn8OMw32L828n2/rTKe1zKgYmRdAwKnLVAl
 4Fxo8zPSq3yzF5BNPThjZO4bh7j3W3vtjxPEFGyoVA==
X-Google-Smtp-Source: APXvYqyA08d3/oXiiFnGgtwg66jdN78gE7Cekb7MKw0wGAFzEsJULTdC1Vf2nLbllwk7NyUkVNgJ20jf1K3jduR1QV0=
X-Received: by 2002:a67:f253:: with SMTP id y19mr6773514vsm.158.1580482801497; 
 Fri, 31 Jan 2020 07:00:01 -0800 (PST)
MIME-Version: 1.0
References: <33c86368-72e9-955c-2601-467f17a12ec2@virtuozzo.com>
In-Reply-To: <33c86368-72e9-955c-2601-467f17a12ec2@virtuozzo.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Fri, 31 Jan 2020 09:59:50 -0500
Message-ID: <CAOg9mSTjKBOGbb0k-SRnFZBUcj10UpOX1Z1tvUxsYGfxbDOZGw@mail.gmail.com>
Subject: Re: [PATCH 1/1] help_next should increase position index
To: Vasily Averin <vvs@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devel@lists.orangefs.org
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

Hello Vasily...

I have applied your patch to Linux 5.5 and tested that it
fixes the problem that your script demonstrates. Thanks
for the fix!

The Linux merge window is open, are you going to submit
this patch, or should I?

-Mike


On Fri, Jan 24, 2020 at 1:10 AM Vasily Averin <vvs@virtuozzo.com> wrote:
>
> if seq_file .next fuction does not change position index,
> read after some lseek can generate unexpected output.
>
> https://bugzilla.kernel.org/show_bug.cgi?id=206283
> Signed-off-by: Vasily Averin <vvs@virtuozzo.com>
> ---
>  fs/orangefs/orangefs-debugfs.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugfs.c
> index 25543a9..29eaa45 100644
> --- a/fs/orangefs/orangefs-debugfs.c
> +++ b/fs/orangefs/orangefs-debugfs.c
> @@ -273,6 +273,7 @@ static void *help_start(struct seq_file *m, loff_t *pos)
>
>  static void *help_next(struct seq_file *m, void *v, loff_t *pos)
>  {
> +       (*pos)++;
>         gossip_debug(GOSSIP_DEBUGFS_DEBUG, "help_next: start\n");
>
>         return NULL;
> --
> 1.8.3.1
>

