Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id E54A4AEE58B
	for <lists+devel-orangefs@lfdr.de>; Mon, 30 Jun 2025 19:19:01 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id 2FD6C381465
	for <lists+devel-orangefs@lfdr.de>; Mon, 30 Jun 2025 13:19:00 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1751303940; bh=BAiyrEhhiV383mOUgct4OWopIaapKv+OJACBpBkj1ek=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=5yZghDuJJZuantZLNWcqk036Xe/ryRJ2VmaHQO4XtKw3YCUzyNOf2fJqMddtz5TIK
	 2fe/CxiDv+tupOPIwI8KqLjgfLYEEjyfqdvag0IXFNs9R5EMDgCfiyTvr7DxgpizGo
	 EDo/Q3y9X1SjHKUXi3aiDoC72PGU/0qt4CdEvL4t+6eLd0vAeNI659CWew1OaNwIPN
	 Xo7XRtwAQeJ+FXqDNOtc6NRB+TKDs8lFpfW0RORicEUrG4e14a7D2pIjLV6IpKSIeB
	 mkZPi3b7/Oc07YUA2+xiKLHFTFvGLvXd+O3wk+umOTSUq6sbX5RZDvRsoElHXOhX5L
	 AwyzeQVNcxUCw==
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	by mm1.emwd.com (Postfix) with ESMTPS id 7212E3808D2
	for <devel@lists.orangefs.org>; Mon, 30 Jun 2025 13:18:59 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="D2OloVs3";
	dkim-atps=neutral
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-748d982e97cso2462252b3a.1
        for <devel@lists.orangefs.org>; Mon, 30 Jun 2025 10:18:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751303938; x=1751908738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAiyrEhhiV383mOUgct4OWopIaapKv+OJACBpBkj1ek=;
        b=Ed4Np55jA3MyTM4Pg8i5Uqhjh4aCxPHW3McORSRVrv/BCiyHFR6MxI67CVhqdmmvCA
         BhkLb6cSA5oGeeuFuyJzHMIey4AP8wYahRVogqQ5QAvZP4t79ODiQ5HdDF9cmxd0DcBg
         FB7v6+xL6OvBSI4gbNf7Pypx6FqVuoJF5MT26GvS3vjEphGoagdXRrExBswjOFdW0U7K
         Oc1JtmtM0UC941ptRmAQ7y838OPHsLzsjmRrz3tSquiiQNIMdzBt+Am78LFC+w63DxhC
         UX60nb8SOqTrTQBAzRCTFPqVffRuTdbbDUM6lq/JZHwxaJu3tZRxzWONWrqBqHztpOa3
         72aw==
X-Forwarded-Encrypted: i=1; AJvYcCV4vFsguNXtIvwHcU13ttpV/oZ/QkOeliwQO7RWDDeEcLOyIPkKl8+baGq+F28C0xkg/uaKsA==@lists.orangefs.org
X-Gm-Message-State: AOJu0Yzia3Eayp1Vk8Ski1nOK32R6x+HcEDezUU+zOkgYeWwqWRNDGDT
	w4KwwjJ2sgP8TAjGC4x/EWeAJ50vPX5etO39xQTMzxUDeGJJ50CGSsmzRaGjugdm6q1gxRxiD7+
	c5IMwOa6P0Hgsjg/Y+1IWwR1+BnRymrqjpRN8LJMA
X-Gm-Gg: ASbGncv3C8y8lrebKTNeu+BLBNO4yp735ai5cze6jZ1lcRLw3EKknFZdsHUQIvP8tMH
	N/bxKt5z7+1BRmzx8/YkPzD0BrBvYKfUJPYH7TfcvszP15KhO7ivBe2pQibl68bjtWeoN16ZVwn
	wIpBtgFsiZLzqdxaQEKsNx6BMWJdyAG/1voNkH+8fqjvrqOr6HAYIy/ho=
