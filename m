Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 21889A1085
	for <lists+devel-orangefs@lfdr.de>; Thu, 29 Aug 2019 06:38:59 +0200 (CEST)
Received: from [::1] (port=58240 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1i3CD3-00011Y-U5
	for lists+devel-orangefs@lfdr.de; Thu, 29 Aug 2019 00:38:57 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:46345)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <deepa.kernel@gmail.com>)
 id 1i3CD2-00011J-EL
 for devel@lists.orangefs.org; Thu, 29 Aug 2019 00:38:56 -0400
Received: by mail-io1-f66.google.com with SMTP id x4so4124148iog.13
 for <devel@lists.orangefs.org>; Wed, 28 Aug 2019 21:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ph2TDX0t8VD1IALiSLotxXSH3Hc7LzlyzCWrbeW7KEM=;
 b=Ad4yH+QK5ygrblSOoyxD0tbvjV1ue9nzyr8wf1rjkD8nTQtAUxNZJKQHZoLxHgRk2B
 TEAoeI524dxNfHCqzBGvK8fuiw+bAamqjZzPjGzpO4q1JaVUUDD9ax94jSI09AwQIEcQ
 WVE9Kk/mYHro0Fu7Hu8WrE90Mi3tlpvW3ZwrAo0k7GoHIwwQC60Y8Y9lhWHQ2x0r9tnz
 jSaqwnIO0Z4sBYO3fglWtXsmzhw2k5YPG8bbqxvl5SmNtQPBiiKKdIu9pdlVPfuYLf7e
 1REmXyzixgNc7NV2Y7fqiRSpx+wDxIJjwki+5Yj33Yn9bHcHOqns04S9V/iNntVln4qf
 JFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ph2TDX0t8VD1IALiSLotxXSH3Hc7LzlyzCWrbeW7KEM=;
 b=q4zPlL9qxadhn976FT0Fo1KvPMWDZJ0i3ASj4tyO2khzHKKMbqo8X1zyW1agj7J7AK
 t4ItnGyriqyYXlgniqgJqfwd80Aq6TvLkTW2YYPkhXqW7SKwI6SApjp6nMGm6S+F2dwD
 k8V5R609Jm11h7QP7rsU4TNRiuZG4tVC86rB/LpJQf7w1wJLP1+Wq5KXQkqVDH8lD7Wt
 vfaKKItMSulLY5b/OJWjgesFN5r6MotbmeChYrJZ0x+D0zoC1STDbUasZHZlwpHygFPa
 zY0gwEmpHivcJ04brxoCgTz6xpMtwOr1LLu9FudQRE3JzUbXnMQDNvpP8y3Tpagm43OM
 X8hA==
X-Gm-Message-State: APjAAAU7vJllyW8T+KxJWwnXZHA/ttfcBjJSTCnK/cLeiG9sgN/QS4/K
 bhDvPGd27sAlCsJe9lnv1wnKu28Lh2lUQqsmurI=
X-Google-Smtp-Source: APXvYqxGcrhx04qhhiztO9h7tEg9eaTJ/omReFf3uThdfVv9L98okzDLYj6+TF/LNCwbU0Ps8hWzB+I1empnbI4Uys0=
X-Received: by 2002:a02:23cc:: with SMTP id u195mr8401832jau.136.1567053495481; 
 Wed, 28 Aug 2019 21:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190829041132.26677-1-deepa.kernel@gmail.com>
In-Reply-To: <20190829041132.26677-1-deepa.kernel@gmail.com>
From: Deepa Dinamani <deepa.kernel@gmail.com>
Date: Wed, 28 Aug 2019 21:38:03 -0700
Message-ID: <CABeXuvoKD83B7iUqE33Y9E2OVtf61DKv-swZr-N=ozz-cMmGOA@mail.gmail.com>
Subject: Re: [GIT PULL] vfs: Add support for timestamp limits
To: Alexander Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>
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
 Eric Van Hensbergen <ericvh@gmail.com>, Jan Kara <jack@suse.com>,
 reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Joel Becker <jlbec@evilplan.org>, aivazian.tigran@gmail.com,
 phillip@squashfs.org.uk, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel <ceph-devel@vger.kernel.org>,
 trond.myklebust@hammerspace.com, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
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
 Anna Schumaker <anna.schumaker@netapp.com>
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

Adding the others who were on original cc, just in case.
- Deepa

