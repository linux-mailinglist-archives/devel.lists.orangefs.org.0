Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E095E53C2
	for <lists+devel-orangefs@lfdr.de>; Wed, 21 Sep 2022 21:26:15 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id 7015C38446E
	for <lists+devel-orangefs@lfdr.de>; Wed, 21 Sep 2022 15:26:14 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=harmony;
	t=1663788374; bh=o+v5eytP7rCBx6gZq3eJ3mGrk3RuwfyPgMfL659y8CU=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XBOzDwh5nAhWe+lAetsMhdmWHQYO12wE8iNVDoFi6EvYFNg9drCsWrXPgCSDCracD
	 9miJ+V6CBhjSV03wIb3CSj7AYAvSUGcXkmL34aunqrqWbuLO2r62PqaMeXAcEKnB0W
	 wbasBj4MZ09E47qEaT59JprPxsd6y/QSRGy9dXJo7KNpIBTdFLGFUjz+Qj6JzGdx2h
	 dBmsNzhievHnm6iB6KHQ3JJY7S7JPDEyXjHvKqHasU0MOlFkxXdXEooAqF+UiKK0Fw
	 6ZPGfcfZ08QwmHSOQr8/tn0uppEHE4Cua3ehFlkB6fbCV9VDnhDcchkKSBHboJIK9P
	 MgC0qC6OFossg==
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	by mm1.emwd.com (Postfix) with ESMTPS id 7ABB338446B
	for <devel@lists.orangefs.org>; Wed, 21 Sep 2022 15:26:11 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20210112.gappssmtp.com header.i=@omnibond-com.20210112.gappssmtp.com header.b="0A5e59ms";
	dkim-atps=neutral
Received: by mail-lj1-f171.google.com with SMTP id b6so8223848ljr.10
        for <devel@lists.orangefs.org>; Wed, 21 Sep 2022 12:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=SB0ZL3ET5KIRiXLzJBPRplLaECUUBPQ/n6fLwa5hHA8=;
        b=0A5e59msr8vZ9yyswtDGOENd9aDNdfqvLUSiJXcQicnCVo7nNeHpFu+d6Ow6+qNhTS
         Y2q5K1hAOfFO8+dpOCigOXgV8M/pbEe3K7y/rzqqGL9LoNChUSrb2pkRahORLufp2uNQ
         9/oUFyzHqOtmTjXzT2Z7oSDKN1xJNpAa0Jddb+aLcNc3tirgXmbXVuyZxc6e131yIVjQ
         hQjxxLXeVO80G3jl+jikLL6WUSmyipysOAZvj17vDHGMjtMHuSwGQCGI3PBFtLO1iMbA
         DCFoh4lvIspc37sZc8KmWtDoE3ohyFq5MLu1QUZTYY3o/XeGP6Hc4ouQGPbnMpjRPjtw
         jLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=SB0ZL3ET5KIRiXLzJBPRplLaECUUBPQ/n6fLwa5hHA8=;
        b=mgWxlLXqzR6lkL9c4pouNT9RHmseHcpG6+N0FMIoZ+AqM6+WCyrhjFtMKflaua8ixd
         XrHxf0S2y+JsRbT7/fSeqWdbnjuN47DNSDD2iEYl7HNIRqEPNpt3aMeCzq3h2G1SD/OV
         9QNsPbSK4qAQdBPtI/IBosHbkvK7z4kfOZk22nR+lbnAIUIZTndtrlUcVo1zrox8lE1t
         OiEMrbPcRQUev5gaWMM6c7wr3BlRbj1VloMU0V1Tn8EW+U+SWmNg+umVgAS7GgZEyILi
         8VjhxkMxh4lr+BTTCefziLobLP5GmDAmNLD0ebmPt15bpvOR4Cpnkuv/70/uINLDxMYQ
         EXcw==
X-Gm-Message-State: ACrzQf2rSDsuTIHTFGsCSnlY2+myjAFFUbJEZcsPAxYSr8GsOZOm9W3e
	JRkoUnrrEqfGF7xQ1QXmqCMQ1q17Qjq7np9h3AX7qw==
X-Google-Smtp-Source: AMsMyM5KO0UwDQkeO6ykB9BNj9gI3KAjgKqiJnM2Fz59q7a2ZikJNq5vRGZQQczhPRWAQLxQ28aQDNsI3e9uHsuaO08=
X-Received: by 2002:a2e:9b89:0:b0:26a:a004:ac3 with SMTP id
 z9-20020a2e9b89000000b0026aa0040ac3mr8832429lji.104.1663788369753; Wed, 21
 Sep 2022 12:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <YvvBs+7YUcrzwV1a@ZenIV> <CAHk-=wgkNwDikLfEkqLxCWR=pLi1rbPZ5eyE8FbfmXP2=r3qcw@mail.gmail.com>
 <Yvvr447B+mqbZAoe@casper.infradead.org> <dc966283-d0b9-b411-0792-c8553b948c2e@canonical.com>
