Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 2557E2E4CF
	for <lists+devel-orangefs@lfdr.de>; Wed, 29 May 2019 20:52:04 +0200 (CEST)
Received: from [::1] (port=40742 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hW3gA-0006NY-M9
	for lists+devel-orangefs@lfdr.de; Wed, 29 May 2019 14:52:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:50266)
 by mm1.emwd.com with esmtps (TLSv1.2:AECDH-AES256-SHA:256)
 (Exim 4.92) (envelope-from <sashal@kernel.org>) id 1hW3g9-0006NG-FF
 for devel@lists.orangefs.org; Wed, 29 May 2019 14:52:01 -0400
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4CD4624056;
 Wed, 29 May 2019 18:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559155880;
 bh=0ZzrcgBGVfZ/PWEdBvIb97tLixwq7FM2BS+szZHK7+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MprGCPlWVTU3pUVTYrl5/4MqcXbWnuVG9rTEYI/rjsq0I9ninigfkE7v3rdQKQwK0
 vXQknEQlHNiriONe46K1YBXeb8Kj4v6gd0J27GX0Gm60mVbG8B0shfzTpgdjJqrMPl
 jOXfIwhm1BpVQHmkaw+0iB6LJQ8dPhoHvoNLKh9A=
Date: Wed, 29 May 2019 14:51:19 -0400
From: Sasha Levin <sashal@kernel.org>
To: martin@omnibond.com
Subject: Re: [PATCH AUTOSEL 5.1 025/375] orangefs: truncate before updating
 size
Message-ID: <20190529185119.GG12898@sasha-vm>
References: <20190522192115.22666-1-sashal@kernel.org>
 <20190522192115.22666-25-sashal@kernel.org>
 <20190522214437.GA87137@t480s.mkb.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190522214437.GA87137@t480s.mkb.name>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: devel@lists.orangefs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: <devel.lists.orangefs.org>
List-Unsubscribe: <http://lists.orangefs.org/mailman/options/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=unsubscribe>
List-Archive: <http://lists.orangefs.org/pipermail/devel_lists.orangefs.org/>
List-Post: <mailto:devel@lists.orangefs.org>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Subscribe: <http://lists.orangefs.org/mailman/listinfo/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=subscribe>
Cc: devel@lists.orangefs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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

On Wed, May 22, 2019 at 05:44:37PM -0400, martin@omnibond.com wrote:
>I don't think it makes much sense to put this one in stable.  Without
>the rest of the pagecache patches the race doesn't exist.

Dropped it, thank you!

--
Thanks,
Sasha

