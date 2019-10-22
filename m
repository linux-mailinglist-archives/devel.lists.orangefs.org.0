Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 757ECE0E15
	for <lists+devel-orangefs@lfdr.de>; Wed, 23 Oct 2019 00:14:56 +0200 (CEST)
Received: from [::1] (port=58562 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1iN2QZ-00059G-5a
	for lists+devel-orangefs@lfdr.de; Tue, 22 Oct 2019 18:14:55 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:32961)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <adilger@dilger.ca>) id 1iN2QX-00058j-4m
 for devel@lists.orangefs.org; Tue, 22 Oct 2019 18:14:53 -0400
Received: by mail-pf1-f193.google.com with SMTP id c184so1998664pfb.0
 for <devel@lists.orangefs.org>; Tue, 22 Oct 2019 15:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dilger-ca.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=jdSjvTdb7YhhV+yeBoGT2uoOFpXOTdsEt8mUL1v5JjU=;
 b=XIkqrxaAVGv4cKdfDL9k/xAlmXBfmv2xaqBwDFkiO+RuiaJ/qx8Qv68C18O/MO1irW
 Cy3Vn+tIJxOtFj8DY52CQH0sqz1B3iiTZccOjh0yUYyHLsKbUqIOJZkP1hpBi5FJn608
 BEKbvyyNE55qhvNvrbZH2IZmNn1WRfEs8EFa630Z7qZk27nOSVksTd9wxV/XGh89QoMm
 Za0X342Laxsi4tJ3eJWdVY07aJeei3nhk9yeONMbDuwXBHxa9DmHFXabN91oSXoIjD1+
 8erSnFeO/EhdCZAlrBE7LptFLs02TiPVVGY+Laj64nj95GyisCNv2t0bm1swjOyHxZ8j
 6L/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=jdSjvTdb7YhhV+yeBoGT2uoOFpXOTdsEt8mUL1v5JjU=;
 b=BNN5R/pCy7RGzOndyVq/95fm6ER4PbfZ/ufRjjtzjDILLeP5pUwmB8Zup6dQli6VdO
 +YULvMQBg3jE+8Cgmn0Gqu/guQmr7CPFoma7y/MYdl9mIwYFps+jsYW7b1VvY08rA0Lq
 aSkykhj4F1VOU9dWgYvnmRlRmNU0mzBklBZcMsG9TXmNSH1XTtpYlPQkWaSKqXCUDLSY
 4pKaCZRfFALmgr9TTpH6fyIzctZ4oxjdLnmIi2H6C0dE9wUpIJkh8Hq4M4M7lyzcGy4v
 d9lXN3TzV1Ea+2xjJgQ/EkNkMcGfklx+dUgHcouNvsa90uZz4hIXMHkZhL7m/+2Futhh
 8+Ug==
X-Gm-Message-State: APjAAAUSeOqREQusY2BvlUYho4HEuY+NGEtWNHHVTpUCjjMuTYirBo4U
 52zibbsn4e5kvb8XX989GUGG8A==
X-Google-Smtp-Source: APXvYqyCGFGpT2C3cY7XT0d1Dal+bVUH3K7BRELFdnAX59mbUm04n1z8zWdaK4LGbMaAkUt/N9526w==
X-Received: by 2002:a17:90a:a60f:: with SMTP id
 c15mr7467310pjq.18.1571782451665; 
 Tue, 22 Oct 2019 15:14:11 -0700 (PDT)
Received: from cabot-wlan.adilger.int (S0106a84e3fe4b223.cg.shawcable.net.
 [70.77.216.213])
 by smtp.gmail.com with ESMTPSA id r24sm21302038pfh.69.2019.10.22.15.13.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Oct 2019 15:14:10 -0700 (PDT)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <8CE5B6E8-DCB7-4F0B-91C1-48030947F585@dilger.ca>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH v14 1/5] Add flags option to get xattr method paired to
 __vfs_getxattr
