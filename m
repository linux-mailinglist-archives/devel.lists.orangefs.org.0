Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 242DC113F8C
	for <lists+devel-orangefs@lfdr.de>; Thu,  5 Dec 2019 11:40:02 +0100 (CET)
Received: from [::1] (port=33712 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1icoY8-0005zR-9V
	for lists+devel-orangefs@lfdr.de; Thu, 05 Dec 2019 05:39:56 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62788)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <riteshh@linux.ibm.com>)
 id 1icoY6-0005yw-3c
 for devel@lists.orangefs.org; Thu, 05 Dec 2019 05:39:54 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB5Ac62T010107
 for <devel@lists.orangefs.org>; Thu, 5 Dec 2019 05:39:12 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wpuqc3ahg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <devel@lists.orangefs.org>; Thu, 05 Dec 2019 05:39:12 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <devel@lists.orangefs.org> from <riteshh@linux.ibm.com>;
 Thu, 5 Dec 2019 10:39:10 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 5 Dec 2019 10:39:07 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB5Ad6JO65732634
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Dec 2019 10:39:06 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67382A405C;
 Thu,  5 Dec 2019 10:39:06 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D686A4054;
 Thu,  5 Dec 2019 10:39:04 +0000 (GMT)
Received: from dhcp-9-199-159-163.in.ibm.com (unknown [9.199.159.163])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Dec 2019 10:39:04 +0000 (GMT)
From: Ritesh Harjani <riteshh@linux.ibm.com>
To: willy@infradead.org, linux-fsdevel@vger.kernel.org, jlayton@kernel.org,
 viro@zeniv.linux.org.uk
Subject: [PATCH 0/1] Use inode_lock/unlock class of provided APIs in
 filesystems
Date: Thu,  5 Dec 2019 16:09:01 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19120510-0020-0000-0000-0000039440D3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120510-0021-0000-0000-000021EB6D6B
Message-Id: <20191205103902.23618-1-riteshh@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-05_02:2019-12-04,2019-12-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=375 bulkscore=0
 lowpriorityscore=0 clxscore=1011 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912050087
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
Cc: linux-nfs@vger.kernel.org, linux-unionfs@vger.kernel.org,
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
2.20.1


