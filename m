Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C49D95CDF
	for <lists+devel-orangefs@lfdr.de>; Tue, 20 Aug 2019 13:06:00 +0200 (CEST)
Received: from [::1] (port=42900 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1i01xf-0006jb-Hw
	for lists+devel-orangefs@lfdr.de; Tue, 20 Aug 2019 07:05:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:40978)
 by mm1.emwd.com with esmtps (TLSv1.2:AECDH-AES256-SHA:256)
 (Exim 4.92) (envelope-from <jlayton@kernel.org>) id 1i01xd-0006j2-Vg
 for devel@lists.orangefs.org; Tue, 20 Aug 2019 07:05:58 -0400
Received: from tleilax.poochiereds.net
 (68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EFF55205C9;
 Tue, 20 Aug 2019 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566299116;
 bh=T0rmHh8w3H3bwdXLru7KFY2A/8hjJcNt2eMc9MdFvoU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=OWYdJNUzSee+UuIh6LQ3YFru0x6seE2TTCifysIDGNOjR8O4ScYkdj2Vrw5S/JeTB
 qmDzLYeDaoNBfNwX5IDihFikAWZqI1dzLhII85Qm3JJy6zIH2yIFue45EEMtXZPwcN
 fgzdH+WlULgP+SUhyw7NDBScX/I9XuZMIU+ITkEg=
Message-ID: <27d1943a0027cb4f658334fad8dc880df133c22d.camel@kernel.org>
Subject: Re: [PATCH v8 00/20] vfs: Add support for timestamp limits
From: Jeff Layton <jlayton@kernel.org>
To: Deepa Dinamani <deepa.kernel@gmail.com>, viro@zeniv.linux.org.uk, 
 linux-kernel@vger.kernel.org
Date: Tue, 20 Aug 2019 07:05:10 -0400
In-Reply-To: <20190818165817.32634-1-deepa.kernel@gmail.com>
References: <20190818165817.32634-1-deepa.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
 adilger.kernel@dilger.ca, mikulas@artax.karlin.mff.cuni.cz, hch@lst.de,
 nico@fluxnic.net, linux-cifs@vger.kernel.org, zyan@redhat.com, sage@redhat.com,
 darrick.wong@oracle.com, y2038@lists.linaro.org, richard@nod.at,
 sfrench@samba.org, anton@enomsg.org, codalist@coda.cs.cmu.edu,
 hch@infradead.org, coda@cs.cmu.edu, v9fs-developer@lists.sourceforge.net,
 idryomov@gmail.com, linux-ext4@vger.kernel.org, salah.triki@gmail.com,
 asmadeus@codewreck.org, devel@lists.orangefs.org, dushistov@mail.ru,
 keescook@chromium.org, arnd@arndb.de, ericvh@gmail.com, jack@suse.com,
 reiserfs-devel@vger.kernel.org, tj@kernel.org, jlbec@evilplan.org,
 aivazian.tigran@gmail.com, phillip@squashfs.org.uk, dsterba@suse.com,
 jaegeuk@kernel.org, ceph-devel@vger.kernel.org,
 trond.myklebust@hammerspace.com, hirofumi@mail.parknet.co.jp,
 jaharkes@cs.cmu.edu, linux-nfs@vger.kernel.org, tony.luck@intel.com,
 tytso@mit.edu, luisbg@kernel.org, dedekind1@gmail.com,
 linux-ntfs-dev@lists.sourceforge.net, gregkh@linuxfoundation.org,
 linux-karma-devel@lists.sourceforge.net, adrian.hunter@intel.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ccross@android.com, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org, anna.schumaker@netapp.com
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

On Sun, 2019-08-18 at 09:57 -0700, Deepa Dinamani wrote:
> The series is an update and a more complete version of the
> previously posted series at
> https://lore.kernel.org/linux-fsdevel/20180122020426.2988-1-deepa.kernel@gmail.com/
> 
> Thanks to Arnd Bergmann for doing a few preliminary reviews.
> They helped me fix a few issues I had overlooked.
> 
> The limits (sometimes granularity also) for the filesystems updated here are according to the
> following table:
> 
> File system   Time type                      Start year Expiration year Granularity
> cramfs        fixed                          0          0
> romfs         fixed                          0          0
> pstore        ascii seconds (27 digit ascii) S64_MIN    S64_MAX         1
> coda          INT64                          S64_MIN    S64_MAX         1
> omfs          64-bit milliseconds            0          U64_MAX/ 1000   NSEC_PER_MSEC
> befs          unsigned 48-bit seconds        0          0xffffffffffff  alloc_super
> bfs           unsigned 32-bit seconds        0          U32_MAX         alloc_super
> efs           unsigned 32-bit seconds        0          U32_MAX         alloc_super
> ext2          signed 32-bit seconds          S32_MIN    S32_MAX         alloc_super
> ext3          signed 32-bit seconds          S32_MIN    S32_MAX         alloc_super
> ext4 (old)    signed 32-bit seconds          S32_MIN    S32_MAX         alloc_super
> ext4 (extra)  34-bit seconds, 30-bit ns      S32_MIN    0x37fffffff	1
> freevxfs      u32 secs/usecs                 0          U32_MAX         alloc_super
> jffs2         unsigned 32-bit seconds        0          U32_MAX         alloc_super
> jfs           unsigned 32-bit seconds/ns     0          U32_MAX         1
> minix         unsigned 32-bit seconds        0          U32_MAX         alloc_super
> orangefs      u64 seconds                    0          U64_MAX         alloc_super
> qnx4          unsigned 32-bit seconds        0          U32_MAX         alloc_super
> qnx6          unsigned 32-bit seconds        0          U32_MAX         alloc_super
> reiserfs      unsigned 32-bit seconds        0          U32_MAX         alloc_super
> squashfs      unsigned 32-bit seconds        0          U32_MAX         alloc_super
> ufs1          signed 32-bit seconds          S32_MIN    S32_MAX         NSEC_PER_SEC
> ufs2          signed 64-bit seconds/u32 ns   S64_MIN    S64_MAX         1
> xfs           signed 32-bit seconds/ns       S32_MIN    S32_MAX         1
> ceph          unsigned 32-bit second/ns      0          U32_MAX         1000

Looks reasonable, overall.

Note that the granularity changed recently for cephfs. See commit
0f7cf80ae96c2a (ceph: initialize superblock s_time_gran to 1).

In any case, you can add my Acked-by

-- 
Jeff Layton <jlayton@kernel.org>


