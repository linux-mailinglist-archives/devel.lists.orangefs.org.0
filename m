Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A85B2AC084
	for <lists+devel-orangefs@lfdr.de>; Mon,  9 Nov 2020 17:09:59 +0100 (CET)
Received: from [::1] (port=49294 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1kc9jy-0004l5-5B
	for lists+devel-orangefs@lfdr.de; Mon, 09 Nov 2020 11:09:58 -0500
Received: from mail-ua1-f71.google.com ([209.85.222.71]:51929)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from
 <3qmmpXw0JBScOLcDQDeePXUHOJPDLO.FRPGHYHOOLVWV.RUDQJHIV.RUJ@trix.bounces.google.com>)
 id 1kc9jw-0004jt-RH
 for devel@lists.orangefs.org; Mon, 09 Nov 2020 11:09:56 -0500
Received: by mail-ua1-f71.google.com with SMTP id 36so1188266uaw.18
 for <devel@lists.orangefs.org>; Mon, 09 Nov 2020 08:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:message-id:date:subject:from:to;
 bh=WWVzmj8+GCqQi8FRvhf7OpUWHXHN1NgTYiaVvPn72lw=;
 b=ib7qvwf1NkykFV2RiFxMevHnWbUb3c+u6+m+KEE8GOKooStmf/Tu718v1zgBO5yDgZ
 /QPaNHjgzs45RtdlOKHfWda5IvhtMEEj4IAlge1L2xOSOFFQsoBR1PkK08/uT9iqH2tC
 ImRkJc08qa/TmGfEvhTveCndV5+1fQytb8qrYgQY1IFy/LdhK0Zfa5DzQuXfFoJp28TV
 oApLGj56LY/bFi51S5sZ9D4vBqn0SxE9LIOzYz/e2zmQaFv29+WpXDh7yPznBeeXh47X
 qrF2S076iSNzqy9txY7wplwiQDjbHg9Sl+YBv4GKe0iiso0Zo2rpqrtdO3uAwzf/tc2k
 HcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:message-id:date:subject
 :from:to;
 bh=WWVzmj8+GCqQi8FRvhf7OpUWHXHN1NgTYiaVvPn72lw=;
 b=FHxgxjF2D9HNDOsQZPFeaMylpkVMLTmZmtOKSL4YyYsjbNawfli21ZNOFSa6oL9g7e
 PpOeGpyeDvgiLInZ2kXE3r2J0T7kIb7dt6qCi1ubMxB2QTNjHPam5pyn/Wqj0/LpSogv
 yoR0NlpIpjv0NT9ODN8F61kb2wmuREofF1ND6Wdd2YB0Fy1Jt7Jk1KlXpVszq6xJ33dm
 GB+GB1fgXO6Qw3NucvD4fKk+Q/e8uaN3H4ydMtcneyhbcUQIbp1NujnkfURWBZZVYh3I
 v9yb7K3D3OQea38ltGyDzDOOTFcpbj25+eHOj/l937HkAQrMaCCE7xdYBt2nw4y6NfSK
 37tg==
X-Gm-Message-State: AOAM532qNl1OqrnO5utCEP6LZULDGjaztQasn/DuSZiZSqxpnkDXjkb5
 6bTCShZ2iOf8AId4Cd3aJ54Fn7CiFF8eS9uVcgiL
MIME-Version: 1.0
X-Received: by 2002:a67:8c44:: with SMTP id o65mt8985104vsd.45.1604938154296; 
 Mon, 09 Nov 2020 08:09:14 -0800 (PST)
X-No-Auto-Attachment: 1
Message-ID: <00000000000092e10f05b3aec89e@google.com>
Date: Mon, 09 Nov 2020 16:09:15 +0000
Subject: Hello dear
From: lizana11murel@gmail.com
To: devel@lists.orangefs.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.33
X-BeenThere: devel@lists.orangefs.org
X-Mailman-Version: 2.1.33
Precedence: list
List-Id: <devel.lists.orangefs.org>
List-Unsubscribe: <http://lists.orangefs.org/mailman/options/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=unsubscribe>
List-Archive: <http://lists.orangefs.org/pipermail/devel_lists.orangefs.org/>
List-Post: <mailto:devel@lists.orangefs.org>
List-Help: <mailto:devel-request@lists.orangefs.org?subject=help>
List-Subscribe: <http://lists.orangefs.org/mailman/listinfo/devel_lists.orangefs.org>, 
 <mailto:devel-request@lists.orangefs.org?subject=subscribe>
Reply-To: lizana11murel@gmail.com
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

