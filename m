Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C36B94C5B
	for <lists+devel-orangefs@lfdr.de>; Mon, 19 Aug 2019 20:07:55 +0200 (CEST)
Received: from [::1] (port=50496 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hzm4Q-0000PO-9r
	for lists+devel-orangefs@lfdr.de; Mon, 19 Aug 2019 14:07:54 -0400
Received: from mail-ed1-f42.google.com ([209.85.208.42]:36137)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <appkwt991@gmail.com>) id 1hzm4O-0000OV-MK
 for devel@lists.orangefs.org; Mon, 19 Aug 2019 14:07:52 -0400
Received: by mail-ed1-f42.google.com with SMTP id p28so2642115edi.3
 for <devel@lists.orangefs.org>; Mon, 19 Aug 2019 11:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/ywVsMybZvNxO7pZEt1ati6u8WuAP5nQiw6foHtMTyc=;
 b=iuShU1l9c83tBu41Nb83gyf8pf/jokTZd4hNX9OH0L6CS7viT6pvKkYcI1ZX5N70pP
 bmE460zaeGpq+6yM0FQAkfxhFXn4zUQZLRtKJUaZM7dOm70nZS6ujtMuaqzRUvt/T1q7
 0RhU3NGK0atxjqxpafUqesUw6c4ZZrUbzqULvhKUD6Cjm4xyrlIJ/XEU6nX//RF/1+u2
 nLjzBB4Htsda3T2r2bwU2U9RZd7zMAcObpp89UrkDPqCVkK8LI7jzQZXRJf/VQKVqwsg
 A9QSjh3Tv3RKoN27+2Qc3FsadGuzV9qZlq9q9KxhR2ki9HPD31dW46pZbcrz1uExcfsp
 v/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/ywVsMybZvNxO7pZEt1ati6u8WuAP5nQiw6foHtMTyc=;
 b=kKvC/haqjhkVtK3T4HASlcGPDRpTW1+woL+9ItsRJP4VTKI2PhR9y/9F9Zekd3o5Uj
 UoQfp0lGA+YggqqexLjaIA13zRAMfU9+x1C7hTlueGwMrb10+JS39FVkSunR+dCNKaLf
 U5NwI1elvGOKeX6PFaSv6/jH5zOYY59X4YKxpeZYQRQUk5u5y+TxZYBJ7Zp9NzQ17L+E
 aDdOfpXyfa60NdwAf59k02xh+M2pwN/B+GCFQVU6x1P/OF0NRknFRGa7YtNeHBwC4+f4
 DUx56nAYBDvQMnv8GSleNlMxyMgQsYCEJft7EFVyfWP3D3m5Xi95R4YsMBXQZOwxH15Z
 WkwA==
X-Gm-Message-State: APjAAAXWn2L+rga8/HF5vVMy03Xkw0kHkKqP6rJ9umx2jNnfGeS35YZI
 PZXLu7rsZUjsGK7jeTfwEG0KyhgIeUs0rGgxmSu5Dg==
X-Google-Smtp-Source: APXvYqwaZcJJGLKXymMs3FfcyWw7tb8mHvjhsmjnzJiUGfXmL6A0hNUXGsEVkHI+OOwnNrsEDTNpGR+kKq+W06hwaxY=
X-Received: by 2002:a50:89d4:: with SMTP id h20mr346678edh.248.1566238031370; 
 Mon, 19 Aug 2019 11:07:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:e8b:0:0:0:0 with HTTP; Mon, 19 Aug 2019 11:07:10
 -0700 (PDT)
Received: by 2002:a17:906:e8b:0:0:0:0 with HTTP; Mon, 19 Aug 2019 11:07:10
 -0700 (PDT)
From: Mohamed Ninja <appkwt991@gmail.com>
Date: Mon, 19 Aug 2019 11:07:10 -0700
Message-ID: <CAEVVKYQd7Pg6tWfGanvGaAhWnawTi1MrtBQUOqOOxXpku2WYtQ@mail.gmail.com>
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

HVAC system
