Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 518D8271D6
	for <lists+devel-orangefs@lfdr.de>; Wed, 22 May 2019 23:45:28 +0200 (CEST)
Received: from [::1] (port=37234 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.91)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hTZ39-0002H9-8J
	for lists+devel-orangefs@lfdr.de; Wed, 22 May 2019 17:45:27 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:33228)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.91) (envelope-from <martin@omnibond.com>) id 1hTZ38-0002Gg-Et
 for devel@lists.orangefs.org; Wed, 22 May 2019 17:45:26 -0400
Received: by mail-yw1-f67.google.com with SMTP id v81so1454689ywe.0
 for <devel@lists.orangefs.org>; Wed, 22 May 2019 14:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=omnibond-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+U25ugincLLIJzKVGUO4d13q2ofk13rCni/NM43MthE=;
 b=wvIeLbs8tXj/V+7dlsuremfP54xMre97ghIYRAw2d80LxF7Prs6jbpJ7qGIblN5DaQ
 fzfHrfnOkUwUjWSiM6g04vId8nMdZaINNerfjXFSZ8B5K9Y3t5nkhSvUrzDJT8TH6/uc
 PrcanSUgxv6jFO1Tejr9Fpp5L6RPFKVZ3B4tjFtE2P7m/1d7cJY+oQBHxoFHVHMSahLE
 KJKJ4OiE0FZmlkjyVq8R7a8UXBpQdnS+AykXYcdy3kAPTpQRv9cUwbCsGkpR6Pp2ebzp
 ALax8ChcW1STMNollaxZPG/xFxaPgszasu52tqkIADBQpKhg0NLCwJ9zr+DpGJMM1OZg
 fjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+U25ugincLLIJzKVGUO4d13q2ofk13rCni/NM43MthE=;
 b=IQaDPU3LXRpz09i/IQlRjvIFMRs7tLkloJI03MZxdPp2l7ayu4xGAVfBGP64J2YlNc
 mssV8g/rIDx9NxxsVnleeZMW6RHe8CttBG0himQNh7989w9WC1PLwuVJ8APl90cKYfVv
 KFft4cKiio/n2OK0YVL1qMxf5sV+lwKg7Fi/JR4lKHo2dWcbYosHTOLW+2wwVNb3gaTR
 LdXyhPu9zzeF79tRKHDbsMHs+v4caQNTtNwgpy/Nv3MtluUlWfJvjpROo9OIAL0l+8e4
 pWuL6PCrz55MGUcBNp7zybBZonP6tQ5TZNj6A3KjD2H1rLIER7ZT+BUK1UwTHnC3KqrT
 GOwg==
X-Gm-Message-State: APjAAAUej0I8M73aToAASHst4V528XRysg/drTWvfo2OVTeP8tcmAfZB
 HCmZOg6lGQskv04JZa92xEZSBg==
X-Google-Smtp-Source: APXvYqwd42palRiYNvvsXAgQvmQ8qs/chUXHybI4l4rSQdA0/uaMWee5epSYw38d2XETjIEwM0IOJg==
X-Received: by 2002:a0d:e544:: with SMTP id o65mr44187293ywe.382.1558561485696; 
 Wed, 22 May 2019 14:44:45 -0700 (PDT)
Received: from t480s.mkb.name (047-049-164-163.biz.spectrum.com.
 [47.49.164.163])
 by smtp.gmail.com with ESMTPSA id x125sm9892550ywx.47.2019.05.22.14.44.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 14:44:44 -0700 (PDT)
Date: Wed, 22 May 2019 17:44:37 -0400
From: martin@omnibond.com
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.1 025/375] orangefs: truncate before updating
 size
Message-ID: <20190522214437.GA87137@t480s.mkb.name>
References: <20190522192115.22666-1-sashal@kernel.org>
 <20190522192115.22666-25-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190522192115.22666-25-sashal@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: devel@lists.orangefs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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

I don't think it makes much sense to put this one in stable.  Without
the rest of the pagecache patches the race doesn't exist.

Martin

On Wed, May 22, 2019 at 03:15:25PM -0400, Sasha Levin wrote:
> From: Martin Brandenburg <martin@omnibond.com>
> 
> [ Upstream commit 33713cd09ccdc1e01b10d0782ae60200d4989553 ]
> 
> Otherwise we race with orangefs_writepage/orangefs_writepages
> which and does not expect i_size < page_offset.
> 
> Fixes xfstests generic/129.
> 
> Signed-off-by: Martin Brandenburg <martin@omnibond.com>
> Signed-off-by: Mike Marshall <hubcap@omnibond.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  fs/orangefs/inode.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
> index c3334eca18c7e..3260f757c0803 100644
> --- a/fs/orangefs/inode.c
> +++ b/fs/orangefs/inode.c
> @@ -172,7 +172,11 @@ static int orangefs_setattr_size(struct inode *inode, struct iattr *iattr)
>  	}
>  	orig_size = i_size_read(inode);
>  
> -	truncate_setsize(inode, iattr->ia_size);
> +	/* This is truncate_setsize in a different order. */
> +	truncate_pagecache(inode, iattr->ia_size);
> +	i_size_write(inode, iattr->ia_size);
> +	if (iattr->ia_size > orig_size)
> +		pagecache_isize_extended(inode, orig_size, iattr->ia_size);
>  
>  	new_op = op_alloc(ORANGEFS_VFS_OP_TRUNCATE);
>  	if (!new_op)
> -- 
> 2.20.1
> 

