Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A31176081
	for <lists+devel-orangefs@lfdr.de>; Mon,  2 Mar 2020 17:55:18 +0100 (CET)
Received: from [::1] (port=58726 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1j8oLd-0002MS-3A
	for lists+devel-orangefs@lfdr.de; Mon, 02 Mar 2020 11:55:17 -0500
Received: from mail-ed1-f41.google.com ([209.85.208.41]:35950)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <tutulahasanm91@gmail.com>)
 id 1j8oLb-0002J3-8n
 for devel@lists.orangefs.org; Mon, 02 Mar 2020 11:55:15 -0500
Received: by mail-ed1-f41.google.com with SMTP id a13so608885edh.3
 for <devel@lists.orangefs.org>; Mon, 02 Mar 2020 08:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=mzZrMxgLSaSgg5d6Iq47QFIaO1sQ/f60zqeB6Od3oFA=;
 b=chWlbe3Nv5K5APbgY1SBv6V5eJEcThv69ffyN1NstEHHNEnKnqeYpQhuMg6F7nYLQG
 jpY+Dct0Vr1pu0i19kQ3xucbxX3SgqQ9Tty1DBVQu7KZeLNbDZwQoh7x7X1LQkN2HWEW
 BwRV1SZWUbi7VkmdUK9hjFbAS7G9/oM41TNnQPUwkwDLzB1u/Pxkt9h9E1I0xlril6aX
 LQGyrvCi6C1Z7zaKqlFoM0/B0fgVq8+LfnDIzLyTm49Iva9kpa+OHsg7bfaTXhXdOXMW
 6wn+/3UFDXJ2ELxLjrix5hzoGaaitlgg9vBWExdvzC8tkXiM9QL93zy6jpzkdH6XmG1b
 yFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mzZrMxgLSaSgg5d6Iq47QFIaO1sQ/f60zqeB6Od3oFA=;
 b=UuEEfEGVqrPnkrqF5HSIkNfw5FdRH7e3nn+pVhf9SrmNd4RcpQj3uK5943Sv8eRZ5Q
 5ZTQeREm/7w+M2jVdRC5xiSa1mWrEjhKT0UL3Bo2n4mTqsA5zKzvd6OS2zhXZbTL2LUq
 xAP60QqubMIIP971WAixJDGTyMB+cc2bybIC57pb2ATRnsleATjhRsLcpJhNDxjUiaJA
 zBpg0drQnm5r/BXwYn2y6DZYti4H4qabspCyCilwC3HgIYy1Oww60bvElA74mlsJKIVx
 Um8fgf0Yf7DMbJrkKk9IATz1srzcy9/QDOXR77Y7I6grE6K8zRFrk2iBakdy1ivYkhhw
 Qx/w==
X-Gm-Message-State: ANhLgQ3v+/P+eB0jIEas4ld3WOjyJTwPptWNCdlFGLVs9CJwGNAu4k4W
 EsKz+5YYTwjt3o4SLzglBbMadQ4JM+s4scb7zUFK7Q==
X-Google-Smtp-Source: ADFU+vtZZZ0X7xSV6QBh58Gn8xDijoRsY6s1H3ZkaTYHGdn1dtxOIx5ogrO77Eyuk/8ABqeAFwTNyQ+v/qVx2vK5dZE=
X-Received: by 2002:a17:907:4300:: with SMTP id
 oa24mr267083ejb.61.1583168073986; 
 Mon, 02 Mar 2020 08:54:33 -0800 (PST)
MIME-Version: 1.0
From: tutula hasanm <tutulahasanm91@gmail.com>
Date: Mon, 2 Mar 2020 22:54:22 +0600
Message-ID: <CAPgVdK1aUvcQTgdvO1DAZDP1GeazzaOVZAAZy=PLtRO99CoFBw@mail.gmail.com>
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


