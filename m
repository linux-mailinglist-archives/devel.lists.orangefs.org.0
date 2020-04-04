Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE0219E6D2
	for <lists+devel-orangefs@lfdr.de>; Sat,  4 Apr 2020 19:44:33 +0200 (CEST)
Received: from [::1] (port=57706 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jKmqP-00012o-2U
	for lists+devel-orangefs@lfdr.de; Sat, 04 Apr 2020 13:44:33 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60882)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <willy@infradead.org>) id 1jKmqL-0000wc-Lk
 for devel@lists.orangefs.org; Sat, 04 Apr 2020 13:44:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AP40KpIqZCsdomgwe4trkVU5kvHN6xKBJSNZQoGj8AE=; b=TmGjz+7r6n1CR1VZNtjadT4GDT
 OHmH1fq6kpLID1Oga1dcep3mKYELxYgNd+jhZlo5aH2nB25prlXuDcxCRA/5Cau2ukG9zbx8kh98b
 BM811VI7n7/zQS7ACNPwow4ZBr0/qHVCVunR8V9f9U+erwyJZdQuzLhFevFowDyi/x8uwV9cGa6tv
 9l8tp0q2ArYCjoSWvWYuC6NcshuDHeE6RPdtxtLRxB92cSVLDK0W7dM5+QZ+n1DZf2YOcZhuQrCNT
 Xc6lLr8Xm8ETuvtZoOiTsxuhs1OpPxcxCZyIJKLwGkNE2SsQADy6KeotMTu4biuBDnaKwu2dM6h+N
 oafzssDg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jKmpe-0003ZR-HB; Sat, 04 Apr 2020 17:43:46 +0000
Date: Sat, 4 Apr 2020 10:43:46 -0700
From: Matthew Wilcox <willy@infradead.org>
To: hubcap@kernel.org
Subject: Re: [PATCH] orangefs: complete Christoph's "remember count" reversion.
Message-ID: <20200404174346.GU21484@bombadil.infradead.org>
References: <20200326170705.1552562-2-hch@lst.de>
 <20200404162826.181808-1-hubcap@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200404162826.181808-1-hubcap@kernel.org>
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
Cc: linux-fsdevel@vger.kernel.org, hch@lst.de, devel@lists.orangefs.org
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

On Sat, Apr 04, 2020 at 12:28:26PM -0400, hubcap@kernel.org wrote:
> As an aside, the page cache has been a blessing and a curse
> for us. Since we started using it, small IO has improved
> incredibly, but our max speed hits a plateau before it otherwise
> would have. I think because of all the page size copies we have
> to do to fill our 4 meg native buffers. I try to read about all
> the new work going into the page cache in lwn, and make some
> sense of the new code :-). One thing I remember is when
> Christoph Lameter said "the page cache does not scale", but
> I know the new work is focused on that. If anyone has any
> thoughts about how we could make improvments on filling our
> native buffers from the page cache (larger page sizes?),
> feel free to offer any help...

Umm, 4MB native buffers are ... really big ;-)  I wasn't planning on
going past PMD_SIZE (ie 2MB on x86) for the readahead large pages,
but if a filesystem wants that, then I should change that plan.

What I was planning for, but don't quite have an implementation nailed
down for yet, is allowing filesystems to grow the readahead beyond that
wanted by the generic code.  Filesystems which implement compression
frequently want blocks in the 256kB size range.  It seems like OrangeFS
would fit with that scheme, as long as I don't put a limit on what the
filesystem asks for.

So yes, I think within the next year, you should be able to tell the
page cache to allocate 4MB pages.  You will still need a fallback path
for when memory is too fragmented to allocate new pages, but if you're
using 4MB pages, then hopefully we'll be able to reclaim a clean 4MB
pages from elsewhere in the page cache and supply you with a new one.

