Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 656D71997F5
	for <lists+devel-orangefs@lfdr.de>; Tue, 31 Mar 2020 15:56:04 +0200 (CEST)
Received: from [::1] (port=35750 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jJHN5-00034i-Cc
	for lists+devel-orangefs@lfdr.de; Tue, 31 Mar 2020 09:56:03 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:37624)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <hubcap@omnibond.com>) id 1jJHN4-00034B-4h
 for devel@lists.orangefs.org; Tue, 31 Mar 2020 09:56:02 -0400
Received: by mail-vs1-f67.google.com with SMTP id o3so13496557vsd.4
 for <devel@lists.orangefs.org>; Tue, 31 Mar 2020 06:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=omnibond-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+/B2A1qcKH7oSSG9mXAFj0tT6t/BTjeCiRoD7zqWTYM=;
 b=LMXF+WcQmxVGp1YzB1UZyrpBVUbhIsrrqHHsK9TQ8EPk7nbI1osljohmYskrWJmNVT
 AHzLrBoCVNxRWL8k39IlPdHopiRDLbwkRdpV2S0JFauXIn1Ltfvx9iAiNY55Ys3TWcZR
 108tpjKrCKUBd1aGR8yA7XPu9DI1L4g4in9Bd48VT4do/7wptV50wDT4A1UaJVVlabD5
 fOLZ77ML4hxhrGdPPqnRurOdQnHJ8erIUtxqyNfDKXDevC3wt9l1W/B30ggi7YcRPFzT
 Fxn85w8fWPkxsvI285WldxldKAXBv3IlbKdxuWiCRym1oS5ZjSSMA/IrZItu1t+lsKPv
 XMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+/B2A1qcKH7oSSG9mXAFj0tT6t/BTjeCiRoD7zqWTYM=;
 b=dcJzyRxNWw2LVJEVwsjFJUTdxwPaJGkGgu3R+f/U7aF/40Xzq7Uc9Jgp6jCnuMSS/9
 lpB3vX9XC0Hh0f2ucILlKqaBNvkrC0KNxo9I0XNxW0VycutY8kYvBSOl/APdlHbI6OaJ
 8KgRKLt3xKUWgxP+ZKbvId3J//egh60cQ2WOMd23jb7Tc0a8VmN1UA2K2lRcdvQRlW4Z
 /Ne0i8xCV3U3OTRcQAzbAa/kH+7TrYhwoyjnQ6Q45hm3v7bMHimV3nbEYTBhIn7e8xI9
 Akj6xEfDvkpL3tFqkqiOg7ovyOzKF+B9Z/e8aCv8ByGbNdhF6c4yMcjjiduxIBgzWtzc
 2jKA==
X-Gm-Message-State: AGi0PubWtIKV4ZXJ2x/Qaw75N5+ptO0JuXcvnZs8IPpnZnXjO/yOgNby
 0PjwoG2xl0WKNuoteBY5P6ztw2Ohfsy+U7enQ7XHGA==
X-Google-Smtp-Source: APiQypK3E0gQuHc1rDbqi+XmKXyimxuhv22EhSnCoIfh0XJFz9xgZieqE30qhe75Tm5i3/nN2aeRc4kOspHycosyIwY=
X-Received: by 2002:a67:80d6:: with SMTP id
 b205mr11605054vsd.137.1585662921374; 
 Tue, 31 Mar 2020 06:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200326170705.1552562-1-hch@lst.de>
 <20200326170705.1552562-2-hch@lst.de>
In-Reply-To: <20200326170705.1552562-2-hch@lst.de>
From: Mike Marshall <hubcap@omnibond.com>
Date: Tue, 31 Mar 2020 09:55:09 -0400
Message-ID: <CAOg9mST05zXRU1rmgTNdYPb93zHsO9N3TOMhuGGj8Q=6=_j=kw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Revert "orangefs: remember count when reading."
To: Christoph Hellwig <hch@lst.de>
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, devel@lists.orangefs.org
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

Hi Christoph...

