Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4AC12265D
	for <lists+devel-orangefs@lfdr.de>; Tue, 17 Dec 2019 09:13:25 +0100 (CET)
Received: from [::1] (port=59776 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1ih7yu-0002AR-Kb
	for lists+devel-orangefs@lfdr.de; Tue, 17 Dec 2019 03:13:24 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26480)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <riteshh@linux.ibm.com>)
 id 1ih7yt-00028y-6q
 for devel@lists.orangefs.org; Tue, 17 Dec 2019 03:13:23 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBH87TdK101112
 for <devel@lists.orangefs.org>; Tue, 17 Dec 2019 03:12:42 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wxpvwfgph-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <devel@lists.orangefs.org>; Tue, 17 Dec 2019 03:12:41 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <devel@lists.orangefs.org> from <riteshh@linux.ibm.com>;
 Tue, 17 Dec 2019 08:12:39 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Dec 2019 08:12:36 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBH8CZG155705752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Dec 2019 08:12:35 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B3DD4C059;
 Tue, 17 Dec 2019 08:12:35 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A81214C040;
 Tue, 17 Dec 2019 08:12:33 +0000 (GMT)
Received: from [9.199.158.112] (unknown [9.199.158.112])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Dec 2019 08:12:33 +0000 (GMT)
Subject: Re: [PATCH 0/1] Use inode_lock/unlock class of provided APIs in
 filesystems
To: willy@infradead.org, linux-fsdevel@vger.kernel.org, jlayton@kernel.org,
 viro@zeniv.linux.org.uk
References: <20191205103902.23618-1-riteshh@linux.ibm.com>
From: Ritesh Harjani <riteshh@linux.ibm.com>
Date: Tue, 17 Dec 2019 13:42:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20191205103902.23618-1-riteshh@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19121708-0020-0000-0000-000003990467
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121708-0021-0000-0000-000021F01F27
Message-Id: <20191217081233.A81214C040@d06av22.portsmouth.uk.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-17_01:2019-12-16,2019-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 phishscore=0 mlxlogscore=771 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912170071
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
Cc: ceph-devel@vger.kernel.org, devel@lists.orangefs.org,
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-unionfs@vger.kernel.org
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

Al, do you think this can be picked up via your tree?
Please let me know if anything needed from my end on this.

-ritesh

On 12/5/19 4:09 PM, Ritesh Harjani wrote:
> Matthew Wilcox in [1] suggested that it will be a good idea
> to define some missing API instead of directly using i_rwsem in
> filesystems drivers for lock/unlock/downgrade purposes.
> 
> This patch does that work. No functionality change in this patch.
> 
> After this there are only lockdep class of APIs at certain places
> in filesystems which are directly using i_rwsem and second is XFS,
> but it seems to be anyway defining it's own xfs_ilock/iunlock set
> of APIs and 'iolock' naming convention for this lock.
> 
> [1]: https://www.spinics.net/lists/linux-ext4/msg68689.html
> 
> Ritesh Harjani (1):
>    fs: Use inode_lock/unlock class of provided APIs in filesystems
> 
>   fs/btrfs/delayed-inode.c |  2 +-
>   fs/btrfs/ioctl.c         |  4 ++--
>   fs/ceph/io.c             | 24 ++++++++++++------------
>   fs/nfs/io.c              | 24 ++++++++++++------------
>   fs/orangefs/file.c       |  4 ++--
>   fs/overlayfs/readdir.c   |  2 +-
>   fs/readdir.c             |  4 ++--
>   include/linux/fs.h       | 21 +++++++++++++++++++++
>   8 files changed, 53 insertions(+), 32 deletions(-)
> 


