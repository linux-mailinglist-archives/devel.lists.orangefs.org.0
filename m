Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AEC1F3AF2
	for <lists+devel-orangefs@lfdr.de>; Tue,  9 Jun 2020 14:47:28 +0200 (CEST)
Received: from [::1] (port=50284 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jidf5-0004gc-0r
	for lists+devel-orangefs@lfdr.de; Tue, 09 Jun 2020 08:47:27 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40308)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <shalu@doper.tech>) id 1jidf3-0004du-Fl
 for devel@lists.orangefs.org; Tue, 09 Jun 2020 08:47:25 -0400
Received: by mail-pf1-f195.google.com with SMTP id s23so8709411pfh.7
 for <devel@lists.orangefs.org>; Tue, 09 Jun 2020 05:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=doper.tech; s=google;
 h=from:to:subject:date:message-id:mime-version:thread-index
 :content-language;
 bh=88JIeAVTpsQbkzatt8B+4ieK7DA6EKyUliukC5ENK+g=;
 b=Wi0QPanBCd5q7wFnoRKSTEOe6w8XFPnu83xL8Ltw1eHGF9G6ADrJ2MmnJDrAyAf3RP
 fbBWDpE7cDYB/Tbl095QT3j1Tt7WgMyv/aa63SpggxiSml7s9UofEWvpmrEdMAWNWy6+
 gMmFqxWwYl7YVpLCvtB0N9ghXKu0vAPyoo+bmOxwsSNkKoAE/IVaTihoGlAhQm4UDYfn
 X/gcdqLMTXahAUSDphXziO9wMLlFVLOlfWdBXHEyKlxJ6pWxXSjIq+nZEVK99aFALa8n
 8aGd45u3yhTZJNwI+xyKgHrA4dQY/QNtcVAkwvE8SMOJYCfWFFFDRMFFDrGCS7oFTHMc
 l/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :thread-index:content-language;
 bh=88JIeAVTpsQbkzatt8B+4ieK7DA6EKyUliukC5ENK+g=;
 b=JdzAJhh98quvi5ir/ktqpP80GQHGs2W8sQrYHu/Ge4ThJHxlFiO0bV5E5D8y5Uq3ea
 hFDRQ3T3r4ZOjFJGP+Bec9fCRawdxuAcqShsj3VUmrph4mLuGxR75U5hG/OgItL9nkO0
 JK+RimCUa69DqtyQGZywy9Ka3DgRUffvWEJG+c7hyLsbGaNXA+1lAv6BjSddvENeEam2
 AJrfu6ip6XiA//lF3mqhaz+8sbHjpruLRCWynJYYQI5yzWfDztRmP41ec8KBvRDTD4iZ
 mzfoqY91tYYSNZq0zovmh+Ct5dES6JhUbqDuIFo4Y10WELzImJWAxY4eE2/GqfFTlEtr
 Sz1A==
X-Gm-Message-State: AOAM532W9mWxJwto87rWtjfflu8PG+ueOXhMcXLP227YaSLcu719ndp+
 8LSFSyXGA5v3B+N3AtqJQp2/Fy9dINU=
X-Google-Smtp-Source: ABdhPJwIHkI3S/uEcgZMxV7YPHjzVJKRz8zJf6EnqChFfC64ylOmgALGPYxe+sAcpbdIUi+Ft0t6Lw==
X-Received: by 2002:a65:508c:: with SMTP id r12mr96284pgp.233.1591706804316;
 Tue, 09 Jun 2020 05:46:44 -0700 (PDT)
Received: from mmPC ([160.202.36.192])
 by smtp.gmail.com with ESMTPSA id o1sm10571964pfu.70.2020.06.09.05.46.42
 for <devel@lists.orangefs.org>
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Tue, 09 Jun 2020 05:46:43 -0700 (PDT)
From: "Shalu" <shalu@doper.tech>
To: <devel@lists.orangefs.org>
Subject: 1st page ranking
Date: Tue, 9 Jun 2020 18:15:40 +0530
Message-ID: <8d1801d63e5c$06787800$13696800$@tech>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AdY+VCMGtfNBkUxDSMOUH8AYhxHPLg==
Content-Language: en-us
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.33
X-BeenThere: devel@lists.orangefs.org
X-Mailman-Version: 2.1.33
Precedence: list
List-Id: <devel.lists.orangefs.org>
List-Unsubscribe: <http://lists.orangefs.org/mailman/options/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=unsubscribe>
List-Archive: <http://lists.orangefs.org/pipermail/devel_lists.orangefs.org/>
List-Post: <mailto:devel@lists.orangefs.org>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Subscribe: <http://lists.orangefs.org/mailman/listinfo/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=subscribe>
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

Hi devel@lists.orangefs.org,

=20

Hope you are well,

=20

I was surfing through your Website and realized that despite having a =
great design; it was not ranking on any of the search engines (Google =
Yahoo and Bing) for most of the keywords relating to your business.

=20

I am affiliated with an SEO company based in India that has helped over =
200 businesses rank on the 1st Page of GOOGLE for even the most =
competitive Industries.

=20

Monitor where you stand=EF=83=BC

Competition Analysis=EF=83=BC

Optimized Content Creation=EF=83=BC

Keywords Optimization=EF=83=BC

Back Link Creation/Link Building=EF=83=BC

Submission to Search Engines and Directories=EF=83=BC

Submission to Article Directories=EF=83=BC

Create a sitemap=EF=83=BC

Search-friendly URLs=EF=83=BC

Avoid Flash=EF=83=BC

Image descriptions=EF=83=BC

Social media distribution=EF=83=BC

=20

Let me know if you are interested and I will send you our company =
details or create a proposal so you can see exactly where you rank =
compared to your competitors.

=20

I look forward to your mail.

=20

Warm Regards

=20

=20

Shalu

                               =20

SEO Co-ordinate

=20

=20

