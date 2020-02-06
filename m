Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F75F154833
	for <lists+devel-orangefs@lfdr.de>; Thu,  6 Feb 2020 16:36:07 +0100 (CET)
Received: from [::1] (port=37048 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1izjCI-00041V-3B
	for lists+devel-orangefs@lfdr.de; Thu, 06 Feb 2020 10:36:06 -0500
Received: from mail-vs1-f51.google.com ([209.85.217.51]:43098)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <hubcap@omnibond.com>) id 1izjCG-0003ot-H9
 for devel@lists.orangefs.org; Thu, 06 Feb 2020 10:36:04 -0500
Received: by mail-vs1-f51.google.com with SMTP id 7so4014332vsr.10
 for <devel@lists.orangefs.org>; Thu, 06 Feb 2020 07:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=omnibond-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CTYvh4/2DVv7Fth9DqQXmsOx8BmhbRQSRexdWwOw5NY=;
 b=Bs+JAuUIVQiMmzgN1ouuEUuJi7qsSYKAwBln/X6V/HG7f37kHuWNUQNVjNL52BhsAL
 j1Ng2G+9om7UYltk4OfW3C8h37+8nYiXixISOTawNHmCZ2kYY5vCm6eZ2xAt6qLu3O7l
 lS/x522Obb1W0z6U13ePdE75kIus1FHkLPFt0KiNCQJpR/ddEr0fJ5iblDORTH6YLPvH
 byYKzONEwSQFy7ul9ss2GnFKfdy0ntcSVVNh+/H3Qj5rbwhdBxGXV9oP/vnt13CCcHDP
 aA6HJtHQhAf4ucqe+moxCPPelhnZ/YFrLjvcm/mu91TxuS9rkHYAJQ7BF0kK/h3Wo4gU
 K3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CTYvh4/2DVv7Fth9DqQXmsOx8BmhbRQSRexdWwOw5NY=;
 b=rIr7F1m4DWa06RRCWogned+wzelbWAZ5oKfwOwupeayvZY5IQzMqiQgvV0f6NCOcIJ
 0DWzKjEu0W5aPH1I6lQulb+eqk6w2i/AqIKqhazb5RarPxTPoRnuSbT0jGO5hfFmMgg5
 4OtoRRz5FB/SR99tB/9xwzipQzzPa1Zriiz87FvydEHasNVhbgEFVAaMDIcWOK18PNqR
 ex4hhCRj6SiQOrVtHTiDuvo8vx9LA0tBm459es8T7Y4KT7vBUjDw1Ykybd8MRqTfDzUu
 jvsNQJFXVGDeW8B5mXwIa+T4b07wa7drDRcN8U8BDb1YFzCwxGjfVHNpJnWKyi4Ja1Kd
 vQCQ==
X-Gm-Message-State: APjAAAXgpi6XRyHu4G9l8RuuHFyc98mN/HpeNeo+WIzNN29cITvEr+BO
 gq0ZLUkPf0Fd1j08cjV5mpc1X/V4yAUDykZLRRxmXA==
X-Google-Smtp-Source: APXvYqyhB2jydUtxQr6f2fSi4+22mnYOP6fjrRVNNgfeX6V4iJ+WmO/t1+9pj1ExxRbPGWkPgOvjtLiQtJUSx9fg1Fw=
X-Received: by 2002:a67:e3c3:: with SMTP id k3mr1907805vsm.137.1581003323681; 
 Thu, 06 Feb 2020 07:35:23 -0800 (PST)
MIME-Version: 1.0
References: <20200201005639.GG23230@ZenIV.linux.org.uk>
In-Reply-To: <20200201005639.GG23230@ZenIV.linux.org.uk>
From: Mike Marshall <hubcap@omnibond.com>
Date: Thu, 6 Feb 2020 10:35:12 -0500
Message-ID: <CAOg9mSSBG7tWQ2+yZDwixCHe5GayyCgZO26D2CCrPCRHxjp4mg@mail.gmail.com>
Subject: Re: [confused] can orangefs ACLs be removed at all?
To: Al Viro <viro@zeniv.linux.org.uk>, Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>, devel@lists.orangefs.org
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

Hi Al...

I've been out of the loop for over a week, I only saw
your questions yesterday... I have one small debugfs
patch on linux-next I will submit for the merge window
today, and will have to go back out of the loop for a
few more days (temps will drop, I'm insulating the plumbing
on my house).

When I was writing and testing 4bef69000d93, as I remember,
I used getfacl and setfacl to see that things worked as
I expected them to.

I looked at my code while thinking about your questions, and
they seem like good ones. I have a couple of questions that will
help me when I return to this in a few days:

>> it used to be possible to do
>> orangefs_set_acl(inode, NULL, ACL_TYPE_ACCESS)

The way I tested (which maybe misses important stuff?) usually
caused posix_acl_xattr_set -> set_posix_acl -> orangefs_set_acl ...
Is there a simple userspace command that would send a NULL? When
would there be a NULL?

>> How is one supposed to remove ACLs there?

setfacl -m and setfacl -x both seem to work. I also have a userspace
test program I wrote that uses the internal orangefs api (not through
the kernel) to manipulate xattrs on orangefs files. Going through the
kernel with setfacl and looking at the results with my test program
seems as expected (I can make acls come and go).

>> Moreover, if you change an existing ACL to something
>> that is expressible by pure mode...

I don't remember having trouble before, but now when I try to set
an acl (on orangefs or ext4) that I think is expressible in pure mode,
the mode doesn't change, rather the acl is still set... can you
suggest a simple setfacl (or other) example I can use to test?

I will get back to this in a few days and work to get the code
into a condition that you think is reasonable.

Thanks!

-Mike

On Fri, Jan 31, 2020 at 7:56 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
>         Prior to 4bef69000d93 (orangefs: react properly to
> posix_acl_update_mode's aftermath.) it used to be possible
> to do orangefs_set_acl(inode, NULL, ACL_TYPE_ACCESS) -
> it would've removed the corresponding xattr and that would
> be it.  Now it fails with -EINVAL without having done
> anything.  How is one supposed to remove ACLs there?
>
>         Moreover, if you change an existing ACL to something
> that is expressible by pure mode, you end up calling
> __orangefs_setattr(), which will call posix_acl_chmod().
> And AFAICS that will happen with *old* ACL still cached,
> so you'll get ACL_MASK/ACL_OTHER updated in the old ACL.
>
>         How can that possibly work?  Sure, you want to
> propagate the updated mode to server - after you've
> done the actual update (possibly removal) of ACL-encoding
> xattr there...

