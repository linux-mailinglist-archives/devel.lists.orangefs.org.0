Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AE11E318A
	for <lists+devel-orangefs@lfdr.de>; Tue, 26 May 2020 23:54:59 +0200 (CEST)
Received: from [::1] (port=42106 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jdhXG-0007qW-DQ
	for lists+devel-orangefs@lfdr.de; Tue, 26 May 2020 17:54:58 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:36890)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <hubcap@omnibond.com>) id 1jdhXF-0007pj-BG
 for devel@lists.orangefs.org; Tue, 26 May 2020 17:54:57 -0400
Received: by mail-vs1-f67.google.com with SMTP id u79so12700791vsu.4
 for <devel@lists.orangefs.org>; Tue, 26 May 2020 14:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=omnibond-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0jK21EhVqfBvbPITLkn+96MTGZW6Bo0ptE3mNnDRD3A=;
 b=VJFY+sE6R0lEkr2FcepjY3oBdZps0iISn6dQY5y2gFvrCz2MSn+lg0Aw+uDaS/9/K0
 +fZwAZx9BypRwHJ5b5N2BEeEZyeipRgosXa0XlUo9pjdLYPG1fSAaMdUk96eMjNpibvN
 sDrOL4pEyDyi4h6gTIgKVUwNpMNz18HQr7oWqcjlAzA/rZPn1wFrocCdJe7W0BrPJnJK
 oEgCcRj6+GWXgVuL8ADPu1yXjAz7mj+yFngENH/Jcq0haWcO11IshEC4nog2VKbuUApP
 6D8BcyICqXQJE8snuXfTXHHUKWTlc3Ac3y1G2MKe2ow4emUmUJRcYUjMrC973SHCcKXr
 QCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0jK21EhVqfBvbPITLkn+96MTGZW6Bo0ptE3mNnDRD3A=;
 b=lpyLvglkvtYYdMAG0/SnbGWwDSflug52cIEQU8CkmRpxIV6LdoT/3ACdXw+/uhKZ+y
 bc0UtwqxO3n7k9jb2Al6aN8xUrgDIyG0bTCvnlO6SYNsaOL7OxGvrNcshBXLbBJxUkwl
 OgaMWdU0+hS74qBAeZGIvQIwFKD6zRwluRZjZrpIA/aXPmveWtZXQEpBoG0ifwABp2X3
 AghJrwlfhvXRj12n2jkUKfuUg6I82NI5F5V2rfBposPtQ0DHhZNubrd76p0u1/gzlz2K
 AbZUHL8ZEuasZFAK0VQGsXZCYZ225aEgIAYCMLS2ZrPnB4OMRm2fz+7XVu/tprx2LT0n
 OKCQ==
X-Gm-Message-State: AOAM531TwQSQM3O5Koamyrof4WsrOHttQ8y7cuivyGXwNp9thfsZhhrx
 jMhqgTYs7pFtfKn+ODsRsjTCup0GON/ayQ5tE/WjWA==
X-Google-Smtp-Source: ABdhPJzzaoMzy16lHwO6Cit4whNo24TT0SRB502FPqok9VsYLq5zk1Uuoxa+iC0FlPfnq33B0P3WZwccZGYkEDw15oU=
X-Received: by 2002:a05:6102:20cb:: with SMTP id
 i11mr2618905vsr.137.1590530055726; 
 Tue, 26 May 2020 14:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200517214718.468-1-guoqing.jiang@cloud.ionos.com>
 <20200517214718.468-9-guoqing.jiang@cloud.ionos.com>
In-Reply-To: <20200517214718.468-9-guoqing.jiang@cloud.ionos.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Tue, 26 May 2020 17:54:04 -0400
Message-ID: <CAOg9mSQ+nGCD-k2OwWWd6Ze_PAh3mhSOwYcLugD-SQHCb0ymWw@mail.gmail.com>
Subject: Re: [PATCH 08/10] orangefs: use attach/detach_page_private
To: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dave Chinner <david@fromorbit.com>, LKML <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, devel@lists.orangefs.org
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

