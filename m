Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A5D11F3D9
	for <lists+devel-orangefs@lfdr.de>; Sat, 14 Dec 2019 21:15:05 +0100 (CET)
Received: from [::1] (port=35644 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1igDoe-0003Mf-Q4
	for lists+devel-orangefs@lfdr.de; Sat, 14 Dec 2019 15:15:04 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43335)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <hdreduan8@gmail.com>) id 1igDod-0003M3-4V
 for devel@lists.orangefs.org; Sat, 14 Dec 2019 15:15:03 -0500
Received: by mail-pl1-f195.google.com with SMTP id p27so2693912pli.10
 for <devel@lists.orangefs.org>; Sat, 14 Dec 2019 12:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:savedfromemail:date:subject:importance:from:to
 :mime-version; bh=CdmXU0APqZ4qm8hWAG/np18OgdjrWuY7x2yT1nuHfnI=;
 b=IuTzneQa2prlWufIlq1WF/H0wrSP4GATgNdnCDrVwCMWh+EdgkCAizNU+vTWp1HxNq
 TeAvzfOdFvr4QNmIDlKhH5tswxxzgyVeef8flqCd2V2tpVlQ2i817QDBRsj3EOmx1I6K
 dQqw0+HBVUaSE6ZftzjHOq11pE6ksDJhnRlfyDoWQ35XHDcxed/kY0mzKEpiCOdB9Cp0
 QU5PJ2UFpyl4hbc8HNmPF7EQVtIbltSLwuE2Wzkk6QMVO+70fVtvn8aSb1T6/cRTuSgG
 RPM2UjFcPVb74gvWRU6B1PSe06dGM8xmKnrTCuMdfD8bhTcqel5mJoERo4jwjK26TNAl
 EbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:savedfromemail:date:subject
 :importance:from:to:mime-version;
 bh=CdmXU0APqZ4qm8hWAG/np18OgdjrWuY7x2yT1nuHfnI=;
 b=UMpCTSYSW35aiHs83yEgT6cDWswJufl6iP43XyubjRs6b/4Zlpg4eL2vcUj6RJ2EZH
 JiPg7X48CbcQVF/ct6k+Mz/MpZpnHgOZAoUSNb9gK/MiB7RQjbeSUzF20yRVrxQu6/we
 tE29hbTi7O389717ROzM7GwDDuuzWEUjqJU7yvayTiZaN29c2K5h1GlViKAtGuTlpwVv
 KMb0yBGpiOf5bKUWBLtLEIhvX/j9FZCO7lxoZekYJmRaEdirJvW6gAf9MqHazgctMl7K
 FoDm4M2CuB1kpO7E6YTydzGpCf0t6omDV/dJrKwitw92odPoKiRaCtuPh2FSSPyBEf/t
 ifUg==
X-Gm-Message-State: APjAAAXLGyG++2w61CRvA/gpUcBRqOx4UNpZYyNVJ3zv7TATwoE+3mtW
 r31LojET4+Clf8zK4CJCqpGUrAZqTQc=
X-Google-Smtp-Source: APXvYqxJTW1uK9qa/JheCGpDKfdss2/Nsu0cLL1BfRJWkzmLpSrkC2IQOTUDt2u4lTYjDrbPOM5I9w==
X-Received: by 2002:a17:902:8309:: with SMTP id
 bd9mr6626516plb.113.1576354461915; 
 Sat, 14 Dec 2019 12:14:21 -0800 (PST)
Received: from [10.98.114.144] ([116.58.203.158])
 by smtp.gmail.com with ESMTPSA id k101sm14094969pjb.5.2019.12.14.12.14.20
 for <devel@lists.orangefs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 14 Dec 2019 12:14:21 -0800 (PST)
Message-ID: <5df5429d.1c69fb81.f69b3.6a75@mx.google.com>
SavedFromEmail: hdreduan8@gmail.com
Date: Sun, 15 Dec 2019 02:14:17 +0600
Subject: Hi
Importance: normal
From: hdreduan8 <hdreduan8@gmail.com>
To: devel@lists.orangefs.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
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

U2VudCBmcm9tIG15IFNhbXN1bmcgR2FsYXh5IHNtYXJ0cGhvbmUu
