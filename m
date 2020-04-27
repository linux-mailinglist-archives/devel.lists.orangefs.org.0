Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 049901B94B3
	for <lists+devel-orangefs@lfdr.de>; Mon, 27 Apr 2020 02:13:21 +0200 (CEST)
Received: from [::1] (port=36228 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jSrOi-0003cg-8d
	for lists+devel-orangefs@lfdr.de; Sun, 26 Apr 2020 20:13:20 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:37376)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <willy@infradead.org>) id 1jSrOg-0003bI-AP
 for devel@lists.orangefs.org; Sun, 26 Apr 2020 20:13:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Sv3KzlHXHSNzqCfln1zX1+cYvetQ25Ui6UHInWko+bo=; b=rEb+lE/0+PtIQJdRbjS2xjuy+o
 oSuqS+/IwVu0sy4fCBtWk7SuEB22rklJevn4zj9wnt4SG9IaNVUSlQbdp8tLG4xGcFlChDqU9Hdp8
 LSZD0cVat+rHWqK4vYCIQfqKBNzpNloawwp5432WYgqdqYklL3xej2tZpQa1Z2c2Sp0vudw1U0aV2
 8YhjOjoLPsdQ1qmpE/Rtx5bn40vIsybG4bpGkMU6yNDtnIlstQZWDQrLFZ6QkdRS6odl8LuHfUAhS
 BxvVdaRF++aRN9IF/VQTPEUdZwxcmS2G+OtGu4bM+Q7fR0GRS+nF/Ppq/nR8Hzzsn9U0a5/b8liA8
 TBKguqDA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jSrNy-0003Ft-9I; Mon, 27 Apr 2020 00:12:34 +0000
Date: Sun, 26 Apr 2020 17:12:34 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Subject: Re: [RFC PATCH 8/9] orangefs: use set/clear_fs_page_private
Message-ID: <20200427001234.GB29705@bombadil.infradead.org>
References: <20200426214925.10970-1-guoqing.jiang@cloud.ionos.com>
 <20200426214925.10970-9-guoqing.jiang@cloud.ionos.com>
 <20200426222455.GB2005@dread.disaster.area>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426222455.GB2005@dread.disaster.area>
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

On Mon, Apr 27, 2020 at 08:24:55AM +1000, Dave Chinner wrote:
> > @@ -460,17 +456,13 @@ static void orangefs_invalidatepage(struct page *page,
> >  
> >  	if (offset == 0 && length == PAGE_SIZE) {
> >  		kfree((struct orangefs_write_range *)page_private(page));
> > -		set_page_private(page, 0);
> > -		ClearPagePrivate(page);
> > -		put_page(page);
> > +		clear_fs_page_private(page);
> 
> Ditto:
> 		wr = clear_fs_page_private(page);
> 		kfree(wr);

You don't want to be as succinct as the btrfs change you suggested?

		kfree(clear_fs_page_private(page));


