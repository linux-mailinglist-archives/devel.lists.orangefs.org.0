Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 359E01C0BC6
	for <lists+devel-orangefs@lfdr.de>; Fri,  1 May 2020 03:44:10 +0200 (CEST)
Received: from [::1] (port=49190 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jUKin-0000Xy-8G
	for lists+devel-orangefs@lfdr.de; Thu, 30 Apr 2020 21:44:09 -0400
Received: from zeniv.linux.org.uk ([195.92.253.2]:45500)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <viro@ftp.linux.org.uk>)
 id 1jUKil-0000XQ-Ri
 for devel@lists.orangefs.org; Thu, 30 Apr 2020 21:44:07 -0400
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jUKhB-00FVTz-IU; Fri, 01 May 2020 01:42:29 +0000
Date: Fri, 1 May 2020 02:42:29 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC PATCH V2 1/9] include/linux/pagemap.h: introduce
 attach/clear_page_private
Message-ID: <20200501014229.GB23230@ZenIV.linux.org.uk>
References: <20200430214450.10662-1-guoqing.jiang@cloud.ionos.com>
 <20200430214450.10662-2-guoqing.jiang@cloud.ionos.com>
 <20200430221338.GY29705@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430221338.GY29705@bombadil.infradead.org>
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
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, david@fromorbit.com,
 Song Liu <song@kernel.org>, Yafang Shao <laoar.shao@gmail.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Chris Mason <clm@fb.com>,
 hch@infradead.org, devel@lists.orangefs.org, Chao Yu <chao@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, linux-raid@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Anton Altaparmakov <anton@tuxera.com>,
 Andreas Dilger <adilger@dilger.ca>,
 Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
 Yang Shi <yang.shi@linux.alibaba.com>,
 William Kucharski <william.kucharski@oracle.com>,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Roman Gushchin <guro@fb.com>, linux-btrfs@vger.kernel.org
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

On Thu, Apr 30, 2020 at 03:13:38PM -0700, Matthew Wilcox wrote:

> > +/**
> > + * clear_page_private - clear page's private field and PG_private.
> > + * @page: page to be cleared.
> > + *
> > + * The counterpart function of attach_page_private.
> > + * Return: private data of page or NULL if page doesn't have private data.
> > + */
> 
> Seems to me that the opposite of "attach" is "detach", not "clear".

Or "remove", perhaps...

