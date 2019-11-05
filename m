Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F23EF9F6
	for <lists+devel-orangefs@lfdr.de>; Tue,  5 Nov 2019 10:49:22 +0100 (CET)
Received: from [::1] (port=39472 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1iRvSh-0008V1-J2
	for lists+devel-orangefs@lfdr.de; Tue, 05 Nov 2019 04:49:19 -0500
Received: from mx2.suse.de ([195.135.220.15]:45630 helo=mx1.suse.de)
 by mm1.emwd.com with esmtps (TLSv1.2:AECDH-AES256-SHA:256)
 (Exim 4.92) (envelope-from <jack@suse.cz>) id 1iRvSf-0008Tf-TA
 for devel@lists.orangefs.org; Tue, 05 Nov 2019 04:49:18 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DDAFFB3A6;
 Tue,  5 Nov 2019 09:48:34 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 242661E4407; Tue,  5 Nov 2019 10:48:30 +0100 (CET)
Date: Tue, 5 Nov 2019 10:48:30 +0100
From: Jan Kara <jack@suse.cz>
To: Mark Salyzyn <salyzyn@android.com>
Subject: Re: [PATCH v15 1/4] Add flags option to get xattr method paired to
 __vfs_getxattr
Message-ID: <20191105094830.GL22379@quack2.suse.cz>
References: <20191104215253.141818-1-salyzyn@android.com>
 <20191104215253.141818-2-salyzyn@android.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104215253.141818-2-salyzyn@android.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 samba-technical@lists.samba.org, Dominique Martinet <asmadeus@codewreck.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, "David S. Miller" <davem@davemloft.net>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Eric Paris <eparis@parisplace.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, netdev@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 linux-xfs@vger.kernel.org, linux-unionfs@vger.kernel.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Sage Weil <sage@redhat.com>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Eric Biggers <ebiggers@google.com>, Hugh Dickins <hughd@google.com>,
 James Morris <jmorris@namei.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, cluster-devel@redhat.com,
 selinux@vger.kernel.org, Benjamin Coddington <bcodding@redhat.com>,
 Casey Schaufler <casey@schaufler-ca.com>, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Stephen Smalley <sds@tycho.nsa.gov>, linux-mm@kvack.org,
 Mark Salyzyn <salyzyn@google.com>, Serge Hallyn <serge@hallyn.com>,
 ecryptfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 Eric Van Hensbergen <ericvh@gmail.com>, Chao Yu <chao@kernel.org>,
 linux-erofs@lists.ozlabs.org, Josef Bacik <josef@toxicpanda.com>,
 reiserfs-devel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
 Joel Becker <jlbec@evilplan.org>, linux-mtd@lists.infradead.org,
 Phillip Lougher <phillip@squashfs.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 devel@lists.orangefs.org, Gao Xiang <xiang@kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Paul Moore <paul@paul-moore.com>,
 linux-nfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-fsdevel@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Mathieu Malaterre <malat@debian.org>, kernel-team@android.com,
 Jonathan Corbet <corbet@lwn.net>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
 Steve French <sfrench@samba.org>, linux-security-module@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, Jan Kara <jack@suse.com>,
 Bob Peterson <rpeterso@redhat.com>, Tejun Heo <tj@kernel.org>,
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

> @@ -228,11 +228,11 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
>  		break;
>  	case 1:
>  		data = buf;
> -		dsize = snprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
> +		dsize = scnprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
>  		break;
>  	case 2:
>  		data = buf;
> -		dsize = snprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
> +		dsize = scnprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
>  		break;
>  	case 3:

These scnprintf() changes (and there are more in the patch) probably
shouldn't be here... Otherwise the patch still looks good to me :).

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

