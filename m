Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E9341688
	for <lists+devel-orangefs@lfdr.de>; Tue, 11 Jun 2019 23:00:58 +0200 (CEST)
Received: from [::1] (port=42506 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hant3-0001vj-Qp
	for lists+devel-orangefs@lfdr.de; Tue, 11 Jun 2019 17:00:57 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36400)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <adilger@dilger.ca>) id 1hant2-0001uu-OU
 for devel@lists.orangefs.org; Tue, 11 Jun 2019 17:00:56 -0400
Received: by mail-pg1-f195.google.com with SMTP id f21so1613812pgi.3
 for <devel@lists.orangefs.org>; Tue, 11 Jun 2019 14:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dilger-ca.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=nUPaXZb2EyHCiKOm64w17o/WMgOXwq3cvo71tUNaOwE=;
 b=1PkfIHxoAL100GHTIJPtUgnC6vtovLyncp9xFBxlnggPu12+zsDGgnLaBjug3WcCRF
 ADQVr3JetSynDAQbtUt6ErvLUOeaCpig1636+Ma6Jq/Pzq9Wm8vruTUnsCFntkIJGXPX
 wWnf8ZOx9s4y5y8Qm3ZvQvL2os1TOwaLQLvbm9ZJou9U0nJzedf/8LPDMnNkHoMmIRvm
 0JVJjUBp99ct05cqa2egnpZd13j2INZwnsHocqWKQQe5RqyURZIMrPteLnuZG4T+3ubQ
 FsvDJpuZH3QIeO3XlnkM7vdfDShdyMdLnG6hcUpiZJVNutSS2SeLa5Fxo2XceNqs4ysr
 0rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=nUPaXZb2EyHCiKOm64w17o/WMgOXwq3cvo71tUNaOwE=;
 b=R+e/aY2cdYXqODQ0ugJjftOwhl0yEgP+Qlf+mnhgpl15byZ/lisXkwvnJEUgeMc3SR
 AB9P0jo8uR1/kTP1wtd/JRjZNp63cCrVxKL9urniLd2h4FTQQNAnAxBiE1QLZjDvtK/t
 FVWZq2wmIE9jNcSBsL879ZQE/eMt3ppYhMvajs9CFaYaIMFpjVfJWUarmvEjY61NP4NF
 A+/KnFBadFbv86mXso6BpZn1ekUFWT8i3bJgxhI7EG9ZwaGBQMoAQoBvSR1aDy7RoTEz
 MjUnoXvak6R8mFoNBY3gzN7ce4CdQK7xnyLNNOHUHFbtOPrMMbHJTaj6HxHctn/zakYg
 OLBw==
X-Gm-Message-State: APjAAAVnT3ntmfF+j8lWCBXFNsO9se1bLKwwiv28j6p87oyQjbAfhofO
 oprL5b/aGlWU4ZX730ECZoLDLw==
X-Google-Smtp-Source: APXvYqw4YBmB5zv3pmuSF2o1Ro24lhPZ3aL8+7Yz5YYkMM5A75U9mLeByV4nZS/X2MAaqVMFGY5qAQ==
X-Received: by 2002:a63:4419:: with SMTP id r25mr22692286pga.247.1560286815720; 
 Tue, 11 Jun 2019 14:00:15 -0700 (PDT)
Received: from cabot.adilger.ext (S0106a84e3fe4b223.cg.shawcable.net.
 [70.77.216.213])
 by smtp.gmail.com with ESMTPSA id l1sm14357897pgj.67.2019.06.11.14.00.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 14:00:14 -0700 (PDT)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <6DCAE4F8-3BEC-45F2-A733-F4D15850B7F3@dilger.ca>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH V2] include: linux: Regularise the use of FIELD_SIZEOF
 macro
Date: Tue, 11 Jun 2019 15:00:10 -0600
In-Reply-To: <20190611134831.a60c11f4b691d14d04a87e29@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
References: <20190611193836.2772-1-shyam.saini@amarulasolutions.com>
 <20190611134831.a60c11f4b691d14d04a87e29@linux-foundation.org>
X-Mailer: Apple Mail (2.3273)
Content-Type: text/plain; charset="us-ascii"
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
 intel-gfx@lists.freedesktop.org, devel@lists.orangefs.org,
 linux-mips@vger.kernel.org, Shyam Saini <shyam.saini@amarulasolutions.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-sctp@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bpf@vger.kernel.org,
 linux-ext4 <linux-ext4@vger.kernel.org>, intel-gvt-dev@lists.freedesktop.org,
 Alexey Dobriyan <adobriyan@gmail.com>, linux-arm-kernel@lists.infradead.org,
 mayhs11saini@gmail.com
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

On Jun 11, 2019, at 2:48 PM, Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> On Wed, 12 Jun 2019 01:08:36 +0530 Shyam Saini <shyam.saini@amarulasolutions.com> wrote:
> 
>> Currently, there are 3 different macros, namely sizeof_field, SIZEOF_FIELD
>> and FIELD_SIZEOF which are used to calculate the size of a member of
>> structure, so to bring uniformity in entire kernel source tree lets use
>> FIELD_SIZEOF and replace all occurrences of other two macros with this.
>> 
>> For this purpose, redefine FIELD_SIZEOF in include/linux/stddef.h and
>> tools/testing/selftests/bpf/bpf_util.h and remove its defination from
>> include/linux/kernel.h
>> 
>> In favour of FIELD_SIZEOF, this patch also deprecates other two similar
>> macros sizeof_field and SIZEOF_FIELD.
>> 
>> For code compatibility reason, retain sizeof_field macro as a wrapper macro
>> to FIELD_SIZEOF
> 
> As Alexey has pointed out, C structs and unions don't have fields -
> they have members.  So this is an opportunity to switch everything to
> a new member_sizeof().
> 
> What do people think of that and how does this impact the patch footprint?

I did a check, and FIELD_SIZEOF() is used about 350x, while sizeof_field()
is about 30x, and SIZEOF_FIELD() is only about 5x.

That said, I'm much more in favour of "sizeof_field()" or "sizeof_member()"
than FIELD_SIZEOF().  Not only does that better match "offsetof()", with
which it is closely related, but is also closer to the original "sizeof()".

Since this is a rather trivial change, it can be split into a number of
patches to get approval/landing via subsystem maintainers, and there is no
huge urgency to remove the original macros until the users are gone.  It
would make sense to remove SIZEOF_FIELD() and sizeof_field() quickly so
they don't gain more users, and the remaining FIELD_SIZEOF() users can be
whittled away as the patches come through the maintainer trees.

Cheers, Andreas





-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 873 bytes
Desc: Message signed with OpenPGP
URL: <http://lists.orangefs.org/pipermail/devel_lists.orangefs.org/attachments/20190611/01adcdb2/attachment.asc>
