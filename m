Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9BA1C9DB1
	for <lists+devel-orangefs@lfdr.de>; Thu,  7 May 2020 23:45:00 +0200 (CEST)
Received: from [::1] (port=51372 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jWoKB-0006HR-PH
	for lists+devel-orangefs@lfdr.de; Thu, 07 May 2020 17:44:59 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38886)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <guoqing.jiang@cloud.ionos.com>)
 id 1jWoKB-0006Gq-5N
 for devel@lists.orangefs.org; Thu, 07 May 2020 17:44:59 -0400
Received: by mail-ed1-f65.google.com with SMTP id r16so6750472edw.5
 for <devel@lists.orangefs.org>; Thu, 07 May 2020 14:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mR5KN3Pz1n6bpXv2DNeSraShlVTsxJWNxOu3C85SoMg=;
 b=NAbAsbcCbcOXGfgGm7ahZi0o5gzd0TsLfygSJrNrVrw5vLmqVRWfCI3isz5iFR5mbA
 STvZy0Ini+hckNV2WvZupD+LtTplGUSiOCIH9BQ4aOETcgeCdIpI3Mj4WzqQem9CXLDe
 qYqvI/C+O08KvR+8KRty0U7zvjbl56T9lDhJogFf/OcHKnQJ9/6T7DcnRmFb0xuydSVo
 OCcwBscdI31qgR35JMlzx4rHo/+NUlCVj0gEvFfy2Ss+woreUw2pfXnuKNU5iEfww/Em
 QGboLZniwFBp/2tvxFy9cYEauvwdXj+tBAzwiJzCfCEprECi1B8+ab9SEyFXMnVToH+E
 +Dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mR5KN3Pz1n6bpXv2DNeSraShlVTsxJWNxOu3C85SoMg=;
 b=NrdJo3Fc5bBJCrUCF532v6z4PTcL6FRtPEkzl+mBVoBEwTeC1ndfgB47ChcVIaJG8H
 Ovk20tnX9yfrQm2370RD0FTOomV5kXRUJEIpab8HgcG3lwk8oRUgbWQz2ZnqouLiCHhx
 z8XAZKDAz5zLxgdzeAdaVjodIHT3Uvgwy/73xKXexJBk9+STSsjccwd2ft37KXM5lGfw
 qeG03jkhUmkSsaLEQVhFEmPqqnUMF+ciiwD1BhmnhxiT4G68K4RSxu/DbLG1bTfqhFZH
 sf5f2ypJxr9PiQ0C5bkuKi4SBCQ7eWlPJ4tnG9bK76+CnEJomkj08w80qaTR9BV3oioP
 q1hg==
X-Gm-Message-State: AGi0PuYJby+Rqnvhna4WMBRDPKFANyvkrzdBbGPQJfNrsZ8mPEmcVYOq
 D4WHublKCcoM7A9ZLx4bVhjrcA==
X-Google-Smtp-Source: APiQypLmX8YHBXb7kua9dEsVAJulVEp2exuqcsxlWLEdtzHF8lGn1ZzGxVKJFdK6oe8J4dems5+T3w==
X-Received: by 2002:a05:6402:221c:: with SMTP id
 cq28mr13246566edb.50.1588887857976; 
 Thu, 07 May 2020 14:44:17 -0700 (PDT)
Received: from ls00508.pb.local ([2001:1438:4010:2540:a1ee:a39a:b93a:c084])
 by smtp.gmail.com with ESMTPSA id k3sm613530edi.60.2020.05.07.14.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 14:44:17 -0700 (PDT)
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH V3 01/10] include/linux/pagemap.h: introduce
 attach/detach_page_private
Date: Thu,  7 May 2020 23:43:51 +0200
Message-Id: <20200507214400.15785-2-guoqing.jiang@cloud.ionos.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200507214400.15785-1-guoqing.jiang@cloud.ionos.com>
References: <20200507214400.15785-1-guoqing.jiang@cloud.ionos.com>
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
 linux-mm@kvack.org, William Kucharski <william.kucharski@oracle.com>,
 Yafang Shao <laoar.shao@gmail.com>, Andreas Gruenbacher <agruenba@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Chris Mason <clm@fb.com>,
 willy@infradead.org, hch@infradead.org, devel@lists.orangefs.org,
 Chao Yu <chao@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 linux-raid@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Anton Altaparmakov <anton@tuxera.com>,
 Andreas Dilger <adilger@dilger.ca>,
 Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
 Yang Shi <yang.shi@linux.alibaba.com>, Song Liu <song@kernel.org>,
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

So, introduce the new attach/detach_page_private to replace them. With
the new pair of function, we will remove the usage of attach_page_buffers
and  __clear_page_buffers in next patches. Thanks for suggestions about
the function name from Alexander Viro, Andreas Grünbacher, Christoph
Hellwig and Matthew Wilcox.

Suggested-by: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
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
RFC V2 -> RFC V3:
1. rename clear_page_private to detach_page_private.
2. updated the comments for the two functions.

RFC -> RFC V2:  Address the comments from Christoph Hellwig
1. change function names to attach/clear_page_private and add comments.
2. change the return type of attach_page_private.

 include/linux/pagemap.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index a8f7bd8ea1c6..99dd93188a5e 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -205,6 +205,43 @@ static inline int page_cache_add_speculative(struct page *page, int count)
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


