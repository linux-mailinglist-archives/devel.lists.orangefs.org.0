Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F49B1BC89E
	for <lists+devel-orangefs@lfdr.de>; Tue, 28 Apr 2020 20:36:45 +0200 (CEST)
Received: from [::1] (port=57440 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jTV64-0001cX-Du
	for lists+devel-orangefs@lfdr.de; Tue, 28 Apr 2020 14:36:44 -0400
Received: from ms.lwn.net ([45.79.88.28]:36830)
 by mm1.emwd.com with esmtps  (TLS1.2) tls TLS_ECDH_anon_WITH_AES_256_CBC_SHA
 (Exim 4.93) (envelope-from <corbet@lwn.net>) id 1jTV63-0001cH-2M
 for devel@lists.orangefs.org; Tue, 28 Apr 2020 14:36:43 -0400
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id D03822D6;
 Tue, 28 Apr 2020 18:36:01 +0000 (UTC)
Date: Tue, 28 Apr 2020 12:36:00 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH] docs: orangefs: fix pvfs2tab literal block
Message-ID: <20200428123600.2f0f908f@lwn.net>
In-Reply-To: <20200424153515.134500-1-steve@sk2.org>
References: <20200424153515.134500-1-steve@sk2.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
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

On Fri, 24 Apr 2020 17:35:15 +0200
Stephen Kitt <steve@sk2.org> wrote:

> Following a merge fix-up, the literal block is introduced too early;
> this patch merges the localhost mention with the introduction, fixing
> 
> 	Documentation/filesystems/orangefs.rst:124: WARNING: Literal block expected; none found.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>

Applied, thanks.

jon

