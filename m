Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 8278112DE99
	for <lists+devel-orangefs@lfdr.de>; Wed,  1 Jan 2020 11:53:42 +0100 (CET)
Received: from [::1] (port=47408 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1imbdF-0006Pd-E1
	for lists+devel-orangefs@lfdr.de; Wed, 01 Jan 2020 05:53:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14526)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <riteshh@linux.ibm.com>)
 id 1imbdE-0006PJ-Cn
 for devel@lists.orangefs.org; Wed, 01 Jan 2020 05:53:40 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 001ApT6K088758
 for <devel@lists.orangefs.org>; Wed, 1 Jan 2020 05:52:59 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2x88je2qem-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <devel@lists.orangefs.org>; Wed, 01 Jan 2020 05:52:59 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <devel@lists.orangefs.org> from <riteshh@linux.ibm.com>;
 Wed, 1 Jan 2020 10:52:57 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Jan 2020 10:52:53 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 001AqqXU48103666
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Jan 2020 10:52:52 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 680755204F;
 Wed,  1 Jan 2020 10:52:52 +0000 (GMT)
Received: from dhcp-9-199-159-72.in.ibm.com (unknown [9.199.159.72])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3A8C952054;
 Wed,  1 Jan 2020 10:52:49 +0000 (GMT)
From: Ritesh Harjani <riteshh@linux.ibm.com>
To: linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk
Subject: [RESEND PATCH 0/1] Use inode_lock/unlock class of provided APIs in
 filesystems
Date: Wed,  1 Jan 2020 16:22:47 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20010110-0012-0000-0000-00000379A8D2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20010110-0013-0000-0000-000021B5B68A
Message-Id: <20200101105248.25304-1-riteshh@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-01_03:2019-12-30,2020-01-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=397
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001010101
X-BeenThere: devel@lists.orangefs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <devel.lists.orangefs.org>
List-Unsubscribe: <http://lists.orangefs.org/mailman/options/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=unsubscribe>
List-Archive: <http://lists.orangefs.org/pipermail/devel_lists.orangefs.org/>
List-Post: <mailto:devel@lists.orangefs.org>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Subscribe: <http://lists.orangefs.org/mailman/listinfo/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=subscribe>
Cc: linux-nfs@vger.kernel.org, jlayton@kernel.org,
 linux-unionfs@vger.kernel.org, willy@infradead.org, dsterba@suse.cz,
 Ritesh Harjani <riteshh@linux.ibm.com>, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, devel@lists.orangefs.org
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

Al, any comments?
Resending this after adding Reviewed-by/Acked-by tags.


From previous version:-
Matthew Wilcox in [1] suggested that it will be a good idea
to define some missing API instead of directly using i_rwsem in
filesystems drivers for lock/unlock/downgrade purposes.

This patch does that work. No functionality change in this patch.

After this there are only lockdep class of APIs at certain places
in filesystems which are directly using i_rwsem and second is XFS,
but it seems to be anyway defining it's own xfs_ilock/iunlock set
of APIs and 'iolock' naming convention for this lock.

[1]: https://www.spinics.net/lists/linux-ext4/msg68689.html

Ritesh Harjani (1):
  fs: Use inode_lock/unlock class of provided APIs in filesystems

 fs/btrfs/delayed-inode.c |  2 +-
 fs/btrfs/ioctl.c         |  4 ++--
 fs/ceph/io.c             | 24 ++++++++++++------------
 fs/nfs/io.c              | 24 ++++++++++++------------
 fs/orangefs/file.c       |  4 ++--
 fs/overlayfs/readdir.c   |  2 +-
 fs/readdir.c             |  4 ++--
 include/linux/fs.h       | 21 +++++++++++++++++++++
 8 files changed, 53 insertions(+), 32 deletions(-)

-- 
2.21.0


