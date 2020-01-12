Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id B81CF138551
	for <lists+devel-orangefs@lfdr.de>; Sun, 12 Jan 2020 07:35:16 +0100 (CET)
Received: from [::1] (port=37448 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1iqWqB-0008V9-Hf
	for lists+devel-orangefs@lfdr.de; Sun, 12 Jan 2020 01:35:15 -0500
Received: from mail3-bck.iservicesmail.com ([217.130.24.85]:25859)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <peterwong@hsbc.com.hk>)
 id 1iqWqA-0008U7-BB
 for devel@lists.orangefs.org; Sun, 12 Jan 2020 01:35:14 -0500
IronPort-SDR: eZHkkB0VzYhZ4pPTi5fLzHT4OliJqt4hk+v1HfgoNURVnfAixc1O+p8EqiUzKNWMSvj2t7BI0+
 Avahjge6hX3w==
IronPort-PHdr: =?us-ascii?q?9a23=3A1yYvZhVB2umFST7n6AcYHAxt2ZfV8LGtZVwlr6?=
 =?us-ascii?q?E/grcLSJyIuqrYbByDt8tkgFKBZ4jH8fUM07OQ7/m7HzZev93Q6zgrS99lb1?=
 =?us-ascii?q?c9k8IYnggtUoauKHbQC7rUVRE8B9lIT1R//nu2YgB/Ecf6YEDO8DXptWZBUh?=
 =?us-ascii?q?rwOhBoKevrB4Xck9q41/yo+53Ufg5EmCexbal9IRmrowjdrNcajIpjJ6o+zh?=
 =?us-ascii?q?bErGZDdvhLy29vOV+dhQv36N2q/J5k/SRQuvYh+NBFXK7nYak2TqFWASo/PW?=
 =?us-ascii?q?wt68LlqRfMTQ2U5nsBSWoWiQZHAxLE7B7hQJj8tDbxu/dn1ymbOc32Sq00WS?=
 =?us-ascii?q?in4qx2RhLklDsLOjgk+23RjcB+kb5Urwikpx1/2oLZfoaVNOBmfqPaZ9MVX3?=
 =?us-ascii?q?ZBUdhIWyNfBIOwdpcCD/YdPelCs4b9p0UBrR6gCgmqGOPj0yFHhnnv0aM91O?=
 =?us-ascii?q?QhFx/J3Qw5E90QtnTfsdH5OakOXeypyaXFyyjIYfFL1jfn8IXGfBAvoeuSU7?=
 =?us-ascii?q?xzbMTexlUgGQzeg1WMq4HqIy+Z2vgRv2SF6edrSOKhi3QgqwF0ujWh3Nkjip?=
 =?us-ascii?q?XXiYIP11vL9SJ5wIA6JdalT0N7ecCrEIdOuCGAOYp2RcUiQ25ztSY60b0Joo?=
 =?us-ascii?q?K0cDIWx5Qgwh7TcfyHc4uR7x/lSe2fIi94iWp7dL6ihRu+61Wsx+PgWsWuzl?=
 =?us-ascii?q?pHoTBJn9fMu30Lyhfd8NKISuFn8UekwTuP0gfT5fxaLk0sjqrbLoIhwqY3lp?=
 =?us-ascii?q?oOrUTPBi/2l1vyjK+Rbkgk//Kn6+XjYrX8uJCcM5N4hw7kPqQwncywHP43Mg?=
 =?us-ascii?q?YJX2id5+uwzqPs/VbhTLVLiP05jLXZvYjEKcgGpKO1GRJZ34g/5xqlETur38?=
 =?us-ascii?q?4UkHcHIV5dfRKIlYnpO1XAIPDiCve/hkyhkC91yPDaILLhGJvMLn/FkLfuZr?=
 =?us-ascii?q?t961VcxxEvwtxF+51UDbQBLOjzWk/yrNDYFAM2MxSow+b7D9Vwzp4RVnyRAq?=
 =?us-ascii?q?CHNKPfqluI5uM0I+mQf48ZojH9K+I/6P7ogn82h1EdfbKz0ZsQcnC4EacuH0?=
 =?us-ascii?q?LMbXfyj9MpFWYRohF4S/bjjlKPXyUVYGy9DJgx/jUqNIXzNYrfS5rlv7uH02?=
 =?us-ascii?q?/vBpBKa3pZDVaDEXTobI+Pc/gJYSOWZMRml2pXe6KmTtoZ2A2jrkfFzLxoZr?=
 =?us-ascii?q?7M9zEVr43k0tdd5/bZnlc58jkyD8fLgDLFdH19gm5dHmx+56t4u0EokQ/b3A?=
 =?us-ascii?q?=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GeAgA1vRpelyMYgtlNGBoBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBAREBAQECAgEBAQGBaAQBAQEBCwEBGwgBgSWBTVIgEpNQgU0fg0O?=
 =?us-ascii?q?LY4EAgx4VhgcUDIFbDQEBAQEBNQIBAYRATgEXgQ8kNQgOAgMNAQEFAQEBAQE?=
 =?us-ascii?q?FBAEBAhABAQEBAQYYBoVzgh0MHgEEAQEBAQMDAwEBDAGDXQcZDzlKTAEOAVO?=
 =?us-ascii?q?DBIJLAQEznXEBjQQNDQKFHYJKBAqBCYEaI4E2AYwYGoFBP4EjIYIrCAGCAYJ?=
 =?us-ascii?q?/ARIBbIJIglkEjUISIYEHiCmYF4JBBHaJTIwCgjcBD4gBhDEDEIJFD4EJiAO?=
 =?us-ascii?q?EToF9ozdXdAGBHnEzGoImGoEgTxgNiBuOLUCBFhACT4xbgjIBAQ?=
