Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B6456ECD
	for <lists+devel-orangefs@lfdr.de>; Wed, 26 Jun 2019 18:31:49 +0200 (CEST)
Received: from [::1] (port=43326 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hgApo-0004vG-0Q
	for lists+devel-orangefs@lfdr.de; Wed, 26 Jun 2019 12:31:48 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:38566)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <darrick.wong@oracle.com>)
 id 1hgApn-0004v2-7H
 for devel@lists.orangefs.org; Wed, 26 Jun 2019 12:31:47 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5QGU4Wg004218;
 Wed, 26 Jun 2019 16:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=Mz7em8B5BcTHywkzCrR8lugIdy2ootcWo4w3RRWBYaM=;
 b=N/a93ebuSSKM+1UIO0buPOjR9AvCbLsHhw01AwBMp/XW9BUb98JLnzoJbLgwOZFWmGyw
 hJdpkR7HkvPCAWlWLDnQsdQatbUdssqmn37SwPrTcAyE+/9x/iin4aJ6YtVFtP1GNmmr
 W4gQLbQG2SBcdOy5QNpDSE2/3fIVqQVrn7mZXub6KhldCj8Zzx/yQQ7a5EH7pzSZXmup
 IrJvp7zWK9kXgRoeoC8dGqS2tKAzLiR74Ta5S5LQWYLQBZWpbM10fUskgAys8/96vQdr
 G26RY/thy8CrA4lCa0mPtRoigi2YSG7nQksiKL4VCeGiPZV6yAFAimBMe+B5DQlWGUUd ig== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2t9brtbf85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2019 16:30:39 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5QGRxdd192423;
 Wed, 26 Jun 2019 16:28:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 2t9p6uvctr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Jun 2019 16:28:38 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5QGScxQ193859;
 Wed, 26 Jun 2019 16:28:38 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2t9p6uvctj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2019 16:28:38 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5QGSZWS032167;
 Wed, 26 Jun 2019 16:28:35 GMT
Received: from localhost (/10.159.137.246)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 26 Jun 2019 09:28:35 -0700
Date: Wed, 26 Jun 2019 09:28:31 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 5/5] vfs: don't allow writes to swap files
Message-ID: <20190626162831.GF5171@magnolia>
References: <156151637248.2283603.8458727861336380714.stgit@magnolia>
 <156151641177.2283603.7806026378321236401.stgit@magnolia>
 <20190626035151.GA10613@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626035151.GA10613@ZenIV.linux.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906260193
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
Cc: linux-efi@vger.kernel.org, linux-btrfs@vger.kernel.org, yuchao0@huawei.com,
 linux-mm@kvack.org, clm@fb.com, adilger.kernel@dilger.ca,
 matthew.garrett@nebula.com, linux-nilfs@vger.kernel.org, hch@infradead.org,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org, josef@toxicpanda.com,
 reiserfs-devel@vger.kernel.org, dsterba@suse.com, jaegeuk@kernel.org,
 tytso@mit.edu, ard.biesheuvel@linaro.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 jk@ozlabs.org, jack@suse.com, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com
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

On Wed, Jun 26, 2019 at 04:51:51AM +0100, Al Viro wrote:
> On Tue, Jun 25, 2019 at 07:33:31PM -0700, Darrick J. Wong wrote:
> > --- a/fs/attr.c
> > +++ b/fs/attr.c
> > @@ -236,6 +236,9 @@ int notify_change(struct dentry * dentry, struct iattr * attr, struct inode **de
> >  	if (IS_IMMUTABLE(inode))
> >  		return -EPERM;
> >  
> > +	if (IS_SWAPFILE(inode))
> > +		return -ETXTBSY;
> > +
> >  	if ((ia_valid & (ATTR_MODE | ATTR_UID | ATTR_GID | ATTR_TIMES_SET)) &&
> >  	    IS_APPEND(inode))
> >  		return -EPERM;
> 
> Er...  So why exactly is e.g. chmod(2) forbidden for swapfiles?  Or touch(1),
> for that matter...

Oops, that check is overly broad; I think the only attribute change we
need to filter here is ATTR_SIZE.... which we could do unconditionally
in inode_newsize_ok.

What's the use case for allowing userspace to increase the size of an
active swapfile?  I don't see any; the kernel has a permanent lease on
the file space mapping (at least until swapoff)...

> > diff --git a/mm/swapfile.c b/mm/swapfile.c
> > index 596ac98051c5..1ca4ee8c2d60 100644
> > --- a/mm/swapfile.c
> > +++ b/mm/swapfile.c
> > @@ -3165,6 +3165,19 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
> >  	if (error)
> >  		goto bad_swap;
> >  
> > +	/*
> > +	 * Flush any pending IO and dirty mappings before we start using this
> > +	 * swap file.
> > +	 */
> > +	if (S_ISREG(inode->i_mode)) {
> > +		inode->i_flags |= S_SWAPFILE;
> > +		error = inode_drain_writes(inode);
> > +		if (error) {
> > +			inode->i_flags &= ~S_SWAPFILE;
> > +			goto bad_swap;
> > +		}
> > +	}
> 
> Why are swap partitions any less worthy of protection?

Hmm, yeah, S_SWAPFILE should apply to block devices too.  I figured that
the mantra of "sane tools will open block devices with O_EXCL" should
have sufficed, but there's really no reason to allow that either.

--D