In-Reply-To: <dc966283-d0b9-b411-0792-c8553b948c2e@canonical.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Wed, 21 Sep 2022 15:25:58 -0400
Message-ID: <CAOg9mSRjo-UZ+3OMVZ4VekwSLzmAe0=+t1kr47K_gFzfp-wUwQ@mail.gmail.com>
Subject: Re: [apparmor] Switching to iterate_shared
To: Matthew Wilcox <willy@infradead.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: J6BTGIH2KUG6GPYW7EIAXVZFKWA3NRAZ
X-Message-ID-Hash: J6BTGIH2KUG6GPYW7EIAXVZFKWA3NRAZ
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devel@lists.orangefs.org
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/J6BTGIH2KUG6GPYW7EIAXVZFKWA3NRAZ/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

>> At least CEPH has active maintainers...

Well that's just mean :-) ...

Anywho...

>> in many cases, the existing iterate() implementation works just fine as iterate_shared().
>> https://lwn.net/Articles/686943/

I changed the orangefs .iterate to .iterate_shared... ls still works,
find still works,
xfstests shows no regressions...

I found and ran my getdents program from back when we were working to
go upstream...
it works the same with .iterate as it does with .iterate_shared...

-Mike

On Thu, Aug 18, 2022 at 12:15 PM John Johansen
<john.johansen@canonical.com> wrote:
>
> On 8/16/22 12:11, Matthew Wilcox wrote:
> > On Tue, Aug 16, 2022 at 11:58:36AM -0700, Linus Torvalds wrote:
> >> That said, our filldir code is still confusing as hell. And I would
> >> really like to see that "shared vs non-shared" iterator thing go away,
> >> with everybody using the shared one - and filesystems that can't deal
> >> with it using their own lock.
> >>
> >> But that's a completely independent wart in our complicated filldir saga.
> >>
> >> But if somebody were to look at that iterate-vs-iterate_shared, that
> >> would be lovely. A quick grep shows that we don't have *that* many of
> >> the non-shared cases left:
> >>
> >>        git grep '\.iterate\>.*='
> >>
> >> seems to imply that converting them to a "use my own load" wouldn't be
> >> _too_ bad.
> >>
> >> And some of them might actually be perfectly ok with the shared
> >> semantics (ie inode->i_rwsem held just for reading) and they just were
> >> never converted originally.
> >
> > What's depressing is that some of these are newly added.  It'd be
> > great if we could attach something _like_ __deprecated to things
> > that checkpatch could pick up on.
> >
> > fs/adfs/dir_f.c:        .iterate        = adfs_f_iterate,
> > fs/adfs/dir_fplus.c:    .iterate        = adfs_fplus_iterate,
> >
> > ADFS is read-only, so must be safe?
> >
> > fs/ceph/dir.c:  .iterate = ceph_readdir,
> > fs/ceph/dir.c:  .iterate = ceph_readdir,
> >
> > At least CEPH has active maintainers, cc'd
> >
> > fs/coda/dir.c:  .iterate        = coda_readdir,
> >
> > Would anyone notice if we broke CODA?  Maintainers cc'd anyway.
> >
> > fs/exfat/dir.c: .iterate        = exfat_iterate,
> >
> > Exfat is a new addition, but has active maintainers.
> >
> > fs/jfs/namei.c: .iterate        = jfs_readdir,
> >
> > Maintainer cc'd
> >
> > fs/ntfs/dir.c:  .iterate        = ntfs_readdir,         /* Read directory contents. */
> >
> > Maybe we can get rid of ntfs soon.
> >
> > fs/ocfs2/file.c:        .iterate        = ocfs2_readdir,
> > fs/ocfs2/file.c:        .iterate        = ocfs2_readdir,
> >
> > maintainers cc'd
> >
> > fs/orangefs/dir.c:      .iterate = orangefs_dir_iterate,
> >
> > New; maintainer cc'd
> >
> > fs/overlayfs/readdir.c: .iterate        = ovl_iterate,
> >
> > Active maintainer, cc'd
> >
> > fs/proc/base.c: .iterate        = proc_##LSM##_attr_dir_iterate, \
> >
> > Hmm.  We need both SMACK and Apparmor to agree to this ... cc's added.
>
> This is fine for AppArmor
>
>
> >
> > fs/vboxsf/dir.c:        .iterate = vboxsf_dir_iterate,
> >
> > Also newly added.  Maintainer cc'd.
> >
>
