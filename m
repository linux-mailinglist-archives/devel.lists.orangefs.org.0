Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 6312EA2C8E
	for <lists+devel-orangefs@lfdr.de>; Fri, 30 Aug 2019 04:03:09 +0200 (CEST)
Received: from [::1] (port=33716 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1i3WFo-00071V-Gk
	for lists+devel-orangefs@lfdr.de; Thu, 29 Aug 2019 22:03:08 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:38164)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <deepa.kernel@gmail.com>)
 id 1i3WFm-00071B-S6
 for devel@lists.orangefs.org; Thu, 29 Aug 2019 22:03:06 -0400
Received: by mail-io1-f68.google.com with SMTP id p12so10982129iog.5
 for <devel@lists.orangefs.org>; Thu, 29 Aug 2019 19:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oLvzfsj88KL7STQQplyqqS42g24w/uMRduFS4XzvSOo=;
 b=SUiSI+Km3m50gBNp/Vf1kQ5Znt7t2xjJr9IjLemKNMiLxz2yhpZsbK/DLZC4L9urNb
 gDxuG7f7XtiecI937GfbQdq+jdln7Z3Fb+8kZnJxwlPpeYQImuMwhjHoDEP857mW1lVb
 NZHRIybWwFHnsioflZzUdQfkXgsEf/TexqY+05N8IO8NvnMnQftjfJ9hFazxqlx7VQO+
 BZ2rZ7/dbzo90ZAvtO0lvvso+7mGgwA9kdlEC7uFLAulP9R+MYUVIvG8IxPGPXul5/em
 IvII12CYogidxhoNLSBGFsf9ZguQCTMWCWKe+z44xwiHPHukomi7gttk607Xpy0ogB0G
 kuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oLvzfsj88KL7STQQplyqqS42g24w/uMRduFS4XzvSOo=;
 b=XCC6P3OxZHndXB/XB991FnD5IF8dx6jz59hx/Q/y646Xoi+4lPMbP6NcEghf/0eeuy
 XlY77YxaxTf2k7OmuHy1Ro/n+SFRtRWfPBzQ7xyXaFfR4a1LYvqpzzR26iiLw0iuIZS3
 ucM8R35obMoYyRYoFEclmO647jnLmMIPZTWvXuHEO3KrNoQGZPh+XsgazXaAL3nOCP39
 8Q3ZSuL24xSAP6eFit4GUs7Wa7YdNEm+YMW9vHbDkPAM1pvM79nH3SnHBmcoYlDXDTWU
 oCxlzCL5ql1ZRLDL9qI4+loc6PdTdIFTxMW44yKDxYC8LI1YvxrVBhZ2E13zxjXD6nwH
 /ucQ==
X-Gm-Message-State: APjAAAURDg7rFUp6NxJhVb/nBy/2QU7UvV4lR9feNp+Qrm2vCZDo2XxT
 Y7H8xyh2awMSeclQe4WjKIm/+ZHGY+t6/8tQXow=
X-Google-Smtp-Source: APXvYqzBsNh7crucvVXKqn/eA6ggQob01fCf1ZKTT3BSHFJDqk3FlwYnF1wm6BwegRm/uQfEg9JQEGStTj+fA+RuGsU=
X-Received: by 2002:a5d:8599:: with SMTP id f25mr9602181ioj.265.1567130545941; 
 Thu, 29 Aug 2019 19:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190829041132.26677-1-deepa.kernel@gmail.com>
 <CABeXuvoKD83B7iUqE33Y9E2OVtf61DKv-swZr-N=ozz-cMmGOA@mail.gmail.com>
 <CAOg9mSR25eAH7e1KhDZt_uscJSzyuSmELbCxgyh=-KWRxjZtcw@mail.gmail.com>
