Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBDA916D9
	for <lists+devel-orangefs@lfdr.de>; Sun, 18 Aug 2019 15:46:55 +0200 (CEST)
Received: from [::1] (port=39254 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hzLWI-0005M2-2D
	for lists+devel-orangefs@lfdr.de; Sun, 18 Aug 2019 09:46:54 -0400
Received: from mga14.intel.com ([192.55.52.115]:8045)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <lkp@intel.com>) id 1hxryP-0003zX-D5
 for devel@lists.orangefs.org; Wed, 14 Aug 2019 08:01:49 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Aug 2019 05:01:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,385,1559545200"; 
 d="gz'50?scan'50,208,50";a="179025067"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 14 Aug 2019 05:00:46 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hxrxN-000ER5-O8; Wed, 14 Aug 2019 20:00:45 +0800
Date: Wed, 14 Aug 2019 19:59:57 +0800
From: kbuild test robot <lkp@intel.com>
To: Mark Salyzyn <salyzyn@android.com>
Subject: Re: [PATCH v2] Add flags option to get xattr method paired to
 __vfs_getxattr
Message-ID: <201908141935.iswsiyzF%lkp@intel.com>
References: <20190813145527.26289-1-salyzyn@android.com>
MIME-Version: 1.0
In-Reply-To: <20190813145527.26289-1-salyzyn@android.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Sun, 18 Aug 2019 09:46:53 -0400
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
 jfs-discussion@lists.sourceforge.net, linux-integrity@vger.kernel.org,
 samba-technical@lists.samba.org, Dominique Martinet <asmadeus@codewreck.org>,
 Chao Yu <yuchao0@huawei.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Adrian Hunter <adrian.hunter@intel.com>, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, "David S. Miller" <davem@davemloft.net>,
 Andreas Dilger <adilger.kernel@dilger.ca>, ocfs2-devel@oss.oracle.com,
 Eric Paris <eparis@parisplace.org>, netdev@vger.kernel.org,
 Tyler Hicks <tyhicks@canonical.com>, linux-afs@lists.infradead.org,
 devel@driverdev.osuosl.org, linux-xfs@vger.kernel.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Sage Weil <sage@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, linux-unionfs@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, James Morris <jmorris@namei.org>,
 cluster-devel@redhat.com, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Vyacheslav Dubeyko <slava@dubeyko.com>,
 Casey Schaufler <casey@schaufler-ca.com>, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 kernel-team@android.com, linux-mm@kvack.org, devel@lists.orangefs.org,
 Serge Hallyn <serge@hallyn.com>,
 Ernesto =?unknown-8bit?Q?A=2E_Fern=C3=A1ndez?=
 <ernesto.mnd.fernandez@gmail.com>, Gao Xiang <gaoxiang25@huawei.com>,
 linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@gmail.com>,
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 Josef Bacik <josef@toxicpanda.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, reiserfs-devel@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Joel Becker <jlbec@evilplan.org>,
 linux-mtd@lists.infradead.org, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 selinux@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>,
 Paul Moore <paul@paul-moore.com>, linux-nfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Theodore Ts'o <tytso@mit.edu>,
 linux-fsdevel@vger.kernel.org, Stephen Smalley <sds@tycho.nsa.gov>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Mark Salyzyn <salyzyn@android.com>, Steve French <sfrench@samba.org>,
 linux-security-module@vger.kernel.org, kbuild-all@01.org,
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

Hi Mark,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[cannot apply to v5.3-rc4 next-20190813]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Mark-Salyzyn/Add-flags-option-to-get-xattr-method-paired-to-__vfs_getxattr/20190814-124805
config: nds32-allmodconfig (attached as .config)
compiler: nds32le-linux-gcc (GCC) 8.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=8.1.0 make.cross ARCH=nds32 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   fs/ubifs/xattr.c:326:9: error: conflicting types for 'ubifs_xattr_get'
    ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
            ^~~~~~~~~~~~~~~
   In file included from fs/ubifs/xattr.c:46:
   fs/ubifs/ubifs.h:2006:9: note: previous declaration of 'ubifs_xattr_get' was here
    ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
            ^~~~~~~~~~~~~~~
   fs/ubifs/xattr.c: In function 'xattr_get':
   fs/ubifs/xattr.c:678:9: error: too few arguments to function 'ubifs_xattr_get'
     return ubifs_xattr_get(inode, name, buffer, size);
            ^~~~~~~~~~~~~~~
   fs/ubifs/xattr.c:326:9: note: declared here
    ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
            ^~~~~~~~~~~~~~~
   fs/ubifs/xattr.c: At top level:
