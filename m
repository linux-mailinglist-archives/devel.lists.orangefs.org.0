Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 97264AEE511
	for <lists+devel-orangefs@lfdr.de>; Mon, 30 Jun 2025 18:55:51 +0200 (CEST)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id 13770385659
	for <lists+devel-orangefs@lfdr.de>; Mon, 30 Jun 2025 12:55:46 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1751302546; bh=FC75vMlSe8TrRgRWFRUOy7zIzHfqkiQpCNr3hqSf5Po=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ZNMCelM5ORtUD6rwsuW2+YvsR4xhPiOt929ODk/v8zqYpKOvYKB1//JD1VLtTHKSb
	 jeyk0vJSdNQn35Koh6gC/EIHV2szyo+QQ753UyUT/QJjzJzEV4dWqRiGDbeRbAnV4M
	 5Po0D5v1FByA9gcu0E9nvyl1Sc4DVlza8CzMDXDS+xqNR1UliHPIN67o0Mo9lz83Pp
	 cMpXkarnfFnATTX2uSce8MyecDRmvkjLYEzvkArK6Wv3A1879+VDpu6EL0/cEpFair
	 IFXoHPxUXajKEuhsOTaRs5NxLqQFNJbOaGV/fnQu1fLVIqGh3A5J1+jOP/FLX9MMil
	 699Ypj8uTL5vQ==
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	by mm1.emwd.com (Postfix) with ESMTPS id C1AE4380051
	for <devel@lists.orangefs.org>; Mon, 30 Jun 2025 12:55:43 -0400 (EDT)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="2U0zziph";
	dkim-atps=neutral
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-311bd8ce7e4so3647705a91.3
        for <devel@lists.orangefs.org>; Mon, 30 Jun 2025 09:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751302543; x=1751907343;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXh1RrAGdPxiz7A29PVsjojv5dzCG1NnN/r1SMhGTxw=;
        b=RM2sRAEPiD0YlqwtIOACOxixWVCwKy/FOte2wQOuR/aBCSlpgypxoyxKnXpTnXwzFt
         y9CrDSvOLpjOS932iaW2Nq/rQUXRxUKWXiXb05+XhRfM8IiYo9MEvACVZ0pYyqgQnvXs
         XETU0SIdWasdmBiYkpY7UfxGlgvvSev2yiFNNUiU6HXEI/sOZK8ci6nllMGpQooMwxp4
         RiYxM9Iwe7ANc5HOYZsnp1EfH8NWCoiR5gsggM5NlOMFbHda5tY/6qgzKiU29j9c/hi7
         MncaekNDyuPXLLc6EnmlZ+L0E1aWoLnV68C9cV/n5UbeOeCAvabhgwVFa1uUOT9I+4k2
         V9Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWxJAaolSdxhGS/WReeK0aQGvgS3D41nDfZW6UuGEspvieOMONEZVcx4sQBbfpq2HKSnkuKrQ==@lists.orangefs.org
X-Gm-Message-State: AOJu0YylkWY0U75663Re/7z6063qEDmou0uGXLyivnAY6gWaMtG+Vp1K
	iSIa5vBNlbdpAqdYnO7TOXFihKwn5aVw/iQ6CbrtJp7v3HU4A4wO71CJjidXl9G1SDeaouIt7XN
	IemWSL3mz3BPfJoHlnyO7JvJQGEGLRGy8AziyO3GC
X-Gm-Gg: ASbGncsLiIOvRxLoXXVao+uHJf3P7uFIVyXo/ZJ8kYUeuRQSk/PuLfkAxpTN32o8Y+X
	FeTWlc5RK1iLR0jWiRSKl6vcaEd16uVpahOUGtey6+isnKeu/6a6TuLP2T6jW+iEG7081k2IUJO
	mBNJDdIXLohayD6luMoegZ/VmzgZ79XaLi18pwXRcn545AxpWV7Ho5jus=
X-Google-Smtp-Source: AGHT+IFzvoR18UEJ/giKGeSd5eaYM2rVo4k17yNVKARVIC9Hwmh7kqRMghQ9kRoqaMczKZ5AoUykw45NO6ZszBBqww4=
X-Received: by 2002:a17:90b:3d50:b0:313:b78:dc14 with SMTP id
 98e67ed59e1d1-318c8d12fdemr23788161a91.0.1751302542437; Mon, 30 Jun 2025
 09:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com> <f528ac4f35b9378931bd800920fee53fc0c5c74d.1750099179.git.lorenzo.stoakes@oracle.com>
