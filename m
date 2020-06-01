Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id D09941EA284
	for <lists+devel-orangefs@lfdr.de>; Mon,  1 Jun 2020 13:15:57 +0200 (CEST)
Received: from [::1] (port=60902 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jfiQ9-0004JA-2i
	for lists+devel-orangefs@lfdr.de; Mon, 01 Jun 2020 07:15:57 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:41728)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <hubcap@omnibond.com>) id 1jfiQ7-0004Ii-M3
 for devel@lists.orangefs.org; Mon, 01 Jun 2020 07:15:55 -0400
Received: by mail-ua1-f65.google.com with SMTP id a10so1623551uan.8
 for <devel@lists.orangefs.org>; Mon, 01 Jun 2020 04:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=omnibond-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OXZ/1DYRo+pu94KlRLN7nt0/Jhb4JRPyNAe/TLutDXA=;
 b=LKZL0Qour/P3znlT11X6MSTa6a99kxJDMSO5oEuzh1urufoBk/cF8qaCaAXe2QzSU7
 o+TAkmNpjAqy8QBkVVDWyY2MQf7jZV3Sh5yfmmn8AxRZqeXovzJiNaHsAVzkJkJbp0c4
 xOcWqsh+4ND9g/cdr4emUuxzL7VBStoQv47qrX7kbAJczbJJH+M9ntwRVDPf9UWnQy0J
 JpeO55wc7hgIA6KQ5zR6fbuP5EPaptgIWLcCl9L8ym6u8sXM5Tj6e1wCaPtGGbKTRxn2
 G3uT95sz/KJ3K0xAc8pFwhdZqDe3jkNHXZUrB5Se/v2+2CNH8Gpz/c3+6EBiz8z1pHYT
 gpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OXZ/1DYRo+pu94KlRLN7nt0/Jhb4JRPyNAe/TLutDXA=;
 b=G7v0Pjj9hVg9szjVd6u1zWj9kWxpakVegy8ofzkl583j6dioRNw8T3jiP4TZv79/br
 qujC3SuNPD6zLljtSoVls5Z4UWisCZ93g+GlpeHKfIGsS07YZSXNZEDJOwk0iBl/Os4R
 LedOxaMVMM+vhCACq7Lwic7Y32YzD2muZdcqApo09IIb61NsGSh89OmZL4WjwjFLKWJL
 AaePJxbeYrawt9PNS3JXml56hUJIbmuEq/FKAkJQM5DkRRi0eYt4OFxrkVxhkQRC1we2
 J3jtZpsJUqTqBD2pNS0JjnuTTZNUfXzVgZhsln1cRX5jT0QEijTjtOjiCJhzDz2ZnFG8
 xo5A==
X-Gm-Message-State: AOAM533r21p/INeVoDrv9/6chD16oAPqrCraf49wMxYzNHOJWIcsd9BG
 Q9rLTSjZaZH4syMgpBMBsD0BV5CdZJYaIws4nKtjvW0/XHY=
X-Google-Smtp-Source: ABdhPJyLmXk9IokgmeXuSJkA51TK2eGFwPQT+GFIvU7RA+yCOCZNRcNTXzdIV1T6tjLuIq55IW6dCOPqa3CLlRE70JQ=
X-Received: by 2002:ab0:548a:: with SMTP id p10mr13945454uaa.35.1591010115132; 
 Mon, 01 Jun 2020 04:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200524224802.27850-1-colin.king@canonical.com>
In-Reply-To: <20200524224802.27850-1-colin.king@canonical.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Mon, 1 Jun 2020 07:15:04 -0400
Message-ID: <CAOg9mSQWuE06DJtfSn-d2cBK+RMZ0ndnw6m29pWEdw3jQq3erQ@mail.gmail.com>
Subject: Re: [PATCH] orangefs: remove redundant assignment to variable ret
To: Colin King <colin.king@canonical.com>
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

Hi Colin... thanks for the patch, I have applied it
to the orangefs for-next tree...

-Mike

On Sun, May 24, 2020 at 6:48 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable ret is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/orangefs/orangefs-mod.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/orangefs/orangefs-mod.c b/fs/orangefs/orangefs-mod.c
> index c010c1fddafc..289b648ae196 100644
> --- a/fs/orangefs/orangefs-mod.c
> +++ b/fs/orangefs/orangefs-mod.c
> @@ -79,7 +79,7 @@ DECLARE_WAIT_QUEUE_HEAD(orangefs_request_list_waitq);
>
>  static int __init orangefs_init(void)
>  {
> -       int ret = -1;
> +       int ret;
>         __u32 i = 0;
>
>         if (op_timeout_secs < 0)
> --
> 2.25.1
>

