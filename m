Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E211B951F
	for <lists+devel-orangefs@lfdr.de>; Mon, 27 Apr 2020 04:27:56 +0200 (CEST)
Received: from [::1] (port=39080 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jStUy-0005bC-0d
	for lists+devel-orangefs@lfdr.de; Sun, 26 Apr 2020 22:27:56 -0400
Received: from mail104.syd.optusnet.com.au ([211.29.132.246]:35112)
 by mm1.emwd.com with esmtp (Exim 4.93)
 (envelope-from <david@fromorbit.com>) id 1jStUw-0005aH-QJ
 for devel@lists.orangefs.org; Sun, 26 Apr 2020 22:27:55 -0400
Received: from dread.disaster.area (pa49-195-157-175.pa.nsw.optusnet.com.au
 [49.195.157.175])
 by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id B80CF82167F;
 Mon, 27 Apr 2020 12:27:10 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1jStUD-0001QJ-Af; Mon, 27 Apr 2020 12:27:09 +1000
Date: Mon, 27 Apr 2020 12:27:09 +1000
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC PATCH 8/9] orangefs: use set/clear_fs_page_private
Message-ID: <20200427022709.GC2005@dread.disaster.area>
References: <20200426214925.10970-1-guoqing.jiang@cloud.ionos.com>
 <20200426214925.10970-9-guoqing.jiang@cloud.ionos.com>
 <20200426222455.GB2005@dread.disaster.area>
 <20200427001234.GB29705@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427001234.GB29705@bombadil.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=X6os11be c=1 sm=1 tr=0
 a=ONQRW0k9raierNYdzxQi9Q==:117 a=ONQRW0k9raierNYdzxQi9Q==:17
 a=kj9zAlcOel0A:10 a=cl8xLZFz6L8A:10 a=7-415B0cAAAA:8
 a=_ZLPnNw1jSjQLjkGmAoA:9 a=CjuIK1q_8ugA:10 a=igBNqPyMv6gA:10
 a=biEYGPWJfzWAr4FL6Ov7:22
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
Cc: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>, linux-kernel@vger.kernel.org,
 hch@infradead.org, linux-fsdevel@vger.kernel.org, devel@lists.orangefs.org
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

On Sun, Apr 26, 2020 at 05:12:34PM -0700, Matthew Wilcox wrote:
> On Mon, Apr 27, 2020 at 08:24:55AM +1000, Dave Chinner wrote:
> > > @@ -460,17 +456,13 @@ static void orangefs_invalidatepage(struct page *page,
> > >  
> > >  	if (offset == 0 && length == PAGE_SIZE) {
> > >  		kfree((struct orangefs_write_range *)page_private(page));
> > > -		set_page_private(page, 0);
> > > -		ClearPagePrivate(page);
> > > -		put_page(page);
> > > +		clear_fs_page_private(page);
> > 
> > Ditto:
> > 		wr = clear_fs_page_private(page);
> > 		kfree(wr);
> 
> You don't want to be as succinct as the btrfs change you suggested?
> 
> 		kfree(clear_fs_page_private(page));

That could be done, yes. I was really just trying to point out the
use after free that was occurring here rather than write compact
code...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

