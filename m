Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 844FA416E6
	for <lists+devel-orangefs@lfdr.de>; Tue, 11 Jun 2019 23:28:46 +0200 (CEST)
Received: from [::1] (port=44724 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1haoJx-000314-Pp
	for lists+devel-orangefs@lfdr.de; Tue, 11 Jun 2019 17:28:45 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38295)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <adilger@dilger.ca>) id 1haoJw-0002yc-9Q
 for devel@lists.orangefs.org; Tue, 11 Jun 2019 17:28:44 -0400
Received: by mail-pg1-f195.google.com with SMTP id v11so7660928pgl.5
 for <devel@lists.orangefs.org>; Tue, 11 Jun 2019 14:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dilger-ca.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=kHOmEXm44ofEStTL89clw86zKCfMK7pxZweKkVj60zc=;
 b=BNyH/I0aTFapdWvAUe1tA6vh4V7SGGnKW9i2iryYsCgfyNFoPcnfrRh6ENitI8pQJy
 ceJmUE14+hVNBM9WC+xAjbbK0ncjBtDNhZsREXS8wFJSFtJTAC+2kp/Gx/2pDb6cUMf8
 JpUjBxKEfOQvrL9m9kMePR3M4fWdfHCrRVaSTbbHZtX1SELIRUg9HXb/1sKatJNSwuF+
 QO1DomLI907tfm1bq218gSHTCncrOyxsRkBkmStrHKSsQYkjWyIsW3ZSK9J+lpNXxDiR
 oojDQ9O14TWNGl2rGOpuLibgYG5bNECymjz1Ygn5Bb6fBc1ArnndD5ref2xpl4j3WuJU
 Jxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=kHOmEXm44ofEStTL89clw86zKCfMK7pxZweKkVj60zc=;
 b=ZB9jcCmKo8vdzESUMOZxbJgXXEfCEP4J1wnVK8ecKqyRIAMNZzLlFBoQ/TNexrwWhF
 WMENvvv5Px2T91L/nmhahnD5JTVC1NPtiYW2RWzfhL8wLrr/9zyO8TOcSQVpwC4JH4y2
 8hEDOArGZRrioi2uJtGaLw0hvQJDPH9WPydYoDDP3o4qqScrcFp8vyMT90crIVMiiTOc
 Qq0p8d5IyptbzdOv4YQoOGqZLEZFkBTNGZQ3Fvv2iGcTYmekxVCLmqm9zVLSYVlmOyVt
 Av29ba0EVa7X7l0CEGEvMGR2caKvTIBC4VwSvgLYC7CdGu4N1gFv6iJELaNXiAWo6UxQ
 +4OA==
X-Gm-Message-State: APjAAAUts+u6C+kgoCYel+esWmfII9pt4GJAXbZMMRc++DbspUjvC/Cn
 l0OxIilWR8cFibSzaqRCJ8IkAg==
X-Google-Smtp-Source: APXvYqx8fSWzb0HB5KPULCR4fAdvphiu+yCLRaPJ3mwALDMWZWEo99vzBDgf+T6A9kZ8B2J2ELLLxQ==
X-Received: by 2002:a17:90a:a505:: with SMTP id
 a5mr29364827pjq.27.1560288483342; 
 Tue, 11 Jun 2019 14:28:03 -0700 (PDT)
Received: from cabot.adilger.ext (S0106a84e3fe4b223.cg.shawcable.net.
 [70.77.216.213])
 by smtp.gmail.com with ESMTPSA id a192sm6068716pfa.84.2019.06.11.14.28.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 14:28:02 -0700 (PDT)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <315FEA4D-41B1-4C5B-89AA-7ABA93D66E0A@dilger.ca>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH V2] include: linux: Regularise the use of FIELD_SIZEOF
 macro
Date: Tue, 11 Jun 2019 15:28:00 -0600
In-Reply-To: <20190611140907.899bebb12a3d731da24a9ad1@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
References: <20190611193836.2772-1-shyam.saini@amarulasolutions.com>
 <20190611134831.a60c11f4b691d14d04a87e29@linux-foundation.org>
 <6DCAE4F8-3BEC-45F2-A733-F4D15850B7F3@dilger.ca>
 <20190611140907.899bebb12a3d731da24a9ad1@linux-foundation.org>
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

On Jun 11, 2019, at 3:09 PM, Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> On Tue, 11 Jun 2019 15:00:10 -0600 Andreas Dilger <adilger@dilger.ca> wrote:
> 
>>>> to FIELD_SIZEOF
>>> 
>>> As Alexey has pointed out, C structs and unions don't have fields -
>>> they have members.  So this is an opportunity to switch everything to
>>> a new member_sizeof().
>>> 
>>> What do people think of that and how does this impact the patch footprint?
>> 
>> I did a check, and FIELD_SIZEOF() is used about 350x, while sizeof_field()
>> is about 30x, and SIZEOF_FIELD() is only about 5x.
> 
> Erk.  Sorry, I should have grepped.
> 
>> That said, I'm much more in favour of "sizeof_field()" or "sizeof_member()"
>> than FIELD_SIZEOF().  Not only does that better match "offsetof()", with
>> which it is closely related, but is also closer to the original "sizeof()".
>> 
>> Since this is a rather trivial change, it can be split into a number of
>> patches to get approval/landing via subsystem maintainers, and there is no
>> huge urgency to remove the original macros until the users are gone.  It
>> would make sense to remove SIZEOF_FIELD() and sizeof_field() quickly so
>> they don't gain more users, and the remaining FIELD_SIZEOF() users can be
>> whittled away as the patches come through the maintainer trees.
> 
> In that case I'd say let's live with FIELD_SIZEOF() and remove
> sizeof_field() and SIZEOF_FIELD().

The real question is whether we want to live with a sub-standard macro for
the next 20 years rather than taking the opportunity to clean it up now?

> I'm a bit surprised that the FIELD_SIZEOF() definition ends up in
> stddef.h rather than in kernel.h where such things are normally
> defined.  Why is that?

Cheers, Andreas





-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 873 bytes
Desc: Message signed with OpenPGP
URL: <http://lists.orangefs.org/pipermail/devel_lists.orangefs.org/attachments/20190611/2b5c9d01/attachment.asc>
