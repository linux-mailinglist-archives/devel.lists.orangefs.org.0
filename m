Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id E15541B9482
	for <lists+devel-orangefs@lfdr.de>; Mon, 27 Apr 2020 00:25:40 +0200 (CEST)
Received: from [::1] (port=53816 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jSpiW-0000jK-5r
	for lists+devel-orangefs@lfdr.de; Sun, 26 Apr 2020 18:25:40 -0400
Received: from mail104.syd.optusnet.com.au ([211.29.132.246]:60603)
 by mm1.emwd.com with esmtp (Exim 4.93)
 (envelope-from <david@fromorbit.com>) id 1jSpiU-0000RT-PC
 for devel@lists.orangefs.org; Sun, 26 Apr 2020 18:25:39 -0400
Received: from dread.disaster.area (pa49-195-157-175.pa.nsw.optusnet.com.au
 [49.195.157.175])
 by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 8DA098218DE;
 Mon, 27 Apr 2020 08:24:55 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1jSphn-0008Lu-20; Mon, 27 Apr 2020 08:24:55 +1000
Date: Mon, 27 Apr 2020 08:24:55 +1000
From: Dave Chinner <david@fromorbit.com>
To: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Subject: Re: [RFC PATCH 8/9] orangefs: use set/clear_fs_page_private
Message-ID: <20200426222455.GB2005@dread.disaster.area>
References: <20200426214925.10970-1-guoqing.jiang@cloud.ionos.com>
 <20200426214925.10970-9-guoqing.jiang@cloud.ionos.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426214925.10970-9-guoqing.jiang@cloud.ionos.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=X6os11be c=1 sm=1 tr=0
 a=ONQRW0k9raierNYdzxQi9Q==:117 a=ONQRW0k9raierNYdzxQi9Q==:17
 a=kj9zAlcOel0A:10 a=cl8xLZFz6L8A:10 a=zesU-xl1AAAA:8 a=HrxoovQnAAAA:8
 a=UgJECxHJAAAA:8 a=7-415B0cAAAA:8 a=gjrzRSDns6Taw2l3SYsA:9
 a=naNHGdH9g6awxBnx:21 a=CFKdaBHXbnT_lfzZ:21 a=CjuIK1q_8ugA:10
 a=fdD1wl1Dw2ox_IZrOsee:22 a=7-7HFLmTXWwImnKUBZ1z:22
 a=-El7cUbtino8hM1DCn8D:22 a=biEYGPWJfzWAr4FL6Ov7:22
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
Cc: linux-kernel@vger.kernel.org, willy@infradead.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, devel@lists.orangefs.org
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

On Sun, Apr 26, 2020 at 11:49:24PM +0200, Guoqing Jiang wrote:
> Since the new pair function is introduced, we can call them to clean the
> code in orangefs.
> 
> Cc: Mike Marshall <hubcap@omnibond.com>
> Cc: Martin Brandenburg <martin@omnibond.com>
> Cc: devel@lists.orangefs.org
> Signed-off-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
> ---
>  fs/orangefs/inode.c | 24 ++++++------------------
>  1 file changed, 6 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
> index 12ae630fbed7..893099d36e20 100644
> --- a/fs/orangefs/inode.c
> +++ b/fs/orangefs/inode.c
> @@ -64,9 +64,7 @@ static int orangefs_writepage_locked(struct page *page,
>  	}
>  	if (wr) {
>  		kfree(wr);
> -		set_page_private(page, 0);
> -		ClearPagePrivate(page);
> -		put_page(page);
> +		clear_fs_page_private(page);

THis is a pre-existing potential use-after-free vector. The wr
pointer held in the page->private needs to be cleared from the page
before it is freed.

>  	}
>  	return ret;
>  }
> @@ -409,9 +407,7 @@ static int orangefs_write_begin(struct file *file,
>  	wr->len = len;
>  	wr->uid = current_fsuid();
>  	wr->gid = current_fsgid();
> -	SetPagePrivate(page);
> -	set_page_private(page, (unsigned long)wr);
> -	get_page(page);
> +	set_fs_page_private(page, wr);
>  okay:
>  	return 0;
>  }
> @@ -460,17 +456,13 @@ static void orangefs_invalidatepage(struct page *page,
>  
>  	if (offset == 0 && length == PAGE_SIZE) {
>  		kfree((struct orangefs_write_range *)page_private(page));
> -		set_page_private(page, 0);
> -		ClearPagePrivate(page);
> -		put_page(page);
> +		clear_fs_page_private(page);

Ditto:
		wr = clear_fs_page_private(page);
		kfree(wr);

>  		return;
>  	/* write range entirely within invalidate range (or equal) */
>  	} else if (page_offset(page) + offset <= wr->pos &&
>  	    wr->pos + wr->len <= page_offset(page) + offset + length) {
>  		kfree((struct orangefs_write_range *)page_private(page));
> -		set_page_private(page, 0);
> -		ClearPagePrivate(page);
> -		put_page(page);
> +		clear_fs_page_private(page);

And again.

>  		/* XXX is this right? only caller in fs */
>  		cancel_dirty_page(page);
>  		return;
> @@ -537,9 +529,7 @@ static void orangefs_freepage(struct page *page)
>  {
>  	if (PagePrivate(page)) {
>  		kfree((struct orangefs_write_range *)page_private(page));
> -		set_page_private(page, 0);
> -		ClearPagePrivate(page);
> -		put_page(page);
> +		clear_fs_page_private(page);

And again.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

