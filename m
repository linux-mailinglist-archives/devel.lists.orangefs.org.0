Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id C329AA467C
	for <lists+devel-orangefs@lfdr.de>; Sun,  1 Sep 2019 00:51:02 +0200 (CEST)
Received: from [::1] (port=36864 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1i4CCz-0005VE-GU
	for lists+devel-orangefs@lfdr.de; Sat, 31 Aug 2019 18:51:01 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:39461)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <deepa.kernel@gmail.com>)
 id 1i4CCz-0005Up-3D
 for devel@lists.orangefs.org; Sat, 31 Aug 2019 18:51:01 -0400
Received: by mail-io1-f67.google.com with SMTP id d25so19319649iob.6
 for <devel@lists.orangefs.org>; Sat, 31 Aug 2019 15:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1oc+uIAZAMYuOvhDPlikaVjREiDzvlKPCeE4Nt1ZrJE=;
 b=aXcTp5ORUJ9v6lvzIgnO3kFSbLpXDiwrjmF8wY+g2guepKA06q9bi3Rm9msLfVfOjQ
 KNRvWmw8ak6S3NwzAdmSxBIeG1Sb4eSNm5e0ZjmAgk9ZlM4k21SSALJLCNoiAvHUizK4
 zOmrFrhQJgVIgE1sjux3jaSKnzRaF/6H90IkDMl/BMTaq8C/TCYMXEN7O4ZJQQtSqb0a
 GFuX6/WoU+ZaNaNKXJ3mYccQ7I8pJ4ma0YPOCysvVSCuZ0omHUn2dF26yyXMeNNj0vzq
 AXHMjcuekyx7LGzDWacrH+K9/2E8bcBn8KFkWIoTNCkGetG/vTsXGmlPsdXHkSwFh3F/
 GYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1oc+uIAZAMYuOvhDPlikaVjREiDzvlKPCeE4Nt1ZrJE=;
 b=X+XeYgIAh70YLSEQ7zJBIps+t62wdIHnkjI9NnDeGwHVcD1lcG0Siy2VTyO4KK4dwm
 m8I6sq+Vw7wjwjarBGl2xXJwU+GHR9Xaa1p5L5Z0teyZXWApYvAuv4ODgVg/4NtIMrZu
 J61iUU7VWpAPzvslfVqm8kvbleEKMywvzHCbdx39qF+28qZ34k/C2U/+XPJnv1qBvV1B
 jZ2YaO7+2hy74dk6v++dWMJw2VncxolTBgQYe0QYqUTEEnPeNRY8UFLO2DFDrPORXgYg
 YJJ3y0RWx2TmHWGoQWkJ0K2maD8ehoO9hKeUpoF0taJIvUZKMwHf8yH6wVf21cI4TwKz
 i+DA==
X-Gm-Message-State: APjAAAWwtrvM9r+/B+/Oi0KZt6O0iH9XZumTBjPcFGzHC7bqwVYBA+rU
 ZLaDgYVJRk22g74XYp2mRlkYvnfiMeMZYfU+ie0=
X-Google-Smtp-Source: APXvYqyTRG8TWby1CMDSb8c+t9UhDYnpFv7cJIBGTaHwW7d+/cTfJvK+wGxNxwIJlNTmqmGSFTPf1WR9NOkPmivvWCA=
X-Received: by 2002:a02:904d:: with SMTP id y13mr12652386jaf.139.1567291820141; 
 Sat, 31 Aug 2019 15:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190829041132.26677-1-deepa.kernel@gmail.com>
 <CABeXuvoKD83B7iUqE33Y9E2OVtf61DKv-swZr-N=ozz-cMmGOA@mail.gmail.com>
 <CAOg9mSR25eAH7e1KhDZt_uscJSzyuSmELbCxgyh=-KWRxjZtcw@mail.gmail.com>
 <CABeXuvpe9vADLZUr4zHrH0izt=1BaLQvBMxAu=T1A2CV3AN4vA@mail.gmail.com>
 <CAK8P3a0NMUv2xOw=fCxJXo_2wbmBMG24Fst3U1LT-m7C8uxz0w@mail.gmail.com>
