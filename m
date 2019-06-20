Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B604CFD4
	for <lists+devel-orangefs@lfdr.de>; Thu, 20 Jun 2019 16:01:13 +0200 (CEST)
Received: from [::1] (port=43784 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hdxcl-0001eK-Qt
	for lists+devel-orangefs@lfdr.de; Thu, 20 Jun 2019 10:01:11 -0400
Received: from mx2.suse.de ([195.135.220.15]:58446 helo=mx1.suse.de)
 by mm1.emwd.com with esmtps (TLSv1.2:AECDH-AES256-SHA:256)
 (Exim 4.92) (envelope-from <jack@suse.cz>) id 1hdxck-0001dD-6x
 for devel@lists.orangefs.org; Thu, 20 Jun 2019 10:01:10 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8BBB1AEF8;
 Thu, 20 Jun 2019 14:00:28 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 1187D1E434F; Thu, 20 Jun 2019 16:00:28 +0200 (CEST)
Date: Thu, 20 Jun 2019 16:00:28 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: [PATCH 2/6] vfs: flush and wait for io when setting the
 immutable flag via SETFLAGS
Message-ID: <20190620140028.GH30243@quack2.suse.cz>
References: <156022836912.3227213.13598042497272336695.stgit@magnolia>
 <156022838496.3227213.3771632042609589318.stgit@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156022838496.3227213.3771632042609589318.stgit@magnolia>
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
Cc: linux-efi@vger.kernel.org, linux-btrfs@vger.kernel.org, yuchao0@huawei.com,
 linux-mm@kvack.org, clm@fb.com, adilger.kernel@dilger.ca,
 matthew.garrett@nebula.com, linux-nilfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org, josef@toxicpanda.com,
 reiserfs-devel@vger.kernel.org, viro@zeniv.linux.org.uk, dsterba@suse.com,
 jaegeuk@kernel.org, tytso@mit.edu, ard.biesheuvel@linaro.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com
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

On Mon 10-06-19 21:46:25, Darrick J. Wong wrote:
> From: Darrick J. Wong <darrick.wong@oracle.com>
> 
> When we're using FS_IOC_SETFLAGS to set the immutable flag on a file, we
> need to ensure that userspace can't continue to write the file after the
> file becomes immutable.  To make that happen, we have to flush all the
> dirty pagecache pages to disk to ensure that we can fail a page fault on
> a mmap'd region, wait for pending directio to complete, and hope the
> caller locked out any new writes by holding the inode lock.
> 
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>

...

> diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
> index 6aa1df1918f7..a05341b94d98 100644
> --- a/fs/ext4/ioctl.c
> +++ b/fs/ext4/ioctl.c
> @@ -290,6 +290,9 @@ static int ext4_ioctl_setflags(struct inode *inode,
>  	jflag = flags & EXT4_JOURNAL_DATA_FL;
>  
>  	err = vfs_ioc_setflags_check(inode, oldflags, flags);
> +	if (err)
> +		goto flags_out;
> +	err = vfs_ioc_setflags_flush_data(inode, flags);
>  	if (err)
>  		goto flags_out;
>  

...

> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 8dad3c80b611..9c899c63957e 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -3548,7 +3548,41 @@ static inline struct sock *io_uring_get_socket(struct file *file)
>  
>  int vfs_ioc_setflags_check(struct inode *inode, int oldflags, int flags);
>  
> +/*
> + * Do we need to flush the file data before changing attributes?  When we're
> + * setting the immutable flag we must stop all directio writes and flush the
> + * dirty pages so that we can fail the page fault on the next write attempt.
> + */
> +static inline bool vfs_ioc_setflags_need_flush(struct inode *inode, int flags)
> +{
> +	if (S_ISREG(inode->i_mode) && !IS_IMMUTABLE(inode) &&
> +	    (flags & FS_IMMUTABLE_FL))
> +		return true;
> +
> +	return false;
> +}
> +
> +/*
> + * Flush file data before changing attributes.  Caller must hold any locks
> + * required to prevent further writes to this file until we're done setting
> + * flags.
> + */
> +static inline int inode_flush_data(struct inode *inode)
> +{
> +	inode_dio_wait(inode);
> +	return filemap_write_and_wait(inode->i_mapping);
> +}
> +
> +/* Flush file data before changing attributes, if necessary. */
> +static inline int vfs_ioc_setflags_flush_data(struct inode *inode, int flags)
> +{
> +	if (vfs_ioc_setflags_need_flush(inode, flags))
> +		return inode_flush_data(inode);
> +	return 0;
> +}
> +

But this is racy at least for page faults, isn't it? What protects you
against write faults just after filemap_write_and_wait() has finished?
So either you need to set FS_IMMUTABLE_FL before flushing data or you need
to get more protection from the fs than just i_rwsem. In the case of ext4
that would be i_mmap_rwsem but other filesystems don't have equivalent
protection...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

