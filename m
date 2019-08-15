Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 978398F5E4
	for <lists+devel-orangefs@lfdr.de>; Thu, 15 Aug 2019 22:44:08 +0200 (CEST)
Received: from [::1] (port=44730 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hyMbP-0006jS-P8
	for lists+devel-orangefs@lfdr.de; Thu, 15 Aug 2019 16:44:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:49728)
 by mm1.emwd.com with esmtps (TLSv1.2:AECDH-AES256-SHA:256)
 (Exim 4.92) (envelope-from <gregkh@linuxfoundation.org>)
 id 1hyMbO-0006h8-Hb
 for devel@lists.orangefs.org; Thu, 15 Aug 2019 16:44:06 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BB2B2083B;
 Thu, 15 Aug 2019 20:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565901805;
 bh=4MUbuhxyjB/Z/I0+KEuHYyPv1fvr/qroc0kojX6LQUI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rmevilO9FFuTpF1TkeHr9rMjq0tx8UWAlZu1cW/zsMuDRMCXNIqbtamv/Bh9PWjxr
 uMcyMcUqmrlEz/U6ipnvwnFJksubQpe8uhV+mxBP/PuZfI7m0SnpKLNF/GD9rIRrXm
 9i2PofIAyA1t7LZj0WwS4y+NrRc1E+LScCfI1k7c=
Date: Thu, 15 Aug 2019 22:43:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: James Morris <jmorris@namei.org>
Subject: Re: [PATCH] Add flags option to get xattr method paired to
 __vfs_getxattr
Message-ID: <20190815204322.GB6782@kroah.com>
References: <20190812193320.200472-1-salyzyn@android.com>
 <20190813084801.GA972@kroah.com>
 <alpine.LRH.2.21.1908160515130.12729@namei.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.21.1908160515130.12729@namei.org>
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
 netdev@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
 linux-afs@lists.infradead.org, linux-xfs@vger.kernel.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Sage Weil <sage@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Ernesto =?iso-8859-1?Q?A=2E_Fern=E1ndez?= <ernesto.mnd.fernandez@gmail.com>,
 cluster-devel@redhat.com, selinux@vger.kernel.org,
 Vyacheslav Dubeyko <slava@dubeyko.com>,
 Casey Schaufler <casey@schaufler-ca.com>, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 kernel-team@android.com, linux-mm@kvack.org, devel@lists.orangefs.org,
 Serge Hallyn <serge@hallyn.com>, linux-cifs@vger.kernel.org,
 Eric Van Hensbergen <ericvh@gmail.com>, ecryptfs@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, reiserfs-devel@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Joel Becker <jlbec@evilplan.org>,
 linux-mtd@lists.infradead.org, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Paul Moore <paul@paul-moore.com>, linux-nfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Theodore Ts'o <tytso@mit.edu>,
 linux-fsdevel@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Mathieu Malaterre <malat@debian.org>, Stephen Smalley <sds@tycho.nsa.gov>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Mark Salyzyn <salyzyn@android.com>, Steve French <sfrench@samba.org>,
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

On Fri, Aug 16, 2019 at 05:20:36AM +1000, James Morris wrote:
> On Tue, 13 Aug 2019, Greg Kroah-Hartman wrote:
> 
> > On Mon, Aug 12, 2019 at 12:32:49PM -0700, Mark Salyzyn wrote:
> > > --- a/include/linux/xattr.h
> > > +++ b/include/linux/xattr.h
> > > @@ -30,10 +30,10 @@ struct xattr_handler {
> > >  	const char *prefix;
> > >  	int flags;      /* fs private flags */
> > >  	bool (*list)(struct dentry *dentry);
> > > -	int (*get)(const struct xattr_handler *, struct dentry *dentry,
> > > +	int (*get)(const struct xattr_handler *handler, struct dentry *dentry,
> > >  		   struct inode *inode, const char *name, void *buffer,
> > > -		   size_t size);
> > > -	int (*set)(const struct xattr_handler *, struct dentry *dentry,
> > > +		   size_t size, int flags);
> > > +	int (*set)(const struct xattr_handler *handler, struct dentry *dentry,
> > >  		   struct inode *inode, const char *name, const void *buffer,
> > >  		   size_t size, int flags);
> > 
> > Wow, 7 arguments.  Isn't there some nice rule of thumb that says once
> > you get more then 5, a function becomes impossible to understand?
> > 
> > Surely this could be a structure passed in here somehow, that way when
> > you add the 8th argument in the future, you don't have to change
> > everything yet again?  :)
> > 
> > I don't have anything concrete to offer as a replacement fix for this,
> > but to me this just feels really wrong...
> 
> How about something like:
> 
> struct xattr_gs_args {
> 	struct dentry *dentry;
> 	struct inode *inode;

As he said in a later message, dentry and inode is redundant, only 1 is
needed (dentry I think?)

> 	const char *name;
> 	const void *buffer;
> 	size_t size;
> 	int flags;
> };
> 
> int (*get)(const struct xattr_handler *handler, struct xattr_gs_args *args);
> int (*set)(const struct xattr_handler *handler, struct xattr_gs_args *args);

But yes, that would be much much better.

thanks,

greg k-h

