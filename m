Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2EB916D8
	for <lists+devel-orangefs@lfdr.de>; Sun, 18 Aug 2019 15:46:55 +0200 (CEST)
Received: from [::1] (port=39252 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hzLWH-0005Lr-W3
	for lists+devel-orangefs@lfdr.de; Sun, 18 Aug 2019 09:46:53 -0400
Received: from mga01.intel.com ([192.55.52.88]:15193)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <lkp@intel.com>) id 1hxmJ5-0004Bt-1H
 for devel@lists.orangefs.org; Wed, 14 Aug 2019 01:58:47 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 22:58:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,384,1559545200"; 
 d="gz'50?scan'50,208,50";a="170625161"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 13 Aug 2019 22:57:47 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hxmI7-0007VE-5K; Wed, 14 Aug 2019 13:57:47 +0800
Date: Wed, 14 Aug 2019 13:57:30 +0800
From: kbuild test robot <lkp@intel.com>
To: Mark Salyzyn <salyzyn@android.com>
Subject: Re: [PATCH v2] Add flags option to get xattr method paired to
 __vfs_getxattr
Message-ID: <201908141340.zUiNVpi0%lkp@intel.com>
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
config: sh-allmodconfig (attached as .config)
compiler: sh4-linux-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=sh 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/ubifs/xattr.c:326:9: error: conflicting types for 'ubifs_xattr_get'
    ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
            ^~~~~~~~~~~~~~~
   In file included from fs/ubifs/xattr.c:46:0:
   fs/ubifs/ubifs.h:2006:9: note: previous declaration of 'ubifs_xattr_get' was here
    ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
            ^~~~~~~~~~~~~~~
   fs/ubifs/xattr.c: In function 'xattr_get':
>> fs/ubifs/xattr.c:678:9: error: too few arguments to function 'ubifs_xattr_get'
     return ubifs_xattr_get(inode, name, buffer, size);
            ^~~~~~~~~~~~~~~
   fs/ubifs/xattr.c:326:9: note: declared here
    ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
            ^~~~~~~~~~~~~~~
   fs/ubifs/xattr.c: At top level:
   fs/ubifs/xattr.c:699:9: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
     .get = xattr_get,
            ^~~~~~~~~
   fs/ubifs/xattr.c:699:9: note: (near initialization for 'ubifs_user_xattr_handler.get')
   fs/ubifs/xattr.c:705:9: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
     .get = xattr_get,
            ^~~~~~~~~
   fs/ubifs/xattr.c:705:9: note: (near initialization for 'ubifs_trusted_xattr_handler.get')
   fs/ubifs/xattr.c:712:9: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
     .get = xattr_get,
            ^~~~~~~~~
   fs/ubifs/xattr.c:712:9: note: (near initialization for 'ubifs_security_xattr_handler.get')
   fs/ubifs/xattr.c: In function 'xattr_get':
   fs/ubifs/xattr.c:679:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   cc1: some warnings being treated as errors

vim +/ubifs_xattr_get +326 fs/ubifs/xattr.c

1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  325  
ade46c3a6029de Richard Weinberger  2016-09-19 @326  ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
ac76fdcb4aadfd Mark Salyzyn        2019-08-13  327  			size_t size, int flags)
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  328  {
ce23e640133484 Al Viro             2016-04-11  329  	struct inode *inode;
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  330  	struct ubifs_info *c = host->i_sb->s_fs_info;
f4f61d2cc6d878 Richard Weinberger  2016-11-11  331  	struct fscrypt_name nm = { .disk_name = FSTR_INIT((char *)name, strlen(name))};
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  332  	struct ubifs_inode *ui;
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  333  	struct ubifs_dent_node *xent;
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  334  	union ubifs_key key;
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  335  	int err;
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  336  
f4f61d2cc6d878 Richard Weinberger  2016-11-11  337  	if (fname_len(&nm) > UBIFS_MAX_NLEN)
2b88fc21cae91e Andreas Gruenbacher 2016-04-22  338  		return -ENAMETOOLONG;
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  339  
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  340  	xent = kmalloc(UBIFS_MAX_XENT_NODE_SZ, GFP_NOFS);
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  341  	if (!xent)
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  342  		return -ENOMEM;
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  343  
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  344  	xent_key_init(c, &key, host->i_ino, &nm);
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  345  	err = ubifs_tnc_lookup_nm(c, &key, xent, &nm);
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  346  	if (err) {
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  347  		if (err == -ENOENT)
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  348  			err = -ENODATA;
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  349  		goto out_unlock;
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  350  	}
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  351  
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  352  	inode = iget_xattr(c, le64_to_cpu(xent->inum));
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  353  	if (IS_ERR(inode)) {
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  354  		err = PTR_ERR(inode);
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  355  		goto out_unlock;
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  356  	}
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  357  
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  358  	ui = ubifs_inode(inode);
6eb61d587f4515 Richard Weinberger  2018-07-12  359  	ubifs_assert(c, inode->i_size == ui->data_len);
6eb61d587f4515 Richard Weinberger  2018-07-12  360  	ubifs_assert(c, ubifs_inode(host)->xattr_size > ui->data_len);
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  361  
ab92a20bce3b4c Dongsheng Yang      2015-08-18  362  	mutex_lock(&ui->ui_mutex);
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  363  	if (buf) {
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  364  		/* If @buf is %NULL we are supposed to return the length */
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  365  		if (ui->data_len > size) {
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  366  			err = -ERANGE;
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  367  			goto out_iput;
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  368  		}
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  369  
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  370  		memcpy(buf, ui->data, ui->data_len);
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  371  	}
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  372  	err = ui->data_len;
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  373  
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  374  out_iput:
ab92a20bce3b4c Dongsheng Yang      2015-08-18  375  	mutex_unlock(&ui->ui_mutex);
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  376  	iput(inode);
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  377  out_unlock:
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  378  	kfree(xent);
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  379  	return err;
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  380  }
1e51764a3c2ac0 Artem Bityutskiy    2008-07-14  381  

:::::: The code at line 326 was first introduced by commit
:::::: ade46c3a6029dea49dbc6c7734b0f6a78d3f104c ubifs: Export xattr get and set functions

:::::: TO: Richard Weinberger <richard@nod.at>
:::::: CC: Richard Weinberger <richard@nod.at>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
