Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCEA1C06E4
	for <lists+devel-orangefs@lfdr.de>; Thu, 30 Apr 2020 21:47:49 +0200 (CEST)
Received: from [::1] (port=59392 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jUF9w-0002Na-7n
	for lists+devel-orangefs@lfdr.de; Thu, 30 Apr 2020 15:47:48 -0400
Received: from ms.lwn.net ([45.79.88.28]:53304)
 by mm1.emwd.com with esmtps  (TLS1.2) tls TLS_ECDH_anon_WITH_AES_256_CBC_SHA
 (Exim 4.93) (envelope-from <corbet@lwn.net>) id 1jUF9v-0002K8-78
 for devel@lists.orangefs.org; Thu, 30 Apr 2020 15:47:47 -0400
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id B33096E3;
 Thu, 30 Apr 2020 19:47:05 +0000 (UTC)
Date: Thu, 30 Apr 2020 13:47:04 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Vitor Massaru Iha <vitor@massaru.org>
Subject: Re: [PATCH] docs: filesystems: fix `make htmldocs` warning
Message-ID: <20200430134704.236c612b@lwn.net>
In-Reply-To: <20200430190737.80950-1-vitor@massaru.org>
References: <20200430190737.80950-1-vitor@massaru.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
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

On Thu, 30 Apr 2020 16:07:37 -0300
Vitor Massaru Iha <vitor@massaru.org> wrote:

> make htmldocs
> Documentation/filesystems/orangefs.rst:124: WARNING: Literal block expected; none found.
> 
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> ---
>  Documentation/filesystems/orangefs.rst | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/Documentation/filesystems/orangefs.rst b/Documentation/filesystems/orangefs.rst
> index e41369709c5b..628dc220567e 100644
> --- a/Documentation/filesystems/orangefs.rst
> +++ b/Documentation/filesystems/orangefs.rst
> @@ -119,9 +119,7 @@ it comes to that question::
>  
>      /opt/ofs/bin/pvfs2-genconfig /etc/pvfs2.conf
>  
> -Create an /etc/pvfs2tab file::
> -
> -Localhost is fine for your pvfs2tab file:
> +Create an /etc/pvfs2tab file. Localhost is fine for your pvfs2tab file::
>  
>      echo tcp://localhost:3334/orangefs /pvfsmnt pvfs2 defaults,noauto 0 0 > \
>  	/etc/pvfs2tab

Thanks, but this has already been fixed in docs-next.

jon

