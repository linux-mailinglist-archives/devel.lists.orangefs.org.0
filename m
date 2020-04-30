Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id B37AA1C09AC
	for <lists+devel-orangefs@lfdr.de>; Thu, 30 Apr 2020 23:53:20 +0200 (CEST)
Received: from [::1] (port=47862 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jUH7P-0007fb-W2
	for lists+devel-orangefs@lfdr.de; Thu, 30 Apr 2020 17:53:19 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:38333)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <guoqing.jiang@cloud.ionos.com>)
 id 1jUH7O-0007fG-O4
 for devel@lists.orangefs.org; Thu, 30 Apr 2020 17:53:18 -0400
Received: by mail-ej1-f65.google.com with SMTP id a2so5985660ejx.5
 for <devel@lists.orangefs.org>; Thu, 30 Apr 2020 14:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2Cwm7q37wd5a49T4hM9tpsz7D3qzUxu8CT8JBwv0w4c=;
 b=NGAEKGruhKtx7ZWTrFdEqTmqAVl/YDbNX5SVHiheCt5mgGQXMvPqVsB2mWj4W+6TZx
 avj1y2aqFM2fM4mYbpeY1mNHjz5L5wFBJHZ7nqGDO/UfrsVe7K3fK+19Qz0xhaRBCJF8
 cnG9jsv0Y3cuCHExnrUC59PgGg5ldN6zReZ4l/MkqDih/pWf2Qq5leOqyJa1Ea1uUvqL
 KSJUgjKhSgiIMTbhcESV0rK/2/wlrqs0rRp/j53oVanG3NSXpHazoglUXFC2CIoq8QGs
 T0RBK7fYVyj0odwSJ7t5g5PDfIz9c6vhMkT7fz1ruAgadlRAj8EWlz0SjkauUs46ppHW
 r7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2Cwm7q37wd5a49T4hM9tpsz7D3qzUxu8CT8JBwv0w4c=;
 b=bcWhmV1lF63R2PsIOPWu5tHAtIBakhwqmxDhTGPFS2xElesTui3FaSlJgoKaj2yjhG
 nA+/R+ImkNB+qlWUq4KeqGnyYSvfcAbDssdCMNLgck1v5PdX0we/YBJ5SU/zlt/PEVRZ
 fvmIxZy/7nfPWlgsZQJRwBmX67gEPGpLaKkCEUXvfZimxHbLcwXBNtfR5XEbRMcUGzGK
 RfDtqHNMI7uGTDwnpUhjH5zHUwUJ7NhJY9+iVoBadY1c71RWkIUK8gmd2TK6ATvzQUAv
 uZFlxZ9EyLc8G2hMJEiPIaxu1O5pcEVq4Jj56/jy3HSZQcz1IQEPPB8yNxinkylS22iD
 EOng==
X-Gm-Message-State: AGi0PuZXB9FVqA3/aGEmSDdmL3yOKE9ZbWhHukkpW3fZVfXIkGtFVXG+
 e+UDdChuBt0GXFDjuuNEVeeTgg==
X-Google-Smtp-Source: APiQypIDTj3Uj7biPphTd2Cba892cORi5pdinqFvBm6XPxrzHDikqrxlAy/dZ1nN6NDVa1Eq5TMhqw==
X-Received: by 2002:a17:906:b2c4:: with SMTP id
 cf4mr538626ejb.340.1588283557346; 
 Thu, 30 Apr 2020 14:52:37 -0700 (PDT)
Received: from ls00508.pb.local ([2001:1438:4010:2540:b82f:dfc:5e2a:e7cc])
 by smtp.gmail.com with ESMTPSA id f13sm92022ejd.2.2020.04.30.14.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 14:52:36 -0700 (PDT)
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH V2 1/9] include/linux/pagemap.h: introduce
 attach/clear_page_private
