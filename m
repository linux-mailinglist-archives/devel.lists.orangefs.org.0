Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id DB19AA3BE4
	for <lists+devel-orangefs@lfdr.de>; Fri, 30 Aug 2019 18:24:43 +0200 (CEST)
Received: from [::1] (port=53122 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1i3jhb-00040S-0J
	for lists+devel-orangefs@lfdr.de; Fri, 30 Aug 2019 12:24:43 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:44821)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <arndbergmann@gmail.com>)
 id 1i3jhY-000404-Pn
 for devel@lists.orangefs.org; Fri, 30 Aug 2019 12:24:40 -0400
Received: by mail-qt1-f193.google.com with SMTP id 44so8152635qtg.11
 for <devel@lists.orangefs.org>; Fri, 30 Aug 2019 09:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B6+OAXXxl2dEgnQY4Uq2+qZqkvaxmBKnbK7dC2TYwZ0=;
 b=GzxNqARdpw2NjKtI78od7CDpSeT9NdGZSfBBSVbWZFOMEDDgRWw13A5KfmtvoRvI7g
 6OL/3Q/o8VqtdDo9PJgPZ04rDSmv1KZHOyGWkxgbxRsBzp0rtvEU/ZxffVW6Z2mpuodX
 dDrx/74ll4TdW8A71O3NDF+h/7IgdNpQdfOwBRJsFqBnq3zvmrnn3AUpGI4Ugu3jvR15
 1qmxkIgH9wSilMpegAuVSzgRmE893VtDi7Ff2eSv5xYEWD67VM9ONRPopFOmsPUHdrgt
 GCD2hhU7CzNO78vP5Xl36oPxYKDW0zqXVcsvssHUaszDbSQCbqyZk4COtsxO/zyr/GHc
 ntFQ==
X-Gm-Message-State: APjAAAXSVsu8dMyNvWI0KakdrMjsWD73I6yTITReqmyryN3s/7haqX7e
 hCQmTx91oa5zeJKY1iZwOD5LX+dmgIyUVVgsBkE=
X-Google-Smtp-Source: APXvYqx1Qvswft0K3BgJsYOtSdZQVwjHx2AQF9skYad3Rr5MY9B9bcWDDXL/X1Cpj9GrJMiBQ1QnvNUru+BTr0FLkYc=
X-Received: by 2002:ac8:5306:: with SMTP id t6mr2652509qtn.204.1567182239864; 
 Fri, 30 Aug 2019 09:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1XjOMpuS12Xao1xqOLFOuz1Jb8dTAfrhLcE643sSkC5g@mail.gmail.com>
 <20190830154744.4868-1-deepa.kernel@gmail.com>
In-Reply-To: <20190830154744.4868-1-deepa.kernel@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 30 Aug 2019 18:23:43 +0200
Message-ID: <CAK8P3a3WUmeewmNscdKpUf3fB3eLV1X=YdLQt8cvS_tqq7OroQ@mail.gmail.com>
Subject: Re: [GIT PULL RESEND] vfs: Add support for timestamp limits
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
 linux-mtd <linux-mtd@lists.infradead.org>, mikulas@artax.karlin.mff.cuni.cz,
 Christoph Hellwig <hch@lst.de>, Nicolas Pitre <nico@fluxnic.net>,
 linux-cifs@vger.kernel.org, Zheng Yan <zyan@redhat.com>,
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
 Al Viro <viro@zeniv.linux.org.uk>, aivazian.tigran@gmail.com,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel <ceph-devel@vger.kernel.org>, trond.myklebust@hammerspace.com,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Dilger <adilger@dilger.ca>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-ntfs-dev@lists.sourceforge.net,
 gregkh <gregkh@linuxfoundation.org>, linux-karma-devel@lists.sourceforge.net,
 Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs <linux-xfs@vger.kernel.org>, Colin Cross <ccross@android.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 phillip@squashfs.org.uk, David Woodhouse <dwmw2@infradead.org>,
 "Anna.Schumaker@Netapp.com" <anna.schumaker@netapp.com>,
 Joel Becker <jlbec@evilplan.org>
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

On Fri, Aug 30, 2019 at 5:48 PM Deepa Dinamani <deepa.kernel@gmail.com> wrote:
>
> [resending, rebased onto linux v5.3-rc6, and dropped orangefs patch from the series]
>
> Hi Al, Arnd,
>
> This is a pull request for filling in min and max timestamps for filesystems.
> I've added all the acks, and dropped the adfs patch. That will be merged through
> Russell's tree.
>
> Dropped orangefs until the maintainers decide what its limits should be.

I've merged this into my
git://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git y2038
branch. Since you did not include a tag description, I took the text from
the last patch series as the commit text, with a link to the pull request
on lore.kernel.org.

Al, let me know in case you have any objections to this going through
the y2038 branch, and you would rather take it through vfs.git.

     Arnd

