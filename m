Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBE3A4AC3B
	for <lists+devel-orangefs@lfdr.de>; Sat,  1 Mar 2025 15:34:39 +0100 (CET)
Received: from mm1.emwd.com (localhost [127.0.0.1])
	by mm1.emwd.com (Postfix) with ESMTP id BB9FE385876
	for <lists+devel-orangefs@lfdr.de>; Sat,  1 Mar 2025 09:34:36 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emwd.com; s=mm1;
	t=1740839676; bh=tp6qxbDMAEWnkv84GCofiZINr2DVyFoMzihPdFT6EY4=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Lkyo6WAcQKo7y2IZwf9R7cDQ7BF+aLntnfKqPpMAm0pAaeno8MrxLJmmHHCBA1CPH
	 Mlkh5PzL/4ta750EXWFxsy6XmprGTEY14OIUl3z1+u6HUKa7yjUpOdcvdH/uylym67
	 mPXDtzLIX8OklsVtVDJqMfzo/JzQudjYT+I4yIP8IXaHBKzojhdvWCd+GOj+ihIonN
	 HVjd9PbRFpGs2skSqvN1tyu3roxvxA2Dj+Qxj/6q+4w9FaKeQoP4CG3XTU6Pa+Cu+n
	 26+i3ADhRKPY32yyHi1qAunmxFVLAVofknw+tc56KFaNOQMCy6zRp2xg9ukEic4II1
	 //xCCzsuETiuQ==
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	by mm1.emwd.com (Postfix) with ESMTPS id 9756838586A
	for <devel@lists.orangefs.org>; Sat,  1 Mar 2025 09:34:33 -0500 (EST)
Authentication-Results: mm1.emwd.com;
	dkim=pass (2048-bit key; unprotected) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="k+f7r1cI";
	dkim-atps=neutral
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fc291f7ddbso5031033a91.1
        for <devel@lists.orangefs.org>; Sat, 01 Mar 2025 06:34:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839672; x=1741444472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kRvL22zEpxH2EhNMGf6qrh+SBeflk+iuDbirlLHJ2Ho=;
        b=uhSGRgssqH7BzAboar5hTmYzmjYOWjZAB7N4ZFUMqyTNiboyMiqg+/TYm+44mXZK8S
         LMfUttkm/nj7PBwR76ggRw3AJ0TALsoqkimmGAJqRmJQaEe7zu/DoWlFrMIZoelCyGOX
         ocFwc/mzgMzU7dd9iE9Hl7FV565Ng3SkWkcVfjyDtCAWkuZ5ofuDa3eS6aUnUqqG+Q1l
         7WSfcq2TjCPCF9u9mWxroNsuqbddHpXBciZAZCptIipZGUJkg6iO+XnzDDzrfgXiHSdp
         bblVcKfyUFm9Mi95rTS2uE7Vh3ysJ0DtdhvOZXlXgd8Lwrb9fvWaKnhv7Ac4nX4TPpCD
         RlSw==
X-Gm-Message-State: AOJu0YxQe1EfNBse39kn+EA/j0cXGzuTnm36ey2Hthp2v9Qc120mxJcZ
	sq7p8UPg3BkzzknJhPFbcGadEEt1YJL2HZfzRf+yl5sOMWZKGId4pc40qzZNW/tw2KTXvPyh4e2
	cGlhiI+V7UV1bB06xwy2YUN/dS2NsCDCiCJET
X-Gm-Gg: ASbGncsVuJ4sAOwCnMOJ0JuKeIcSoq6ZrbEffizrQyT3MthxUUoYtb9+YDaOhvtySVi
	fH0fh1SzcvvH7iuCh1omhuiNYld55bJa7rXT6ufn2gNl2xGjCopsC0hoOtF2LHI6LljIFmj7nts
	l1hgWVu9+lIQPdU2HLL/946cKGfET/Y6AUnc0/8A==
X-Google-Smtp-Source: AGHT+IG2MDZpDQqNkppDXUSzX4Sjtf+ED0oQh7rhEBC8yZ8/cdt3wYjqVBsvqKAyrFOW5m102lktBHFvZoMzrkowF8o=
X-Received: by 2002:a17:90b:4b4e:b0:2fa:ba3:5455 with SMTP id
 98e67ed59e1d1-2febab2be02mr12468480a91.7.1740839671014; Sat, 01 Mar 2025
 06:34:31 -0800 (PST)
