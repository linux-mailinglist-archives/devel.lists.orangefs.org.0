Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id B172829E27D
	for <lists+devel-orangefs@lfdr.de>; Thu, 29 Oct 2020 03:15:22 +0100 (CET)
Received: from [::1] (port=37150 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1kXxTF-0000Qy-Vs
	for lists+devel-orangefs@lfdr.de; Wed, 28 Oct 2020 22:15:21 -0400
Received: from mail-yb1-f200.google.com ([209.85.219.200]:34676)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from
 <3jyWaXxIJBUYijlw2ti6mpq00mvmmAouiqt.kwulm3mttq010.wzivomn0.wzo@trix.bounces.google.com>)
 id 1kXxTE-0000QU-Di
 for devel@lists.orangefs.org; Wed, 28 Oct 2020 22:15:20 -0400
Received: by mail-yb1-f200.google.com with SMTP id h64so1152795ybc.1
 for <devel@lists.orangefs.org>; Wed, 28 Oct 2020 19:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:message-id:date:subject:from:to;
 bh=gnQM4uYp7IFAIFr/Rf+5YWBQNBgQOVEJlvASNPfzGF8=;
 b=ZKYKVtNWmkEOSF9w+eHNJda01eNCXSQQVn+g8BfuoUmDfFZBvst/CHTRUdoDjLPOtl
 1NZGBHRA9crjSl6LQRo0E7J3V2IdtgdKNAGKuG45j35VJ0VEpfBE91qa48ctoG9OJYOZ
 Xz8wp/dNcblJP3v0r7AB2TqrmFoU6e4THrDCoOoZfGRy//29T4vfoUqHnsUqnijV+hv9
 o1I1jLS+dCFzQK6TfoUEiAWrSyENeBgReVcmaqcagMQ+HkMpdFXUOF4eUNi39/xS9iFU
 awdL1kH1RZdQqHe/r2+V37YlLSY1Srv17R9sjbQA5XHRhbMh6AMPirie7CgrxQubYucK
 kP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:message-id:date:subject
 :from:to;
 bh=gnQM4uYp7IFAIFr/Rf+5YWBQNBgQOVEJlvASNPfzGF8=;
 b=F+k2XvTMGKKSlTtxy247+nLdxz4q5E2imI//6rdaKirjcZCQCHunHnS+k7aqvYG5z+
 VvCHGGJzTKwApyJLwlxQKwKxEtq9iNuiWz0Q5mNpVkSHl25sxvLmmcDzkmyYmib2bcD0
 8tQgCTjQfPjLsV4/azjuoAkaf47BtuK4ccSAKFxNjeidCEVs92wWG6Z9r2DxMCnt1VKh
 go6Ff3VXtn54e9Dk53MTBTvqAsOugzz00nlbrUnT1ah5QtwSd27fSwNMkDCGtfW+Gwep
 5MMbkFxV93AyD5CnG1CG2MlRygW9Gyts5W0Zgq30xFIWK9JfRYdGS/6c5toLiWc0QOzb
 gj0Q==
X-Gm-Message-State: AOAM530lLyXBOgdVuhYVWjt6ryUG+Vh4w86tVA6zYLeFkDbEDetdc7SD
 EUTB7lk0YPmXBrB3rN1ss2050gmQb5u4Vz4WgGTY
MIME-Version: 1.0
X-Received: by 2002:a25:37d4:: with SMTP id e203mt3068152yba.18.1603937679243; 
 Wed, 28 Oct 2020 19:14:39 -0700 (PDT)
X-No-Auto-Attachment: 1
Message-ID: <0000000000009d0c9405b2c5d718@google.com>
Date: Thu, 29 Oct 2020 02:14:39 +0000
Subject: Re:bonjour 
From: abdoulayehissenee2@gmail.com
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
Reply-To: abdoulayehissenee2@gmail.com
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

