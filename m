Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F278AEBC
	for <lists+devel-orangefs@lfdr.de>; Tue, 13 Aug 2019 07:25:30 +0200 (CEST)
Received: from [::1] (port=55878 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hxPJJ-00014G-Qz
	for lists+devel-orangefs@lfdr.de; Tue, 13 Aug 2019 01:25:29 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:42749)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <stefan.wahren@i2se.com>)
 id 1hxPJH-00013d-Ky
 for devel@lists.orangefs.org; Tue, 13 Aug 2019 01:25:27 -0400
Received: from [192.168.178.60] ([109.104.47.130]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MPGiR-1hevT50O45-00PbYR; Tue, 13 Aug 2019 07:23:46 +0200
Subject: Re: [PATCH v2 15/34] staging/vc04_services: convert put_page() to
 put_user_page*()
To: john.hubbard@gmail.com, Andrew Morton <akpm@linux-foundation.org>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
 <20190804224915.28669-16-jhubbard@nvidia.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
Message-ID: <f92a9b35-072c-a452-3248-ded047a9ee7e@i2se.com>
Date: Tue, 13 Aug 2019 07:23:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190804224915.28669-16-jhubbard@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:WLtnGHSdIdsSOgSCw9gLWN/He07a3vhG8P/jw9q/ZsKCLbsJUeS
 5llVNlt7KE/tvHn+5EOmDYYv4pX1cHVWKOXHtrw4HQWAHuCkTohFsgxlEY0fExapDm8vR8t
 zVIsUr/Bms6Kvxj5sCY8IbKiNL01LBum+j6x95pPZHXG9iG9KDUI7QIiVK2/58tc3NB1jnX
 y7VHJG/KIA+fGCfAbINIQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:e2tiG/LoUCE=:MfCllk8c06iYHLUWJWcKAL
 cdQ1fi1ypP4tC6pu8XAt4M+fU5mGlkjM5ziFPw9nAP5+ICbjFLhxsiDLATVpll3xwUgna69cS
 Ev9bpFgmBYRqbHsiOVM335kNgAU19xY/LXN/GzEuigzotpDhc5IdC4FGsNTdqmIYi0Bx4dgCw
 bLM/SrMXG40Mg1UArtxdqWQvHnINj7yK6JacwPswBAo33CV5S5U4U1PS67DpEMKA7dX0oduGb
 5fQtkN1kvCZEg2/ekJnnb+PAR6KRS8Eu0zqK7cwQwWxs+nxHFNvcdfFolT7waPuKj24rhpnjW
 ZntPcErm15w8EJ72vFuARtCUk4Lh4jU+zYNtoDE6B8RJqr/+yxycmwEDucEbNXrujkaPH72RU
 fWCHjlXjsJS29DRMlBs91cqiKMaK/ktbzSpegz+iLEJq/HkDuPh/jiz/b8w2crkMXTYEXfcIb
 WqkuI5hHrAdEh99xa/X99FupD8F6iZ52Pv/g2glNHL9WlKL41btCn/KodqBqy/glIqHZeYzq2
 SXjRol/t4oy36qgSCQmUGiCt1lssYLkBWOzcxjui5lZUL2V9O7wn91tHl7G+DbqjQzgMyVtBP
 60iHHkwkWe3su3M3o+o4m8sWd9OG5XIToU/4cSDhBQohrRIKKqoUbXAyCJH96bxaYdq/zseIf
 oMsHaN/31pBaLs6MtsAa2tu5PRj9qlBX5kso+Y5up4mj5gl7CfIWyGwpM4gPWtVKv1En5k3ZR
 HR/0MJ6spaP8P86u5+VALfxj2aM5bbcj+ZVczoVE2BIVl4lPQEesVoHHwFc=
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Suniel Mahesh <sunil.m@techveda.org>,
 Dan Williams <dan.j.williams@intel.com>, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 Mihaela Muraru <mihaela.muraru21@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 Sidong Yang <realwakka@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, Eric Anholt <eric@anholt.net>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 Kishore KP <kishore.p@techveda.org>, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>
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

On 05.08.19 00:48, john.hubbard@gmail.com wrote:
> From: John Hubbard <jhubbard@nvidia.com>
>
> For pages that were retained via get_user_pages*(), release those pages
> via the new put_user_page*() routines, instead of via put_page() or
> release_pages().
>
> This is part a tree-wide conversion, as described in commit fc1d8e7cca2d
> ("mm: introduce put_user_page*(), placeholder versions").
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Stefan Wahren <stefan.wahren@i2se.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Mihaela Muraru <mihaela.muraru21@gmail.com>
> Cc: Suniel Mahesh <sunil.m@techveda.org>
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Cc: Sidong Yang <realwakka@gmail.com>
> Cc: Kishore KP <kishore.p@techveda.org>
> Cc: linux-rpi-kernel@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: devel@driverdev.osuosl.org
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Acked-by: Stefan Wahren <stefan.wahren@i2se.com>