MIME-Version: 1.0
References: <20250224180529.1916812-1-willy@infradead.org> <CAOg9mSQ2o0zaBhY37bBfR9CDKv=-EY3SzxEh0mFYiNvEjZaZKQ@mail.gmail.com>
In-Reply-To: <CAOg9mSQ2o0zaBhY37bBfR9CDKv=-EY3SzxEh0mFYiNvEjZaZKQ@mail.gmail.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Sat, 1 Mar 2025 09:34:20 -0500
X-Gm-Features: AQ5f1Jp9bivAtQbkUoP4gYt-35pWuI4JnGMaw3cJdHeXfMBUEDasgjZB3DOKLng
Message-ID: <CAOg9mSRbk=76L-kNhJAXgH3VJS5uipxY59ezO71DzFSCTk2KkA@mail.gmail.com>
Subject: Re: [PATCH 0/9] Orangefs fixes for 6.15
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: BIIKEVQOCXU6JEQRKXIYBZQK4QXY2RD7
X-Message-ID-Hash: BIIKEVQOCXU6JEQRKXIYBZQK4QXY2RD7
X-MailFrom: hubcap@omnibond.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devel@lists.orangefs.org, linux-fsdevel@vger.kernel.org
X-Mailman-Version: 3.3.3
Precedence: list
List-Id: <devel.lists.orangefs.org>
Archived-At: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/message/BIIKEVQOCXU6JEQRKXIYBZQK4QXY2RD7/>
List-Archive: <https://lists.orangefs.org/archives/list/devel@lists.orangefs.org/>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Owner: <mailto:devel-owner@lists.orangefs.org>
List-Post: <mailto:devel@lists.orangefs.org>
List-Subscribe: <mailto:devel-join@lists.orangefs.org>
List-Unsubscribe: <mailto:devel-leave@lists.orangefs.org>

Matthew... Thanks for the patch. I get no xfstests regressions
with it...

-Mike

On Thu, Feb 27, 2025 at 3:18=E2=80=AFPM Mike Marshall <hubcap@omnibond.com>=
 wrote:
>
> Howdy Matthew... I got your patch and deciphered the note
> about leaving out the include files. It is compiling on top of
>  Linux 6.14-rc4 now, and I'll let you know how testing goes...
>
> -Mike
>
> On Mon, Feb 24, 2025 at 1:05=E2=80=AFPM Matthew Wilcox (Oracle)
> <willy@infradead.org> wrote:
> >
> > The start of this was the removal of orangefs_writepage(), but it
> > quickly spiralled out of hand.  The first patch is an actual bug fix.
> > I haven't tagged it for backport, as I don't think we really care about
> > 32-bit systems any more, but feel free to add a cc to stable.
> >
> > Patches 2 and 3 are compilation fixes for warnings which aren't enabled
> > by default.
> >
> > Patches 4-9 are improvements which simplify orangefs or convert it
> > from pages to folios.  There is still a little use of 'struct page'
> > in orangefs, but it's not in the areas that deal with the page cache.
> >
> > Matthew Wilcox (Oracle) (9):
> >   orangefs: Do not truncate file size
> >   orangefs: Move s_kmod_keyword_mask_map to orangefs-debugfs.c
> >   orangefs: make open_for_read and open_for_write boolean
> >   orangefs: Remove orangefs_writepage()
> >   orangefs: Convert orangefs_writepage_locked() to take a folio
> >   orangefs: Pass mapping to orangefs_writepages_work()
> >   orangefs: Unify error & success paths in orangefs_writepages_work()
> >   orangefs: Simplify bvec setup in orangefs_writepages_work()
> >   orangefs: Convert orangefs_writepages to contain an array of folios
> >
> >  fs/orangefs/file.c             |   4 +-
> >  fs/orangefs/inode.c            | 149 ++++++++++++++-------------------
> >  fs/orangefs/orangefs-debug.h   |  43 ----------
> >  fs/orangefs/orangefs-debugfs.c |  43 ++++++++++
> >  include/linux/mm_types.h       |   6 +-
> >  include/linux/nfs_page.h       |   2 +-
> >  include/linux/page-flags.h     |   6 +-
> >  7 files changed, 116 insertions(+), 137 deletions(-)
> >
> > --
> > 2.47.2
> >