SmUgdm91cyBhaSBpbnZpdMOpIMOgIHJlbXBsaXIgbGUgZm9ybXVsYWlyZSBzdWl2YW50wqA6DQpJ
bnZpdGF0aW9uIOKAkyBGb3JtdWxhaXJlIGRlIHLDqXBvbnNlDQoNClBvdXIgcmVtcGxpciBjZSBm
b3JtdWxhaXJlLCBjb25zdWx0ZXrCoDoNCmh0dHBzOi8vZG9jcy5nb29nbGUuY29tL2Zvcm1zL2Qv
ZS8xRkFJcFFMU2ROUmhESC1YN05xM2wzZmxFaVJMM2QwYmFpSjRuVzdlWXNOVWcwN0tyaGdqblZI
US92aWV3Zm9ybT92Yz0wJmFtcDtjPTAmYW1wO3c9MSZhbXA7ZmxyPTAmYW1wO3VzcD1tYWlsX2Zv
cm1fbGluaw0KDQpCb25qb3VyLA0KamUgbSYjMzk7YXBwZWxsZSBNciBBYmRvdWxheWUgSGlzc2Vu
ZSBleCBtaW5pc3RyZSBkZSBsYSBqZXVuZXNzZSBldCBkZXMNCnNwb3J0cyBlbiByw6lwdWJsaXF1
ZSBDZW50cmFmcmljYWluZSBww6hyZSBkZSAzIGVuZmFudHMgZG9uYyAyIGdhcsOnb25zIHVuZSAg
DQpmaWxsZS4NCk5vdXMgc29tbWVzIGV4aWzDqXMuIEplIGRpc3Bvc2UgZCYjMzk7dW4gdHLDqHMg
Ym9uIGNhcGl0YWwgZXQgamUgY29tcHRlDQptJiMzOTtpbnN0YWxsZXIgZGFucyB2b3RyZQ0KcGF5
cyAgYXZlYyBtYSBwZXRpdGUgZmFtaWxsZSBhZmluIGQmIzM5O2ludmVzdGlyIGRhbnMgcGx1c2ll
dXJzIGRvbWFpbmVzDQpyZW50YWJsZSBldCBzdWlzIMOgIGxhIHJlY2hlcmNoZSBkJiMzOTt1biBi
b24NCnBhcnRlbmFpcmUgYWZpbiBkZSBzZSBsYW5jZXIgZGFucyBwbHVzaWV1cnMgaW52ZXN0aXNz
ZW1lbnQuDQpNZXJjaSBkZSB2b3RyZSBib25uZSBjb21wcsOpaGVuc2lvbiBlbiBhdHRlbnRlIGRl
IHZvdHJlIHLDqXBvbnNlLg0KU2kgdm91cyDDqnRlcyBpbnTDqXJlc3PDqSBkb25uZXotbW9pIHZv
cyBjb29yZG9ubsOpZXMgcXVpIHNvbnQgbGVzIHN1aXZhbnRzOg0KMSAvIFZvdHJlIG51bcOpcm8g
ZGUgdMOpbMOpcGhvbmUgcG9ydGFibGUNCjIgLyBWb3RyZSBub20gZXQgcHLDqW5vbQ0KDQpFc3DD
qXJhbnQgZCYjMzk7YXR0ZW5kcmUgcGx1cyB0w7R0IGRlIHZvdXMNCkNvcmRpYWxlbWVudC4NCk1y
IEFiZG91bGF5ZSBIaXNzZW5lDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCg0KSGVsbG8sDQpteSBuYW1lIGlzIE1yIEFiZG91
bGF5ZSBIaXNzZW5lIGV4IG1pbmlzdGVyIG9mIHlvdXRoIGFuZCBzcG9ydHMgaW4gdGhlICANCnJl
cHVibGljDQpDZW50cmFsIEFmcmljYW4gZmF0aGVyIG9mIDMgY2hpbGRyZW4gdGhlcmVmb3JlIDIg
Ym95cyBhIGdpcmwuIFdlIGFyZSBleGlsZWQuDQpJIGhhdmUgY2FwaXRhbCBhbmQgSSBpbnRlbmQg
dG8gc2V0dGxlIGluIHlvdXIgY291bnRyeSB3aXRoIG15IHNtYWxsDQpmYW1pbHkgaW4gb3JkZXIg
dG8gaW52ZXN0IGluIHNldmVyYWwgcHJvZml0YWJsZSBmaWVsZHMgYW5kIGFtIGxvb2tpbmcNCmZv
ciBhIGdvb2QgcGFydG5lciBpbiBvcmRlciB0byBlbWJhcmsgb24NCnNldmVyYWwgaW52ZXN0bWVu
dC4gVGhhbmsgeW91IGZvciB5b3VyIHVuZGVyc3RhbmRpbmcsIGF3YWl0aW5nIHlvdXIgIA0KcmVz
cG9uc2UuDQpJZiB5b3UgYXJlIGludGVyZXN0ZWQgZ2l2ZSBtZSB5b3VyIGNvbnRhY3QgZGV0YWls
cyB3aGljaCBhcmUgYXMgZm9sbG93czoNCjEgLyBZb3VyIG1vYmlsZSBwaG9uZSBudW1iZXINCjIg
LyBZb3VyIGZpcnN0IGFuZCBsYXN0IG5hbWUNCg0KSG9waW5nIHRvIHdhaXQgc29vbmVyIGZyb20g
eW91DQpDb3JkaWFsbHkuDQpNciBBYmRvdWxheWUgSGlzc2VuZQ0KDQpHb29nbGXCoEZvcm1zIHZv
dXMgcGVybWV0IGRlIGNyw6llciBkZXMgZW5xdcOqdGVzIGV0IGQnZW4gYW5hbHlzZXIgbGVzICAN
CnLDqXN1bHRhdHMuDQo=