>> fs/ubifs/xattr.c:699:9: error: initialization of 'int (*)(const struct xattr_handler *, struct dentry *, struct inode *, const char *, void *, size_t,  int)' {aka 'int (*)(const struct xattr_handler *, struct dentry *, struct inode *, const char *, void *, unsigned int,  int)'} from incompatible pointer type 'int (*)(const struct xattr_handler *, struct dentry *, struct inode *, const char *, void *, size_t)' {aka 'int (*)(const struct xattr_handler *, struct dentry *, struct inode *, const char *, void *, unsigned int)'} [-Werror=incompatible-pointer-types]
     .get = xattr_get,
            ^~~~~~~~~
   fs/ubifs/xattr.c:699:9: note: (near initialization for 'ubifs_user_xattr_handler.get')
   fs/ubifs/xattr.c:705:9: error: initialization of 'int (*)(const struct xattr_handler *, struct dentry *, struct inode *, const char *, void *, size_t,  int)' {aka 'int (*)(const struct xattr_handler *, struct dentry *, struct inode *, const char *, void *, unsigned int,  int)'} from incompatible pointer type 'int (*)(const struct xattr_handler *, struct dentry *, struct inode *, const char *, void *, size_t)' {aka 'int (*)(const struct xattr_handler *, struct dentry *, struct inode *, const char *, void *, unsigned int)'} [-Werror=incompatible-pointer-types]
     .get = xattr_get,
            ^~~~~~~~~
   fs/ubifs/xattr.c:705:9: note: (near initialization for 'ubifs_trusted_xattr_handler.get')
   fs/ubifs/xattr.c:712:9: error: initialization of 'int (*)(const struct xattr_handler *, struct dentry *, struct inode *, const char *, void *, size_t,  int)' {aka 'int (*)(const struct xattr_handler *, struct dentry *, struct inode *, const char *, void *, unsigned int,  int)'} from incompatible pointer type 'int (*)(const struct xattr_handler *, struct dentry *, struct inode *, const char *, void *, size_t)' {aka 'int (*)(const struct xattr_handler *, struct dentry *, struct inode *, const char *, void *, unsigned int)'} [-Werror=incompatible-pointer-types]
     .get = xattr_get,
            ^~~~~~~~~
   fs/ubifs/xattr.c:712:9: note: (near initialization for 'ubifs_security_xattr_handler.get')
   fs/ubifs/xattr.c: In function 'xattr_get':
   fs/ubifs/xattr.c:679:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   cc1: some warnings being treated as errors

vim +699 fs/ubifs/xattr.c

2b88fc21cae91e Andreas Gruenbacher 2016-04-22  669  
ade46c3a6029de Richard Weinberger  2016-09-19  670  static int xattr_get(const struct xattr_handler *handler,
2b88fc21cae91e Andreas Gruenbacher 2016-04-22  671  			   struct dentry *dentry, struct inode *inode,
2b88fc21cae91e Andreas Gruenbacher 2016-04-22  672  			   const char *name, void *buffer, size_t size)
2b88fc21cae91e Andreas Gruenbacher 2016-04-22  673  {
2b88fc21cae91e Andreas Gruenbacher 2016-04-22  674  	dbg_gen("xattr '%s', ino %lu ('%pd'), buf size %zd", name,
2b88fc21cae91e Andreas Gruenbacher 2016-04-22  675  		inode->i_ino, dentry, size);
2b88fc21cae91e Andreas Gruenbacher 2016-04-22  676  
17ce1eb0b64eb2 Richard Weinberger  2016-07-31  677  	name = xattr_full_name(handler, name);
ade46c3a6029de Richard Weinberger  2016-09-19 @678  	return ubifs_xattr_get(inode, name, buffer, size);
2b88fc21cae91e Andreas Gruenbacher 2016-04-22  679  }
2b88fc21cae91e Andreas Gruenbacher 2016-04-22  680  
ade46c3a6029de Richard Weinberger  2016-09-19  681  static int xattr_set(const struct xattr_handler *handler,
5930122683dff5 Al Viro             2016-05-27  682  			   struct dentry *dentry, struct inode *inode,
5930122683dff5 Al Viro             2016-05-27  683  			   const char *name, const void *value,
5930122683dff5 Al Viro             2016-05-27  684  			   size_t size, int flags)
2b88fc21cae91e Andreas Gruenbacher 2016-04-22  685  {
2b88fc21cae91e Andreas Gruenbacher 2016-04-22  686  	dbg_gen("xattr '%s', host ino %lu ('%pd'), size %zd",
2b88fc21cae91e Andreas Gruenbacher 2016-04-22  687  		name, inode->i_ino, dentry, size);
2b88fc21cae91e Andreas Gruenbacher 2016-04-22  688  
17ce1eb0b64eb2 Richard Weinberger  2016-07-31  689  	name = xattr_full_name(handler, name);
17ce1eb0b64eb2 Richard Weinberger  2016-07-31  690  
2b88fc21cae91e Andreas Gruenbacher 2016-04-22  691  	if (value)
d8db5b1ca9d4c5 Xiaolei Li          2017-06-23  692  		return ubifs_xattr_set(inode, name, value, size, flags, true);
2b88fc21cae91e Andreas Gruenbacher 2016-04-22  693  	else
ade46c3a6029de Richard Weinberger  2016-09-19  694  		return ubifs_xattr_remove(inode, name);
2b88fc21cae91e Andreas Gruenbacher 2016-04-22  695  }
2b88fc21cae91e Andreas Gruenbacher 2016-04-22  696  
dfaf8d2aeca482 Ben Dooks           2016-06-21  697  static const struct xattr_handler ubifs_user_xattr_handler = {
2b88fc21cae91e Andreas Gruenbacher 2016-04-22  698  	.prefix = XATTR_USER_PREFIX,
ade46c3a6029de Richard Weinberger  2016-09-19 @699  	.get = xattr_get,
ade46c3a6029de Richard Weinberger  2016-09-19  700  	.set = xattr_set,
2b88fc21cae91e Andreas Gruenbacher 2016-04-22  701  };
2b88fc21cae91e Andreas Gruenbacher 2016-04-22  702  

:::::: The code at line 699 was first introduced by commit
:::::: ade46c3a6029dea49dbc6c7734b0f6a78d3f104c ubifs: Export xattr get and set functions

:::::: TO: Richard Weinberger <richard@nod.at>
:::::: CC: Richard Weinberger <richard@nod.at>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