Thanks for the patches... the revision of c2549f8c (which I dreamed up :-) )
might hose up some other stuff with our recent page cache revisions,
though I have no doubt about your concerns... I'll post back after I've
run some tests...

-Mike

On Thu, Mar 26, 2020 at 1:07 PM Christoph Hellwig <hch@lst.de> wrote:
>
> ->read_iter calls can race with each other and one or more ->flush calls.
> Remove the the scheme to store the read count in the file private data
> as is is completely racy and can cause use after free or double free
> conditions.
>
> This reverts commit c2549f8c7a28c00facaf911f700c4811cfd6f52b.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/orangefs/file.c            | 26 +-------------------------
>  fs/orangefs/orangefs-kernel.h |  4 ----
>  2 files changed, 1 insertion(+), 29 deletions(-)
>
> diff --git a/fs/orangefs/file.c b/fs/orangefs/file.c
> index c740159d9ad1..173e6ea57a47 100644
> --- a/fs/orangefs/file.c
> +++ b/fs/orangefs/file.c
> @@ -346,23 +346,8 @@ static ssize_t orangefs_file_read_iter(struct kiocb *iocb,
>      struct iov_iter *iter)
>  {
>         int ret;
> -       struct orangefs_read_options *ro;
> -
>         orangefs_stats.reads++;
>
> -       /*
> -        * Remember how they set "count" in read(2) or pread(2) or whatever -
> -        * users can use count as a knob to control orangefs io size and later
> -        * we can try to help them fill as many pages as possible in readpage.
> -        */
> -       if (!iocb->ki_filp->private_data) {
> -               iocb->ki_filp->private_data = kmalloc(sizeof *ro, GFP_KERNEL);
> -               if (!iocb->ki_filp->private_data)
> -                       return(ENOMEM);
> -               ro = iocb->ki_filp->private_data;
> -               ro->blksiz = iter->count;
> -       }
> -
>         down_read(&file_inode(iocb->ki_filp)->i_rwsem);
>         ret = orangefs_revalidate_mapping(file_inode(iocb->ki_filp));
>         if (ret)
> @@ -650,12 +635,6 @@ static int orangefs_lock(struct file *filp, int cmd, struct file_lock *fl)
>         return rc;
>  }
>
> -static int orangefs_file_open(struct inode * inode, struct file *file)
> -{
> -       file->private_data = NULL;
> -       return generic_file_open(inode, file);
> -}
> -
>  static int orangefs_flush(struct file *file, fl_owner_t id)
>  {
>         /*
> @@ -669,9 +648,6 @@ static int orangefs_flush(struct file *file, fl_owner_t id)
>         struct inode *inode = file->f_mapping->host;
>         int r;
>
> -       kfree(file->private_data);
> -       file->private_data = NULL;
> -
>         if (inode->i_state & I_DIRTY_TIME) {
>                 spin_lock(&inode->i_lock);
>                 inode->i_state &= ~I_DIRTY_TIME;
> @@ -694,7 +670,7 @@ const struct file_operations orangefs_file_operations = {
>         .lock           = orangefs_lock,
>         .unlocked_ioctl = orangefs_ioctl,
>         .mmap           = orangefs_file_mmap,
> -       .open           = orangefs_file_open,
> +       .open           = generic_file_open,
>         .flush          = orangefs_flush,
>         .release        = orangefs_file_release,
>         .fsync          = orangefs_fsync,
> diff --git a/fs/orangefs/orangefs-kernel.h b/fs/orangefs/orangefs-kernel.h
> index ed67f39fa7ce..e12aeb9623d6 100644
> --- a/fs/orangefs/orangefs-kernel.h
> +++ b/fs/orangefs/orangefs-kernel.h
> @@ -239,10 +239,6 @@ struct orangefs_write_range {
>         kgid_t gid;
>  };
>
> -struct orangefs_read_options {
> -       ssize_t blksiz;
> -};
> -
>  extern struct orangefs_stats orangefs_stats;
>
>  /*
> --
> 2.25.1
>

