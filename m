Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6BAA3883
	for <lists+devel-orangefs@lfdr.de>; Fri, 30 Aug 2019 15:59:35 +0200 (CEST)
Received: from [::1] (port=54128 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1i3hR8-0004Xj-K4
	for lists+devel-orangefs@lfdr.de; Fri, 30 Aug 2019 09:59:34 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:45695)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <arndbergmann@gmail.com>)
 id 1i3hR7-0004XC-Cc
 for devel@lists.orangefs.org; Fri, 30 Aug 2019 09:59:33 -0400
Received: by mail-qk1-f196.google.com with SMTP id m2so6145057qki.12
 for <devel@lists.orangefs.org>; Fri, 30 Aug 2019 06:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wZh0lrnnbveFd2ktjNoW+9Y7+KeLBrFI15hkdhrfg8w=;
 b=BCXz8llUgIGTBmYUYVr9O7jm9YZKt5UoDJmYQg4mxDpmiLtQkTaeMbgqvIzBMXWHJv
 sWV3IRjM+Pt0IhGt0Yj3GIO7HnI6h33iqoCn8D+CureVsP0KhHcrFLn682Y7N67wdtAj
 KN3phWLWIJWqte3ZMCY0L50TpgXjDII8oXRZV3jaEQvRdYxqx0LPlUvd1mWLtWW56ShV
 rmHlodegMH/xv/cu2i1MeN8L1uAWYua566jYgBcSXEM0kU6PZhF47Nz/XxVPcn8Q3KIT
 oyULsJt90SNceMBzGR17YFpSx4qMhiYheM7qBVLmJfvFZ3ImkCbvzscwNh3Wi2MT4IxI
 osOA==
X-Gm-Message-State: APjAAAUWPI1iOthM19aKw8NamKrs4LUmu99CQ0RXn3tCRb5JTamX14Ai
 TSiq3CLmzNseJiatF99/CbloONMkT0ziEK0n51U=
X-Google-Smtp-Source: APXvYqwLJSfUvFHYpnCbLtQwiLesqk6Up0F09OxCEWeJS/zvGXm8TGjLQauibK2uyX+MPGtGJJXtticB+OlivKMyzRQ=
X-Received: by 2002:a37:4b0d:: with SMTP id y13mr15306907qka.3.1567173532434; 
 Fri, 30 Aug 2019 06:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190829041132.26677-1-deepa.kernel@gmail.com>
 <CABeXuvoKD83B7iUqE33Y9E2OVtf61DKv-swZr-N=ozz-cMmGOA@mail.gmail.com>
 <CAOg9mSR25eAH7e1KhDZt_uscJSzyuSmELbCxgyh=-KWRxjZtcw@mail.gmail.com>
 <CABeXuvpe9vADLZUr4zHrH0izt=1BaLQvBMxAu=T1A2CV3AN4vA@mail.gmail.com>
In-Reply-To: <CABeXuvpe9vADLZUr4zHrH0izt=1BaLQvBMxAu=T1A2CV3AN4vA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 30 Aug 2019 15:58:35 +0200
Message-ID: <CAK8P3a0NMUv2xOw=fCxJXo_2wbmBMG24Fst3U1LT-m7C8uxz0w@mail.gmail.com>
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

On Fri, Aug 30, 2019 at 4:02 AM Deepa Dinamani <deepa.kernel@gmail.com> wrote:
> On Thu, Aug 29, 2019 at 6:20 PM Mike Marshall <hubcap@omnibond.com> wrote:
> >
> > Hi Deepa...
> >
> > I installed this patch series on top of Linux 5.3-rc6 and ran xfstests
> > on orangefs and got a regression... generic/258 failed
> > with: "Timestamp wrapped"...
> >
> > # cat results/generic/258.out.bad
> > QA output created by 258
> > Creating file with timestamp of Jan 1, 1960
> > Testing for negative seconds since epoch
> > Timestamp wrapped: 0
> > Timestamp wrapped
> > (see /home/hubcap/xfstests-dev/results//generic/258.full for details)
>
> Note that patch [16/20] https://lkml.org/lkml/2019/8/18/193 assumes
> that orangefs does not support negative timestamps.
> And, the reason was pointed out in the commit text:
>
> ----------------------
> Assume the limits as unsigned according to the below
> commit 98e8eef557a9 ("changed PVFS_time from int64_t to uint64_t")
> in https://github.com/waltligon/orangefs
>
> Author: Neill Miller <neillm@mcs.anl.gov>
> Date:   Thu Sep 2 15:00:38 2004 +0000
> --------------------
>
> So the timestamp being wrapped to 0 in this case is correct behavior
> according to my patchset.
> The generic/258 assumes that the timestamps can be negative. If this
> is not true then it should not be run for this fs.
>
> But, if you think the timestamp should support negative timestamps for
> orangefs, I'd be happy to change it.

I think it's unclear from the orangefs source code what the intention is,
as there is a mixed of signed and unsigned types used for the inode
stamps:

#define encode_PVFS_time encode_int64_t
#define encode_int64_t(pptr,x) do { \
    *(int64_t*) *(pptr) = cpu_to_le64(*(x)); \
    *(pptr) += 8; \
} while (0)
#define decode_PVFS_time decode_int64_t
#define decode_int64_t(pptr,x) do { \
    *(x) = le64_to_cpu(*(int64_t*) *(pptr)); \
    *(pptr) += 8; \
} while (0)

This suggests that making it unsigned may have been an accident.

Then again,  it's clearly and consistently printed as unsigned in
user space:

        gossip_debug(
            GOSSIP_GETATTR_DEBUG, " VERSION is %llu, mtime is %llu\n",
            llu(s_op->attr.mtime), llu(resp_attr->mtime));

A related issue I noticed is this:

PVFS_time PINT_util_mktime_version(PVFS_time time)
{
    struct timeval t = {0,0};
    PVFS_time version = (time << 32);

    gettimeofday(&t, NULL);
    version |= (PVFS_time)t.tv_usec;
    return version;
}
PVFS_time PINT_util_mkversion_time(PVFS_time version)
{
    return (PVFS_time)(version >> 32);
}
static PINT_sm_action getattr_verify_attribs(
        struct PINT_smcb *smcb, job_status_s *js_p)
{
...
    resp_attr->mtime = PINT_util_mkversion_time(s_op->attr.mtime);
...
}

which suggests that at least for some purposes, the mtime field
is only an unsigned 32-bit number (1970..2106). From my readiing,
this affects the on-disk format, but not the protocol implemented
by the kernel.

atime and ctime are apparently 64-bit, but mtime is only 32-bit
seconds, plus a 32-bit 'version'. I suppose the server could be
fixed to allow a larger range, but probably would take it out of
the 'version' bits, not the upper half.

To be on the safe side, I suppose the kernel can only assume
an unsigned 32-bit range to be available. If the server gets
extended beyond that, it would have to pass a feature flag.

     Arnd

