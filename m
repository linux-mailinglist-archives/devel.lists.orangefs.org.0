Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B31A2C36
	for <lists+devel-orangefs@lfdr.de>; Fri, 30 Aug 2019 03:21:13 +0200 (CEST)
Received: from [::1] (port=60890 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1i3VbD-00069e-Tr
	for lists+devel-orangefs@lfdr.de; Thu, 29 Aug 2019 21:21:11 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:45800)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <hubcap@omnibond.com>) id 1i3VbC-00064q-Iy
 for devel@lists.orangefs.org; Thu, 29 Aug 2019 21:21:10 -0400
Received: by mail-yw1-f67.google.com with SMTP id n69so1822334ywd.12
 for <devel@lists.orangefs.org>; Thu, 29 Aug 2019 18:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=omnibond-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+IuQC8pbIafmSwD8SbGVAzn/DZ0LTbah8BkBemk6zek=;
 b=FGYyo76P5II4TE0xyyEdll3m2ufcqhN3TwhgI6WWOYj3toWhxeSi1wWMnzOp+D+rYj
 ahd/4sJOU/IaAo7fV5KpR4dy/NEnkI1UPi4BR9HH0itETNn+Hditb/hnVnP9oH/cyNg4
 oI/T5YJcX1gIvRAs4gjgcyFpS6Se90hdq2vCkSsM9WNmJBY7Ycu/Ay47jlkEZ0BEznLj
 bnxVQVgo6gmqDF8OmKQJnD/UyjSMDAyIfFY4B9AG7e1HO4urtYx5HaPIY5KSCwE1BSTn
 LymvSnfnU7tZBJ24uBJnsgaKmzRTtIBHnwqi8KIi0Il9SHJcQtsaNRWzW9wHZdDsxfKj
 tuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+IuQC8pbIafmSwD8SbGVAzn/DZ0LTbah8BkBemk6zek=;
 b=DQTxtk168I+OwYkyPWy+uo9ZFTug8IhzkPxOpLypALDYAYpdK1JUjpll6sL+XfmHBY
 IuWoxaoNAbT/IyEI1gKnHBH7l/fqig/CykavpcVVlA936vrJJHuh2yG8TVkDu2eJrVs4
 w+CQgCCJEUvydKf2WzhJ8fskEi7F1WQ+DXzPSewF8oA/5+zSqZbrS5aMRP0RkN6itd5g
 3TYeqdYTa+fExc9pPXtl2JiOQlKTd8dV0mAnUTFOeEY9tPPJ9lqmRwYkpxqk7i7Sufha
 Lml4sQ82O2VfwladNIOc85dWb4sSbBxVh+vEsbKg7foKgEklN0J3FntX9tLTOeU/fJq9
 b9Qw==
X-Gm-Message-State: APjAAAUQOgtbr4fDk5iaFz7C7cukHN59/kCzxqAJvrMBZFILh/hH3dE+
 KWacsbl1RUgknK9jRVFGqZNL0V2D6bDVcldlo7q3Dg==
X-Google-Smtp-Source: APXvYqxAu3ghLEx4a7gfcA71cO2rSrBRWU6Icj84myb4LlhRF0l0un6rKVRkx0QZ124nnLqeAoTJBmXR1ZEKYdU440U=
X-Received: by 2002:a81:3681:: with SMTP id d123mr9784376ywa.348.1567128029653; 
 Thu, 29 Aug 2019 18:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190829041132.26677-1-deepa.kernel@gmail.com>
 <CABeXuvoKD83B7iUqE33Y9E2OVtf61DKv-swZr-N=ozz-cMmGOA@mail.gmail.com>
In-Reply-To: <CABeXuvoKD83B7iUqE33Y9E2OVtf61DKv-swZr-N=ozz-cMmGOA@mail.gmail.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Thu, 29 Aug 2019 21:20:18 -0400
Message-ID: <CAOg9mSR25eAH7e1KhDZt_uscJSzyuSmELbCxgyh=-KWRxjZtcw@mail.gmail.com>
Subject: Re: [GIT PULL] vfs: Add support for timestamp limits
To: Deepa Dinamani <deepa.kernel@gmail.com>
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

Hi Deepa...

I installed this patch series on top of Linux 5.3-rc6 and ran xfstests
on orangefs and got a regression... generic/258 failed
with: "Timestamp wrapped"...

