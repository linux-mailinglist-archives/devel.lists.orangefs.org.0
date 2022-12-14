Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id CE67364CFF3
	for <lists+devel-orangefs@lfdr.de>; Wed, 14 Dec 2022 20:15:57 +0100 (CET)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id 4262E3842FA
	for <lists+devel-orangefs@lfdr.de>; Wed, 14 Dec 2022 14:15:56 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1671045356; bh=xqI9sBRYonkCEakhxtSiO7JMYMOJShZg+QBf7tQrR1A=;
	h=From:Date:Subject:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YKcCF3yBy7FK/LVZdak8DZBEQQaiKQ/CtabCAwJCfPrMa1yyroEyHS3VejAD8TT8P
	 ihCJwqMdGjxfYDABZra2HVsTOlllJngzEkdOEc3Ap3biuK8AVBRWG0hQrQRCO4J6sU
	 /LICno3iwayBxbw/Ki2l9zXwBQPMJnVrR3TQATi1VUL++oX4DCV8thvl1AcIhzIOEX
	 6kjuRalx+OFM/qUkRd/1KBDK6gYHRzy0L6ccBSrbRy42De/Wx8rqqJRayxbAYGQZ3L
	 4rzaPAUQgo2y5tqQaD4Hd025AhLNPnk8ewNwLWQ05uDrlXj85SpvMjOxlxKyWS+r2q
	 9i4jTixaOffQQ==
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	by mm1.emwd.com (Postfix) with ESMTPS id 148603842A2
	for <devel@lists.orangefs.org>; Wed, 14 Dec 2022 14:15:53 -0500 (EST)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20210112.gappssmtp.com header.i=@omnibond-com.20210112.gappssmtp.com header.b="dR+feQN0";
	dkim-atps=neutral
Received: by mail-qv1-f54.google.com with SMTP id d13so411283qvj.8
        for <devel@lists.orangefs.org>; Wed, 14 Dec 2022 11:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8hfd8zAToSdzoK0fgf7KAIEFt+FxnQhco6jJDWQ8kcw=;
        b=dR+feQN0VFxYmzmPqpClZWVGlfFTTob0isDNrP7epY7UpEsSnly93dg8s/XEKllovj
         tETGg8V/bNsv0TetZPWH1+eCm6rHOmwe3F+EAfyYLaszin7VR7QSwJnJAZcvsIaBFtUI
         WBqlHvNzR4ocrWP6HRv+JEJtTwI9hQIahHkaxOfJTdLt+T25MneMN2G1Uh8W63IZDQIc
         wLNBxrX1SXS6dSekF2cYwHujD4bqfPKmPAfHKchzmI1jkW4le4Y4ZVkBzbnlzqCZQCvl
         u4NpGyM8aM2Lp3XbyfCMgbbjPQBYlb4D3hpSfglotEhvTbJDcB+hcZ09QNfTKr/h11tM
         s0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8hfd8zAToSdzoK0fgf7KAIEFt+FxnQhco6jJDWQ8kcw=;
        b=Jy5xfGdf9lDiM1fprgERwLmq/O+ALH05kzhHj5lY86jWglCTJBVWLa4DVQf4tIyLP0
         JTOIiMG5b98u4bwydOCFhLu7gl3iNdD45BppaMjtGJD5nWmI5nlMbD7ORB36QnzF4l5e
         9OBZ7qKExnWDE/maFDEM7kwz8gB5UzGasDkdAJzMxK1ZyP0DY72An826I0WulRhIBnPg
         5VYcW3f9AB+6Pu3/vWyhAYJsBkS8pCSBJD6rdd83KnYNZC8sFRQXFCr48OxXkdbkOpwj
         Fo6A2bIcWNCDAEDeaL9pp/lnzspKujSlNdDiVk8MyHMQP38tFY9iVsxzSPpZFMKYAXAx
         qPBQ==
X-Gm-Message-State: ANoB5pkb2wcOdmqj/vUj0hwJQJYBW88HHJ9IdEyGX1V6iAGDiyFinGbJ
	bXPxlnAeKJW2ArDfHqZwSmxtzNPs5KUNlZ2VNFG9SA==
X-Google-Smtp-Source: AA0mqf53mDWZFIYq5wZXD6e8D8URM20PslKERiFkl3uLqhw2khmXGyf37Rj510P8fAs0dRrRGp1Fi8yrK36O3OCTlMM=
X-Received: by 2002:a0c:90c3:0:b0:4c7:e13:6459 with SMTP id
 p61-20020a0c90c3000000b004c70e136459mr36460242qvp.11.1671045353367; Wed, 14
 Dec 2022 11:15:53 -0800 (PST)
MIME-Version: 1.0
From: Mike Marshall <hubcap@omnibond.com>
Date: Wed, 14 Dec 2022 14:15:42 -0500
Message-ID: <CAOg9mSR0m_Tb_1uKHMXseJ2AEUpvN3siaJd9rC-Fykx4QEXMXA@mail.gmail.com>
Subject: [GIT PULL] orangefs pull request for 6.2
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: 7V5NBIJ3BQ4DSVDOKIDZTUTE3E545XWN
X-Message-ID-Hash: 7V5NBIJ3BQ4DSVDOKIDZTUTE3E545XWN
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devel@lists.orangefs.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/7V5NBIJ3BQ4DSVDOKIDZTUTE3E545XWN/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

The following changes since commit b7b275e60bcd5f89771e865a8239325f86d9927d:

  Linux 6.1-rc7 (2022-11-27 13:31:48 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux.git/
tags/for-linus-6.2-ofs1

for you to fetch changes up to 31720a2b109b3080eb77e97b8f6f50a27b4ae599:

  orangefs: Fix kmemleak in orangefs_{kernel,client}_debug_init()
(2022-12-07 15:18:30 -0500)

----------------------------------------------------------------
orangefs: four fixes from Zhang Xiaoxu and two from Colin Ian King

Zhang: fixed problems with memory leaks on exit in sysfs and debufs.
fs/orangefs/orangefs-debugfs.c
fs/orangefs/orangefs-sysfs.c
fs/orangefs/orangefs-debugfs.c
fs/orangefs/orangefs-mod.c

Colin: removed an unused variable and an unneeded assignment.
fs/orangefs/file.c
fs/orangefs/inode.c

----------------------------------------------------------------
Colin Ian King (2):
      orangefs: remove variable i
      orangefs: remove redundant assignment to variable buffer_index

Zhang Xiaoxu (4):
      orangefs: Fix sysfs not cleanup when dev init failed
      orangefs: Fix kmemleak in orangefs_prepare_debugfs_help_string()
      orangefs: Fix kmemleak in orangefs_sysfs_init()
      orangefs: Fix kmemleak in orangefs_{kernel,client}_debug_init()

 fs/orangefs/file.c             |  1 -
 fs/orangefs/inode.c            |  2 --
 fs/orangefs/orangefs-debugfs.c | 29 ++++-------------
 fs/orangefs/orangefs-mod.c     |  8 ++---
 fs/orangefs/orangefs-sysfs.c   | 71 +++++++++++++++++++++++++++++++++++++-----
 5 files changed, 73 insertions(+), 38 deletions(-)
