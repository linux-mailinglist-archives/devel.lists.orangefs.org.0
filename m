Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A58214DFB
	for <lists+devel-orangefs@lfdr.de>; Sun,  5 Jul 2020 18:33:13 +0200 (CEST)
Received: from [::1] (port=59746 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1js7Zo-00060P-Iv
	for lists+devel-orangefs@lfdr.de; Sun, 05 Jul 2020 12:33:12 -0400
Received: from wrqvfbns.outbound-mail.sendgrid.net ([149.72.251.38]:29466)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.93)
 (envelope-from <bounces+17344838-c199-devel=lists.orangefs.org@sendgrid.net>)
 id 1js7Zm-000608-Lo
 for devel@lists.orangefs.org; Sun, 05 Jul 2020 12:33:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.net; 
 h=from:to:subject:mime-version:content-type; s=smtpapi; 
 bh=iionp6wdOTXXVZagR3VB2BJEUuaGhEfi04F3gUIWVKE=; b=NCaotu6He5PM0
 7JS+ULVTNsQQon8qB6M9PuPobR1WA79nXN8Yg2dRrclYEsJZdJ0Dk6P7r/8l5lXZ
 CcYvjbpzmuI5RKaLI+8UfPOSzDo/GCOwuI+SIoa101tMixoF6bz4chZW+coB7xIn
 oF+n014bS6ZwGE1l+NP4qrIVoGZSqc=
Received: by filter0441p1iad2.sendgrid.net with SMTP id
 filter0441p1iad2-26928-5F02009C-20
 2020-07-05 16:32:28.550910327 +0000 UTC m=+494952.468739907
Received: from fjceis (unknown)
 by ismtpd0001p1hnd1.sendgrid.net (SG) with ESMTP id 5WsI1a1PR6WuXQ-K2k--nw
 for <devel@lists.orangefs.org>; Sun, 05 Jul 2020 16:32:28.149 +0000 (UTC)
From: Amazon <Amazon@xnkpwx.com>
To: devel <devel@lists.orangefs.org>
Subject: =?iso-2022-jp?B?GyRCJCo7WUonJCRKfUshJE4+cEpzJHI5OT83GyhC?=
Date: Sun, 05 Jul 2020 16:32:28 +0000 (UTC)
Message-ID: <00f943ef62bd$9d818031$d7f2dd94$@fjceis>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
X-SG-EID: rb8ZEMJ2v8XTXhbm8WmwaHqmJ0VKlETmT1ucqJP8gB/L6D/jtVd9LAZnf7eCX01gwiaU1HMR0ZaGXT
 6NvoNt4e8vhokjjGhWVJnXCD8dSdS4GKZNKTTMofzyzf3POlBp5iMUP062McXhkhWMw4fCQppKt1kF
 R0WKlCvqyFSQE5woDiPX+LT/o6H8+2qqLdTkiT9Lh0qShrPdX81l2W7koA==
Content-Type: text/plain;
	charset="iso-2022-jp"
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

GyRCJCo7WUonJCRKfUshJE4+cEpzJHI5OT83JDckRiQvJEAkNSQkISMbKEJVcGRhdGUgZGVmYXVs
dCBjYXJkIGZvciB5b3VyIG1lbWJlcnNoaXAuDQoNCiANCiAbJEIlXiUkJTklSCUiGyhCPyAbJEIl
PyUkJWAlOyE8JWsbKEI/IBskQiUuJVUlSDd0GyhCIA0KDQogDQoNCg0KQW1hem9uGyRCJVclaSUk
JWAkciQ0TXhNUUQ6JC0kIiRqJCwkSCQmJDQkNiQkJF4kOSEjJCo1Uk1NJE4bKEJBbWF6b24bJEIl
VyVpJSQlYDJxMHc7cTNKJE8hIhsoQjIwMjAvMDcvMDYbJEIkSzk5PzckcjdeJCgkXiQ5ISMkKkQ0
JFkkNyQ/JEgkMyRtISIycUhxJE4kKjtZSickJCRLO0hNUSRHJC0ka00tOHokSiUvJWwlOCVDJUgl
KyE8JUkkLCUiJSslJiVzJUgkS0VQTz8kNSRsJEYkJCReJDskcyEjJS8lbCU4JUMlSCUrITwlST5w
SnMkTjk5PzchIj83JDckJCUvJWwlOCVDJUglKyE8JUkkTkRJMkMkSyREJCQkRiRPMEoyPCROPGo9
ZyRyJDQzTkcnJC8kQCQ1JCQhIxsoQg0KDQoNCg0KMS4gGyRCJSIlKyUmJXMlSCU1ITwlUyU5JCsk
aRsoQkFtYXpvbhskQiVXJWklJCVgMnEwdz5wSnMkcjRJTX0kOSRrJEslIiUvJTslOSQ3JF4kOSEj
GyhCDQoNCg0KMi4gQW1hem9uGyRCJVclaSUkJWAkS0VQTz8kNyQ/GyhCQW1hem9uLmNvLmpwGyRC
JE4lIiUrJSYlcyVIJHI7SE1RJDckRiU1JSQlcyUkJXMkNyReJDkhIxsoQg0KDQoNCjMuIBskQjo4
QiYkS0k9PCgkNSRsJEYkJCRrIVY4PTpfJE47WUonSn1LISFXJE4yPCRLJCIkayFWO1lKJ0p9SyEk
ckpROTkkOSRrIVckTiVqJXMlLyRyJS8laiVDJS8kNyReJDkhIxsoQg0KDQoNCjQuIBskQk0tOHo0
fDhCJE45OT83JF4kPyRPPzckNyQkJS8lbCU4JUMlSCUrITwlST5wSnMkckZ+Tk8kNyRGJC8kQCQ1
JCQhIxsoQg0KDQoNCg0KQW1hem9uGyRCJVclaSUkJWAkcjdRQjMkNyRGJDRNeE1RJCQkPyRAJC8k
PyRhJEshIjJxSHEkTiQqO1lKJyQkJEskNDtYRGokJCQ/JEAkJCQ/JS8lbCU4JUMlSCUrITwlSSQs
O0hNUSRHJC0kSiQkPmw5ZyRPISIlIiUrJSYlcyVIJEtFUE8/JDUkbCRGJCQka0pMGyhCIBskQiRO
JS8lbCU4JUMlSCUrITwlSSRLMnFIcSRyQEE1YSQ1JDskRkQ6JC0kXiQ5ISMycUhxJE5AQTVhJCw9
UE1oJEokJD5sOWckTyEiJCo1Uk1NJE4bKEJBbWF6b24bJEIlVyVpJSQlYDJxMHc7cTNKJE88Ojh6
JDchIkZDRTUkciQ0TXhNUSRHJC0kSiQvJEokaiReJDkhIxsoQg0KDQoNCkFtYXpvbi5jby5qcBsk
QiUrJTklPyVeITwlNSE8JVMlORsoQiANCg0KDQoNCg0KIA0KGyRCO1lKJ0p9SyEkTj5wSnMkcjk5
PzckOSRrGyhCIA0KDQoNCg0KIA0KDQo=
