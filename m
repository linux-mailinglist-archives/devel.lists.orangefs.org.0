Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id AC44AF775F
	for <lists+devel-orangefs@lfdr.de>; Mon, 11 Nov 2019 16:07:22 +0100 (CET)
Received: from [::1] (port=46400 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1iUBHl-0007bS-GP
	for lists+devel-orangefs@lfdr.de; Mon, 11 Nov 2019 10:07:21 -0500
Received: from mail-il1-f173.google.com ([209.85.166.173]:39724)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <abidsheikhabidsheikh4@gmail.com>)
 id 1iUBHj-0007aP-UU
 for devel@lists.orangefs.org; Mon, 11 Nov 2019 10:07:19 -0500
Received: by mail-il1-f173.google.com with SMTP id a7so11937527ild.6
 for <devel@lists.orangefs.org>; Mon, 11 Nov 2019 07:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=93ovztUGIfle0nRCLMKKRMkW1aOHoXcmbDdjiogUhF8=;
 b=DNrSe3ebgI3PQPl90u4jBFaSNNILQbUcWcfGcOPSiStF3FHKa82MNCoPc/cXH7I3SP
 juRLp4vdPoc7/nhw2f6A9UTF9whC5IQi3Nva2zd3GOgx1baprkPQvVgsjq8Nr2AgrtxP
 v0oGBdxmyNNewFl/XAnR3cFEh7Z8rBZVr5654mlD64XVQyYDfJRfzSawo/d5Ma2imEic
 f3DnkokbthLfGZl7E17zg1AvULkO0TC47NCQLmy4Wi1eJZztF+KJUUN4BB1EPL7hLbkK
 JrO1INuBynJg8E7aDHY58QD4tiz0/mUrRaOm36PIRW5E3KCkClas0isu4YzawFvQbkmL
 b4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=93ovztUGIfle0nRCLMKKRMkW1aOHoXcmbDdjiogUhF8=;
 b=YGlmSzmeGJHc4otkSiJ4QxBbSuJttdNuurAU5FvMHInLW3YGPUYNmy97odTMMW2SxB
 IFKd4Uu5BernytKCQv6zi6VWK1sbHCtm35G+p9z1bhVn7m8cYy+8XkQUF/8apjCC0TQB
 dPbQ2PfndxkRDkbkaRx1SGM94U8rROsMgfJvHLcGTIMxihFsda1+Se8eTkP0pnccATlY
 R4t2jcpir69+CXZab9yr5PF0v7O42XB/WQ7BMhXa8qRj4kNuz6AZItTg5DAIjpoSzt6x
 NLGzJDVpwHww8XxMufFnvQxZKFQgdroSpxKq6lyJyPFWqxNSpgUOsEPVlEi+Q24oXiTk
 8kuA==
X-Gm-Message-State: APjAAAUCIbXZXTBE8v6oxwpGMF64PAbXCU/tJ54DTb1q83HVsRcU8rgu
 7VXEd5meSGqZW+IM9HzrAHOWkmdpvB3Yus86cc5Trg==
X-Google-Smtp-Source: APXvYqwp0X7vq55zejd5k9J5L4gv5zAIDXsGf+8fHjc69e8EVtN+HGIT8g2s2/sPD15cZTKdXQgNLLXARI0//G1snPU=
X-Received: by 2002:a92:c525:: with SMTP id m5mr16655001ili.91.1573484799046; 
 Mon, 11 Nov 2019 07:06:39 -0800 (PST)
MIME-Version: 1.0
From: Abidsheikh Abidsheikh <abidsheikhabidsheikh4@gmail.com>
Date: Mon, 11 Nov 2019 20:04:44 +0500
Message-ID: <CABSED-oF6pMiA1eij2Bzd7B91Ftsbp-wwJam3MiCY=47rNqh7Q@mail.gmail.com>
Subject: 
To: devel@lists.orangefs.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.27
X-BeenThere: devel@lists.orangefs.org
X-Mailman-Version: 2.1.27
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