X-Google-Smtp-Source: AGHT+IF5EUFj3NXjU3AVcJ/Zu/DDPjIC7nSgpWEx00YDQf4mbck1Hjl5QK0YbghJ0YN5j+UjqF3+EU3iklA4MYf3sAc=
X-Received: by 2002:a05:6a00:238b:b0:746:24c9:c92e with SMTP id
 d2e1a72fcca58-74af6ef81a9mr20692678b3a.8.1751303938118; Mon, 30 Jun 2025
 10:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250608163559.36401-1-a.jahangirzad@gmail.com>
 <CADf5TKvyKvaP3eZUR81ND6JQUfVqUEroCrXp=joZ8GHdu2EBbA@mail.gmail.com>
 <20250622184815.GW1880847@ZenIV> <CADf5TKvorgeCJ=6u6=jhxetUhDx3SCnUBe+cpbUQu5gADqRRCg@mail.gmail.com>
 <CAOg9mSQGNOrA0p4q+9Q_tLCMtBnCuEc5d+TYXdV+7XT4pqOQNg@mail.gmail.com>
In-Reply-To: <CAOg9mSQGNOrA0p4q+9Q_tLCMtBnCuEc5d+TYXdV+7XT4pqOQNg@mail.gmail.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Mon, 30 Jun 2025 13:18:47 -0400
X-Gm-Features: Ac12FXxG1vMznYMejNAEHasbVa_SYqnMqre4yhcxDzQgyJ9n0lVdgpRMdyqH75M
Message-ID: <CAOg9mSScdVGLu6RFFe_Lcv5ugRmN8Ov-qZ=yNUM84Jv94jKz1g@mail.gmail.com>
Subject: Re: [PATCH] fs/orangefs: use snprintf() instead of sprintf()
To: Amir Mohammad Jahangirzad <a.jahangirzad@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: QVNVILBPADPULEZZW37OL77VU7YM7EDX
X-Message-ID-Hash: QVNVILBPADPULEZZW37OL77VU7YM7EDX
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Al Viro <viro@zeniv.linux.org.uk>, devel@lists.orangefs.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/QVNVILBPADPULEZZW37OL77VU7YM7EDX/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

Hi Amir...

I added your patch to 6.16-rc3 and ran it through xfstests, it
works fine. snprintf won't overflow the buffer and gives you
the opportunity to compare the return code to the buffer size
to detect truncation. It doesn't look like many of the other uses
of snprintf in the kernel bother with checking for truncation.

Whatever Al was pointing out is probably important... :-)

-Mike

On Mon, Jun 23, 2025 at 1:02=E2=80=AFPM Mike Marshall <hubcap@omnibond.com>=
 wrote:
>
> Hi Y'all...
>
> I was about to add Amir's patch on top of 6.16-rc3 and run it through
> xfstests, when I saw Al's comment.
>
> Al patched a similar bit of code in orangefs-debugfs.c without
> removing sprintf:
>
> 45063097 - "don't open-code file_inode()"
>
> When I look at orangefs_debug_read as it is now, I might be trusting
> file->private_data's length too much and Amir's patch might risk sending
> a bad sprintf_ret to simple_read_from_buffer. Al, could you be
> more explicit?
>
> -Mike
>
> On Sun, Jun 22, 2025 at 4:10=E2=80=AFPM Amir Mohammad Jahangirzad
> <a.jahangirzad@gmail.com> wrote:
> >
> > On Sun, Jun 22, 2025 at 10:18=E2=80=AFPM Al Viro <viro@zeniv.linux.org.=
uk> wrote:
> > >
> > > On Sun, Jun 22, 2025 at 10:09:58PM +0330, Amir Mohammad Jahangirzad w=
rote:
> > >
> > > > > Replace sprintf() with snprintf() for copying the debug string
> > > > > into a temporary buffer, using ORANGEFS_MAX_DEBUG_STRING_LEN as
> > > > > the maximum size to ensure safe formatting and prevent memory
> > > > > corruption in edge cases.
> > >
> > > Out of curiosity - have you actually looked at the format used there?
> >
> > No, I just found this through static analysis. Is there any issue with =
it?