I apologize for not mentioning that I ran this patch set
through orangefs xfstests at 5.7 rc5 with no problems
or regressions.

-Mike


On Sun, May 17, 2020 at 5:47 PM Guoqing Jiang
<guoqing.jiang@cloud.ionos.com> wrote:
>
> Since the new pair function is introduced, we can call them to clean the
> code in orangefs.
>
> Cc: Mike Marshall <hubcap@omnibond.com>
> Cc: Martin Brandenburg <martin@omnibond.com>
> Cc: devel@lists.orangefs.org
> Signed-off-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
> ---
> No change since RFC V3.
>
> RFC V2 -> RFC V3
> 1. rename clear_page_private to detach_page_private.
>
> RFC -> RFC V2
> 1. change the name of new functions to attach/clear_page_private.
> 2. avoid potential use-after-free as suggested by Dave Chinner.
>
>  fs/orangefs/inode.c | 32 ++++++--------------------------
>  1 file changed, 6 insertions(+), 26 deletions(-)
>
> diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
> index 12ae630fbed7..48f0547d4850 100644
> --- a/fs/orangefs/inode.c
> +++ b/fs/orangefs/inode.c
> @@ -62,12 +62,7 @@ static int orangefs_writepage_locked(struct page *page,
>         } else {
>                 ret = 0;
>         }
> -       if (wr) {
> -               kfree(wr);
> -               set_page_private(page, 0);
> -               ClearPagePrivate(page);
> -               put_page(page);
> -       }
> +       kfree(detach_page_private(page));
>         return ret;
>  }
>
> @@ -409,9 +404,7 @@ static int orangefs_write_begin(struct file *file,
>         wr->len = len;
>         wr->uid = current_fsuid();
>         wr->gid = current_fsgid();
> -       SetPagePrivate(page);
> -       set_page_private(page, (unsigned long)wr);
> -       get_page(page);
> +       attach_page_private(page, wr);
>  okay:
>         return 0;
>  }
> @@ -459,18 +452,12 @@ static void orangefs_invalidatepage(struct page *page,
>         wr = (struct orangefs_write_range *)page_private(page);
>
>         if (offset == 0 && length == PAGE_SIZE) {
> -               kfree((struct orangefs_write_range *)page_private(page));
> -               set_page_private(page, 0);
> -               ClearPagePrivate(page);
> -               put_page(page);
> +               kfree(detach_page_private(page));
>                 return;
>         /* write range entirely within invalidate range (or equal) */
>         } else if (page_offset(page) + offset <= wr->pos &&
>             wr->pos + wr->len <= page_offset(page) + offset + length) {
> -               kfree((struct orangefs_write_range *)page_private(page));
> -               set_page_private(page, 0);
> -               ClearPagePrivate(page);
> -               put_page(page);
> +               kfree(detach_page_private(page));
>                 /* XXX is this right? only caller in fs */
>                 cancel_dirty_page(page);
>                 return;
> @@ -535,12 +522,7 @@ static int orangefs_releasepage(struct page *page, gfp_t foo)
>
>  static void orangefs_freepage(struct page *page)
>  {
> -       if (PagePrivate(page)) {
> -               kfree((struct orangefs_write_range *)page_private(page));
> -               set_page_private(page, 0);
> -               ClearPagePrivate(page);
> -               put_page(page);
> -       }
> +       kfree(detach_page_private(page));
>  }
>
>  static int orangefs_launder_page(struct page *page)
> @@ -740,9 +722,7 @@ vm_fault_t orangefs_page_mkwrite(struct vm_fault *vmf)
>         wr->len = PAGE_SIZE;
>         wr->uid = current_fsuid();
>         wr->gid = current_fsgid();
> -       SetPagePrivate(page);
> -       set_page_private(page, (unsigned long)wr);
> -       get_page(page);
> +       attach_page_private(page, wr);
>  okay:
>
>         file_update_time(vmf->vma->vm_file);
> --
> 2.17.1
>

