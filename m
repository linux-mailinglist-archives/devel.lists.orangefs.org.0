Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 552B24166B
	for <lists+devel-orangefs@lfdr.de>; Tue, 11 Jun 2019 22:49:16 +0200 (CEST)
Received: from [::1] (port=42442 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hanhj-0001ep-H5
	for lists+devel-orangefs@lfdr.de; Tue, 11 Jun 2019 16:49:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:35072)
 by mm1.emwd.com with esmtps (TLSv1.2:AECDH-AES256-SHA:256)
 (Exim 4.92) (envelope-from <akpm@linux-foundation.org>)
 id 1hanhi-0001c8-0f
 for devel@lists.orangefs.org; Tue, 11 Jun 2019 16:49:14 -0400
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7CE6320684;
 Tue, 11 Jun 2019 20:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560286113;
 bh=y33lrlkQja7eoIovWsePDjdEdIHZ/RJoRj29PafhqOI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UgyruavCsSZLLvbVGn/8Url9hdMFqD/vc6cS2xvCxVAaLGSpqRyO7wgSl3uYSlnrC
 3+fJjYU9x+kvkKn62ONAnZk5QMPYKtIt9RU5V2bIySebdJX4pNazzbre4oO5OlK2mG
 81xtH5C+HAjNqK8Itw5roVmiKtRcfGnYRZlw+kVk=
Date: Tue, 11 Jun 2019 13:48:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Shyam Saini <shyam.saini@amarulasolutions.com>
Subject: Re: [PATCH V2] include: linux: Regularise the use of FIELD_SIZEOF
 macro
Message-Id: <20190611134831.a60c11f4b691d14d04a87e29@linux-foundation.org>
In-Reply-To: <20190611193836.2772-1-shyam.saini@amarulasolutions.com>
References: <20190611193836.2772-1-shyam.saini@amarulasolutions.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: keescook@chromium.org, kvm@vger.kernel.org,
 kernel-hardening@lists.openwall.com, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, devel@lists.orangefs.org,
 bpf@vger.kernel.org, linux-ext4@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, Alexey Dobriyan <adobriyan@gmail.com>,
 linux-arm-kernel@lists.infradead.org, mayhs11saini@gmail.com
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

On Wed, 12 Jun 2019 01:08:36 +0530 Shyam Saini <shyam.saini@amarulasolutions.com> wrote:

> Currently, there are 3 different macros, namely sizeof_field, SIZEOF_FIELD
> and FIELD_SIZEOF which are used to calculate the size of a member of
> structure, so to bring uniformity in entire kernel source tree lets use
> FIELD_SIZEOF and replace all occurrences of other two macros with this.
> 
> For this purpose, redefine FIELD_SIZEOF in include/linux/stddef.h and
> tools/testing/selftests/bpf/bpf_util.h and remove its defination from
> include/linux/kernel.h
> 
> In favour of FIELD_SIZEOF, this patch also deprecates other two similar
> macros sizeof_field and SIZEOF_FIELD.
> 
> For code compatibility reason, retain sizeof_field macro as a wrapper macro
> to FIELD_SIZEOF

As Alexey has pointed out, C structs and unions don't have fields -
they have members.  So this is an opportunity to switch everything to
a new member_sizeof().

What do people think of that and how does this impact the patch footprint?

