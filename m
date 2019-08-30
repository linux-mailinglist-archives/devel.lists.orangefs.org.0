Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AE7A3AEF
	for <lists+devel-orangefs@lfdr.de>; Fri, 30 Aug 2019 17:49:18 +0200 (CEST)
Received: from [::1] (port=45516 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1i3j9J-0001sT-LN
	for lists+devel-orangefs@lfdr.de; Fri, 30 Aug 2019 11:49:17 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34126)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <deepa.kernel@gmail.com>)
 id 1i3j9I-0001s2-S1
 for devel@lists.orangefs.org; Fri, 30 Aug 2019 11:49:16 -0400
Received: by mail-pg1-f196.google.com with SMTP id n9so3760174pgc.1
 for <devel@lists.orangefs.org>; Fri, 30 Aug 2019 08:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4oHQ/J6gD7m5a2hZJIzg30k30/iTJHkHY5qB+o+D4cE=;
 b=h7oWCY6wHIupyilklhVw3zKKmS4N6rNYStKFd6M4mXY2zoBod9UZ8VCkDGXpvOwPEx
 y0aASnlb2KjG+wF+/aUT2biKn+NEObcgE8m7DGPrZYueZa0oebuiKl0kXOBZW/YvAFgG
 wiNfxFX1BU+QMvruLmfNr9RwuUgTVgZhni7EzWpQBGg9w69s5GjxRS3CR8rDUkEmFDvX
 StbzvePxJ6JAeogsEcWDy1lOLEazKGBM7XSWMidYvC4oTqL+OIaD7n27qxye/p6T0bld
 MAh4tx6oguKUb4RPv6qhdVfxJi3jyYGLfFoX32P7ntEtN8+5CPxBMCDh7sUKz71y0419
 8ZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4oHQ/J6gD7m5a2hZJIzg30k30/iTJHkHY5qB+o+D4cE=;
 b=GRvb9nQiu4He9FWlDiWSbkJty6drQgD7qmjTjnCHut1Jw7w0hvYvTkOIjlThOjf8WY
 xXSkWnFPIJFwt5ITtgNvMwZjxt7kPiS8001vpM0Q63seofKAOBEVrZDsgsQYNEunLvtf
 BbcriDXlrqVMp5/l0RlwCZyFGhUVSzpbhYxj/mGXK3LZE3eT0hRuXGwpMmSWFVFS9flH
 jHZWeBuH1VV6AdIzxymNfciXu9CO2XD4TjXE9bVYdsD8nxx85Alv9tGrjTx2Th8/Mx64
 m7emelBkQU6QxRfpinIKlax6wLH917ewoInghteifgJoQ+UvikTQQJ7g7mNbwz01SDkQ
 FN6w==
X-Gm-Message-State: APjAAAWwEWzSw6QfCsIo5GcpEboR2oQegpSJwDqD9yyzEjoCxp/mimMQ
 EPMB344cfc7/SYTJDZjMZ/g=
X-Google-Smtp-Source: APXvYqw+TTjvl6C13mK+Kx+U+c7BoLzOucbYEU3GqDfQjm5bxaW7IFfh1q/TNPR40tNdaKG3mocNEw==
X-Received: by 2002:a17:90a:c386:: with SMTP id
 h6mr16090687pjt.122.1567180114546; 
 Fri, 30 Aug 2019 08:48:34 -0700 (PDT)
Received: from deepa-ubuntu.lan (c-98-234-52-230.hsd1.ca.comcast.net.
 [98.234.52.230])
 by smtp.gmail.com with ESMTPSA id z28sm8093085pfj.74.2019.08.30.08.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2019 08:48:33 -0700 (PDT)
From: Deepa Dinamani <deepa.kernel@gmail.com>
To: arnd@arndb.de,
	viro@zeniv.linux.org.uk
Subject: [GIT PULL RESEND] vfs: Add support for timestamp limits
Date: Fri, 30 Aug 2019 08:47:44 -0700
Message-Id: <20190830154744.4868-1-deepa.kernel@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAK8P3a1XjOMpuS12Xao1xqOLFOuz1Jb8dTAfrhLcE643sSkC5g@mail.gmail.com>
References: <CAK8P3a1XjOMpuS12Xao1xqOLFOuz1Jb8dTAfrhLcE643sSkC5g@mail.gmail.com>
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
Cc: lucho@ionkov.net, jfs-discussion@lists.sourceforge.net, shaggy@kernel.org,
 al@alarsen.net, yuchao0@huawei.com, me@bobcopeland.com,
 adrian.hunter@intel.com, linux-mtd@lists.infradead.org, deepa.kernel@gmail.com,
 mikulas@artax.karlin.mff.cuni.cz, hch@lst.de, nico@fluxnic.net,
 linux-cifs@vger.kernel.org, zyan@redhat.com, sage@redhat.com,
 darrick.wong@oracle.com, y2038@lists.linaro.org, richard@nod.at,
 sfrench@samba.org, anton@enomsg.org, linux@armlinux.org.uk,
 codalist@coda.cs.cmu.edu, hch@infradead.org, coda@cs.cmu.edu,
 v9fs-developer@lists.sourceforge.net, idryomov@gmail.com,
 linux-ext4@vger.kernel.org, salah.triki@gmail.com, asmadeus@codewreck.org,
 devel@lists.orangefs.org, dushistov@mail.ru, keescook@chromium.org,
 ericvh@gmail.com, jack@suse.com, reiserfs-devel@vger.kernel.org, tj@kernel.org,
 jlbec@evilplan.org, aivazian.tigran@gmail.com, dsterba@suse.com,
 jaegeuk@kernel.org, ceph-devel@vger.kernel.org,
 trond.myklebust@hammerspace.com, hirofumi@mail.parknet.co.jp,
 adilger@dilger.ca, jaharkes@cs.cmu.edu, linux-nfs@vger.kernel.org,
 tony.luck@intel.com, tytso@mit.edu, luisbg@kernel.org, dedekind1@gmail.com,
 linux-ntfs-dev@lists.sourceforge.net, gregkh@linuxfoundation.org,
 linux-karma-devel@lists.sourceforge.net, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, ccross@android.com, linux-fsdevel@vger.kernel.org,
 phillip@squashfs.org.uk, dwmw2@infradead.org, anna.schumaker@netapp.com
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

