Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6ED3CC93
	for <lists+devel-orangefs@lfdr.de>; Tue, 11 Jun 2019 15:08:08 +0200 (CEST)
Received: from [::1] (port=56736 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hagVT-0007eL-Hy
	for lists+devel-orangefs@lfdr.de; Tue, 11 Jun 2019 09:08:07 -0400
Received: from 210519.news014.com ([206.189.188.169]:49390)
 by mm1.emwd.com with esmtp (Exim 4.92)
 (envelope-from <news@news014.com>) id 1hagVS-0007dT-4d
 for devel@lists.orangefs.org; Tue, 11 Jun 2019 09:08:06 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=certs; d=news014.com;
 h=Date:To:From:Reply-To:Subject:Message-ID:List-Unsubscribe:List-Id:MIME-Version:Content-Type;
 i=news@news014.com; bh=bc2UnxOjEN7gWO9Fnoo60bJbN3k=;
 b=Wv6eJTwwAz6gREhzhJwISdrK6Kf3+5Zp0N8FOLCVBYWKoU6QAsszGZIV421lbIDI4F2lZK4WpY39
 MR0jWCRtZcVxS7aelLjh668+WYHd2FI4Ld0XQG5J7dmYmfJOkWKt4Mv+hDIjd0RrbXZrIuzAC42g
 PQCz2Lq1+5thocet4APUufqAvL4s1iDGPWZZdJBDyjt1OV3nKfP+U/Dt+sJontgHO2b8V2yVOx9P
 RJKByy/MACP+XKjRbYt5BgWnrxcvq9uXOzMCgm5TQkDFtuKpgE3oTJbP8o2aPaBF8DlMIF7jBF14
 j6K9n4qQn3yxapgsZpRDL1dWjac8kKuVQ00paA==
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=certs; d=news014.com;
 b=q0xzWgbr0GjS+WCTxQSY9VzyqiJyyj10Ev0vmTb3oE9fGf2jLE09LpRHR9kEBWpuO0jNt7XVRbSH
 Bx1pHpnVIZa9KFgWz+kfjnwoIL7bUnFB4J0Stp/+slodbfnbAQpTc6U3r8wHSkfRf/8jSPTXHmUG
 Kepu6Zp7Wq26XOjJy1IdjJxI6sgMEyHDSyT3nzZ2tavwHIfI2+7UG8iTb1P7J+s9RKU0l5XSKkW8
 7V8lh2cWx+O6YnKSDZTLORRNkITPdSaEFnGKL37LYvnSRDgeCRPKtY3ICPp/qdcZnutOC5fZva0t
 kJ2ylMuQ7jNozluTXSFGpfRs5i3z5ZNNeCEjmQ==;
Date: Tue, 11 Jun 2019 13:07:24 +0000
To: "Customers_li@mail.com" <devel@lists.orangefs.org>
From: Dan Wolter <news@news014.com>
Subject: Re: Your Order is Ready
Message-ID: <f60f173092a286f31cd1a69690f1d147@news014.com>
X-Hneq-Campaign-Uid: pr1606r7b97a5
X-Hneq-Subscriber-Uid: oo830273z9907
X-Hneq-Customer-Uid: vy755nk3wz5b4
X-Hneq-Customer-Gid: 2
X-Hneq-Delivery-Sid: 2
X-Hneq-Tracking-Did: 2
X-Report-Abuse: Please report abuse for this campaign here:
 http://tr.news014.com/hu-appd/index.php/campaigns/pr1606r7b97a5/report-abuse/sj99032psd73c/oo830273z9907
Feedback-ID: pr1606r7b97a5:oo830273z9907:sj99032psd73c:vy755nk3wz5b4
Precedence: bulk
X-Hneq-EBS: http://tr.news014.com/hu-appd/index.php/lists/block-address
X-Sender: news@news014.com
X-Receiver: devel@lists.orangefs.org
X-Hneq-Mailer: PHPMailer - 5.2.21
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.27
X-BeenThere: devel@lists.orangefs.org
X-Mailman-Version: 2.1.27
List-Id: <devel.lists.orangefs.org>
List-Unsubscribe: <http://lists.orangefs.org/mailman/options/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=unsubscribe>
List-Archive: <http://lists.orangefs.org/pipermail/devel_lists.orangefs.org/>
List-Post: <mailto:devel@lists.orangefs.org>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Subscribe: <http://lists.orangefs.org/mailman/listinfo/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=subscribe>
Reply-To: Dan Wolter <noreply@news014.com>
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

____
____
____
You received this email because you subscribed to Shopify Apps. You
can UNSUBSCRIBE
http://tr.news014.com/hu-appd/index.php/campaigns/pr1606r7b97a5/track-url/o=
o830273z9907/d4d2b6157f534a041562b6de28debb70fa2c2f24
at any time.
Powered by Shopify
http://tr.news014.com/hu-appd/index.php/campaigns/pr1606r7b97a5/track-url/o=
o830273z9907/3e0f6199e9a37dffb5656f8ec1f65872f905af66.

