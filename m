Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id D771B4F187
	for <lists+devel-orangefs@lfdr.de>; Sat, 22 Jun 2019 01:57:58 +0200 (CEST)
Received: from [::1] (port=57978 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1heTPq-0000L3-29
	for lists+devel-orangefs@lfdr.de; Fri, 21 Jun 2019 19:57:58 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:40112)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <darrick.wong@oracle.com>)
 id 1heTPo-0000Jm-KE
 for devel@lists.orangefs.org; Fri, 21 Jun 2019 19:57:56 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5LNtT3B053502;
 Fri, 21 Jun 2019 23:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=twjcs7hmw0I/0y9CON1SwlujfVo0pxMu7JFwyONml5Y=;
 b=EN0d442hHQvSNNdl/RDvWSv64qxAaUqBJ+XWzb9wmHNittQOUUWson32FwnA5XsOJ7B1
 iGsLJuG230CgcItr8GkMiTTOOQPd++pT+F2FFKTrjIIUW23zuCjPo4q9zWJSRjhtqh4y
 tHUs2KjIj99SfJcNC3WfbXVxr7c5JoLZ6M05US2Y9VlFyVrcg+sjXlOJohNfSt1B3GLs
 aTA1JLQMueHt86DwwYNKh4l87ElhhVid89sOr4rk8MXfz9FIGnNxYLjrMalcbFp/7Ylc
 5dsT5NuF7PizftC8G7G17VjxcDrejTJ0B4mzo+6ilFAPLgyMkxYtyhCXIMImzP87l7n9 2g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2t7809rswm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jun 2019 23:57:05 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5LNtKFi168028;
 Fri, 21 Jun 2019 23:57:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 2t7rdy0612-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 21 Jun 2019 23:57:04 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5LNuhUw170079;
 Fri, 21 Jun 2019 23:57:04 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2t7rdy060u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jun 2019 23:57:04 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5LNv2Il019145;
 Fri, 21 Jun 2019 23:57:02 GMT
Received: from localhost (/10.159.131.214)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 21 Jun 2019 16:57:02 -0700
Subject: [PATCH 1/7] mm/fs: don't allow writes to immutable files
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: matthew.garrett@nebula.com, yuchao0@huawei.com, tytso@mit.edu,
 darrick.wong@oracle.com, ard.biesheuvel@linaro.org,
 josef@toxicpanda.com, clm@fb.com, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, jack@suse.com, dsterba@suse.com,
 jaegeuk@kernel.org, jk@ozlabs.org
Date: Fri, 21 Jun 2019 16:56:58 -0700
Message-ID: <156116141836.1664939.12249697737780481978.stgit@magnolia>
In-Reply-To: <156116141046.1664939.11424021489724835645.stgit@magnolia>
References: <156116141046.1664939.11424021489724835645.stgit@magnolia>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9295
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=315 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906210182
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
Cc: linux-efi@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, linux-nilfs@vger.kernel.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org
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

From: Darrick J. Wong <darrick.wong@oracle.com>

The chattr manpage has this to say about immutable files:

"A file with the 'i' attribute cannot be modified: it cannot be deleted
or renamed, no link can be created to this file, most of the file's
metadata can not be modified, and the file can not be opened in write
mode."

Once the flag is set, it is enforced for quite a few file operations,
such as fallocate, fpunch, fzero, rm, touch, open, etc.  However, we
don't check for immutability when doing a write(), a PROT_WRITE mmap(),
a truncate(), or a write to a previously established mmap.

If a program has an open write fd to a file that the administrator
subsequently marks immutable, the program still can change the file
contents.  Weird!

The ability to write to an immutable file does not follow the manpage
promise that immutable files cannot be modified.  Worse yet it's
inconsistent with the behavior of other syscalls which don't allow
modifications of immutable files.

Therefore, add the necessary checks to make the write, mmap, and
truncate behavior consistent with what the manpage says and consistent
with other syscalls on filesystems which support IMMUTABLE.

Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
---
 fs/attr.c    |   13 ++++++-------
 mm/filemap.c |    3 +++
 mm/memory.c  |    3 +++
 mm/mmap.c    |    8 ++++++--
 4 files changed, 18 insertions(+), 9 deletions(-)


diff --git a/fs/attr.c b/fs/attr.c
index d22e8187477f..1fcfdcc5b367 100644
--- a/fs/attr.c
+++ b/fs/attr.c
@@ -233,19 +233,18 @@ int notify_change(struct dentry * dentry, struct iattr * attr, struct inode **de
 
 	WARN_ON_ONCE(!inode_is_locked(inode));
 
-	if (ia_valid & (ATTR_MODE | ATTR_UID | ATTR_GID | ATTR_TIMES_SET)) {
-		if (IS_IMMUTABLE(inode) || IS_APPEND(inode))
-			return -EPERM;
-	}
+	if (IS_IMMUTABLE(inode))
+		return -EPERM;
+
+	if ((ia_valid & (ATTR_MODE | ATTR_UID | ATTR_GID | ATTR_TIMES_SET)) &&
+	    IS_APPEND(inode))
+		return -EPERM;
 
 	/*
 	 * If utimes(2) and friends are called with times == NULL (or both
 	 * times are UTIME_NOW), then we need to check for write permission
 	 */
 	if (ia_valid & ATTR_TOUCH) {
-		if (IS_IMMUTABLE(inode))
-			return -EPERM;
-
 		if (!inode_owner_or_capable(inode)) {
 			error = inode_permission(inode, MAY_WRITE);
 			if (error)
diff --git a/mm/filemap.c b/mm/filemap.c
index aac71aef4c61..dad85e10f5f8 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2935,6 +2935,9 @@ inline ssize_t generic_write_checks(struct kiocb *iocb, struct iov_iter *from)
 	loff_t count;
 	int ret;
 
+	if (IS_IMMUTABLE(inode))
+		return -EPERM;
+
 	if (!iov_iter_count(from))
 		return 0;
 
diff --git a/mm/memory.c b/mm/memory.c
index ddf20bd0c317..4311cfdade90 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2235,6 +2235,9 @@ static vm_fault_t do_page_mkwrite(struct vm_fault *vmf)
 
 	vmf->flags = FAULT_FLAG_WRITE|FAULT_FLAG_MKWRITE;
 
+	if (vmf->vma->vm_file && IS_IMMUTABLE(file_inode(vmf->vma->vm_file)))
+		return VM_FAULT_SIGBUS;
+
 	ret = vmf->vma->vm_ops->page_mkwrite(vmf);
 	/* Restore original flags so that caller is not surprised */
 	vmf->flags = old_flags;
diff --git a/mm/mmap.c b/mm/mmap.c
index 7e8c3e8ae75f..ac1e32205237 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1483,8 +1483,12 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 		case MAP_SHARED_VALIDATE:
 			if (flags & ~flags_mask)
 				return -EOPNOTSUPP;
-			if ((prot&PROT_WRITE) && !(file->f_mode&FMODE_WRITE))
-				return -EACCES;
+			if (prot & PROT_WRITE) {
+				if (!(file->f_mode & FMODE_WRITE))
+					return -EACCES;
+				if (IS_IMMUTABLE(file_inode(file)))
+					return -EPERM;
+			}
 
 			/*
 			 * Make sure we don't allow writing to an append-only