[resending, rebased onto linux v5.3-rc6, and dropped orangefs patch from the series]

Hi Al, Arnd,

This is a pull request for filling in min and max timestamps for filesystems.
I've added all the acks, and dropped the adfs patch. That will be merged through
Russell's tree.

Dropped orangefs until the maintainers decide what its limits should be.

The following changes since commit a55aa89aab90fae7c815b0551b07be37db359d76:

  Linux 5.3-rc6 (2019-08-25 12:01:23 -0700)

are available in the Git repository at:

  https://github.com/deepa-hub/vfs limits

for you to fetch changes up to 5ad32b3acded06183f40806f76b030c3143017bb:

  isofs: Initialize filesystem timestamp ranges (2019-08-30 08:11:25 -0700)

----------------------------------------------------------------

- Deepa

Deepa Dinamani (18):
      vfs: Add file timestamp range support
      vfs: Add timestamp_truncate() api
      timestamp_truncate: Replace users of timespec64_trunc
      mount: Add mount warning for impending timestamp expiry
      utimes: Clamp the timestamps before update
      fs: Fill in max and min timestamps in superblock
      9p: Fill min and max timestamps in sb
      ext4: Initialize timestamps limits
      fs: nfs: Initialize filesystem timestamp ranges
      fs: cifs: Initialize filesystem timestamp ranges
      fs: fat: Initialize filesystem timestamp ranges
      fs: affs: Initialize filesystem timestamp ranges
      fs: sysv: Initialize filesystem timestamp ranges
      fs: ceph: Initialize filesystem timestamp ranges
      fs: hpfs: Initialize filesystem timestamp ranges
      fs: omfs: Initialize filesystem timestamp ranges
      pstore: fs superblock limits
      isofs: Initialize filesystem timestamp ranges

 fs/9p/vfs_super.c        |  6 +++++-
 fs/affs/amigaffs.c       |  2 +-
 fs/affs/amigaffs.h       |  3 +++
 fs/affs/inode.c          |  4 ++--
 fs/affs/super.c          |  4 ++++
 fs/attr.c                | 21 ++++++++++++---------
 fs/befs/linuxvfs.c       |  2 ++
 fs/bfs/inode.c           |  2 ++
 fs/ceph/super.c          |  2 ++
 fs/cifs/cifsfs.c         | 22 ++++++++++++++++++++++
 fs/cifs/netmisc.c        | 14 +++++++-------
 fs/coda/inode.c          |  3 +++
 fs/configfs/inode.c      | 12 ++++++------
 fs/cramfs/inode.c        |  2 ++
 fs/efs/super.c           |  2 ++
 fs/ext2/super.c          |  2 ++
 fs/ext4/ext4.h           | 10 +++++++++-
 fs/ext4/super.c          | 17 +++++++++++++++--
 fs/f2fs/file.c           | 21 ++++++++++++---------
 fs/fat/inode.c           | 12 ++++++++++++
 fs/freevxfs/vxfs_super.c |  2 ++
 fs/hpfs/hpfs_fn.h        |  6 ++----
 fs/hpfs/super.c          |  2 ++
 fs/inode.c               | 33 ++++++++++++++++++++++++++++++++-
 fs/isofs/inode.c         |  7 +++++++
 fs/jffs2/fs.c            |  3 +++
 fs/jfs/super.c           |  2 ++
 fs/kernfs/inode.c        |  7 +++----
 fs/minix/inode.c         |  2 ++
 fs/namespace.c           | 33 ++++++++++++++++++++++++++++++++-
 fs/nfs/super.c           | 20 +++++++++++++++++++-
 fs/ntfs/inode.c          | 21 ++++++++++++---------
 fs/omfs/inode.c          |  4 ++++
 fs/pstore/ram.c          |  2 ++
 fs/qnx4/inode.c          |  2 ++
 fs/qnx6/inode.c          |  2 ++
 fs/reiserfs/super.c      |  3 +++
 fs/romfs/super.c         |  2 ++
 fs/squashfs/super.c      |  2 ++
 fs/super.c               |  2 ++
 fs/sysv/super.c          |  5 ++++-
 fs/ubifs/file.c          | 21 ++++++++++++---------
 fs/ufs/super.c           |  7 +++++++
 fs/utimes.c              |  6 ++----
 fs/xfs/xfs_super.c       |  2 ++
 include/linux/fs.h       |  5 +++++
 include/linux/time64.h   |  2 ++
 47 files changed, 296 insertions(+), 72 deletions(-)

