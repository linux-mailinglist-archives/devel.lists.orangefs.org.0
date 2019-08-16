Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ADC90303
	for <lists+devel-orangefs@lfdr.de>; Fri, 16 Aug 2019 15:29:27 +0200 (CEST)
Received: from [::1] (port=52482 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hycII-0001xG-D1
	for lists+devel-orangefs@lfdr.de; Fri, 16 Aug 2019 09:29:26 -0400
Received: from mga01.intel.com ([192.55.52.88]:61749)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <lkp@intel.com>) id 1hycIF-0001up-RK
 for devel@lists.orangefs.org; Fri, 16 Aug 2019 09:29:24 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Aug 2019 06:28:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,393,1559545200"; 
 d="gz'50?scan'50,208,50";a="171415115"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 16 Aug 2019 06:28:26 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hycHK-0008An-BD; Fri, 16 Aug 2019 21:28:26 +0800
Date: Fri, 16 Aug 2019 21:27:42 +0800
From: kbuild test robot <lkp@intel.com>
To: Mark Salyzyn <salyzyn@android.com>
Subject: Re: [PATCH v4] Add flags option to get xattr method paired to
 __vfs_getxattr
Message-ID: <201908162141.9dc5Bnb4%lkp@intel.com>
References: <20190815155019.229988-1-salyzyn@android.com>
MIME-Version: 1.0
In-Reply-To: <20190815155019.229988-1-salyzyn@android.com>
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 linux-integrity@vger.kernel.org, samba-technical@lists.samba.org,
 Dominique Martinet <asmadeus@codewreck.org>, Chao Yu <yuchao0@huawei.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 "David S. Miller" <davem@davemloft.net>,
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
[cannot apply to v5.3-rc4 next-20190814]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Mark-Salyzyn/Add-flags-option-to-get-xattr-method-paired-to-__vfs_getxattr/20190816-155049
config: x86_64-lkp (attached as .config)
compiler: gcc-7 (Debian 7.4.0-10) 7.4.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/ext2/xattr_security.c:56:9: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
     .get = ext2_xattr_security_get,
            ^~~~~~~~~~~~~~~~~~~~~~~
   fs/ext2/xattr_security.c:56:9: note: (near initialization for 'ext2_xattr_security_handler.get')
   cc1: some warnings being treated as errors

vim +56 fs/ext2/xattr_security.c

9d8f13ba3f4833 Mimi Zohar        2011-06-06  53  
749c72efa4bd91 Stephen Hemminger 2010-05-13  54  const struct xattr_handler ext2_xattr_security_handler = {
^1da177e4c3f41 Linus Torvalds    2005-04-16  55  	.prefix	= XATTR_SECURITY_PREFIX,
^1da177e4c3f41 Linus Torvalds    2005-04-16 @56  	.get	= ext2_xattr_security_get,

:::::: The code at line 56 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
