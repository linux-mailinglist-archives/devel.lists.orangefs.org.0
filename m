Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DBE1C0D76
	for <lists+devel-orangefs@lfdr.de>; Fri,  1 May 2020 06:38:32 +0200 (CEST)
Received: from [::1] (port=34052 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jUNRY-0005gn-2U
	for lists+devel-orangefs@lfdr.de; Fri, 01 May 2020 00:38:32 -0400
Received: from zeniv.linux.org.uk ([195.92.253.2]:47826)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <viro@ftp.linux.org.uk>)
 id 1jUNRW-0005gQ-IJ
 for devel@lists.orangefs.org; Fri, 01 May 2020 00:38:30 -0400
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jUNQj-00Fc0H-H0; Fri, 01 May 2020 04:37:41 +0000
Date: Fri, 1 May 2020 05:37:41 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Ritesh Harjani <riteshh@linux.ibm.com>
Subject: Re: [RESEND PATCH 0/1] Use inode_lock/unlock class of provided APIs
 in filesystems
Message-ID: <20200501043741.GK23230@ZenIV.linux.org.uk>
References: <20200101105248.25304-1-riteshh@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200101105248.25304-1-riteshh@linux.ibm.com>
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
 devel@lists.orangefs.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-btrfs@vger.kernel.org
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

On Wed, Jan 01, 2020 at 04:22:47PM +0530, Ritesh Harjani wrote:
> Al, any comments?
> Resending this after adding Reviewed-by/Acked-by tags.

.... argh.  My apologies - that got fallen through the cracks.
Could you rebase and resend it?