In-Reply-To: <CAK8P3a0NMUv2xOw=fCxJXo_2wbmBMG24Fst3U1LT-m7C8uxz0w@mail.gmail.com>
From: Deepa Dinamani <deepa.kernel@gmail.com>
Date: Sat, 31 Aug 2019 15:50:08 -0700
Message-ID: <CABeXuvrm76iKnFrd7Wo=z4d0v7i7xT+Ta37D-mwVwy7-P3YyUg@mail.gmail.com>
Subject: Re: [GIT PULL] vfs: Add support for timestamp limits
To: Arnd Bergmann <arnd@arndb.de>
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
 Dave Kleikamp <shaggy@kernel.org>, Anders Larsen <al@alarsen.net>,
 Chao Yu <yuchao0@huawei.com>, Bob Copeland <me@bobcopeland.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, mikulas@artax.karlin.mff.cuni.cz,
 stoph Hellwig <hch@lst.de>, Nicolas Pitre <nico@fluxnic.net>,
 linux-cifs@vger.kernel.org, "Yan, Zheng" <zyan@redhat.com>,
 Sage Weil <sage@redhat.com>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Richard Weinberger <richard@nod.at>, Steve French <sfrench@samba.org>,
 Anton Vorontsov <anton@enomsg.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, codalist@coda.cs.cmu.edu,
 Christoph Hellwig <hch@infradead.org>, coda@cs.cmu.edu,
 V9FS Developers <v9fs-developer@lists.sourceforge.net>,
 Ilya Dryomov <idryomov@gmail.com>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>, salah.triki@gmail.com,
 asmadeus@codewreck.org, devel@lists.orangefs.org,
 Evgeniy Dushistov <dushistov@mail.ru>, Kees Cook <keescook@chromium.org>,
 Eric Van Hensbergen <ericvh@gmail.com>, Jan Kara <jack@suse.com>,
 reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, aivazian.tigran@gmail.com,
 phillip@squashfs.org.uk, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel <ceph-devel@vger.kernel.org>,
 trond.myklebust@hammerspace.com, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Dilger <adilger@dilger.ca>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-ntfs-dev@lists.sourceforge.net,
 Greg KH <gregkh@linuxfoundation.org>, linux-karma-devel@lists.sourceforge.net,
 Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs <linux-xfs@vger.kernel.org>, Colin Cross <ccross@android.com>,
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

> I think it's unclear from the orangefs source code what the intention is,
> as there is a mixed of signed and unsigned types used for the inode
> stamps:
>
> #define encode_PVFS_time encode_int64_t
> #define encode_int64_t(pptr,x) do { \
>     *(int64_t*) *(pptr) = cpu_to_le64(*(x)); \
>     *(pptr) += 8; \
> } while (0)
> #define decode_PVFS_time decode_int64_t
> #define decode_int64_t(pptr,x) do { \
>     *(x) = le64_to_cpu(*(int64_t*) *(pptr)); \
>     *(pptr) += 8; \
> } while (0)
>
> This suggests that making it unsigned may have been an accident.
>
> Then again,  it's clearly and consistently printed as unsigned in
> user space:
>
>         gossip_debug(
>             GOSSIP_GETATTR_DEBUG, " VERSION is %llu, mtime is %llu\n",
>             llu(s_op->attr.mtime), llu(resp_attr->mtime));

I think I had noticed these two and decided maybe the intention was to
use unsigned types.

> A related issue I noticed is this:
>
> PVFS_time PINT_util_mktime_version(PVFS_time time)
> {
>     struct timeval t = {0,0};
>     PVFS_time version = (time << 32);
>
>     gettimeofday(&t, NULL);
>     version |= (PVFS_time)t.tv_usec;
>     return version;
> }
> PVFS_time PINT_util_mkversion_time(PVFS_time version)
> {
>     return (PVFS_time)(version >> 32);
> }
> static PINT_sm_action getattr_verify_attribs(
>         struct PINT_smcb *smcb, job_status_s *js_p)
> {
> ...
>     resp_attr->mtime = PINT_util_mkversion_time(s_op->attr.mtime);
> ...
> }
>
> which suggests that at least for some purposes, the mtime field
> is only an unsigned 32-bit number (1970..2106). From my readiing,
> this affects the on-disk format, but not the protocol implemented
> by the kernel.
>
> atime and ctime are apparently 64-bit, but mtime is only 32-bit
> seconds, plus a 32-bit 'version'. I suppose the server could be
> fixed to allow a larger range, but probably would take it out of
> the 'version' bits, not the upper half.

I had missed this part. Thanks.

> To be on the safe side, I suppose the kernel can only assume
> an unsigned 32-bit range to be available. If the server gets
> extended beyond that, it would have to pass a feature flag.

This makes sense to me also. And, as Arnd pointed out on the IRC, if
there are negative timestamps that are already in use, this will be a
problem for those use cases.
I can update tha patch to use limits 0-u32_max.

-Deepa