Date: Tue, 22 Oct 2019 16:13:53 -0600
In-Reply-To: <20191022204453.97058-2-salyzyn@android.com>
To: Mark Salyzyn <salyzyn@android.com>
References: <20191022204453.97058-1-salyzyn@android.com>
 <20191022204453.97058-2-salyzyn@android.com>
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Hugh Dickins <hughd@google.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 James Morris <jmorris@namei.org>, devel@lists.orangefs.org,
 Eric Van Hensbergen <ericvh@gmail.com>, Joel Becker <jlbec@evilplan.org>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jan Kara <jack@suse.com>, Casey Schaufler <casey@schaufler-ca.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Kleikamp <shaggy@kernel.org>,
 linux-doc@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, CIFS <linux-cifs@vger.kernel.org>,
 Paul Moore <paul@paul-moore.com>, "Darrick J . Wong" <darrick.wong@oracle.com>,
 Eric Sandeen <sandeen@sandeen.net>, kernel-team@android.com,
 Chao Yu <chao@kernel.org>, selinux@vger.kernel.org,
 Brian Foster <bfoster@redhat.com>, reiserfs-devel@vger.kernel.org,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, linux-f2fs-devel@lists.sourceforge.net,
 Benjamin Coddington <bcodding@redhat.com>, linux-integrity@vger.kernel.org,
 Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
 linux-afs@lists.infradead.org, Miklos Szeredi <miklos@szeredi.hu>,
 Ilya Dryomov <idryomov@gmail.com>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Stephen Smalley <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>,
 Eric Paris <eparis@parisplace.org>, ceph-devel <ceph-devel@vger.kernel.org>,
 Gao Xiang <xiang@kernel.org>, linux-nfs <linux-nfs@vger.kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 samba-technical <samba-technical@lists.samba.org>,
 linux-xfs <linux-xfs@vger.kernel.org>, Bob Peterson <rpeterso@redhat.com>,
 Tejun Heo <tj@kernel.org>, linux-erofs@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Eric Biggers <ebiggers@google.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 overlayfs <linux-unionfs@vger.kernel.org>, David Howells <dhowells@redhat.com>,
 linux-mm <linux-mm@kvack.org>, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, cluster-devel@redhat.com,
 Steve French <sfrench@samba.org>, v9fs-developer@lists.sourceforge.net,
 Bharath Vedartham <linux.bhar@gmail.com>, Jann Horn <jannh@google.com>,
 ecryptfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 Dave Chinner <dchinner@redhat.com>, David Sterba <dsterba@suse.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, netdev@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, Tyler Hicks <tyhicks@canonical.com>,
 linux-security-module@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
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


On Oct 22, 2019, at 2:44 PM, Mark Salyzyn <salyzyn@android.com> wrote:
> 
> Replace arguments for get and set xattr methods, and __vfs_getxattr
> and __vfs_setaxtr functions with a reference to the following now
> common argument structure:
> 
> struct xattr_gs_args {
> 	struct dentry *dentry;
> 	struct inode *inode;
> 	const char *name;
> 	union {
> 		void *buffer;
> 		const void *value;
> 	};
> 	size_t size;
> 	int flags;
> };

As part of this change (which is touching all of the uses of these
fields anyway) it would be useful to give these structure fields a
prefix like "xga_" so that they can be easily found with tags.
Otherwise, there are so many different "dentry" and "inode" fields
in various structures that it is hard to find the right one.

> #define __USE_KERNEL_XATTR_DEFS
> 
> -#define XATTR_CREATE	0x1	/* set value, fail if attr already exists */
> -#define XATTR_REPLACE	0x2	/* set value, fail if attr does not exist */
> +#define XATTR_CREATE	 0x1	/* set value, fail if attr already exists */
> +#define XATTR_REPLACE	 0x2	/* set value, fail if attr does not exist */
> +#ifdef __KERNEL__ /* following is kernel internal, colocated for maintenance */
> +#define XATTR_NOSECURITY 0x4	/* get value, do not involve security check */
> +#endif

Now that these arguments are separated out into their own structure,
rather than using "int flags" (there are a million different flags in
the kernel and easily confused) it would be immediately clear *which*
flags are used here with a named enum, like:

enum xattr_flags {
	XATTR_CREATE	= 0x1,	/* set value, fail if attr already exists */
	XATTR_REPLACE	= 0x2,	/* set value, fail if attr does not exist */
#ifdef __KERNEL__ /* following is kernel internal, colocated for maintenance */
	XATTR_NOSECURITY= 0x4,  /* get value, do not involve security check */
#endif
};

and use this in the struct like:

struct xattr_gs_args {
	struct dentry	*xga_dentry;
	struct inode	*xga_inode;
	const char	*xga_name;
	union {
		void		*xga_buffer;
		const void	*xga_value;
	};
	size_t		 xga_size;
	enum xattr_flags xga_flags;
};

Beyond the benefit for the reader to understand the code better, this
can also allow the compiler to warn if incorrect values are being
assigned to this field.

Cheers, Andreas





-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 873 bytes
Desc: Message signed with OpenPGP
URL: <http://lists.orangefs.org/pipermail/devel_lists.orangefs.org/attachments/20191022/0bca25a2/attachment.asc>
