Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 8315325F58E
	for <lists+devel-orangefs@lfdr.de>; Mon,  7 Sep 2020 10:44:12 +0200 (CEST)
Received: from [::1] (port=36074 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1kFCl0-00029L-OH
	for lists+devel-orangefs@lfdr.de; Mon, 07 Sep 2020 04:44:10 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2048 helo=huawei.com)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <alex.margolin@huawei.com>)
 id 1kFCkx-00028g-SY
 for devel@lists.orangefs.org; Mon, 07 Sep 2020 04:44:07 -0400
Received: from lhreml738-chm.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 4AFB4B07A2B70E8652ED
 for <devel@lists.orangefs.org>; Mon,  7 Sep 2020 09:43:25 +0100 (IST)
Received: from lhreml703-chm.china.huawei.com (10.201.108.52) by
 lhreml738-chm.china.huawei.com (10.201.108.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.1913.5; Mon, 7 Sep 2020 09:43:25 +0100
Received: from lhreml703-chm.china.huawei.com ([10.201.68.198]) by
 lhreml703-chm.china.huawei.com ([10.201.68.198]) with mapi id 15.01.1913.007; 
 Mon, 7 Sep 2020 09:43:24 +0100
From: Alex Margolin <alex.margolin@huawei.com>
To: "devel@lists.orangefs.org" <devel@lists.orangefs.org>
CC: Michael Laufer <michael.laufer@huawei.com>
Subject: UCX support for OrangeFS
Thread-Topic: UCX support for OrangeFS
Thread-Index: AdaE8qJrWlHUF8d5QXmAhAnAU53IWA==
Date: Mon, 7 Sep 2020 08:43:24 +0000
Message-ID: <45e50a753ef44cb68cee6bdf12717f59@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.71.241]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
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

Hello,

My name is Alex, and I'm a (hands-on) software architect with the Israeli r=
esearch center of Huawei. My team's main focus is MPI and low-latency netwo=
rks. I've been looking into parallel filesystems, and I installed OrangeFS =
on a small cluster to try it out. I encountered some issues, some known (gi=
thub issue #77) and others probably less so (though this might be related t=
o our unique network setup).

I'm writing to you because I'm considering adding OpenUCX support to Orange=
FS (and contributing this code to the community). It looks pretty straightf=
orward, at least the part of adding a BMI module recognizing "ucx://". Befo=
re I get ahead of myself, I have a few questions:

1. Does OrangeFS require the contributors to sign any papers? clearly, the =
code I submit upstream will become open source, but some projects also requ=
ire signing a CLA.

2. What is OrangeFS's malloc override used for? I'm asking because UCX typi=
cally uses malloc hooks for memory registration, so I'm concerned the two w=
ill conflict.

3. UCX is typically configured (e.g. which device to use) using environment=
 variables, which is fine for MPI but may not be appropriate for a system d=
aemon. Any suggestions on how to pass such BMI-module-related parameters to=
 the OrangeFS client and server (on boot)?

4. I'll be experimenting with OrangeFS on a 10-node cluster used for I/O in=
tensive MPI runs, where each compute node also has an NVMe SSD (hosting Ora=
ngeFS over f2fs). I'm counting on UCX to use RDMA, thus offloading the work=
 traditionally done by OrangeFS server+client so that their overhead would =
be minimal (OrangeFS metadata is all on a storage node, accessible from the=
 compute nodes via RDMA). Am I missing something? Is there something I can =
do to significantly improve this setup, e.g., split the metadata across the=
 nodes as well?

5. I didn't find almost any information about the filesystem architecture, =
namely the way caching works (both on clients and the metadata servers), th=
e layout/logic for distributing files across the storage servers, how is th=
e gossip used, etc. Could you please point me to such material, if exists? =
Actually, most of all, I'm interested in how MPI I/O uses OrangeFS's parall=
elism - if you have any material on that, it would be tremendously helpful.=
=20

I'll appreciate any feedback you can provide.

Best regards,
Alex Margolin
HPC Software Architect
Huawei Smart Platforms Innovation Lab
Email: alex.margolin@huawei.com

