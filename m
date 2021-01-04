Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 0869B2E8FDE
	for <lists+devel-orangefs@lfdr.de>; Mon,  4 Jan 2021 06:01:28 +0100 (CET)
Received: from [::1] (port=48806 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1kwHzd-0007eH-Sf
	for lists+devel-orangefs@lfdr.de; Mon, 04 Jan 2021 00:01:21 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:40728)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <alison.c@junilearning.co>)
 id 1kwHzc-0007cp-4v
 for devel@lists.orangefs.org; Mon, 04 Jan 2021 00:01:20 -0500
Received: by mail-ot1-f44.google.com with SMTP id j12so24953102ota.7
 for <devel@lists.orangefs.org>; Sun, 03 Jan 2021 21:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=junilearning-co.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:mailmergekey:date:message-id:subject:to;
 bh=5OnU/jhxKtGPt2nMuorKo8uoAf92oh4t+u/FHQNFOJg=;
 b=C5txd+4/eApe8zYBm940dsRRNPQ3HqVg/Wru1ww9KNDZJLGYP4kCaZGs44QpCxxcqp
 qexvYJ/Sbk3/rQ8XkLXxJsDxSmxVFf/o62OXHhIQcm0yIbrCrS3NJu0apsLlXOR1+o8G
 sQLA6jVQN8cYqQwGNgetItu+t0qIgsRAKtn8dHhAwZuK+LVCSLr+6J9X/pOzrubh/JOe
 YW/6d7uMYZGuZyFNmq6IMqg8M9Nqsnl5xq+uceFbO6M8h6IfSSKaukBJYENVqAIHnIll
 rpdN6abCXJx+W2Vo7QWx/m2v5FF2RkJhGFK8QWV/50Xwg7FEhuc84jwY1WJauS8cRWUl
 n1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:mailmergekey:date:message-id
 :subject:to;
 bh=5OnU/jhxKtGPt2nMuorKo8uoAf92oh4t+u/FHQNFOJg=;
 b=WuB+Ern8LpyBXk96opc/WmHEr/9KHnOWgta9E3T/c2ajCt2LBBCPozPbsHA2UAqH4Y
 87Jh8/3NCYZeO6yIOTbhd01F4mQcX1FwqazgQWygjxV5zREJMpCiz6DFNIcTuC8k+GVZ
 tA4wdEj07dlz5zZKNFMhMK/iwm0OBzE/Aw7L1vtJadtYeGvhgFKRZnnPmcnqW2iwcyfA
 e+PNNxAD67glwAEN3Y9zEHcRVGv3hHoBNpI0K+CmZ7qYtdB5RJAvscFYA60dLYOm0D8Z
 +z7GVUiGlzfe7Jjl8mlbAdnoB75I25Zb8EP7XlJINPhz9FvxjesN/M78Ff7ili2isx6B
 8puw==
X-Gm-Message-State: AOAM5304kTFf2JOr63ELZLrRBjFz3mfzIUnbiMHCVoJ8HMi4FN9fc3Yk
 /qzbRhHaUSWb2b5I5W2HH7XG5eIlaw4VRYMvinG7HVaU5mLfYw==
X-Google-Smtp-Source: ABdhPJy5v0PJpjTold26DosGuONlFgV3zdts7zYq3OEbG5xeGb1MaKR5JCw1OCwhS7lC/3M64ju+W6ZAk8rx1Ijp6Zc=
X-Received: by 2002:a05:6830:1e41:: with SMTP id
 e1mr51928577otj.143.1609736438934; 
 Sun, 03 Jan 2021 21:00:38 -0800 (PST)
Received: from 326440123436 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 Jan 2021 00:00:38 -0500
MIME-Version: 1.0
From: Alison C <alison.c@junilearning.co>
mailmergekey: agxzfm1haWxmb29nYWVySAsSDE9yZ2FuaXphdGlvbiIPanVuaWxlYXJuaW5nLmNvDAsSBFVzZXIYgIDysbP23QgMCxIJTWFpbE1lcmdlGICAqvLMtboJDA
Date: Mon, 4 Jan 2021 00:00:38 -0500
Message-ID: <CAGEyE-aEB_hMGNa8n1BiWyZYaSdbCY-7G=GFdkmrFdfEN-cgjg@mail.gmail.com>
Subject: Content + Marketing Partnership
To: devel@lists.orangefs.org
Content-Type: text/plain; charset="UTF-8"
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

Hi there!

My name is Alison Clarke and I=E2=80=99m from the Juni Learning
<https://junilearning.com/> team. We are an award-winning online computer
science and mathematics academy that offers private online courses to
students from ages 8=E2=80=9318. You can give this feature on PC Mag
<https://www.pcmag.com/news/this-startup-connects-your-kid-with-ivy-league-=
student-instructors>
a read to know more about us.

Our program helps bright young minds develop their interest and passion for
analytical and technical subjects outside of school, and we want to inspire
kids and their parents to check out how much fun learning could be. I
thought we could team up with orangefs.org and share our content with you
and your audience. This would help us reach out to more parents with
similar interests, and at the same time, if you need additional content for
your blog, we could help you out, too. In case you=E2=80=99re interested, h=
ere=E2=80=99s a
sample of an article that you can publish on your site:

How to Teach Kids Variables

https://docs.google.com/document/d/1PmKOdAL_QKutFkJZ2pc3SE63sxExJV2xG2erKOX=
evmY/edit?usp=3Dsharing

Alternatively, you may also simply use our links as external sources in
your own articles.

Should you agree to a partnership with us, we have a dedicated social media
team that would be more than happy to share with and promote your own
content to our followers. This way, we could help boost each other=E2=80=99=
s reach.

Please let me know what you think, or if you have any questions - I would
be delighted to discuss this in further detail.

Thank you for your time and have a great day!

Best,

Ali

*If you do not wish to receive any email from us in the future, please let
me know and I=E2=80=99ll remove you from our mailing list (no hard feelings=
!).
Thank you!

=E1=90=A7
