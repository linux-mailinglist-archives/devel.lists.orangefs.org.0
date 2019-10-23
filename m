Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C149E24B0
	for <lists+devel-orangefs@lfdr.de>; Wed, 23 Oct 2019 22:39:51 +0200 (CEST)
Received: from [::1] (port=48194 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1iNNQ6-0002Xb-CV
	for lists+devel-orangefs@lfdr.de; Wed, 23 Oct 2019 16:39:50 -0400
Received: from sonic301-27.consmr.mail.sg3.yahoo.com ([106.10.242.90]:46583)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <kim@possumbusiness.com>)
 id 1iNNQ4-0002Uq-Na
 for devel@lists.orangefs.org; Wed, 23 Oct 2019 16:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1571863145; bh=DK+zzXtDuHSbJMAv1NKGG84OmJtfrAPZBjKcHeviSpI=;
 h=From:To:Subject:Date:From:Subject;
 b=UamE3B5ozAAZ/IuJflDMH8mqWLabv7X8xoX5iqMHHUYVsrEa+ZWYEblj/v+oo0eY6sgt4ipDbRDHqfm4nmk4LInyKp74uoIPdn4MzPX7xh9yB5p5kpzuT7TikQ2nrZaUDZgirHRu83bB410v2/qVrU0NujumPLW7wDwttNMgRr1Q8fhQsNF+0e4xZDkDFKO50qS+JkMK2IFGHpozfwR1vQLel/kSRphfWr+Mi9ENAlfbPEqUgTvDw1yB78Ivhf1yqXb1eW4GQDm4KqPnhHOx5RzvkcyI++On87gIuWVuiqFAn+jsIayetT9Sb2ntWo/NYYo0wmBoL9LaNL/9brRwIQ==
X-YMail-OSG: Ba657Z4VM1kJiTwuACx37sr1.4B0g6Y92hqTmyKz6Hq8iKAH2hW_vYb4EHhU8O6
 lBFfMSLbGJY13SuWYdCLp6WQk3lz0kpqdkbxU_k03SOnqHsZAgvFWexur1hrIa63BLH_jLUyYIoX
 lb0GeZvqSqhOaZKaHkgR397mpKzzFanCwyLteKmCWKV2mwGXgCVvoYz_rO68PreIej39adurftzn
 x11RFNjVH.DOvTOaVxQYv_B8fk26Nwju_aQOWt47XrA1vyFW1dHvn6XsPQnRh2Vx_Bx4zeirqK_y
 qFLsQ6s2D3nVesJahxRFOFoOc_X1JIg_yglUgAcGop17yIgV1sHAig0d0YJA38xxEqnHrNrnZ6xh
 i208mXfbEOwi0EhSoGc7pnWY1wHbZdOeFfw42Qnwx9.hO9g6E6WJERJPTrIhZqbZssF_EwIIzoXS
 TWOcSiPcGwYoGNFCz7EvfyqZtRSx4uUIbhnsXAeuIzRsDHqqCykN2e8qNbIOxIGTPiaMY7wZZY9k
 Rhmd90OSd0PmXZVEEnCGv4Vv8Xv4yWrJqCpiEsBcjr3THoGRlO2O._NABS7Rd.V8d6eJnK31MSCy
 B9tDe_lOvgsNMIbJM0DrQb2neuJmpgWobn0NTl3S0cXj6ddrrHjWjTTEbVjr1ZKLptAepaQPlvSO
 VRV7khxOo9C98d_9oCwPu5FPuDXkmcWmwQ2kjZciYJdCaaf6Yo_mh2dwBvKSWCtM2NXxaww4daMm
 BwtFnbVG2WVZIs77gdsXB_0G0TDHceBoqoCUJvT9NkImT7kTzsL.FgxWpjV3WcWGCKM9Xzlv9DcJ
 ZgcdtBlD7x_s6eBSx0MxE3wmNOoZjC12xJg2c2Voj4tFQsExHb8AfBvXnimQkC5J1i13csO1COVl
 mb_7B4zfLCf3POXgKr4XHGYeaSaBRRG8GTepemwifwem5ieG7ofZR2yowNMRRDKnh9Q_G_xQkex7
 vMu7javqIAuYuFMOkXpx6Z50hjpttGybDajCB4YB7FbdKVvX95oiByRjdCkkPODOgLBRGkFtVwZ0
 Xg_FCQpzhQddElRwDQo2jPG0gvC09CH2KJ3Ww70zols32gKCRdm9KWLrEvgypISRPDIP7xxjM.xt
 m0Alu31wHpkz._SQJbCs1v6l4ltiu4W6AlE8XCwgLtl9jhjMr8aU_jsqhuhsRtN89WaJToFwib11
 efSVlRQxSupP2QrOYSRtVm3RN1NltjJMuYNEBOkAgyqD.9OvMsRNskQq9VYUUtaNxawgdGdqIQ.h
 HqRKjGbDmILKVeGV4qZLfqQiAdEcuF6MgEUGlX8o3oeoYredom3NH2f3dDO3FOJo78SsaisB_798
 aqfEUfne_9zpM_mSLe_sVx6Xx36GXbPwsK0UYirzbjVk-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.sg3.yahoo.com with HTTP; Wed, 23 Oct 2019 20:39:05 +0000
Received: by smtp402.mail.sg3.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 4ca75dd3a511c944cad2a91178020fab; 
 Wed, 23 Oct 2019 20:39:02 +0000 (UTC)
From: "Kim" <kim@possumbusiness.com>
To: <devel@lists.orangefs.org>
Subject: =?us-ascii?Q?_Supercomputing_'19-_Attendees_Leads?=
Date: Wed, 23 Oct 2019 16:39:01 -0400
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAANVdmHe06qNMghp8QAFZn57CgAAAEAAAAFIS//TNH7hJpOvK7etfRDgBAAAAAA==@possumbusiness.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AdWJ4ea5KihnfDDET0+Ev8/6Qypprw==
Content-Language: en-us
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.27
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

 

 

Hello,

 

Would you be interested in attendee list of Supercomputing '19? 

 

Titles: Computing, Networking and storage professional Marketing/Sales
Managers

 

Please let me know your interest, I will send you additional information
along with pricing details.

Awaiting your reply.

 

Thank you and I look forward to working with your company in making all your
upcoming events successful.

 

Best Regards,

Kim Kardashian 

Marketing Consultant                                         

 

                                                      To opt out, please
response Remove.

 