SmUgdm91cyBhaSBpbnZpdMOpIMOgIHJlbXBsaXIgbGUgZm9ybXVsYWlyZSBzdWl2YW50wqA6DQpG
b3JtdWxhaXJlIHNhbnMgdGl0cmUNCg0KUG91ciByZW1wbGlyIGNlIGZvcm11bGFpcmUsIGNvbnN1
bHRlesKgOg0KaHR0cHM6Ly9kb2NzLmdvb2dsZS5jb20vZm9ybXMvZC9lLzFGQUlwUUxTZjFwVG9r
UVU5UkNoS2dub0hqNzdtUHNmM0ZVbFIyY0Jkc1JrVGp4Z1lUa1FCcklBL3ZpZXdmb3JtP3ZjPTAm
YW1wO2M9MCZhbXA7dz0xJmFtcDtmbHI9MCZhbXA7dXNwPW1haWxfZm9ybV9saW5rDQoNCkhlbGxv
LA0KDQpJJiMzOTttIExpemFuYSBNdXJlbCwgQSBiYW5rIHdvcmtlciwgSSBoYXZlIGEgYnVzaW5l
c3MgZGVhbCBmb3Igb3VyIG11dHVhbA0KYmVuZWZpdC4gT25lIG9mIG91ciBjdXN0b21lcnMgZGll
ZCB5ZWFycyBhZ28gaW4gYSBwbGFuZSBjcmFzaCB3aXRob3V0DQphbnkgcmVnaXN0ZXJlZCBuZXh0
LW9mLWtpbiBpbiBoaXMgYmlvLWRhdGEvYWNjb3VudCBmaWxlIHdoaWNoIGlzDQpwZWN1bGlhciB3
aXRoIGhpZ2ggcHJvZmlsZSBpbnZlc3RvcnMuIEkgd2FzIGhpcyBhY2NvdW50IG9mZmljZXIgYmVm
b3JlDQpJIHJvc2UgdG8gdGhlIHBvc2l0aW9uIG9mIEZpbmFuY2lhbCBPZmZpY2VyLiBSaWdodCBu
b3cgbXkgYmFuayB3YW50IHRvDQpzaXQgb24gdGhpcyBtb25leSAoVVMkMTguN01pbGxpb24pIGFz
IHVuY2xhaW1lZCBhbmQgYWJhbmRvbmVkIGZ1bmRzDQp3aGljaCBpIGRvIG5vdCB3YW50IGJlY2F1
c2Ugb2YgcmVhc29ucyBJIHdpbGwgZXhwbGFpbiB0byB5b3Ugd2hlbiBpDQpyZWNlaXZlIHlvdXIg
cmVzcG9uc2UuIFBsZWFzZSBnZXQgYmFjayB0byBtZSBhcyBmYXN0IGFzIHlvdSBjYW4gd2l0aA0K
eW91ciBtb2JpbGUgdGVsZXBob25lIGFuZCBhZGRyZXNzZXMgZm9yIGRldGFpbHMgb24gaG93IHRo
ZSBmdW5kcyBjYW4NCmJlIHR1cm5lZCBpbnRvIHlvdXJzIGJ5IHJpZ2h0IG9mIGluaGVyaXRhbmNl
IGZvciB1cyB0byBjbGFpbSBhbmQgc2hhcmUNCmVxdWFsbHkgYWZ0ZXJ3YXJkLg0KDQpTb21lIGRp
cmVjdG9ycyBoZXJlIGhhdmUgYmVlbiB0cnlpbmcgdG8gZmluZCBvdXQgZnJvbSBtZSB0aGUNCmlu
Zm9ybWF0aW9uIGFib3V0IGhpcyBhY2NvdW50LCBidXQgSSBoYXZlIGtlcHQgaXQgdW5kaXNjbG9z
ZWQgYmVjYXVzZQ0KSSBrbm93IHRoYXQgaWYgdGhleSYjMzk7cmUgYXdhcmUgdGhhdCB0aGUgY3Vz
dG9tZXJzIGlzIGxhdGUsIHRoZXkgd2lsbA0KcXVpY2tseSBkaXZlcnQgaGlzIGZ1bmRzIGZvciB0
aGVpciBzZWxmaXNoIGludGVyZXN0IGp1c3QgYXMgdGhleSBkaWQNClRvIHRoZSByZXN0IGN1c3Rv
bWVycyB3aG8gaGFkIHNpbWlsYXIgY2FzZXMuIFRoZXJlZm9yZSBJIGFtIHNlZWtpbmcNCnlvdXIg
Y28tb3BlcmF0aW9uIHRvIHByZXNlbnQgeW91IGFzIHRoZSBiZW5lZmljaWFyeSB0byB0aGlzIGZ1
bmQgYXMNCnJlY29yZCBzaG93cyB0aGF0IHlvdSBiYXJlIHRoZSBzYW1lIGxhc3QvZmFtaWx5IG5h
bWUgd2l0aCB0aGUNCmRlY2Vhc2VkLHRoaXMgd2lsbCBlbmFibGUgbXkgYmFuayBoZWFkcXVhcnRl
ciB0byBwYXkgdGhlIGZ1bmRzIHRvIHlvdS4NCg0KV2Ugc2hhbGwgYm90aCBiZW5lZml0cyBlcXVh
bGx5IGZyb20gdGhpcyB0cmFuc2FjdGlvbiBpbiB0aGUgc2hhcmluZw0KcmF0aW8gb2YgNDUlIHRv
IHlvdSBhbmQgNDUlIGZvciBtZSB3aGlsZSB0aGUgcmVtYWluaW5nIDEwJSB3aWxsIGJlDQpnaXZp
bmcgdG8gdGhlIGxlc3MgcHJpdmlsZWdlIGFuZCB0aGUgbW90aGVybGVzcyBob21lLiBJZiB5b3Ug
Y29uc2lkZXINCnlvdXJzZWxmIHRvIHdvcmsgd2l0aCBtZSBraW5kbHkgc2VuZCB5b3VyIHJlc3Bv
bnNlIHRvIG15IHByaXZhdGUgZW1haWwNCmZvciBzZWN1cml0eSByZWFzb247IGxpemFuYW11cmVs
NDU5QHlhaG9vLmNvbQ0KDQoNCg0KQmVzdCBSZWdhcmRzLA0KTGl6YW5hIE11cmVsDQoNCkdvb2ds
ZcKgRm9ybXMgdm91cyBwZXJtZXQgZGUgY3LDqWVyIGRlcyBlbnF1w6p0ZXMgZXQgZCdlbiBhbmFs
eXNlciBsZXMgIA0KcsOpc3VsdGF0cy4NCg==
