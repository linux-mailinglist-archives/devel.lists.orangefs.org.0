Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE96963E3
	for <lists+devel-orangefs@lfdr.de>; Tue, 20 Aug 2019 17:13:52 +0200 (CEST)
Received: from [::1] (port=47506 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1i05pX-00051L-NO
	for lists+devel-orangefs@lfdr.de; Tue, 20 Aug 2019 11:13:51 -0400
Received: from mga04.intel.com ([192.55.52.120]:51484)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <lkp@intel.com>) id 1i05pV-00050U-TL
 for devel@lists.orangefs.org; Tue, 20 Aug 2019 11:13:50 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 08:13:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; 
 d="gz'50?scan'50,208,50";a="353603591"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 20 Aug 2019 08:12:52 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1i05oZ-0004T4-Ls; Tue, 20 Aug 2019 23:12:51 +0800
Date: Tue, 20 Aug 2019 23:12:03 +0800
From: kbuild test robot <lkp@intel.com>
To: Mark Salyzyn <salyzyn@android.com>
Subject: Re: [PATCH v5] Add flags option to get xattr method paired to
 __vfs_getxattr
Message-ID: <201908202356.Jnt6ivbB%lkp@intel.com>
References: <20190819183305.153583-1-salyzyn@android.com>
MIME-Version: 1.0
In-Reply-To: <20190819183305.153583-1-salyzyn@android.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Content-Filtered-By: Mailman/MimeDel 2.1.27
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
 James Morris <jmorris@namei.org>, devel@lists.orangefs.org,
 Eric Van Hensbergen <ericvh@gmail.com>, Joel Becker <jlbec@evilplan.org>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 kbuild-all@01.org, Jan Kara <jack@suse.com>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Kleikamp <shaggy@kernel.org>,
 linux-doc@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 Chao Yu <yuchao0@huawei.com>, Mimi Zohar <zohar@linux.ibm.com>,
 linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 Eric Sandeen <sandeen@sandeen.net>, kernel-team@android.com,
 selinux@vger.kernel.org, Brian Foster <bfoster@redhat.com>,
 reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
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
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org, linux-mm@kvack.org,
 samba-technical@lists.samba.org, linux-xfs@vger.kernel.org,
 Bob Peterson <rpeterso@redhat.com>, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 ocfs2-devel@oss.oracle.com, jfs-discussion@lists.sourceforge.net,
 Eric Biggers <ebiggers@google.com>,
 Dominique Martinet <asmadeus@codewreck.org>, Jeff Mahoney <jeffm@suse.com>,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Mark Salyzyn <salyzyn@android.com>,
 devel@driverdev.osuosl.org, "J. Bruce Fields" <bfields@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Sage Weil <sage@redhat.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 linux-security-module@vger.kernel.org, cluster-devel@redhat.com,
 Steve French <sfrench@samba.org>, v9fs-developer@lists.sourceforge.net,
 Bharath Vedartham <linux.bhar@gmail.com>, Jann Horn <jannh@google.com>,
 ecryptfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 Dave Chinner <dchinner@redhat.com>, David Sterba <dsterba@suse.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, netdev@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, stable@vger.kernel.org,
 Tyler Hicks <tyhicks@canonical.com>,
 Ernesto =?unknown-8bit?Q?A=2E_Fern=C3=A1ndez?=
 <ernesto.mnd.fernandez@gmail.com>, Phillip Lougher <phillip@squashfs.org.uk>,
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

Hi Mark,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[cannot apply to v5.3-rc5 next-20190820]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Mark-Salyzyn/Add-flags-option-to-get-xattr-method-paired-to-__vfs_getxattr/20190820-220307
config: um-x86_64_defconfig (attached as .config)
compiler: gcc-7 (Debian 7.4.0-10) 7.4.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=um SUBARCH=x86_64

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   fs//kernfs/inode.c: In function 'kernfs_vfs_xattr_set':
>> fs//kernfs/inode.c:322:27: error: 'inode' undeclared (first use in this function)
     struct kernfs_node *kn = inode->i_private;
                              ^~~~~
   fs//kernfs/inode.c:322:27: note: each undeclared identifier is reported only once for each function it appears in

vim +/inode +322 fs//kernfs/inode.c

b230d5aba2d1a7 Ondrej Mosnacek 2019-02-22  318  
1537ad15c9c59c Ondrej Mosnacek 2019-04-03  319  static int kernfs_vfs_xattr_set(const struct xattr_handler *handler,
7d823b0879d4e2 Mark Salyzyn    2019-08-19  320  				struct xattr_gs_args *args)
b230d5aba2d1a7 Ondrej Mosnacek 2019-02-22  321  {
b230d5aba2d1a7 Ondrej Mosnacek 2019-02-22 @322  	struct kernfs_node *kn = inode->i_private;
b230d5aba2d1a7 Ondrej Mosnacek 2019-02-22  323  
7d823b0879d4e2 Mark Salyzyn    2019-08-19  324  	return kernfs_xattr_set(kn, xattr_full_name(handler, args->name),
7d823b0879d4e2 Mark Salyzyn    2019-08-19  325  				args->value, args->size, args->flags);
b230d5aba2d1a7 Ondrej Mosnacek 2019-02-22  326  }
b230d5aba2d1a7 Ondrej Mosnacek 2019-02-22  327  

:::::: The code at line 322 was first introduced by commit
:::::: b230d5aba2d1a7b0636408889a75bf9eae6b8bc7 LSM: add new hook for kernfs node initialization

:::::: TO: Ondrej Mosnacek <omosnace@redhat.com>
:::::: CC: Paul Moore <paul@paul-moore.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
