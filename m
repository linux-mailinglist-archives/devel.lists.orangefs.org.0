Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAEC20C91
	for <lists+devel-orangefs@lfdr.de>; Thu, 16 May 2019 18:07:25 +0200 (CEST)
Received: from [::1] (port=45370 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.91)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hRIuh-0006xi-OU
	for lists+devel-orangefs@lfdr.de; Thu, 16 May 2019 12:07:23 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:33244)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.91) (envelope-from <hubcap@omnibond.com>) id 1hRIug-0006x3-R9
 for devel@lists.orangefs.org; Thu, 16 May 2019 12:07:22 -0400
Received: by mail-yb1-f196.google.com with SMTP id j10so1472830ybh.0
 for <devel@lists.orangefs.org>; Thu, 16 May 2019 09:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=omnibond-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CHWyz1LU+xHA4Q1ska4TffuV2AfB2TvrKTO3gR0GbGE=;
 b=Y0mXezBZVxIxseokZsbxqalDY+MaBWbgOOboidAQf5Pma6GdOx6ZZxVHR30++t/Y7q
 P4kua8WZMlbWVIE1t/ywUPS4L/qmMs+NyeEkbC5QIECT0cXdsBYd+UxeuKIbXXG6cx+1
 GY+oD0njrg6/P9nBGOCHBvBWGQRZfp5OOeFqsacn0cJDfuCyPZFJ3UECh54jrCIETv2A
 ebwlOHH7So5wen48Z0j33UczjRMSJT+kNffsRx55e6kC/3la9syO+SwhKOvdhx2DrBqo
 x1GWHEYxpzdmhD2PZmvHYLIkmozTXQny5F7/UQOE1XrIru48Nw44/P9PWTS4gBKhljp5
 3dsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CHWyz1LU+xHA4Q1ska4TffuV2AfB2TvrKTO3gR0GbGE=;
 b=nTJhqwNwWO9b/G/1bDSMB2G+DmwwEaQ4tM54EqhcUc9ivamLWBCjlssbAkkXYZ31l2
 TOyYC3XoFo6RyU+woARCQspGQ8fppz0mQ6SYvWQWnGpwBkhQry1V+poyaKlR+kJmmuJf
 FgD1VX0ZefopUnl8PTREFDFDe8eI42i/cxwMwGEj1yVE0G3YlNu47gfeWjX2FHweHCKH
 eMK4urs5YkZXCCHBM2y3PKvRIqbghZuGVBou1+MUva3D11UCgAeZTnZ/BR4fHfc/xYVW
 GVXefx8/BYMwMRGw0BtVaz0JVOEBe4NwlrxVbayZobM2oWbwSe3DP/UZloqPAKbvnmaE
 lxgg==
X-Gm-Message-State: APjAAAUfjdTMhYNvRYqf3WatnwaX+/a3Twb4jIMbaxzZIJA3H8XGWuXY
 N5DpxzZVRmBZfhZXumKu9zObBBfoahEgHQKvD/zXYw==
X-Google-Smtp-Source: APXvYqwTwUep44gjhL50pdhBMWRKO6w6XgfCToc9A83ssp6llyoXZB/UrsVDxWm82O0MyBEOv0DQEWDkOmlNKpI2j8A=
X-Received: by 2002:a25:26c7:: with SMTP id
 m190mr22880219ybm.486.1558022802021; 
 Thu, 16 May 2019 09:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190511132700.4862-1-colin.king@canonical.com>
In-Reply-To: <20190511132700.4862-1-colin.king@canonical.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Thu, 16 May 2019 12:06:31 -0400
Message-ID: <CAOg9mSQt42NQu-3nwZOCGOPx45y7G8aaiDaVe4SwotGnD9iY1A@mail.gmail.com>
Subject: Re: [PATCH] orangefs: remove redundant assignment to variable
 buffer_index
To: Colin King <colin.king@canonical.com>
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 devel@lists.orangefs.org
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

Hi Colin...

Thanks for the patch. Before I initialized buffer_index, Dan Williams sent
in a warning that a particular error path could try to use ibuffer_index
uninitialized. I could induce the problem he described with one
of the xfstests resulting in a crashed kernel. I will try to refactor
the code to fix the problem some other way than initializing
buffer_index in the declaration.

-Mike

On Sat, May 11, 2019 at 9:27 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable buffer_index is being initialized however this is never
> read and later it is being reassigned to a new value. The initialization
> is redundant and hence can be removed.
>
> Addresses-Coverity: ("Unused Value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/orangefs/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/orangefs/file.c b/fs/orangefs/file.c
> index a35c17017210..80f06ee794c5 100644
> --- a/fs/orangefs/file.c
> +++ b/fs/orangefs/file.c
> @@ -52,7 +52,7 @@ ssize_t wait_for_direct_io(enum ORANGEFS_io_type type, struct inode *inode,
>         struct orangefs_inode_s *orangefs_inode = ORANGEFS_I(inode);
>         struct orangefs_khandle *handle = &orangefs_inode->refn.khandle;
>         struct orangefs_kernel_op_s *new_op = NULL;
> -       int buffer_index = -1;
> +       int buffer_index;
>         ssize_t ret;
>         size_t copy_amount;
>
> --
> 2.20.1
>

