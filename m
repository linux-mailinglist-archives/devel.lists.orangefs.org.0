Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2F01DF508
	for <lists+devel-orangefs@lfdr.de>; Sat, 23 May 2020 07:42:07 +0200 (CEST)
Received: from [::1] (port=45976 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jcMv8-0008De-E8
	for lists+devel-orangefs@lfdr.de; Sat, 23 May 2020 01:42:06 -0400
Received: from zeniv.linux.org.uk ([195.92.253.2]:54502)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <viro@ftp.linux.org.uk>)
 id 1jcMv6-00088n-Hp
 for devel@lists.orangefs.org; Sat, 23 May 2020 01:42:04 -0400
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1jcMuL-00DvEc-Av; Sat, 23 May 2020 05:41:17 +0000
Date: Sat, 23 May 2020 06:41:17 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: wu000273@umn.edu
Subject: Re: [PATCH 2/2] orangefs: fix double-unlock issue in
 service_operation().
Message-ID: <20200523054117.GY23230@ZenIV.linux.org.uk>
References: <20200523043551.9756-1-wu000273@umn.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200523043551.9756-1-wu000273@umn.edu>
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
Cc: kjlu@umn.edu, linux-kernel@vger.kernel.org, devel@lists.orangefs.org
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

On Fri, May 22, 2020 at 11:35:51PM -0500, wu000273@umn.edu wrote:
> From: Qiushi Wu <wu000273@umn.edu>
> 
> spin_unlock(&op->lock) is called before calling wake_up_interruptible().
> But spin_unlock() was called again after a call of the function
> "wait_for_matching_downcall" failed.

Yes, it was.

> Fix this issue by remove
> the second spin_unlock().

Why is that a bug?  That's not an idle question - you could demonstrate
that if you had reproduced an unbalanced unlock experimentally, or you
could've proven it possible by analysis of the source.

The former ought to be clearly reported; the latter... AFAICS, your
reasoning is
	1) at the time of wait_for_matching_downcall() call the spinlock
is not being held, since we'd unlocked it upstream of that call and had
done nothing that could have reacquired it.
	2) after the return from that function we are doing unlock.
That is a bug, because one should not unlock a spinlock that is not
locked.

The gap in that proof is the unverified assumption that the locking
conditions upon return from wait_for_matching_downcall() are the same
as upon its call.  IF that assumption holds, there is, indeed a bug.
Now, a look at the function in question shows
	* a comment right before it claiming that it
" * Returns with op->lock taken.".  Which might or might not be correct.
	* one of the wait_for_completion...() called; that clearly
indicates that no spinlocks should be held upon the entry.
	* unconditional spin_lock(&op->lock); right after that.
	* several predicates checked, apparently some debugging
output possibly produced and a value returned.  The predicates
(op_state_service(), op_state_purged()) are clearly locking-neutral -
grep shows
fs/orangefs/orangefs-kernel.h:154:#define op_state_serviced(op)    ((op)->op_state & OP_VFS_STATE_SERVICED)
fs/orangefs/orangefs-kernel.h:155:#define op_state_purged(op)      ((op)->op_state & OP_VFS_STATE_PURGED)
so it's plain arithmetics.  The same, of course, applies to
comparisons.

In other words, the function *does* acquire that spinlock and
does not release it, regardless of the value it returns.  Which
means that your patch would very likely to cause deadlocks.

