Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 797DA2DDC31
	for <lists+devel-orangefs@lfdr.de>; Fri, 18 Dec 2020 00:56:18 +0100 (CET)
Received: from [::1] (port=48228 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1kq385-0005Vx-5P
	for lists+devel-orangefs@lfdr.de; Thu, 17 Dec 2020 18:56:17 -0500
Received: from mail-il1-f182.google.com ([209.85.166.182]:33819)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <gayatridevi457900@gmail.com>)
 id 1kq384-0005Rg-5j
 for devel@lists.orangefs.org; Thu, 17 Dec 2020 18:56:16 -0500
Received: by mail-il1-f182.google.com with SMTP id x15so585665ilq.1
 for <devel@lists.orangefs.org>; Thu, 17 Dec 2020 15:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=RAXyj1fswYxIgdQ6udc3Z7tWCfzpyeRbMlzSxMeFim8=;
 b=JIiyy7SU7vgpGSKG2FxLNbj+9Br24UQwY+wIIOMqGkTva0dywF3SBno7nGeFXLRFtj
 K1EeMH5Zy/4dFvQPEuSirvVrlfkMnlnbvKakef+SX7PtsSM8k/WghT7Gy3NMcNyP2iGI
 WNa+L8PnWAWA9UZCdSI8Y0NpCCj0O3Hw0hd+79y3YembFnBl+ooWVsDvEZtngv3PXHF3
 vtu0dBTjOi6O22u9Hs92uC40KgkRrnuQANGakqByKcw0rGaEgRDDV4uSnz828XkC/9jx
 gWB5s5IYxHkmYl93pWdPGCmNAzRYOzcwpHSevsMnrg6oOZabvhpGrgyyqrJbF6/ybDdI
 c5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=RAXyj1fswYxIgdQ6udc3Z7tWCfzpyeRbMlzSxMeFim8=;
 b=kbg6mQbs7l2Jwymht32U8qoANOht/AZxzo0kEnxsnpJTYFtTI0jrnkiheqYbpxhkU/
 3+EYLNgHAQpWK1KmLNwiclG0+A06/XItCEoIhix33lsSqJRq58UyeuJ/iRIcsV1l6HGp
 a4tqTE+qNL0G02eJn583DZQkxD4c09eulAY4xW6DssFgbfHDuDX+3p2NDBE4hBITleCv
 DPlyWN8ElIlmEzEmYJo+YLz+/gsPC2Ai7aDo8IqTwo5KvLbeCBDluBfuDcv/i3FZVHdf
 h/VJMIPf9ZSuej2K74npfTR6DnI4+05lkzrDxOI5lfVGPHWNewU+U0l4hqC0UmTiUjeh
 hSSQ==
X-Gm-Message-State: AOAM531YgtRNwwnzGxB79+wHdJbXHT19ay8a0ny3I5qdE25+6LBd6+UP
 ijCh1ef+jicmPOXDHkfVyD7hpYXM94BGR3Jl/5hAVmBF
X-Google-Smtp-Source: ABdhPJyeU9gdrk2iMh/mLVRhSoWSJlajeAOHIUZ6BSgPiRoRuEePvn9N1JEDGBsBfCiDuinIsbHNZJqLF8xWmGsLXl4=
X-Received: by 2002:a92:9f8d:: with SMTP id z13mr1325287ilk.90.1608249334993; 
 Thu, 17 Dec 2020 15:55:34 -0800 (PST)
MIME-Version: 1.0
From: Gayatri Devi <gayatridevi457900@gmail.com>
Date: Fri, 18 Dec 2020 05:25:22 +0530
Message-ID: <CAGayoN9TZbDuHRXSa4R_AARm_R+J4=UvU3b9-YHD6fYQWA=kYg@mail.gmail.com>
Subject: 
To: devel@lists.orangefs.org
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


