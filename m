Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA34155345
	for <lists+devel-orangefs@lfdr.de>; Fri,  7 Feb 2020 08:51:37 +0100 (CET)
Received: from [::1] (port=36984 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1izyQJ-00066z-UA
	for lists+devel-orangefs@lfdr.de; Fri, 07 Feb 2020 02:51:35 -0500
Received: from mail-il1-f170.google.com ([209.85.166.170]:38949)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <pwai64229@gmail.com>) id 1izyQJ-00064W-3S
 for devel@lists.orangefs.org; Fri, 07 Feb 2020 02:51:35 -0500
Received: by mail-il1-f170.google.com with SMTP id f70so918867ill.6
 for <devel@lists.orangefs.org>; Thu, 06 Feb 2020 23:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=dp6uKKJ9SnDlPSyI2Tb+m+GBP8mfd9TCq+tlzqYK31A=;
 b=ATnAG+Jj4vFFpmYMMJzg3ciXiJAll9Fh56DyGSNgvWC2WE77eBURPTsqKu2zM2k1WA
 xizmxmyyEJDbDq+ZiSFtMVxiD5RaFjIY5ywaDLMUeXIRwmNYpujQyCuE1aZxJ1+gdqrC
 MPH8LbTAgqEPKP6+lKU79h182BdHBjY4Wl65vs0G1Y6KD72XbfXQ9bt211urZ62k8Ta2
 WlDrGbQZMiMKq80Wg9/nFpvvFrQiZqjCI/eXHRBuyJ1CG3QtqqvDlDw1RttJqRLAK8Sc
 RJtfFVJn+9zmHYVn9E+DyersyJmveaVS4r6eDNCxZto1z4K9zpxgcDf5SKm9VfA25dxk
 GcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=dp6uKKJ9SnDlPSyI2Tb+m+GBP8mfd9TCq+tlzqYK31A=;
 b=PbE6PsrqXwZrXT5iFya7GxjeC1H5mCf+y+tcgswWrsQdzVVMA9djy35pkohE07L5wL
 B+JhiXzcB6T33I7/L/PNQJvnT/PZUGHpY3xTF5jTmc4YKCUZk792ZRvSSV8t4G26SsJA
 TyGu9dxGmmTrA2gpzzWkmwe6kQH1Hd3VSDk/FT1oLGlTs11ewOi0Rfye6KtB+XeSCnoZ
 rSIEM0EB7GGxg4FO90Q6j42/t/+tKZhTKCWlZopusypPhyLDk5J1ejHLPjOuu41cRFEl
 GXXXo2KT6UlXXwD312iGDtmb07PWcSROILZMr2sPEbv4PSZQAjxv10eRDCI2rVg5QEsY
 hXxw==
X-Gm-Message-State: APjAAAWMxJxAHBj4XJDEwFdhGDen6RLuTtY8+hQ/W1NLh0cVMgE4ElYr
 wij7tbXfAb9QkAje8oHnSLOITAkyoHEC3fHR6JcBeg==
X-Google-Smtp-Source: APXvYqxyHv3ycq4mNzWR1u5GNATgrzpveYsVFlhMSbwCuo6WvkDprrn3JAYhXAgg6fAcm8TlYRVXVmFEu/o/cqmUW3I=
X-Received: by 2002:a92:1547:: with SMTP id v68mr7753192ilk.58.1581061853844; 
 Thu, 06 Feb 2020 23:50:53 -0800 (PST)
MIME-Version: 1.0
From: wai phyo <pwai64229@gmail.com>
Date: Fri, 7 Feb 2020 14:20:42 +0630
Message-ID: <CAA9pnGOXxM8MGM4Kx5qFLfak0wDLMWVjugvwVKpggrPOae+Bhg@mail.gmail.com>
Subject: 
To: devel@lists.orangefs.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

Billfree9000000
