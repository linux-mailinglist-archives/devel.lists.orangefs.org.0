Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C5926C307
	for <lists+devel-orangefs@lfdr.de>; Wed, 16 Sep 2020 14:59:31 +0200 (CEST)
Received: from [::1] (port=57166 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1kIX21-0005D4-Nx
	for lists+devel-orangefs@lfdr.de; Wed, 16 Sep 2020 08:59:29 -0400
Received: from mail-qt1-f169.google.com ([209.85.160.169]:46221)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <david@omnibond.com>) id 1kIX20-0005CP-Gj
 for devel@lists.orangefs.org; Wed, 16 Sep 2020 08:59:28 -0400
Received: by mail-qt1-f169.google.com with SMTP id r8so5935853qtp.13
 for <devel@lists.orangefs.org>; Wed, 16 Sep 2020 05:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=omnibond-com.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=Mr62WK/m2TAwiEuM5Hao49CUyWEryLRYY7MdIobZchE=;
 b=K0M5x2uS9u0UOBJjdWHzKbZw4UuD1U4J6FJ412Sqh3xurSMNz8f+InSTXChjvzlyOx
 6wiHjTSf00XWTzLTI6bVaW122eq6YvidKB5d/xaCki2NU6CDLM6aWK20QomQmgMn6YSR
 HwKM9RfFrN/S9MTB658FM4hvlsVvQQwA3nCEQlnhPOcxUvgH+PgOa6SCTYnRFG7Boh9u
 vz0Iq+YJThLmsV9VsDQ2ZkVjm36xFg/SIwciLaZCYvtvw1I+3/ffNaEQskDSM2QXlMYW
 R7Ie6eIeQAARrAO6cBFbVA97c/KGSmY9JqHrE9C4JbZkNaTtN1p1Xb55LJh/9eEygYaM
 cblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=Mr62WK/m2TAwiEuM5Hao49CUyWEryLRYY7MdIobZchE=;
 b=HUWsbbLmM+mMRaXZdNXd+NyXUh1GkHjFlbChjghkdBmoyrWefLFTkqav+d8LD8zPRo
 Yc/pDRY0S+Brxd1T4lN+9RC/jo7kA8Yy4E3oJM8AQrGUoe2r+i+bfD+WCUFnl2wUv62K
 aL7EgxzHE6EGhzNBdU9BI4EpiW1MUd3T44iOAa6lUnR6CRfDaUW7/vRALDORx/lIVewe
 y/Sw7SsdnibO06QwDfneGNt5XvxmDT+WZmU5s/Urk/XbHtRVvZpTaVHvKgEa3hvutMSf
 ER4Vg7T8UgodMKUTecL++kjybT437PN9mgI2Bt35rWOJievYQRuUQqnggqe/D+It1yri
 57ww==
X-Gm-Message-State: AOAM53322dhrdZ02bkABFL0ZwKVqE6K0mRNYAmWvZBamTlyp57bcMWso
 rZd6+cVukyqs+fXLwzva0Wm9Lw==
X-Google-Smtp-Source: ABdhPJxSGihs1Wrzy6Jfp9QhFSP3TrYvSC+0wBxueJJ0lWjzPgZgcRvCzMhIqJM4v+X97+f8Bp6SRg==
X-Received: by 2002:ac8:5d04:: with SMTP id f4mr10447187qtx.290.1600261127630; 
 Wed, 16 Sep 2020 05:58:47 -0700 (PDT)
Received: from ?IPv6:2600:1700:7e60:d130:4d9b:bbd:371d:3c12?
 ([2600:1700:7e60:d130:4d9b:bbd:371d:3c12])
 by smtp.gmail.com with ESMTPSA id x124sm19537593qkd.72.2020.09.16.05.58.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 05:58:46 -0700 (PDT)
From: David Reynolds <david@omnibond.com>
Message-Id: <AA4DC365-D96D-4F00-82AF-1241B760B53B@omnibond.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: UCX support for OrangeFS
Date: Wed, 16 Sep 2020 08:58:46 -0400
In-Reply-To: <CAMJ-+6o_vx=eai2sb6Rtpe8rQE+VYxgqzyDSdjLADTWjHLQMRA@mail.gmail.com>
Cc: "devel@lists.orangefs.org" <devel@lists.orangefs.org>,
 Michael Laufer <michael.laufer@huawei.com>,
 Support at OrangeFS <support@orangefs.com>
To: Alex Margolin <alex.margolin@huawei.com>
References: <45e50a753ef44cb68cee6bdf12717f59@huawei.com>
 <CAMJ-+6o_vx=eai2sb6Rtpe8rQE+VYxgqzyDSdjLADTWjHLQMRA@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Content-Type: text/plain;
	charset=utf-8
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

Hi Alex,

Please see our updated responses inline below.

