Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id B53F316FEE3
	for <lists+devel-orangefs@lfdr.de>; Wed, 26 Feb 2020 13:25:34 +0100 (CET)
Received: from [::1] (port=41686 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1j6vkr-0007tJ-Jo
	for lists+devel-orangefs@lfdr.de; Wed, 26 Feb 2020 07:25:33 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:32897)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <chelsey@thenativeapps.com>)
 id 1j6vkq-0007sp-4c
 for devel@lists.orangefs.org; Wed, 26 Feb 2020 07:25:32 -0500
Received: by mail-pl1-f195.google.com with SMTP id ay11so1249406plb.0
 for <devel@lists.orangefs.org>; Wed, 26 Feb 2020 04:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thenativeapps-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version:thread-index
 :content-language;
 bh=k/ueGtOn6xTX1ZGjgcI8ooGUOrJUyGboO5DyJIVVW5o=;
 b=1fykJj8dBmsVreAJXUcmZcbQiLQxXSVNsBwj3z71beQoKlgsZeD0Sci1+8KknV4Y1p
 CTEUdBI8MVhg5bbsul1ndWcUS8OTgHJNcQZ0bHQG5O8my5I15X7S9oYDIF88QRKbQxB2
 GrQsmawworUTFYjEPAmoa+SMp4eW87PKblU8xAjLJobYDhPpDlc7HMss8JCQrUgAAVok
 vyhJbLuiGNLZ4VXNjN/sztpUhn0mxb85CmnWh/znfqZgybrIE5ZnNFxdB3BArIMgyc+f
 S3Y31imR84QtRbJ8I4UlWYFpQlkS/abte9s++dfdTeOxXx619bv2Fowpm2vSiMabgRfs
 vbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :thread-index:content-language;
 bh=k/ueGtOn6xTX1ZGjgcI8ooGUOrJUyGboO5DyJIVVW5o=;
 b=iJShAhhDV20+rOlOwDNJuhwsAmHiMCFeunt1GaXceXmbLtw4OqzT6oszSvuc/mUNaO
 XpDf9D6k1vbRpM9q6Mfy7WTkUzHGY6+goCrISIyjlhJSRCPrwGY3TD9Gu88GlRIv/BtH
 vfXt4mQ046Ls/vG4TQVgWrr3jFP6lnVHYUHCChvn4EIcMsciBDqpMG+y9VLmLm3JufLk
 bX4O9LAo0VCnEXN9EtPARtNwGhyKH7CzkJ0cEo/DN3zu1WPThv2+vuRXTBBN0HHkijSG
 UW+S9gX6kH+s9DLNMvBd1Yf6V1W0vuhjNOP1dhS2hiJ1w5dEoWl0fiB0DZuNe/ZwHyY/
 A5Rw==
X-Gm-Message-State: APjAAAXZF1b6JZSmbuRBi1FJVtt7H00JnyrHTgGaDTwn9mHe6+VITwp+
 jbd7gct17G0K4ZqqfzQICQLm4C8LRaU=
X-Google-Smtp-Source: APXvYqwwTn320gzI+s2zCLObRqJz3fMHMztKzzYuUcSb/5zzuAC7SeNt8hisBxg13IFZQ+PVsjw6+w==
X-Received: by 2002:a17:90a:f0c1:: with SMTP id
 fa1mr5104122pjb.129.1582719890507; 
 Wed, 26 Feb 2020 04:24:50 -0800 (PST)
Received: from VikasGuptaPC ([223.190.44.223])
 by smtp.gmail.com with ESMTPSA id r13sm2706061pgf.1.2020.02.26.04.24.48
 for <devel@lists.orangefs.org>
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 26 Feb 2020 04:24:49 -0800 (PST)
From: "Chelsey" <chelsey@thenativeapps.com>
To: <devel@lists.orangefs.org>
Subject: App Proposal".......
Date: Wed, 26 Feb 2020 17:54:50 +0530
Message-ID: <274201d5ec9f$bf5c2560$3e147020$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AdXsn4YcdqYS2HjkSxWmWy+sEIcNhA==
Content-Language: en-us
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Hi,

 

My name is Chelsey, and we are a team of Professional IOS & Android Apps
Developer with 7+ years' experience based in India. Do you need a great App
adjusted or built from scratch?

 

Reply me if you need any kinds of help in mobile Apps.

 

Kind regards

Chelsey,

Online Marketing Consultant

 

