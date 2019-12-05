Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id D59DE1141C8
	for <lists+devel-orangefs@lfdr.de>; Thu,  5 Dec 2019 14:43:09 +0100 (CET)
Received: from [::1] (port=52048 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1icrPQ-0005F8-Ri
	for lists+devel-orangefs@lfdr.de; Thu, 05 Dec 2019 08:43:08 -0500
Received: from mx2.suse.de ([195.135.220.15]:34342 helo=mx1.suse.de)
 by mm1.emwd.com with esmtps (TLSv1.2:AECDH-AES256-SHA:256)
 (Exim 4.92) (envelope-from <dsterba@suse.cz>) id 1icrPP-0005Df-RK
 for devel@lists.orangefs.org; Thu, 05 Dec 2019 08:43:07 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 880E7B1A3;
 Thu,  5 Dec 2019 13:42:26 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id A1255DA733; Thu,  5 Dec 2019 14:42:20 +0100 (CET)
Date: Thu, 5 Dec 2019 14:42:20 +0100
From: David Sterba <dsterba@suse.cz>
To: Ritesh Harjani <riteshh@linux.ibm.com>
Subject: Re: [PATCH 1/1] fs: Use inode_lock/unlock class of provided APIs in
 filesystems
Message-ID: <20191205134220.GM2734@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Ritesh Harjani <riteshh@linux.ibm.com>,
 willy@infradead.org, linux-fsdevel@vger.kernel.org,
 jlayton@kernel.org, viro@zeniv.linux.org.uk,
 ceph-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, devel@lists.orangefs.org,
 linux-unionfs@vger.kernel.org
References: <20191205103902.23618-1-riteshh@linux.ibm.com>
 <20191205103902.23618-2-riteshh@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191205103902.23618-2-riteshh@linux.ibm.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
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
Reply-To: dsterba@suse.cz
Cc: linux-nfs@vger.kernel.org, devel@lists.orangefs.org, jlayton@kernel.org,
 linux-unionfs@vger.kernel.org, willy@infradead.org, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-btrfs@vger.kernel.org
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

On Thu, Dec 05, 2019 at 04:09:02PM +0530, Ritesh Harjani wrote:
> This defines 4 more APIs which some of the filesystem needs
> and reduces the direct use of i_rwsem in filesystem drivers.
> Instead those are replaced with inode_lock/unlock_** APIs.
> 
> Signed-off-by: Ritesh Harjani <riteshh@linux.ibm.com>
> ---

For the btrfs part

>  fs/btrfs/delayed-inode.c |  2 +-
>  fs/btrfs/ioctl.c         |  4 ++--

Acked-by: David Sterba <dsterba@suse.com>

