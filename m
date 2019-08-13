Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D238B2DC
	for <lists+devel-orangefs@lfdr.de>; Tue, 13 Aug 2019 10:48:47 +0200 (CEST)
Received: from [::1] (port=38728 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hxSU2-0005Dj-Ni
	for lists+devel-orangefs@lfdr.de; Tue, 13 Aug 2019 04:48:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:39134)
 by mm1.emwd.com with esmtps (TLSv1.2:AECDH-AES256-SHA:256)
 (Exim 4.92) (envelope-from <gregkh@linuxfoundation.org>)
 id 1hxSU1-0005DU-JQ
 for devel@lists.orangefs.org; Tue, 13 Aug 2019 04:48:45 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E6C720679;
 Tue, 13 Aug 2019 08:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565686084;
 bh=dgkNfsoGvEEUqkSMoKhZo00QGi0KOqUYD1qh2seiDX0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YExtdyLDmV5g6i2jgGccJIQ9lpJD2qunpsOWx/skQdmvZBvdutmEsdbbDFgUnYiW9
 lXvB0C/oMwnRrAFZnyypCC3r55bOvbM5/MOv8GxdUmBrJYIbb3l/0Xsrf+14ZRwh2E
 PJJHiAbOF9zt2xlZLKfEtULVL5ySMo91nAG/3xII=
Date: Tue, 13 Aug 2019 10:48:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Salyzyn <salyzyn@android.com>
Subject: Re: [PATCH] Add flags option to get xattr method paired to
 __vfs_getxattr
Message-ID: <20190813084801.GA972@kroah.com>
References: <20190812193320.200472-1-salyzyn@android.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812193320.200472-1-salyzyn@android.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
 jfs-discussion@lists.sourceforge.net, linux-integrity@vger.kernel.org,
 samba-technical@lists.samba.org, Dominique Martinet <asmadeus@codewreck.org>,
 Chao Yu <yuchao0@huawei.com>, Mimi Zohar <zohar@linux.ibm.com>,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, "David S. Miller" <davem@davemloft.net>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Eric Paris <eparis@parisplace.org>,
 netdev@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-afs@lists.infradead.org, linux-xfs@vger.kernel.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Sage Weil <sage@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 James Morris <jmorris@namei.org>, cluster-devel@redhat.com,
 selinux@vger.kernel.org, Vyacheslav Dubeyko <slava@dubeyko.com>,
 Casey Schaufler <casey@schaufler-ca.com>, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 kernel-team@android.com, linux-mm@kvack.org, devel@lists.orangefs.org,
 Serge Hallyn <serge@hallyn.com>,
 Ernesto =?iso-8859-1?Q?A=2E_Fern=E1ndez?= <ernesto.mnd.fernandez@gmail.com>,
 linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@gmail.com>,
 ecryptfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Joel Becker <jlbec@evilplan.org>, linux-mtd@lists.infradead.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>,
 Paul Moore <paul@paul-moore.com>, linux-nfs@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Mathieu Malaterre <malat@debian.org>,
 Stephen Smalley <sds@tycho.nsa.gov>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Tyler Hicks <tyhicks@canonical.com>, Steve French <sfrench@samba.org>,
 linux-security-module@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 Jan Kara <jack@suse.com>, Bob Peterson <rpeterso@redhat.com>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org,
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

On Mon, Aug 12, 2019 at 12:32:49PM -0700, Mark Salyzyn wrote:
> --- a/include/linux/xattr.h
> +++ b/include/linux/xattr.h
> @@ -30,10 +30,10 @@ struct xattr_handler {
>  	const char *prefix;
>  	int flags;      /* fs private flags */
>  	bool (*list)(struct dentry *dentry);
> -	int (*get)(const struct xattr_handler *, struct dentry *dentry,
> +	int (*get)(const struct xattr_handler *handler, struct dentry *dentry,
>  		   struct inode *inode, const char *name, void *buffer,
> -		   size_t size);
> -	int (*set)(const struct xattr_handler *, struct dentry *dentry,
> +		   size_t size, int flags);
> +	int (*set)(const struct xattr_handler *handler, struct dentry *dentry,
>  		   struct inode *inode, const char *name, const void *buffer,
>  		   size_t size, int flags);

Wow, 7 arguments.  Isn't there some nice rule of thumb that says once
you get more then 5, a function becomes impossible to understand?

Surely this could be a structure passed in here somehow, that way when
you add the 8th argument in the future, you don't have to change
everything yet again?  :)

I don't have anything concrete to offer as a replacement fix for this,
but to me this just feels really wrong...

thanks,

greg k-h