In-Reply-To: <f528ac4f35b9378931bd800920fee53fc0c5c74d.1750099179.git.lorenzo.stoakes@oracle.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Mon, 30 Jun 2025 12:55:30 -0400
X-Gm-Features: Ac12FXz_RQfJWf0cEJ6w8E5NH7TADnrJ6gZS0h_E8FSvatJeptmkxWgHMVM2x3I
Message-ID: <CAOg9mSQcpC+Y0gMBZ1KO-Fofw5a=6NaSpM8+b+Xq3ZEgUQcOew@mail.gmail.com>
Subject: Re: [PATCH 10/10] fs: replace mmap hook with .mmap_prepare for simple mappings
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, devel@lists.orangefs.org,
	Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: SNOOA676QWIPIGHNKZ6OLGMK5OZFG5TC
X-Message-ID-Hash: SNOOA676QWIPIGHNKZ6OLGMK5OZFG5TC
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/SNOOA676QWIPIGHNKZ6OLGMK5OZFG5TC/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

I added this patch series to 6.16-rc3 and ran it through xfstests
for orangefs with no regressions...

-Mike

On Mon, Jun 16, 2025 at 3:36=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file
> callback"), the f_op->mmap() hook has been deprecated in favour of
> f_op->mmap_prepare().
>
> This callback is invoked in the mmap() logic far earlier, so error handli=
ng
> can be performed more safely without complicated and bug-prone state
> unwinding required should an error arise.
>
> This hook also avoids passing a pointer to a not-yet-correctly-establishe=
d
> VMA avoiding any issues with referencing this data structure.
>
> It rather provides a pointer to the new struct vm_area_desc descriptor ty=
pe
> which contains all required state and allows easy setting of required
> parameters without any consideration needing to be paid to locking or
> reference counts.
>
> Note that nested filesystems like overlayfs are compatible with an
> .mmap_prepare() callback since commit bb666b7c2707 ("mm: add mmap_prepare=
()
> compatibility layer for nested file systems").
>
> In this patch we apply this change to file systems with relatively simple
> mmap() hook logic - exfat, ceph, f2fs, bcachefs, zonefs, btrfs, ocfs2,
> orangefs, nilfs2, romfs, ramfs and aio.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  fs/aio.c              |  8 ++++----
>  fs/bcachefs/fs.c      |  8 ++++----
>  fs/btrfs/file.c       |  7 ++++---
>  fs/ceph/addr.c        |  5 +++--
>  fs/ceph/file.c        |  2 +-
>  fs/ceph/super.h       |  2 +-
>  fs/exfat/file.c       |  7 ++++---
>  fs/f2fs/file.c        |  7 ++++---
>  fs/nilfs2/file.c      |  8 ++++----
>  fs/ocfs2/file.c       |  4 ++--
>  fs/ocfs2/mmap.c       |  5 +++--
>  fs/ocfs2/mmap.h       |  2 +-
>  fs/orangefs/file.c    | 10 ++++++----
>  fs/ramfs/file-nommu.c | 12 ++++++------
>  fs/romfs/mmap-nommu.c |  6 +++---
>  fs/zonefs/file.c      | 10 ++++++----
>  16 files changed, 56 insertions(+), 47 deletions(-)
>
> diff --git a/fs/aio.c b/fs/aio.c
> index 793b7b15ec4b..7fc7b6221312 100644
> --- a/fs/aio.c
> +++ b/fs/aio.c
> @@ -392,15 +392,15 @@ static const struct vm_operations_struct aio_ring_v=
m_ops =3D {
>  #endif
>  };
>
> -static int aio_ring_mmap(struct file *file, struct vm_area_struct *vma)
> +static int aio_ring_mmap_prepare(struct vm_area_desc *desc)
>  {
> -       vm_flags_set(vma, VM_DONTEXPAND);
> -       vma->vm_ops =3D &aio_ring_vm_ops;
> +       desc->vm_flags |=3D VM_DONTEXPAND;
> +       desc->vm_ops =3D &aio_ring_vm_ops;
>         return 0;
>  }
>
>  static const struct file_operations aio_ring_fops =3D {
> -       .mmap =3D aio_ring_mmap,
> +       .mmap_prepare =3D aio_ring_mmap_prepare,
>  };
>
>  #if IS_ENABLED(CONFIG_MIGRATION)
> diff --git a/fs/bcachefs/fs.c b/fs/bcachefs/fs.c
> index 3063a8ddc2df..9c2238edc0e3 100644
> --- a/fs/bcachefs/fs.c
> +++ b/fs/bcachefs/fs.c
> @@ -1553,11 +1553,11 @@ static const struct vm_operations_struct bch_vm_o=
ps =3D {
>         .page_mkwrite   =3D bch2_page_mkwrite,
>  };
>
> -static int bch2_mmap(struct file *file, struct vm_area_struct *vma)
> +static int bch2_mmap_prepare(struct vm_area_desc *desc)
>  {
> -       file_accessed(file);
> +       file_accessed(desc->file);
>
> -       vma->vm_ops =3D &bch_vm_ops;
> +       desc->vm_ops =3D &bch_vm_ops;
>         return 0;
>  }
>
> @@ -1740,7 +1740,7 @@ static const struct file_operations bch_file_operat=
ions =3D {
>         .llseek         =3D bch2_llseek,
>         .read_iter      =3D bch2_read_iter,
>         .write_iter     =3D bch2_write_iter,
> -       .mmap           =3D bch2_mmap,
> +       .mmap_prepare   =3D bch2_mmap_prepare,
>         .get_unmapped_area =3D thp_get_unmapped_area,
>         .fsync          =3D bch2_fsync,
>         .splice_read    =3D filemap_splice_read,
> diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
> index 8ce6f45f45e0..06bd30b35b95 100644
> --- a/fs/btrfs/file.c
> +++ b/fs/btrfs/file.c
> @@ -1978,15 +1978,16 @@ static const struct vm_operations_struct btrfs_fi=
le_vm_ops =3D {
>         .page_mkwrite   =3D btrfs_page_mkwrite,
>  };
>
> -static int btrfs_file_mmap(struct file *filp, struct vm_area_struct *vma=
)
> +static int btrfs_file_mmap_prepare(struct vm_area_desc *desc)
>  {
> +       struct file *filp =3D desc->file;
>         struct address_space *mapping =3D filp->f_mapping;
>
>         if (!mapping->a_ops->read_folio)
>                 return -ENOEXEC;
>
>         file_accessed(filp);
> -       vma->vm_ops =3D &btrfs_file_vm_ops;
> +       desc->vm_ops =3D &btrfs_file_vm_ops;
>
>         return 0;
>  }
> @@ -3765,7 +3766,7 @@ const struct file_operations btrfs_file_operations =
=3D {
>         .splice_read    =3D filemap_splice_read,
>         .write_iter     =3D btrfs_file_write_iter,
>         .splice_write   =3D iter_file_splice_write,
> -       .mmap           =3D btrfs_file_mmap,
> +       .mmap_prepare   =3D btrfs_file_mmap_prepare,
>         .open           =3D btrfs_file_open,
>         .release        =3D btrfs_release_file,
>         .get_unmapped_area =3D thp_get_unmapped_area,
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index 60a621b00c65..37522137c380 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -2330,13 +2330,14 @@ static const struct vm_operations_struct ceph_vmo=
ps =3D {
>         .page_mkwrite   =3D ceph_page_mkwrite,
>  };
>
> -int ceph_mmap(struct file *file, struct vm_area_struct *vma)
> +int ceph_mmap_prepare(struct vm_area_desc *desc)
>  {
> +       struct file *file =3D desc->file;
>         struct address_space *mapping =3D file->f_mapping;
>
>         if (!mapping->a_ops->read_folio)
>                 return -ENOEXEC;
> -       vma->vm_ops =3D &ceph_vmops;
> +       desc->vm_ops =3D &ceph_vmops;
>         return 0;
>  }
>
> diff --git a/fs/ceph/file.c b/fs/ceph/file.c
> index d5c674d2ba8a..41b8ec33e864 100644
> --- a/fs/ceph/file.c
> +++ b/fs/ceph/file.c
> @@ -3170,7 +3170,7 @@ const struct file_operations ceph_file_fops =3D {
>         .llseek =3D ceph_llseek,
>         .read_iter =3D ceph_read_iter,
>         .write_iter =3D ceph_write_iter,
> -       .mmap =3D ceph_mmap,
> +       .mmap_prepare =3D ceph_mmap_prepare,
>         .fsync =3D ceph_fsync,
>         .lock =3D ceph_lock,
>         .setlease =3D simple_nosetlease,
> diff --git a/fs/ceph/super.h b/fs/ceph/super.h
> index bb0db0cc8003..cf176aab0f82 100644
> --- a/fs/ceph/super.h
> +++ b/fs/ceph/super.h
> @@ -1286,7 +1286,7 @@ extern void __ceph_touch_fmode(struct ceph_inode_in=
fo *ci,
>  /* addr.c */
>  extern const struct address_space_operations ceph_aops;
>  extern const struct netfs_request_ops ceph_netfs_ops;
> -extern int ceph_mmap(struct file *file, struct vm_area_struct *vma);
> +int ceph_mmap_prepare(struct vm_area_desc *desc);
>  extern int ceph_uninline_data(struct file *file);
>  extern int ceph_pool_perm_check(struct inode *inode, int need);
>  extern void ceph_pool_perm_destroy(struct ceph_mds_client* mdsc);
> diff --git a/fs/exfat/file.c b/fs/exfat/file.c
> index 841a5b18e3df..d63213c8a823 100644
> --- a/fs/exfat/file.c
> +++ b/fs/exfat/file.c
> @@ -683,13 +683,14 @@ static const struct vm_operations_struct exfat_file=
_vm_ops =3D {
>         .page_mkwrite   =3D exfat_page_mkwrite,
>  };
>
> -static int exfat_file_mmap(struct file *file, struct vm_area_struct *vma=
)
> +static int exfat_file_mmap_prepare(struct vm_area_desc *desc)
>  {
> +       struct file *file =3D desc->file;
>         if (unlikely(exfat_forced_shutdown(file_inode(file)->i_sb)))
>                 return -EIO;
>
>         file_accessed(file);
> -       vma->vm_ops =3D &exfat_file_vm_ops;
> +       desc->vm_ops =3D &exfat_file_vm_ops;
>         return 0;
>  }
>
> @@ -710,7 +711,7 @@ const struct file_operations exfat_file_operations =
=3D {
>  #ifdef CONFIG_COMPAT
>         .compat_ioctl =3D exfat_compat_ioctl,
>  #endif
> -       .mmap           =3D exfat_file_mmap,
> +       .mmap_prepare   =3D exfat_file_mmap_prepare,
>         .fsync          =3D exfat_file_fsync,
>         .splice_read    =3D exfat_splice_read,
>         .splice_write   =3D iter_file_splice_write,
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6bd3de64f2a8..7af2b49b7e8a 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -532,8 +532,9 @@ static loff_t f2fs_llseek(struct file *file, loff_t o=
ffset, int whence)
>         return -EINVAL;
>  }
>
> -static int f2fs_file_mmap(struct file *file, struct vm_area_struct *vma)
> +static int f2fs_file_mmap_prepare(struct vm_area_desc *desc)
>  {
> +       struct file *file =3D desc->file;
>         struct inode *inode =3D file_inode(file);
>
>         if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
> @@ -543,7 +544,7 @@ static int f2fs_file_mmap(struct file *file, struct v=
m_area_struct *vma)
>                 return -EOPNOTSUPP;
>
>         file_accessed(file);
> -       vma->vm_ops =3D &f2fs_file_vm_ops;
> +       desc->vm_ops =3D &f2fs_file_vm_ops;
>
>         f2fs_down_read(&F2FS_I(inode)->i_sem);
>         set_inode_flag(inode, FI_MMAP_FILE);
> @@ -5376,7 +5377,7 @@ const struct file_operations f2fs_file_operations =
=3D {
>         .iopoll         =3D iocb_bio_iopoll,
>         .open           =3D f2fs_file_open,
>         .release        =3D f2fs_release_file,
> -       .mmap           =3D f2fs_file_mmap,
> +       .mmap_prepare   =3D f2fs_file_mmap_prepare,
>         .flush          =3D f2fs_file_flush,
>         .fsync          =3D f2fs_sync_file,
>         .fallocate      =3D f2fs_fallocate,
> diff --git a/fs/nilfs2/file.c b/fs/nilfs2/file.c
> index 0e3fc5ba33c7..1b8d754db44d 100644
> --- a/fs/nilfs2/file.c
> +++ b/fs/nilfs2/file.c
> @@ -125,10 +125,10 @@ static const struct vm_operations_struct nilfs_file=
_vm_ops =3D {
>         .page_mkwrite   =3D nilfs_page_mkwrite,
>  };
>
> -static int nilfs_file_mmap(struct file *file, struct vm_area_struct *vma=
)
> +static int nilfs_file_mmap_prepare(struct vm_area_desc *desc)
>  {
> -       file_accessed(file);
> -       vma->vm_ops =3D &nilfs_file_vm_ops;
> +       file_accessed(desc->file);
> +       desc->vm_ops =3D &nilfs_file_vm_ops;
>         return 0;
>  }
>
> @@ -144,7 +144,7 @@ const struct file_operations nilfs_file_operations =
=3D {
>  #ifdef CONFIG_COMPAT
>         .compat_ioctl   =3D nilfs_compat_ioctl,
>  #endif /* CONFIG_COMPAT */
> -       .mmap           =3D nilfs_file_mmap,
> +       .mmap_prepare   =3D nilfs_file_mmap_prepare,
>         .open           =3D generic_file_open,
>         /* .release     =3D nilfs_release_file, */
>         .fsync          =3D nilfs_sync_file,
> diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
> index 2056cf08ac1e..21d797ccccd0 100644
> --- a/fs/ocfs2/file.c
> +++ b/fs/ocfs2/file.c
> @@ -2800,7 +2800,7 @@ const struct inode_operations ocfs2_special_file_io=
ps =3D {
>   */
>  const struct file_operations ocfs2_fops =3D {
>         .llseek         =3D ocfs2_file_llseek,
> -       .mmap           =3D ocfs2_mmap,
> +       .mmap_prepare   =3D ocfs2_mmap_prepare,
>         .fsync          =3D ocfs2_sync_file,
>         .release        =3D ocfs2_file_release,
>         .open           =3D ocfs2_file_open,
> @@ -2850,7 +2850,7 @@ const struct file_operations ocfs2_dops =3D {
>   */
>  const struct file_operations ocfs2_fops_no_plocks =3D {
>         .llseek         =3D ocfs2_file_llseek,
> -       .mmap           =3D ocfs2_mmap,
> +       .mmap_prepare   =3D ocfs2_mmap_prepare,
>         .fsync          =3D ocfs2_sync_file,
>         .release        =3D ocfs2_file_release,
>         .open           =3D ocfs2_file_open,
> diff --git a/fs/ocfs2/mmap.c b/fs/ocfs2/mmap.c
> index 6a314e9f2b49..50e2faf64c19 100644
> --- a/fs/ocfs2/mmap.c
> +++ b/fs/ocfs2/mmap.c
> @@ -159,8 +159,9 @@ static const struct vm_operations_struct ocfs2_file_v=
m_ops =3D {
>         .page_mkwrite   =3D ocfs2_page_mkwrite,
>  };
>
> -int ocfs2_mmap(struct file *file, struct vm_area_struct *vma)
> +int ocfs2_mmap_prepare(struct vm_area_desc *desc)
>  {
> +       struct file *file =3D desc->file;
>         int ret =3D 0, lock_level =3D 0;
>
>         ret =3D ocfs2_inode_lock_atime(file_inode(file),
> @@ -171,7 +172,7 @@ int ocfs2_mmap(struct file *file, struct vm_area_stru=
ct *vma)
>         }
>         ocfs2_inode_unlock(file_inode(file), lock_level);
>  out:
> -       vma->vm_ops =3D &ocfs2_file_vm_ops;
> +       desc->vm_ops =3D &ocfs2_file_vm_ops;
>         return 0;
>  }
>
> diff --git a/fs/ocfs2/mmap.h b/fs/ocfs2/mmap.h
> index 1051507cc684..d21c30de6b8c 100644
> --- a/fs/ocfs2/mmap.h
> +++ b/fs/ocfs2/mmap.h
> @@ -2,6 +2,6 @@
>  #ifndef OCFS2_MMAP_H
>  #define OCFS2_MMAP_H
>
> -int ocfs2_mmap(struct file *file, struct vm_area_struct *vma);
> +int ocfs2_mmap_prepare(struct vm_area_desc *desc);
>
>  #endif  /* OCFS2_MMAP_H */
> diff --git a/fs/orangefs/file.c b/fs/orangefs/file.c
> index 90c49c0de243..919f99b16834 100644
> --- a/fs/orangefs/file.c
> +++ b/fs/orangefs/file.c
> @@ -398,8 +398,9 @@ static const struct vm_operations_struct orangefs_fil=
e_vm_ops =3D {
>  /*
>   * Memory map a region of a file.
>   */
> -static int orangefs_file_mmap(struct file *file, struct vm_area_struct *=
vma)
> +static int orangefs_file_mmap_prepare(struct vm_area_desc *desc)
>  {
> +       struct file *file =3D desc->file;
>         int ret;
>
>         ret =3D orangefs_revalidate_mapping(file_inode(file));
> @@ -410,10 +411,11 @@ static int orangefs_file_mmap(struct file *file, st=
ruct vm_area_struct *vma)
>                      "orangefs_file_mmap: called on %pD\n", file);
>
>         /* set the sequential readahead hint */
> -       vm_flags_mod(vma, VM_SEQ_READ, VM_RAND_READ);
> +       desc->vm_flags |=3D VM_SEQ_READ;
> +       desc->vm_flags &=3D ~VM_RAND_READ;
>
>         file_accessed(file);
> -       vma->vm_ops =3D &orangefs_file_vm_ops;
> +       desc->vm_ops =3D &orangefs_file_vm_ops;
>         return 0;
>  }
>
> @@ -574,7 +576,7 @@ const struct file_operations orangefs_file_operations=
 =3D {
>         .read_iter      =3D orangefs_file_read_iter,
>         .write_iter     =3D orangefs_file_write_iter,
>         .lock           =3D orangefs_lock,
> -       .mmap           =3D orangefs_file_mmap,
> +       .mmap_prepare   =3D orangefs_file_mmap_prepare,
>         .open           =3D generic_file_open,
>         .splice_read    =3D orangefs_file_splice_read,
>         .splice_write   =3D iter_file_splice_write,
> diff --git a/fs/ramfs/file-nommu.c b/fs/ramfs/file-nommu.c
> index 7a6d980e614d..77b8ca2757e0 100644
> --- a/fs/ramfs/file-nommu.c
> +++ b/fs/ramfs/file-nommu.c
> @@ -28,7 +28,7 @@ static unsigned long ramfs_nommu_get_unmapped_area(stru=
ct file *file,
>                                                    unsigned long len,
>                                                    unsigned long pgoff,
>                                                    unsigned long flags);
> -static int ramfs_nommu_mmap(struct file *file, struct vm_area_struct *vm=
a);
> +static int ramfs_nommu_mmap_prepare(struct vm_area_desc *desc);
>
>  static unsigned ramfs_mmap_capabilities(struct file *file)
>  {
> @@ -38,7 +38,7 @@ static unsigned ramfs_mmap_capabilities(struct file *fi=
le)
>
>  const struct file_operations ramfs_file_operations =3D {
>         .mmap_capabilities      =3D ramfs_mmap_capabilities,
> -       .mmap                   =3D ramfs_nommu_mmap,
> +       .mmap_prepare           =3D ramfs_nommu_mmap_prepare,
>         .get_unmapped_area      =3D ramfs_nommu_get_unmapped_area,
>         .read_iter              =3D generic_file_read_iter,
>         .write_iter             =3D generic_file_write_iter,
> @@ -262,12 +262,12 @@ static unsigned long ramfs_nommu_get_unmapped_area(=
struct file *file,
>  /*
>   * set up a mapping for shared memory segments
>   */
> -static int ramfs_nommu_mmap(struct file *file, struct vm_area_struct *vm=
a)
> +static int ramfs_nommu_mmap_prepare(struct vm_area_desc *desc)
>  {
> -       if (!is_nommu_shared_mapping(vma->vm_flags))
> +       if (!is_nommu_shared_mapping(desc->vm_flags))
>                 return -ENOSYS;
>
> -       file_accessed(file);
> -       vma->vm_ops =3D &generic_file_vm_ops;
> +       file_accessed(desc->file);
> +       desc->vm_ops =3D &generic_file_vm_ops;
>         return 0;
>  }
> diff --git a/fs/romfs/mmap-nommu.c b/fs/romfs/mmap-nommu.c
> index 4520ca413867..4b77c6dc4418 100644
> --- a/fs/romfs/mmap-nommu.c
> +++ b/fs/romfs/mmap-nommu.c
> @@ -61,9 +61,9 @@ static unsigned long romfs_get_unmapped_area(struct fil=
e *file,
>   * permit a R/O mapping to be made directly through onto an MTD device i=
f
>   * possible
>   */
> -static int romfs_mmap(struct file *file, struct vm_area_struct *vma)
> +static int romfs_mmap_prepare(struct vm_area_desc *desc)
>  {
> -       return is_nommu_shared_mapping(vma->vm_flags) ? 0 : -ENOSYS;
> +       return is_nommu_shared_mapping(desc->vm_flags) ? 0 : -ENOSYS;
>  }
>
>  static unsigned romfs_mmap_capabilities(struct file *file)
> @@ -79,7 +79,7 @@ const struct file_operations romfs_ro_fops =3D {
>         .llseek                 =3D generic_file_llseek,
>         .read_iter              =3D generic_file_read_iter,
>         .splice_read            =3D filemap_splice_read,
> -       .mmap                   =3D romfs_mmap,
> +       .mmap_prepare           =3D romfs_mmap_prepare,
>         .get_unmapped_area      =3D romfs_get_unmapped_area,
>         .mmap_capabilities      =3D romfs_mmap_capabilities,
>  };
> diff --git a/fs/zonefs/file.c b/fs/zonefs/file.c
> index 42e2c0065bb3..c1848163b378 100644
> --- a/fs/zonefs/file.c
> +++ b/fs/zonefs/file.c
> @@ -312,8 +312,10 @@ static const struct vm_operations_struct zonefs_file=
_vm_ops =3D {
>         .page_mkwrite   =3D zonefs_filemap_page_mkwrite,
>  };
>
> -static int zonefs_file_mmap(struct file *file, struct vm_area_struct *vm=
a)
> +static int zonefs_file_mmap_prepare(struct vm_area_desc *desc)
>  {
> +       struct file *file =3D desc->file;
> +
>         /*
>          * Conventional zones accept random writes, so their files can su=
pport
>          * shared writable mappings. For sequential zone files, only read
> @@ -321,11 +323,11 @@ static int zonefs_file_mmap(struct file *file, stru=
ct vm_area_struct *vma)
>          * ordering between msync() and page cache writeback.
>          */
>         if (zonefs_inode_is_seq(file_inode(file)) &&
> -           (vma->vm_flags & VM_SHARED) && (vma->vm_flags & VM_MAYWRITE))
> +           (desc->vm_flags & VM_SHARED) && (desc->vm_flags & VM_MAYWRITE=
))
>                 return -EINVAL;
>
>         file_accessed(file);
> -       vma->vm_ops =3D &zonefs_file_vm_ops;
> +       desc->vm_ops =3D &zonefs_file_vm_ops;
>
>         return 0;
>  }
> @@ -850,7 +852,7 @@ const struct file_operations zonefs_file_operations =
=3D {
>         .open           =3D zonefs_file_open,
>         .release        =3D zonefs_file_release,
>         .fsync          =3D zonefs_file_fsync,
> -       .mmap           =3D zonefs_file_mmap,
> +       .mmap_prepare   =3D zonefs_file_mmap_prepare,
>         .llseek         =3D zonefs_file_llseek,
>         .read_iter      =3D zonefs_file_read_iter,
>         .write_iter     =3D zonefs_file_write_iter,
> --
> 2.49.0
>
