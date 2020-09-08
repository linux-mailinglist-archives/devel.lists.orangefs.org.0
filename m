Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D13E2609C4
	for <lists+devel-orangefs@lfdr.de>; Tue,  8 Sep 2020 07:05:23 +0200 (CEST)
Received: from [::1] (port=52476 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1kFVoo-0006hN-3U
	for lists+devel-orangefs@lfdr.de; Tue, 08 Sep 2020 01:05:22 -0400
Received: from mail-lj1-f180.google.com ([209.85.208.180]:41316)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <boyd@omnibond.com>) id 1kFVom-0006gW-Dz
 for devel@lists.orangefs.org; Tue, 08 Sep 2020 01:05:20 -0400
Received: by mail-lj1-f180.google.com with SMTP id y4so18324981ljk.8
 for <devel@lists.orangefs.org>; Mon, 07 Sep 2020 22:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=omnibond-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DAYHs4r3oGTuiH+NF0Eye2fTbDH98DNkLH7UPCbpF2c=;
 b=GJDg1fRy+mLj31us9x+sDWnBckuQabV5PftfFisM+ma0gtHKnrhHRzJ/8HxD2QCyw+
 mFRjnnL5GZkeg2uoI6xvErfYkpPTmquupOasDwEFL96zmv81TdPTPe2qp+AcLY9sPDlG
 ljLs8k25IpKobJM8PExRYLA8cvC/5bCdo5qwXrIJy2MVwKwVde3JHdWQkJnqdPvDmJGA
 Z6tQRqTrET+hEuXIBgrwb49iEWeI5num7zaEWcQQCGk56ddUvfDTgHSefPY2MvIAGSl6
 IbRkToWkVsAOUeibw2D8l3AgM2jUf+V/F202+ZkjjPBW8+18tJLc9bAWbHTucxQsv+br
 SCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DAYHs4r3oGTuiH+NF0Eye2fTbDH98DNkLH7UPCbpF2c=;
 b=lLGuH7SbwAkr5A2H3aeh0OGsuxW+3ZMScC6ETG3ZWnE1WWRFDG6UNT2d60lo9lITG1
 ijC59lVoxZZRvZrvVdluVpBR5IQrZdrWgLfEkN6hXFslfEjx2fLk9F+aAYGM+Iqsr54g
 CBZFuh9lmptOGbRcORQIQxpCatL99nxfqm3bDT9j6+Ggmfiw65g4TzQe2OPxUgEHu30w
 ziHezyIUBuBH2oVzPrsFIFQLWFZv7mq8uFmT7iP79HMOyIUENIrfak6xmRzsVOgHSgDS
 yPpofRdSH1MVfJBmAJAgbHAxOTUL10cYttzGMjcJz0uIg5YGX+4gOu2/1QnzpmcVaCCH
 bDeA==
X-Gm-Message-State: AOAM531f75gH6LQYYovmtyGw258AQvPCxwl8IX6+qOGIpOCDIHvvYhHH
 h9LoJ2BUhncZxQWboWH7Zrho9JdtDWuXvjemkEF9WQ==
X-Google-Smtp-Source: ABdhPJyVJivwSCIxGyFVNhN5ljdDNR/U/3sdEl7+sU35CrFwFUXYnseHbl1QU4Ed+ZVyVQsdvUT2Xp87zTLNa4vk8Y8=
X-Received: by 2002:a2e:b4ba:: with SMTP id q26mr10731640ljm.79.1599541478666; 
 Mon, 07 Sep 2020 22:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <45e50a753ef44cb68cee6bdf12717f59@huawei.com>
In-Reply-To: <45e50a753ef44cb68cee6bdf12717f59@huawei.com>
From: Boyd Wilson <boyd@omnibond.com>
Date: Tue, 8 Sep 2020 01:04:12 -0400
Message-ID: <CAMJ-+6o_vx=eai2sb6Rtpe8rQE+VYxgqzyDSdjLADTWjHLQMRA@mail.gmail.com>
Subject: Re: UCX support for OrangeFS
To: Alex Margolin <alex.margolin@huawei.com>
Cc: "devel@lists.orangefs.org" <devel@lists.orangefs.org>,
 Michael Laufer <michael.laufer@huawei.com>, 
 Support at OrangeFS <support@orangefs.com>
Content-Type: text/plain; charset="UTF-8"
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

Alex,
I hope you are well.    Adding OpenUCX to OrangeFS sounds like an
interesting project.    Let me make some comments inline:

On Mon, Sep 7, 2020 at 4:44 AM Alex Margolin <alex.margolin@huawei.com>
wrote:

> Hello,
>
> My name is Alex, and I'm a (hands-on) software architect with the Israeli
> research center of Huawei. My team's main focus is MPI and low-latency
> networks. I've been looking into parallel filesystems, and I installed
> OrangeFS on a small cluster to try it out. I encountered some issues, some
> known (github issue #77) and others probably less so (though this might be
> related to our unique network setup).
>
>
We have done some work on RoCE that has not made it out of a branch, I am
checking to see if this could possibly help with this.


> I'm writing to you because I'm considering adding OpenUCX support to
> OrangeFS (and contributing this code to the community). It looks pretty
> straightforward, at least the part of adding a BMI module recognizing
> "ucx://". Before I get ahead of myself, I have a few questions:
>
> 1. Does OrangeFS require the contributors to sign any papers? clearly, the
> code I submit upstream will become open source, but some projects also
> require signing a CLA.
>

We try to make contributing easy and don't require a CLA, we do require the
code that is brought in to be compatible with how OrangeFS is licensed.


>
> 2. What is OrangeFS's malloc override used for? I'm asking because UCX
> typically uses malloc hooks for memory registration, so I'm concerned the
> two will conflict.
>
>
I will check on this.


> 3. UCX is typically configured (e.g. which device to use) using
> environment variables, which is fine for MPI but may not be appropriate for
> a system daemon. Any suggestions on how to pass such BMI-module-related
> parameters to the OrangeFS client and server (on boot)?
>
>
We will have to look at this.


> 4. I'll be experimenting with OrangeFS on a 10-node cluster used for I/O
> intensive MPI runs, where each compute node also has an NVMe SSD (hosting
> OrangeFS over f2fs). I'm counting on UCX to use RDMA, thus offloading the
> work traditionally done by OrangeFS server+client so that their overhead
> would be minimal (OrangeFS metadata is all on a storage node, accessible
> from the compute nodes via RDMA). Am I missing something? Is there
> something I can do to significantly improve this setup, e.g., split the
> metadata across the nodes as well?
>

OrangeFS Metadata can be configured/distributed in several different ways,
and is accessed through BMI.   One of the standard configurations is to
have metadata on each of the storage nodes (as long as there are not a very
large number of storage nodes - diminishing returns).


>
> 5. I didn't find almost any information about the filesystem architecture,
> namely the way caching works (both on clients and the metadata servers),
> the layout/logic for distributing files across the storage servers, how is
> the gossip used, etc. Could you please point me to such material, if
> exists? Actually, most of all, I'm interested in how MPI I/O uses
> OrangeFS's parallelism - if you have any material on that, it would be
> tremendously helpful.
>

There are a couple of caches (attribute cache, page cache with the upstream
kernel module, etc..).   I will try to dig up some information that covers
this as well as any MPI I/O in OrangeFS material.

thanks!
-b


>
> I'll appreciate any feedback you can provide.
>
> Best regards,
> Alex Margolin
> HPC Software Architect
> Huawei Smart Platforms Innovation Lab
> Email: alex.margolin@huawei.com
>
>
