Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 35794194513
	for <lists+devel-orangefs@lfdr.de>; Thu, 26 Mar 2020 18:07:54 +0100 (CET)
Received: from [::1] (port=36118 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jHVyz-0006e0-EU
	for lists+devel-orangefs@lfdr.de; Thu, 26 Mar 2020 13:07:53 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:41416)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from
 <BATV+f73da832ea8226d6223e+6059+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1jHVyy-0006V2-Ej
 for devel@lists.orangefs.org; Thu, 26 Mar 2020 13:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=5peKgPAOIgDsB7OdsjooA9F7ULofAH7Tv5lWvuuxPdQ=; b=cAA+jDacoun0eJYipzHcWd5pyi
 CeCvQKVZZaeDAd3DehDrp3XdPLx98uLvmAFouTNSkkIwYK/l/TYt9D5ZR0SUhvIVerpjgBYj1oYme
 e54EomVm7TYA2mfsoTTXSzm/6ckQokCLtK0oXzHXAhTjitR180tn4FnE89UQl8vMpgWy86iQi+fkv
 /kQ+SB0Ix8fZ7t//sGrTrvr+AMmN9D7AGleXNBTPP270KGew+b8b/sFaROci2WbEYN2CsI06laE+T
 mUI84OykN5NEAN3Kgby9tytE4IuFOCDsq5aNL75X4Kj4IX/Fmy55sZJkvHPml6buoZm4soKZIYcA0
 GsszmeIg==;
Received: from [2001:4bb8:18c:2a9e:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHVyG-00018n-9d; Thu, 26 Mar 2020 17:07:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>
Subject: orangefs fixes
Date: Thu, 26 Mar 2020 18:07:03 +0100
Message-Id: <20200326170705.1552562-1-hch@lst.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 devel@lists.orangefs.org
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

Hi Mike and Martin,

this fixes a pretty grave bug in the ->read_iter and ->flush interaction,
and also removes some copy and pasted code that isn't needed (and out of
date already)

