Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 224891D6D91
	for <lists+devel-orangefs@lfdr.de>; Sun, 17 May 2020 23:48:08 +0200 (CEST)
Received: from [::1] (port=47814 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jaR8h-0008H2-3p
	for lists+devel-orangefs@lfdr.de; Sun, 17 May 2020 17:48:07 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36102)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <guoqing.jiang@cloud.ionos.com>)
 id 1jaR8f-0008Gi-9L
 for devel@lists.orangefs.org; Sun, 17 May 2020 17:48:05 -0400
Received: by mail-wm1-f67.google.com with SMTP id u188so8185953wmu.1
 for <devel@lists.orangefs.org>; Sun, 17 May 2020 14:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=umFCQ4NMWCIE/enEbdR7IzBDkwF+7PPxVjQ7OU7ryME=;
 b=bc9JiCyNi2SaYl+btE6yrujudYyNLl78V5XpCyZ9/4KEKAxZRAkGj+1u6RtqkAg8km
 AqFdngrJgZ/406TlWA1lT6giJ9khHuUW7QONSzFjqtf58qeWHJGMxhP3aPHFDtf+2zaQ
 mydxAV6NRzV2r1+bfnNomk9OOUhPLAlSKRxC16WEBfx4jes9GyHem4xpgvJTiW5lWMUw
 vhTlktN5Wp5bdjPQy+ibqrcIY+uBMIk5JRsyjeodQ5f5J23sr5oITBr9zBlowO7pPGPZ
 VRPpox3R7Qe8bogft+q4bqukDp6Glyy0BZW8Wg4rtv5njYWjLb6gNugwrmJhNroIrloy
 qcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=umFCQ4NMWCIE/enEbdR7IzBDkwF+7PPxVjQ7OU7ryME=;
 b=YdHakF9qlWHR4BAlvbyJaKA1ROZaxA47Qx5Z1cAue65doxQdIXvouIm4g+rYDOgx8s
 s0hh1L79CnJQ+vkNtHyTLeeO75lt7SaKHxINz2RQk6w4D5vRvpByDxNO183mUBAA05ck
 MhQRS9AWuFVNuPdQmXlpVGgYwMq3Nw9AZdwRJy78QoL0de04oHvEJ6rAWqx02vl8SKsV
 BF4YVel9mf/KfK/VUaSgKnBAXq8J+vhzY3Cqsa/TYS3AQfCiDRmTKnkcoDMPFs0WgsEt
 IG0UGxanDuz4Eqpve0dCijvB5qSEzOP3455j658qnzMQKs6lZRBTW2RX1wR0pRMNrOW3
 G9dw==
X-Gm-Message-State: AOAM532SiOnNlUSLHhqM0ZWi+pCcVlI8N83yKwvRyCZKxgXgC0GlJ1cI
 YAqVwSR6xnM20T52cqszMLEumQ==
X-Google-Smtp-Source: ABdhPJw4f9DasVjg3UWnPvpGkYC6F50+B/J+YVBxdXzbXqEpee6TDkiCS9KiwItSk/Fp8hTBso6ChQ==
X-Received: by 2002:a1c:545e:: with SMTP id p30mr15205009wmi.20.1589752043827; 
 Sun, 17 May 2020 14:47:23 -0700 (PDT)
Received: from ls00508.pb.local ([2001:1438:4010:2540:bc3e:92a1:7010:2763])
 by smtp.gmail.com with ESMTPSA id v126sm14441244wmb.4.2020.05.17.14.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 14:47:23 -0700 (PDT)
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
To: akpm@linux-foundation.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH 01/10] include/linux/pagemap.h: introduce
 attach/detach_page_private
Date: Sun, 17 May 2020 23:47:09 +0200
Message-Id: <20200517214718.468-2-guoqing.jiang@cloud.ionos.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200517214718.468-1-guoqing.jiang@cloud.ionos.com>
References: <20200517214718.468-1-guoqing.jiang@cloud.ionos.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 linux-raid@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Anton Altaparmakov <anton@tuxera.com>, Andreas Dilger <adilger@dilger.ca>,
 Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
 Yang Shi <yang.shi@linux.alibaba.com>,
 William Kucharski <william.kucharski@oracle.com>,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Roman Gushchin <guro@fb.com>,
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

So, introduce the new attach/detach_page_private to replace them. With
the new pair of function, we will remove the usage of attach_page_buffers
and  __clear_page_buffers in next patches. Thanks for suggestions about
the function name from Alexander Viro, Andreas Grünbacher, Christoph
Hellwig and Matthew Wilcox.

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
No change since RFC V3.

RFC V2 -> RFC V3:
1. rename clear_page_private to detach_page_private.
2. updated the comments for the two functions.

RFC -> RFC V2:  Address the comments from Christoph Hellwig
1. change function names to attach/clear_page_private and add comments.
2. change the return type of attach_page_private.

 include/linux/pagemap.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index c6348c50136f..8e085713150c 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -208,6 +208,43 @@ static inline int page_cache_add_speculative(struct page *page, int count)
 	return __page_cache_add_speculative(page, count);
 }
 
+/**
+ * attach_page_private - Attach private data to a page.
+ * @page: Page to attach data to.
+ * @data: Data to attach to page.
+ *
+ * Attaching private data to a page increments the page's reference count.
+ * The data must be detached before the page will be freed.
+ */
+static inline void attach_page_private(struct page *page, void *data)
+{
+	get_page(page);
+	set_page_private(page, (unsigned long)data);
+	SetPagePrivate(page);
+}
+
+/**
+ * detach_page_private - Detach private data from a page.
+ * @page: Page to detach data from.
+ *
+ * Removes the data that was previously attached to the page and decrements
+ * the refcount on the page.
+ *
+ * Return: Data that was attached to the page.
+ */
+static inline void *detach_page_private(struct page *page)
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