On Wed, Aug 28, 2019 at 9:12 PM Deepa Dinamani <deepa.kernel@gmail.com> wrote:
>
> Hi Al, Arnd,
>
> This is a pull request for filling in min and max timestamps for filesystems.
> I've added all the acks, and dropped the adfs patch. That will be merged through
> Russell's tree.
>
> Thanks,
> Deepa
>
> The following changes since commit 5d18cb62218608a1388858880ad3ec76d6cb0d3b:
>
>   Add linux-next specific files for 20190828 (2019-08-28 19:59:14 +1000)
>
> are available in the Git repository at:
>
>   https://github.com/deepa-hub/vfs limits
>
> for you to fetch changes up to f0f216afa4c7e4dee9121fde52ccf57f76119188:
>
>   isofs: Initialize filesystem timestamp ranges (2019-08-28 19:19:36 -0700)
>
> ----------------------------------------------------------------
> Deepa Dinamani (19):
>       vfs: Add file timestamp range support
>       vfs: Add timestamp_truncate() api
>       timestamp_truncate: Replace users of timespec64_trunc
>       mount: Add mount warning for impending timestamp expiry
>       utimes: Clamp the timestamps before update
>       fs: Fill in max and min timestamps in superblock
>       9p: Fill min and max timestamps in sb
>       ext4: Initialize timestamps limits
>       fs: nfs: Initialize filesystem timestamp ranges
>       fs: cifs: Initialize filesystem timestamp ranges
>       fs: fat: Initialize filesystem timestamp ranges
>       fs: affs: Initialize filesystem timestamp ranges
>       fs: sysv: Initialize filesystem timestamp ranges
>       fs: ceph: Initialize filesystem timestamp ranges
>       fs: orangefs: Initialize filesystem timestamp ranges
>       fs: hpfs: Initialize filesystem timestamp ranges
>       fs: omfs: Initialize filesystem timestamp ranges
>       pstore: fs superblock limits
>       isofs: Initialize filesystem timestamp ranges
>
>  fs/9p/vfs_super.c        |  6 +++++-
>  fs/affs/amigaffs.c       |  2 +-
>  fs/affs/amigaffs.h       |  3 +++
>  fs/affs/inode.c          |  4 ++--
>  fs/affs/super.c          |  4 ++++
>  fs/attr.c                | 21 ++++++++++++---------
>  fs/befs/linuxvfs.c       |  2 ++
>  fs/bfs/inode.c           |  2 ++
>  fs/ceph/super.c          |  2 ++
>  fs/cifs/cifsfs.c         | 22 ++++++++++++++++++++++
>  fs/cifs/netmisc.c        | 14 +++++++-------
>  fs/coda/inode.c          |  3 +++
>  fs/configfs/inode.c      | 12 ++++++------
>  fs/cramfs/inode.c        |  2 ++
>  fs/efs/super.c           |  2 ++
>  fs/ext2/super.c          |  2 ++
>  fs/ext4/ext4.h           | 10 +++++++++-
>  fs/ext4/super.c          | 17 +++++++++++++++--
>  fs/f2fs/file.c           | 21 ++++++++++++---------
>  fs/fat/inode.c           | 12 ++++++++++++
>  fs/freevxfs/vxfs_super.c |  2 ++
>  fs/hpfs/hpfs_fn.h        |  6 ++----
>  fs/hpfs/super.c          |  2 ++
>  fs/inode.c               | 33 ++++++++++++++++++++++++++++++++-
>  fs/isofs/inode.c         |  7 +++++++
>  fs/jffs2/fs.c            |  3 +++
>  fs/jfs/super.c           |  2 ++
>  fs/kernfs/inode.c        |  7 +++----
>  fs/minix/inode.c         |  2 ++
>  fs/namespace.c           | 33 ++++++++++++++++++++++++++++++++-
>  fs/nfs/super.c           | 20 +++++++++++++++++++-
>  fs/ntfs/inode.c          | 21 ++++++++++++---------
>  fs/omfs/inode.c          |  4 ++++
>  fs/orangefs/super.c      |  2 ++
>  fs/pstore/ram.c          |  2 ++
>  fs/qnx4/inode.c          |  2 ++
>  fs/qnx6/inode.c          |  2 ++
>  fs/reiserfs/super.c      |  3 +++
>  fs/romfs/super.c         |  2 ++
>  fs/squashfs/super.c      |  2 ++
>  fs/super.c               |  2 ++
>  fs/sysv/super.c          |  5 ++++-
>  fs/ubifs/file.c          | 21 ++++++++++++---------
>  fs/ufs/super.c           |  7 +++++++
>  fs/utimes.c              |  6 ++----
>  fs/xfs/xfs_super.c       |  2 ++
>  include/linux/fs.h       |  5 +++++
>  include/linux/time64.h   |  2 ++
>  48 files changed, 298 insertions(+), 72 deletions(-)