In-Reply-To: <CAOg9mSR25eAH7e1KhDZt_uscJSzyuSmELbCxgyh=-KWRxjZtcw@mail.gmail.com>
From: Deepa Dinamani <deepa.kernel@gmail.com>
Date: Thu, 29 Aug 2019 19:02:13 -0700
Message-ID: <CABeXuvpe9vADLZUr4zHrH0izt=1BaLQvBMxAu=T1A2CV3AN4vA@mail.gmail.com>
Subject: Re: [GIT PULL] vfs: Add support for timestamp limits
To: Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, jfs-discussion@lists.sourceforge.net,
 Dave Kleikamp <shaggy@kernel.org>, al@alarsen.net, yuchao0@huawei.com,
 Bob Copeland <me@bobcopeland.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, mikulas@artax.karlin.mff.cuni.cz,
 stoph Hellwig <hch@lst.de>, nico@fluxnic.net, linux-cifs@vger.kernel.org, "Yan,
 Zheng" <zyan@redhat.com>, Sage Weil <sage@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Richard Weinberger <richard@nod.at>, Steve French <sfrench@samba.org>,
 Anton Vorontsov <anton@enomsg.org>, linux@armlinux.org.uk,
 codalist@coda.cs.cmu.edu, Christoph Hellwig <hch@infradead.org>,
 coda@cs.cmu.edu, V9FS Developers <v9fs-developer@lists.sourceforge.net>,
 Ilya Dryomov <idryomov@gmail.com>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>, salah.triki@gmail.com,
 asmadeus@codewreck.org, devel@lists.orangefs.org,
 Evgeniy Dushistov <dushistov@mail.ru>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Eric Van Hensbergen <ericvh@gmail.com>,
 Jan Kara <jack@suse.com>, reiserfs-devel@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 aivazian.tigran@gmail.com, phillip@squashfs.org.uk,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel <ceph-devel@vger.kernel.org>, trond.myklebust@hammerspace.com,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Dilger <adilger@dilger.ca>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 luisbg@kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 linux-ntfs-dev@lists.sourceforge.net, Greg KH <gregkh@linuxfoundation.org>,
 linux-karma-devel@lists.sourceforge.net, jlayton@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Colin Cross <ccross@android.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Anna Schumaker <anna.schumaker@netapp.com>, Joel Becker <jlbec@evilplan.org>
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

On Thu, Aug 29, 2019 at 6:20 PM Mike Marshall <hubcap@omnibond.com> wrote:
>
> Hi Deepa...
>
> I installed this patch series on top of Linux 5.3-rc6 and ran xfstests
> on orangefs and got a regression... generic/258 failed
> with: "Timestamp wrapped"...
>
> # cat results/generic/258.out.bad
> QA output created by 258
> Creating file with timestamp of Jan 1, 1960
> Testing for negative seconds since epoch
> Timestamp wrapped: 0
> Timestamp wrapped
> (see /home/hubcap/xfstests-dev/results//generic/258.full for details)

Note that patch [16/20] https://lkml.org/lkml/2019/8/18/193 assumes
that orangefs does not support negative timestamps.
And, the reason was pointed out in the commit text:

----------------------
Assume the limits as unsigned according to the below
commit 98e8eef557a9 ("changed PVFS_time from int64_t to uint64_t")
in https://github.com/waltligon/orangefs

Author: Neill Miller <neillm@mcs.anl.gov>
Date:   Thu Sep 2 15:00:38 2004 +0000
--------------------

So the timestamp being wrapped to 0 in this case is correct behavior
according to my patchset.
The generic/258 assumes that the timestamps can be negative. If this
is not true then it should not be run for this fs.

But, if you think the timestamp should support negative timestamps for
orangefs, I'd be happy to change it.

> Just to double check, I compiled Linux 5.3-rc6 without the timestamp series,
> and 258 passed... then added the patch series back and the failure returned...
>
> Also.... when I was using "git am" to apply the patch series, the ceph patch
> failed, so I "git skipped" it...

My series applies cleanly against linux-next as of yesterday.

-Deepa