On Mon, Sep 7, 2020 at 4:44 AM Alex Margolin <alex.margolin@huawei.com =
<mailto:alex.margolin@huawei.com>> wrote:
> Hello,
>=20
> My name is Alex, and I'm a (hands-on) software architect with the =
Israeli research center of Huawei. My team's main focus is MPI and =
low-latency networks. I've been looking into parallel filesystems, and I =
installed OrangeFS on a small cluster to try it out. I encountered some =
issues, some known (github issue #77) and others probably less so =
(though this might be related to our unique network setup).

We have done some work on RoCE that has not made it out of a branch, I =
am checking to see if this could possibly help with this.
[Update] We are testing this and will let you know.

> I'm writing to you because I'm considering adding OpenUCX support to =
OrangeFS (and contributing this code to the community). It looks pretty =
straightforward, at least the part of adding a BMI module recognizing =
"ucx://". Before I get ahead of myself, I have a few questions:

It may be helpful to look at the commit here: =
https://github.com/waltligon/orangefs/commit/0406fbb4d8e7aa4dc9207de6d1e35=
e29f70f0e1c =
<https://github.com/waltligon/orangefs/commit/0406fbb4d8e7aa4dc9207de6d1e3=
5e29f70f0e1c>
It is from work we were doing in the past to add a generic RDMA module =
to BMI. If needed, you may be able to use it as a reference for what =
additions need to be made to makefiles, configure scripts, etc. in order =
to add a new module. As for the module itself, if you=E2=80=99d like a =
little more information about what is required in a BMI module, it may =
be useful to look at the bmi-design.tex document located in the =
doc/design/ directory. This is an older latex doc that we are currently =
in the process of updating/converting, but for the time being it may =
provide a helpful overview of the general concepts and requirements, =
especially the sections on Methods, Interface Functions, and Method =
Implementation.

> 1. Does OrangeFS require the contributors to sign any papers? clearly, =
the code I submit upstream will become open source, but some projects =
also require signing a CLA.

We try to make contributing easy and don't require a CLA, we do require =
the code that is brought in to be compatible with how OrangeFS is =
licensed.

> 2. What is OrangeFS's malloc override used for? I'm asking because UCX =
typically uses malloc hooks for memory registration, so I'm concerned =
the two will conflict.

The malloc in OFS is a debugging aid - it catches allocate and free =
calls and adds a few bytes to the block.  It will store a magic number =
in there, it can record the file and line no where the call occurred for =
use with a memory debugging tool, and it zeros all memory before and =
after the user gets it.  The latter has been the solution to several =
nasty bugs.  There are macros that aim to free the memory at the calling =
site, if that is turned off.  Generally we leave it on all the time =
(though not the call tracing, that takes setting a define and =
recompiling).
=20
The mechanism uses macros to replace the calls and uses direct calls to =
the shared library for the underlying allocation and free.

> 3. UCX is typically configured (e.g. which device to use) using =
environment variables, which is fine for MPI but may not be appropriate =
for a system daemon. Any suggestions on how to pass such =
BMI-module-related parameters to the OrangeFS client and server (on =
boot)?

For the server, you can specify BMI-specific options in the config file =
using the BMIOpts option. If you add =E2=80=9CBMIOpts=E2=80=9D followed =
by a comma-separated list of options to the <Defaults> context in the =
config file, those options will be passed to BMI upon initialization. =
For example, to specify a specific IB port to use, you would add the =
following line:
=20
	BMIOpts ib_port=3D2
=20
On the client, there are two ways to pass options to BMI. If you are not =
using the client-core, you can add =E2=80=9Cbmi_opts=3DNNN=E2=80=9D as =
an option in the tab file. Otherwise, you can use the --bmi-opts=3DNNN =
command-line option when starting the client-core. In both cases, NNN is =
a comma-separated list of options.
=20
The entire options string will be passed to your module when it is =
initialized, so you can add any options you need, as long as your UCX =
module has the logic to parse them.

> 4. I'll be experimenting with OrangeFS on a 10-node cluster used for =
I/O intensive MPI runs, where each compute node also has an NVMe SSD =
(hosting OrangeFS over f2fs). I'm counting on UCX to use RDMA, thus =
offloading the work traditionally done by OrangeFS server+client so that =
their overhead would be minimal (OrangeFS metadata is all on a storage =
node, accessible from the compute nodes via RDMA). Am I missing =
something? Is there something I can do to significantly improve this =
setup, e.g., split the metadata across the nodes as well?

OrangeFS Metadata can be configured/distributed in several different =
ways and is accessed through BMI.   One of the standard configurations =
is to have metadata on each of the storage nodes (as long as there are =
not a very large number of storage nodes - diminishing returns). =20

[Update] You can also have it on its own storage node or nodes, however =
you see fit.  Any server process can serve metadata, data, or both.  =
What sets them apart is how you divide handles among the server when you =
set up the config file.

> 5. I didn't find almost any information about the filesystem =
architecture, namely the way caching works (both on clients and the =
metadata servers), the layout/logic for distributing files across the =
storage servers, how is the gossip used, etc. Could you please point me =
to such material, if exists? Actually, most of all, I'm interested in =
how MPI I/O uses OrangeFS's parallelism - if you have any material on =
that, it would be tremendously helpful.=20

There are a couple of caches (attribute cache, page cache with the =
upstream kernel module, etc..).   I will try to dig up some information =
that covers this as well as any MPI I/O in OrangeFS material.

[Update] The data servers access the file data through the local FS, and =
will use the caching provided by the OS on that machine.  The metadata =
servers utilize a kv database which in turn caches data on the local =
machine.  The client has a cache for partial paths to reduce lookup =
time, and an attribute cache that holds on to metadata at the client.  =
The page cache with a configurable timeout is used when using the kernel =
module which is upstream in the Linux kernel.  All client caching is =
incoherent between client nodes.  I am not up to date on the ROMIO pvfs =
driver.  It had a number of nice features in it for parallel I/O, but at =
some point they stopped testing it so I don=E2=80=99t know if it is =
working with current releases.

Let us know if you have any more questions!

Thanks,
David Reynolds
Software Engineer
Omnibond Systems, LLC.

> I'll appreciate any feedback you can provide.
>=20
> Best regards,
> Alex Margolin
> HPC Software Architect
> Huawei Smart Platforms Innovation Lab
> Email: alex.margolin@huawei.com <mailto:alex.margolin@huawei.com>=