Date: Thu, 30 Apr 2020 23:44:42 +0200
Message-Id: <20200430214450.10662-2-guoqing.jiang@cloud.ionos.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430214450.10662-1-guoqing.jiang@cloud.ionos.com>
References: <20200430214450.10662-1-guoqing.jiang@cloud.ionos.com>
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
 willy@infradead.org, hch@infradead.org, devel@lists.orangefs.org,
 Chao Yu <chao@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 linux-raid@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Anton Altaparmakov <anton@tuxera.com>,
 Andreas Dilger <adilger@dilger.ca>,
 Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
 Yang Shi <yang.shi@linux.alibaba.com>,
 William Kucharski <william.kucharski@oracle.com>,
 linux-ntfs-dev@lists.sourceforge.net, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 linux-btrfs@vger.kernel.org
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

The logic in attach_page_buffers and  __clear_page_buffers are quite
paired, but

1. they are located in different files.

2. attach_page_buffers is implemented in buffer_head.h, so it could be
   used by other files. But __clear_page_buffers is static function in
   buffer.c and other potential users can't call the function, md-bitmap
   even copied the function.

So, introduce the new attach/clear_page_private to replace them. With
the new pair of function, we will remove the usage of attach_page_buffers
and  __clear_page_buffers in next patches. Thanks for the new names from
Christoph Hellwig.

Suggested-by: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: William Kucharski <william.kucharski@oracle.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Yang Shi <yang.shi@linux.alibaba.com>
Cc: Yafang Shao <laoar.shao@gmail.com>
Cc: Song Liu <song@kernel.org>
Cc: linux-raid@vger.kernel.org
Cc: Chris Mason <clm@fb.com>
Cc: Josef Bacik <josef@toxicpanda.com>
Cc: David Sterba <dsterba@suse.com>
Cc: linux-btrfs@vger.kernel.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Cc: Christoph Hellwig <hch@infradead.org>
Cc: linux-xfs@vger.kernel.org
Cc: Anton Altaparmakov <anton@tuxera.com>
Cc: linux-ntfs-dev@lists.sourceforge.net
Cc: Mike Marshall <hubcap@omnibond.com>
Cc: Martin Brandenburg <martin@omnibond.com>
Cc: devel@lists.orangefs.org
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Roman Gushchin <guro@fb.com>
Cc: Andreas Dilger <adilger@dilger.ca>
Signed-off-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
---
RFC -> RFC V2:  Address the comments from Christoph Hellwig
1. change function names to attach/clear_page_private and add comments.
2. change the return type of attach_page_private.

 include/linux/pagemap.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index a8f7bd8ea1c6..2e515f210b18 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -205,6 +205,41 @@ static inline int page_cache_add_speculative(struct page *page, int count)
 	return __page_cache_add_speculative(page, count);
 }
 
+/**
+ * attach_page_private - attach data to page's private field and set PG_private.
+ * @page: page to be attached and set flag.
+ * @data: data to attach to page's private field.
+ *
+ * Need to take reference as mm.h said "Setting PG_private should also increment
+ * the refcount".
+ */
+static inline void attach_page_private(struct page *page, void *data)
+{
+	get_page(page);
+	set_page_private(page, (unsigned long)data);
+	SetPagePrivate(page);
+}
+
+/**
+ * clear_page_private - clear page's private field and PG_private.
+ * @page: page to be cleared.
+ *
+ * The counterpart function of attach_page_private.
+ * Return: private data of page or NULL if page doesn't have private data.
+ */
+static inline void *clear_page_private(struct page *page)
+{
+	void *data = (void *)page_private(page);
+
+	if (!PagePrivate(page))
+		return NULL;
+	ClearPagePrivate(page);
+	set_page_private(page, 0);
+	put_page(page);
+
+	return data;
+}
+
 #ifdef CONFIG_NUMA
 extern struct page *__page_cache_alloc(gfp_t gfp);
 #else
-- 
2.17.1


