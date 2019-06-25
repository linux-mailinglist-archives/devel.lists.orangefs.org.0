Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE4655903
	for <lists+devel-orangefs@lfdr.de>; Tue, 25 Jun 2019 22:38:26 +0200 (CEST)
Received: from [::1] (port=37300 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hfsCv-0001Cp-LD
	for lists+devel-orangefs@lfdr.de; Tue, 25 Jun 2019 16:38:25 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34330)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <adilger@dilger.ca>) id 1hfsCt-0001Bx-Ld
 for devel@lists.orangefs.org; Tue, 25 Jun 2019 16:38:23 -0400
Received: by mail-pl1-f196.google.com with SMTP id i2so90202plt.1
 for <devel@lists.orangefs.org>; Tue, 25 Jun 2019 13:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dilger-ca.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=k9wVBI3MNSxJVQhODLuSRbOf+SmT1l1K5RRF5+DdhGM=;
 b=i0tlux+8FNEu0ugkEvUUlD4zKy+jo4LmPTngoA6r4KZwHDBk4l5v9aHPUQEnX49/5g
 z/5lU03hiGUesQ1zP/lPDO/M9fU515Y8oNEl0EKjwdC7dNyZmZQEQEJzGU548pSrAizw
 AlBCGdOUNg8gVK9FeesIiFWJzJ6YbgT5nrsBvzAUmh99yf7q8hQlgwIm8HPdOmToZugA
 nEmrM6blVwgyo7dN5eFPje1f1HwAtA+5XwodCP1ntkD5mvR/FwjSqB5AJn7YMTtfEeor
 5bhYLcubsCaGOlgF0onarHD40ER7JyKcO4a/eslTTHQKCN3GB1Tra4WgBV7T6KYa0chE
 ps9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=k9wVBI3MNSxJVQhODLuSRbOf+SmT1l1K5RRF5+DdhGM=;
 b=bpjirlTybiQHiUiB9NvSy41WAG2eHBFGNsFUXl/T7nw10QKNWazTLOyYqtfDrLrloo
 0SIbm4GCjwvhjTpAyRqfQQIXAh8VCUajaKK5uMWbYy0M8+Zm1mxM78kKdQLuUSAcFk/+
 66aCf0yqfLRyRH8wkSFQTsRS1cLBgrblrk4JHNdZCCJ3cMJjZKCsh0ojUcEJZA/p7WU4
 e/+vklgk5zAQK6sqtWUWOzl7qSJt6n+ZDEfzMOPnYYxMKA3iTncWGvbV+hz3LILQuLzu
 LhQXp8cECZKfQi7HXOI3tVaje3U84ZuXVA3m6mNjSxz0CvdM3+QlMyWfAb5jK0uP1dyM
 r7cg==
X-Gm-Message-State: APjAAAXz9burLfrnT9iPds/oymLIW5CCaF9mky7mZ1Kp4dxbi1qcJsI2
 DlxetkcQhD/p/pHmkPrWcyFEPA==
X-Google-Smtp-Source: APXvYqxrr/uL0yeWv0l0AFEkJ0fiuFxZszwvIRMBTgsPNJXwasc7ZXW/q9+Il/kiADkCo486i0NA9w==
X-Received: by 2002:a17:902:f216:: with SMTP id
 gn22mr690564plb.118.1561495062448; 
 Tue, 25 Jun 2019 13:37:42 -0700 (PDT)
Received: from cabot.adilger.ext (S0106a84e3fe4b223.cg.shawcable.net.
 [70.77.216.213])
 by smtp.gmail.com with ESMTPSA id m4sm4145961pff.108.2019.06.25.13.37.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 13:37:41 -0700 (PDT)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <E84C8EBC-8341-49E5-8EED-0980D158CD50@dilger.ca>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH v4 0/7] vfs: make immutable files actually immutable
Date: Tue, 25 Jun 2019 14:37:37 -0600
In-Reply-To: <20190625180326.GC2230847@magnolia>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
References: <156116141046.1664939.11424021489724835645.stgit@magnolia>
 <20190625103631.GB30156@infradead.org> <20190625180326.GC2230847@magnolia>
X-Mailer: Apple Mail (2.3273)
Content-Type: text/plain; charset="us-ascii"
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
Cc: linux-efi@vger.kernel.org, linux-btrfs <linux-btrfs@vger.kernel.org>,
 yuchao0@huawei.com, linux-mm <linux-mm@kvack.org>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, matthew.garrett@nebula.com,
 linux-nilfs@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>, devel@lists.orangefs.org,
 Josef Bacik <josef@toxicpanda.com>, reiserfs-devel@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, dsterba@suse.com,
 Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 ard.biesheuvel@linaro.org,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs <linux-xfs@vger.kernel.org>,
 jk@ozlabs.org, Jan Kara <jack@suse.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
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

On Jun 25, 2019, at 12:03 PM, Darrick J. Wong <darrick.wong@oracle.com> wrote:
> 
> On Tue, Jun 25, 2019 at 03:36:31AM -0700, Christoph Hellwig wrote:
>> On Fri, Jun 21, 2019 at 04:56:50PM -0700, Darrick J. Wong wrote:
>>> Hi all,
>>> 
>>> The chattr(1) manpage has this to say about the immutable bit that
>>> system administrators can set on files:
>>> 
>>> "A file with the 'i' attribute cannot be modified: it cannot be deleted
>>> or renamed, no link can be created to this file, most of the file's
>>> metadata can not be modified, and the file can not be opened in write
>>> mode."
>>> 
>>> Given the clause about how the file 'cannot be modified', it is
>>> surprising that programs holding writable file descriptors can continue
>>> to write to and truncate files after the immutable flag has been set,
>>> but they cannot call other things such as utimes, fallocate, unlink,
>>> link, setxattr, or reflink.
>> 
>> I still think living code beats documentation.  And as far as I can
>> tell the immutable bit never behaved as documented or implemented
>> in this series on Linux, and it originated on Linux.
> 
> The behavior has never been consistent -- since the beginning you can
> keep write()ing to a fd after the file becomes immutable, but you can't
> ftruncate() it.  I would really like to make the behavior consistent.
> Since the authors of nearly every new system call and ioctl since the
> late 1990s have interpreted S_IMMUTABLE to mean "immutable takes effect
> everywhere immediately" I resolved the inconsistency in favor of that
> interpretation.
> 
> I asked Ted what he thought that that userspace having the ability to
> continue writing to an immutable file, and he thought it was an
> implementation bug that had been there for 25 years.  Even he thought
> that immutable should take effect immediately everywhere.
> 
>> If you want  hard cut off style immutable flag it should really be a
>> new API, but I don't really see the point.  It isn't like the usual
>> workload is to set the flag on a file actively in use.
> 
> FWIW Ted also thought that since it's rare for admins to set +i on a
> file actively in use we could just change it without forcing everyone
> onto a new api.

On the flip side, it is possible to continue to write to an open fd
after removing the write permission, and this is a problem we've hit
in the real world with NFS export, so real applications do this.

It may be the same case with immutable files, where an application sets
the immutable flag immediately after creation, but continues to write
until it closes the file, so that the file can't be modified by other
processes, and there isn't a risk that the file is missing the immutable
flag if the writing process dies before setting it at the end.

Cheers, Andreas





-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 873 bytes
Desc: Message signed with OpenPGP
URL: <http://lists.orangefs.org/pipermail/devel_lists.orangefs.org/attachments/20190625/bbdf3c99/attachment.asc>
