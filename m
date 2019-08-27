Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EF39F132
	for <lists+devel-orangefs@lfdr.de>; Tue, 27 Aug 2019 19:07:27 +0200 (CEST)
Received: from [::1] (port=53948 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1i2ewI-0003ql-AG
	for lists+devel-orangefs@lfdr.de; Tue, 27 Aug 2019 13:07:26 -0400
Received: from mx2.suse.de ([195.135.220.15]:58448 helo=mx1.suse.de)
 by mm1.emwd.com with esmtps (TLSv1.2:AECDH-AES256-SHA:256)
 (Exim 4.92) (envelope-from <dsterba@suse.cz>) id 1i2ewG-0003q7-3v
 for devel@lists.orangefs.org; Tue, 27 Aug 2019 13:07:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6C032B03C;
 Tue, 27 Aug 2019 17:06:41 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id D57F2DA809; Tue, 27 Aug 2019 19:07:00 +0200 (CEST)
Date: Tue, 27 Aug 2019 19:07:00 +0200
From: David Sterba <dsterba@suse.cz>
To: Mark Salyzyn <salyzyn@android.com>
Subject: Re: [PATCH v8] Add flags option to get xattr method paired to
 __vfs_getxattr
Message-ID: <20190827170700.GW2752@suse.cz>
Mail-Followup-To: dsterba@suse.cz, Mark Salyzyn <salyzyn@android.com>,
 linux-kernel@vger.kernel.org, kernel-team@android.com,
 Tyler Hicks <tyhicks@canonical.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 "David S. Miller" <davem@davemloft.net>,
 Mathieu Malaterre <malat@debian.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 devel@driverdev.osuosl.org, Vyacheslav Dubeyko <slava@dubeyko.com>,
 Joel Becker <jlbec@evilplan.org>, Mark Fasheh <mark@fasheh.com>,
 Chris Mason <clm@fb.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Eric Van Hensbergen <ericvh@gmail.com>,
 Ilya Dryomov <idryomov@gmail.com>,
 Bharath Vedartham <linux.bhar@gmail.com>,
 Eric Biggers <ebiggers@google.com>, Hugh Dickins <hughd@google.com>,
 Jann Horn <jannh@google.com>, Serge Hallyn <serge@hallyn.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Gao Xiang <gaoxiang25@huawei.com>, Chao Yu <yuchao0@huawei.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Latchesar Ionkov <lucho@ionkov.net>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Dave Kleikamp <shaggy@kernel.org>, Tejun Heo <tj@kernel.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Mimi Zohar <zohar@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-afs@lists.infradead.org, linux-mtd@lists.infradead.org,
 devel@lists.orangefs.org, linux-erofs@lists.ozlabs.org,
 samba-technical@lists.samba.org,
 jfs-discussion@lists.sourceforge.net,
 linux-f2fs-devel@lists.sourceforge.net,
 v9fs-developer@lists.sourceforge.net,
 Jonathan Corbet <corbet@lwn.net>, Theodore Ts'o <tytso@mit.edu>,
 James Morris <jmorris@namei.org>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Richard Weinberger <richard@nod.at>,
 Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>,
 Allison Henderson <allison.henderson@oracle.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 ocfs2-devel@oss.oracle.com, Eric Paris <eparis@parisplace.org>,
 Paul Moore <paul@paul-moore.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 Benjamin Coddington <bcodding@redhat.com>,
 "J. Bruce Fields" <bfields@redhat.com>,
 Brian Foster <bfoster@redhat.com>, cluster-devel@redhat.com,
 Dave Chinner <dchinner@redhat.com>,
 David Howells <dhowells@redhat.com>,
 Bob Peterson <rpeterso@redhat.com>, Sage Weil <sage@redhat.com>,
 Steve French <sfrench@samba.org>,
 Eric Sandeen <sandeen@sandeen.net>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.com>,
 Jan Kara <jack@suse.cz>, Miklos Szeredi <miklos@szeredi.hu>,
 Josef Bacik <josef@toxicpanda.com>,
 Stephen Smalley <sds@tycho.nsa.gov>, ceph-devel@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-security-module@vger.kernel.org,
 linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org,
 netdev@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 selinux@vger.kernel.org, stable@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
References: <20190827150544.151031-1-salyzyn@android.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827150544.151031-1-salyzyn@android.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
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
Reply-To: dsterba@suse.cz
Cc: Latchesar Ionkov <lucho@ionkov.net>, Eric Sandeen <sandeen@sandeen.net>,
 James Morris <jmorris@namei.org>, devel@lists.orangefs.org,
 Eric Van Hensbergen <ericvh@gmail.com>, Joel Becker <jlbec@evilplan.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Jan Kara <jack@suse.com>, Casey Schaufler <casey@schaufler-ca.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Kleikamp <shaggy@kernel.org>,
 linux-doc@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 Chao Yu <yuchao0@huawei.com>, Mimi Zohar <zohar@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, linux-cifs@vger.kernel.org,
 Paul Moore <paul@paul-moore.com>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Hugh Dickins <hughd@google.com>, kernel-team@android.com,
 selinux@vger.kernel.org, Brian Foster <bfoster@redhat.com>,
 reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-f2fs-devel@lists.sourceforge.net,
 Benjamin Coddington <bcodding@redhat.com>, linux-integrity@vger.kernel.org,
 Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
 linux-afs@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Vyacheslav Dubeyko <slava@dubeyko.com>,
 Allison Henderson <allison.henderson@oracle.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Stephen Smalley <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>,
 Gao Xiang <gaoxiang25@huawei.com>, Eric Paris <eparis@parisplace.org>,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 Joseph Qi <joseph.qi@linux.alibaba.com>, samba-technical@lists.samba.org,
 linux-xfs@vger.kernel.org, Bob Peterson <rpeterso@redhat.com>,
 Tejun Heo <tj@kernel.org>, linux-erofs@lists.ozlabs.org,
 Anna Schumaker <anna.schumaker@netapp.com>, ocfs2-devel@oss.oracle.com,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Eric Biggers <ebiggers@google.com>,
 Dominique Martinet <asmadeus@codewreck.org>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 Andreas Dilger <adilger.kernel@dilger.ca>, devel@driverdev.osuosl.org,
 "J. Bruce Fields" <bfields@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Sage Weil <sage@redhat.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 cluster-devel@redhat.com, Steve French <sfrench@samba.org>,
 v9fs-developer@lists.sourceforge.net, Bharath Vedartham <linux.bhar@gmail.com>,
 Jann Horn <jannh@google.com>, ecryptfs@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, Dave Chinner <dchinner@redhat.com>,
 David Sterba <dsterba@suse.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 netdev@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 stable@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
 linux-security-module@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 David Woodhouse <dwmw2@infradead.org>, linux-btrfs@vger.kernel.org,
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

On Tue, Aug 27, 2019 at 08:05:15AM -0700, Mark Salyzyn wrote:
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
> 
> Which in effect adds a flags option to the get method and
> __vfs_getxattr function.
> 
> Add a flag option to get xattr method that has bit flag of
> XATTR_NOSECURITY passed to it.  XATTR_NOSECURITY is generally then
> set in the __vfs_getxattr path when called by security
> infrastructure.
> 
> This handles the case of a union filesystem driver that is being
> requested by the security layer to report back the xattr data.
> 
> For the use case where access is to be blocked by the security layer.
> 
> The path then could be security(dentry) ->
> __vfs_getxattr({dentry...XATTR_NOSECURITY}) ->
> handler->get({dentry...XATTR_NOSECURITY}) ->
> __vfs_getxattr({lower_dentry...XATTR_NOSECURITY}) ->
> lower_handler->get({lower_dentry...XATTR_NOSECURITY})
> which would report back through the chain data and success as
> expected, the logging security layer at the top would have the
> data to determine the access permissions and report back the target
> context that was blocked.
> 
> Without the get handler flag, the path on a union filesystem would be
> the errant security(dentry) -> __vfs_getxattr(dentry) ->
> handler->get(dentry) -> vfs_getxattr(lower_dentry) -> nested ->
> security(lower_dentry, log off) -> lower_handler->get(lower_dentry)
> which would report back through the chain no data, and -EACCES.
> 
> For selinux for both cases, this would translate to a correctly
> determined blocked access. In the first case with this change a correct avc
> log would be reported, in the second legacy case an incorrect avc log
> would be reported against an uninitialized u:object_r:unlabeled:s0
> context making the logs cosmetically useless for audit2allow.
> 
> This patch series is inert and is the wide-spread addition of the
> flags option for xattr functions, and a replacement of __vfs_getxattr
> with __vfs_getxattr({...XATTR_NOSECURITY}).
> 
> Signed-off-by: Mark Salyzyn <salyzyn@android.com>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Cc: Stephen Smalley <sds@tycho.nsa.gov>
> Cc: linux-kernel@vger.kernel.org
> Cc: kernel-team@android.com
> Cc: linux-security-module@vger.kernel.org
> Cc: stable@vger.kernel.org # 4.4, 4.9, 4.14 & 4.19
> ---
> v8:
> - Documentation reported 'struct xattr_gs_flags' rather than
>   'struct xattr_gs_flags *args' as argument to get and set methods.

For btrfs

>  fs/btrfs/xattr.c                  |  36 +++++-----

Acked-by: David Sterba <dsterba@suse.com>

