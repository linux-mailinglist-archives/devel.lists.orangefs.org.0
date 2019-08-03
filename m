Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id C646E804F3
	for <lists+devel-orangefs@lfdr.de>; Sat,  3 Aug 2019 09:07:34 +0200 (CEST)
Received: from [::1] (port=46084 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hto8b-0003af-Sw
	for lists+devel-orangefs@lfdr.de; Sat, 03 Aug 2019 03:07:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:51664)
 by mm1.emwd.com with esmtps (TLSv1.2:AECDH-AES256-SHA:256)
 (Exim 4.92) (envelope-from <gregkh@linuxfoundation.org>)
 id 1hto8a-0003a7-ST
 for devel@lists.orangefs.org; Sat, 03 Aug 2019 03:07:32 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 756402173E;
 Sat,  3 Aug 2019 07:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564816011;
 bh=fAm+JJVlEEdZsZEnQU6VmG7AlISaD9fVfUjXl/e9MGA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EvBQbY6tUIAsZP4MFxGmLRqZJjlnz59fmNMbvE0jfno1B+JXE+PNryIyzSAnXbr8N
 +lgw4Y3y5zL8NJKrLYjFHjBcr6/6qlTB3yc6rbylv5fVS7aSSqYd41B1eBmWwcN4jJ
 e48QvmU3i/Btia6YyxF5rYYxbA6/qQXbJH8nGzR0=
Date: Sat, 3 Aug 2019 09:06:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: john.hubbard@gmail.com
Subject: Re: [PATCH 10/34] genwqe: convert put_page() to put_user_page*()
Message-ID: <20190803070640.GB2508@kroah.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-11-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190802022005.5117-11-jhubbard@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 "Guilherme G. Piccoli" <gpiccoli@linux.vnet.ibm.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Frank Haverkamp <haver@linux.vnet.ibm.com>
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

On Thu, Aug 01, 2019 at 07:19:41PM -0700, john.hubbard@gmail.com wrote:
> From: John Hubbard <jhubbard@nvidia.com>
> 
> For pages that were retained via get_user_pages*(), release those pages
> via the new put_user_page*() routines, instead of via put_page() or
> release_pages().
> 
> This is part a tree-wide conversion, as described in commit fc1d8e7cca2d
> ("mm: introduce put_user_page*(), placeholder versions").
> 
> This changes the release code slightly, because each page slot in the
> page_list[] array is no longer checked for NULL. However, that check
> was wrong anyway, because the get_user_pages() pattern of usage here
> never allowed for NULL entries within a range of pinned pages.
> 
> Cc: Frank Haverkamp <haver@linux.vnet.ibm.com>
> Cc: "Guilherme G. Piccoli" <gpiccoli@linux.vnet.ibm.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/misc/genwqe/card_utils.c | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

