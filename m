Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 0667214F585
	for <lists+devel-orangefs@lfdr.de>; Sat,  1 Feb 2020 01:57:26 +0100 (CET)
Received: from [::1] (port=35896 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1ixh6C-00032s-UG
	for lists+devel-orangefs@lfdr.de; Fri, 31 Jan 2020 19:57:24 -0500
Received: from zeniv.linux.org.uk ([195.92.253.2]:45266)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <viro@ftp.linux.org.uk>)
 id 1ixh6B-00032R-Ex
 for devel@lists.orangefs.org; Fri, 31 Jan 2020 19:57:23 -0500
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1ixh5T-005Ta0-1z; Sat, 01 Feb 2020 00:56:39 +0000
Date: Sat, 1 Feb 2020 00:56:39 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Mike Marshall <hubcap@omnibond.com>
Subject: [confused] can orangefs ACLs be removed at all?
Message-ID: <20200201005639.GG23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linux-fsdevel@vger.kernel.org, devel@lists.orangefs.org
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

	Prior to 4bef69000d93 (orangefs: react properly to
posix_acl_update_mode's aftermath.) it used to be possible
to do orangefs_set_acl(inode, NULL, ACL_TYPE_ACCESS) -
it would've removed the corresponding xattr and that would
be it.  Now it fails with -EINVAL without having done
anything.  How is one supposed to remove ACLs there?

	Moreover, if you change an existing ACL to something
that is expressible by pure mode, you end up calling
__orangefs_setattr(), which will call posix_acl_chmod().
And AFAICS that will happen with *old* ACL still cached,
so you'll get ACL_MASK/ACL_OTHER updated in the old ACL.

	How can that possibly work?  Sure, you want to
propagate the updated mode to server - after you've
done the actual update (possibly removal) of ACL-encoding
xattr there...

