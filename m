Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0F5F4E6E
	for <lists+devel-orangefs@lfdr.de>; Fri,  8 Nov 2019 15:43:01 +0100 (CET)
Received: from [::1] (port=32952 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1iT5TX-00057Z-KD
	for lists+devel-orangefs@lfdr.de; Fri, 08 Nov 2019 09:42:59 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:43647)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <cna78978@gmail.com>) id 1iT5TW-00055z-JZ
 for devel@lists.orangefs.org; Fri, 08 Nov 2019 09:42:58 -0500
Received: by mail-ot1-f43.google.com with SMTP id l14so5359465oti.10
 for <devel@lists.orangefs.org>; Fri, 08 Nov 2019 06:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=9SXh97Yed/HYEEHGOzMAXHYpQNKUz6RZSbARJ0zrPPo=;
 b=TclFVSGWhE6ZyjTdZyImv4spXrG78eFqZCMgw4Wq2xYo3zW6GcHuICgpGGRq5/DH8M
 lJAJ3npudsxLFECb3A9ZZpzZHA63Lrw4XdCY4bngpSRZqsQDdya8QWPTySrrfFTrmbNj
 N80OZchhoZrORfFLU7TTXp3S64f5B379ulFfuv0SjL3Uh/7EUfN/GdQnaSigZIHBXEfG
 32ia4OJ2VQHePEwseblvBZhpvj15x9zqsvNbxDnUF+9dUrtFc1UxSD6PPgtTAKXZOyNy
 ZXSwt9mKkIgSwaOm9V91Uq+KEkcZiQXFiy/RubbQNje0W5YTr+b17AwivR/gpOLMlZP9
 hbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9SXh97Yed/HYEEHGOzMAXHYpQNKUz6RZSbARJ0zrPPo=;
 b=fnKfutvj1XXLW7WlLFz67yFEEwjsWZCODuWkDKv+nxWyf93VrVG3TUl7lYXEhwKaUq
 zrbxiMrHSk8RWGoZodH51eQPzqfF8bm2M8de+k1kM8AakejHMvlyR+1OrCRs4NLObNk7
 g61PMVz+GSHxYdaA2YSeZ4bQODSfodpPYpkT3WXa8LPxRB1biuOAT4rGEu3Bm6TG/wVs
 Zfe7GBbvhyS7Bhfn80y4qZRiSOWHc5srpvgTk4drsQo98HrpiRk+wqJB+RrNIjinU6zB
 NhWpEovj5T0HFS6F+lCCjwGAtNpVTibtG/ujH65gJ7CUixPkMTZVD7la/h3n2G8DLEYc
 H2aA==
X-Gm-Message-State: APjAAAVd8JKwGIT+KIdcKQ8LxSGAfY+qwPH+8tckLpiwyZ2S36v+csJU
 GXRlrf8yVQX58FPGWYCaGvlMZFrmHlcs8nFMRsb1N18m
X-Google-Smtp-Source: APXvYqyG6yZi9jcoJS5cFWhzc/QGi5UzseOJFvKwCcf5cgstV5766UGvrMXmMW6ZCWS0ef8F3+OqS+O9sh5UVYSVVns=
X-Received: by 2002:a9d:5cc7:: with SMTP id r7mr2397286oti.331.1573224137803; 
 Fri, 08 Nov 2019 06:42:17 -0800 (PST)
MIME-Version: 1.0
From: Chan Na <cna78978@gmail.com>
Date: Fri, 8 Nov 2019 21:42:06 +0700
Message-ID: <CADLCws301LxHtQBiW-kQeVAvF7XAB_c1JmdoPeRXTUcD1VLdCg@mail.gmail.com>
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