# cat results/generic/258.out.bad
QA output created by 258
Creating file with timestamp of Jan 1, 1960
Testing for negative seconds since epoch
Timestamp wrapped: 0
Timestamp wrapped
(see /home/hubcap/xfstests-dev/results//generic/258.full for details)

Just to double check, I compiled Linux 5.3-rc6 without the timestamp series,
and 258 passed... then added the patch series back and the failure returned...

Also.... when I was using "git am" to apply the patch series, the ceph patch
failed, so I "git skipped" it...

I obtained the patch series from: https://github.com/deepa-hub/vfs limits
today.

-Mike

On Thu, Aug 29, 2019 at 12:38 AM Deepa Dinamani <deepa.kernel@gmail.com> wrote:
>
> Adding the others who were on original cc, just in case.
> - Deepa
>
> On Wed, Aug 28, 2019 at 9:12 PM Deepa Dinamani <deepa.kernel@gmail.com> wrote:
> >
> > Hi Al, Arnd,
> >
> > This is a pull request for filling in min and max timestamps for filesystems.
> > I've added all the acks, and dropped the adfs patch. That will be merged through
> > Russell's tree.
> >
> > Thanks,
> > Deepa
> >
> > The following changes since commit 5d18cb62218608a1388858880ad3ec76d6cb0d3b:
> >
> >   Add linux-next specific files for 20190828 (2019-08-28 19:59:14 +1000)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/deepa-hub/vfs limits
> >
> > for you to fetch changes up to f0f216afa4c7e4dee9121fde52ccf57f76119188:
> >
> >   isofs: Initialize filesystem timestamp ranges (2019-08-28 19:19:36 -0700)
> >
> > ----------------------------------------------------------------
> > Deepa Dinamani (19):
> >       vfs: Add file timestamp range support
> >       vfs: Add timestamp_truncate() api
> >       timestamp_truncate: Replace users of timespec64_trunc
> >       mount: Add mount warning for impending timestamp expiry
> >       utimes: Clamp the timestamps before update
> >       fs: Fill in max and min timestamps in superblock
> >       9p: Fill min and max timestamps in sb
> >       ext4: Initialize timestamps limits
> >       fs: nfs: Initialize filesystem timestamp ranges
> >       fs: cifs: Initialize filesystem timestamp ranges
> >       fs: fat: Initialize filesystem timestamp ranges
> >       fs: affs: Initialize filesystem timestamp ranges
> >       fs: sysv: Initialize filesystem timestamp ranges
> >       fs: ceph: Initialize filesystem timestamp ranges
> >       fs: orangefs: Initialize filesystem timestamp ranges
> >       fs: hpfs: Initialize filesystem timestamp ranges
> >       fs: omfs: Initialize filesystem timestamp ranges
> >       pstore: fs superblock limits
> >       isofs: Initialize filesystem timestamp ranges
> >
> >  fs/9p/vfs_super.c        |  6 +++++-
> >  fs/affs/amigaffs.c       |  2 +-
> >  fs/affs/amigaffs.h       |  3 +++
> >  fs/affs/inode.c          |  4 ++--
> >  fs/affs/super.c          |  4 ++++
> >  fs/attr.c                | 21 ++++++++++++---------
> >  fs/befs/linuxvfs.c       |  2 ++
> >  fs/bfs/inode.c           |  2 ++
> >  fs/ceph/super.c          |  2 ++
> >  fs/cifs/cifsfs.c         | 22 ++++++++++++++++++++++
> >  fs/cifs/netmisc.c        | 14 +++++++-------
> >  fs/coda/inode.c          |  3 +++
> >  fs/configfs/inode.c      | 12 ++++++------
> >  fs/cramfs/inode.c        |  2 ++
> >  fs/efs/super.c           |  2 ++
> >  fs/ext2/super.c          |  2 ++
> >  fs/ext4/ext4.h           | 10 +++++++++-
> >  fs/ext4/super.c          | 17 +++++++++++++++--
> >  fs/f2fs/file.c           | 21 ++++++++++++---------
> >  fs/fat/inode.c           | 12 ++++++++++++
> >  fs/freevxfs/vxfs_super.c |  2 ++
> >  fs/hpfs/hpfs_fn.h        |  6 ++----
> >  fs/hpfs/super.c          |  2 ++
> >  fs/inode.c               | 33 ++++++++++++++++++++++++++++++++-
> >  fs/isofs/inode.c         |  7 +++++++
> >  fs/jffs2/fs.c            |  3 +++
> >  fs/jfs/super.c           |  2 ++
> >  fs/kernfs/inode.c        |  7 +++----
> >  fs/minix/inode.c         |  2 ++
> >  fs/namespace.c           | 33 ++++++++++++++++++++++++++++++++-
> >  fs/nfs/super.c           | 20 +++++++++++++++++++-
> >  fs/ntfs/inode.c          | 21 ++++++++++++---------
> >  fs/omfs/inode.c          |  4 ++++
> >  fs/orangefs/super.c      |  2 ++
> >  fs/pstore/ram.c          |  2 ++
> >  fs/qnx4/inode.c          |  2 ++
> >  fs/qnx6/inode.c          |  2 ++
> >  fs/reiserfs/super.c      |  3 +++
> >  fs/romfs/super.c         |  2 ++
> >  fs/squashfs/super.c      |  2 ++
> >  fs/super.c               |  2 ++
> >  fs/sysv/super.c          |  5 ++++-
> >  fs/ubifs/file.c          | 21 ++++++++++++---------
> >  fs/ufs/super.c           |  7 +++++++
> >  fs/utimes.c              |  6 ++----
> >  fs/xfs/xfs_super.c       |  2 ++
> >  include/linux/fs.h       |  5 +++++
> >  include/linux/time64.h   |  2 ++
> >  48 files changed, 298 insertions(+), 72 deletions(-)