X-IPAS-Result: =?us-ascii?q?A2GeAgA1vRpelyMYgtlNGBoBAQEBAQEBAQEDAQEBAREBA?=
 =?us-ascii?q?QECAgEBAQGBaAQBAQEBCwEBGwgBgSWBTVIgEpNQgU0fg0OLY4EAgx4VhgcUD?=
 =?us-ascii?q?IFbDQEBAQEBNQIBAYRATgEXgQ8kNQgOAgMNAQEFAQEBAQEFBAEBAhABAQEBA?=
 =?us-ascii?q?QYYBoVzgh0MHgEEAQEBAQMDAwEBDAGDXQcZDzlKTAEOAVODBIJLAQEznXEBj?=
 =?us-ascii?q?QQNDQKFHYJKBAqBCYEaI4E2AYwYGoFBP4EjIYIrCAGCAYJ/ARIBbIJIglkEj?=
 =?us-ascii?q?UISIYEHiCmYF4JBBHaJTIwCgjcBD4gBhDEDEIJFD4EJiAOEToF9ozdXdAGBH?=
 =?us-ascii?q?nEzGoImGoEgTxgNiBuOLUCBFhACT4xbgjIBAQ?=
X-IronPort-AV: E=Sophos;i="5.69,424,1571695200"; d="scan'208";a="323227503"
Received: from mailrel04.vodafone.es ([217.130.24.35])
 by mail02.vodafone.es with ESMTP; 12 Jan 2020 07:34:32 +0100
Received: (qmail 13805 invoked from network); 12 Jan 2020 05:12:19 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
 (envelope-sender <peterwong@hsbc.com.hk>)
 by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
 for <devel@lists.orangefs.org>; 12 Jan 2020 05:12:19 -0000
Date: Sun, 12 Jan 2020 06:12:18 +0100 (CET)
From: Peter Wong <peterwong@hsbc.com.hk>
To: devel@lists.orangefs.org
Message-ID: <20820991.498367.1578805939485.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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
Reply-To: Peter Wong <peterwonghkhsbc@gmail.com>
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

Greetings,
Please read the attached investment proposal and reply for more details.
Are you interested in loan?
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.


