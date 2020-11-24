Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A302C2310
	for <lists+devel-orangefs@lfdr.de>; Tue, 24 Nov 2020 11:37:00 +0100 (CET)
Received: from [::1] (port=49192 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1khVgw-0006uy-RM
	for lists+devel-orangefs@lfdr.de; Tue, 24 Nov 2020 05:36:58 -0500
Received: from mail-vk1-f199.google.com ([209.85.221.199]:49129)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from
 <3G-K8XwsJBdY5GJ2L9Q823Q8E2AD.4GE56N6DDAKLK.GJ2F867K.GJ8@trix.bounces.google.com>)
 id 1khVgv-0006t9-DL
 for devel@lists.orangefs.org; Tue, 24 Nov 2020 05:36:57 -0500
Received: by mail-vk1-f199.google.com with SMTP id j129so9241370vkb.15
 for <devel@lists.orangefs.org>; Tue, 24 Nov 2020 02:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:message-id:date:subject:from:to;
 bh=bt9vG9vsKYVn8QWVZbVjA7WQCW+GZsyeDnWpCSdK7V8=;
 b=u2ltpxxZpNb5QxGypNu5YdKNPVODRA42+8eTsbYaFnEm6pufEvE/cbr7PuF3sgT2Tl
 UDEUnBqvhfbntW/vRMjTFw5yoRmY15DMv10kK3CYiAJ+oh/MvY1dtbOIt8Eh8IuQKj/6
 3IltnixMFmeYsr+EYPQQZ2plDtrNHIwYbWbo1V/zjtUjuGwuPsP0HL34rCjUO/g3XrEF
 tEoDqr0GNWROAl9LApRXgKrrPWjcLpmlwDTG+7O1ZT2JRy1jl3r3YaI+Hp3xGKDSxyMS
 lAkC8jDM4N5d+ZXJN8tZzmPwryHNJD1Q18IdWakAslbRj9BCIYzxJOFkQYRU3eUui5ZJ
 xfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:message-id:date:subject
 :from:to;
 bh=bt9vG9vsKYVn8QWVZbVjA7WQCW+GZsyeDnWpCSdK7V8=;
 b=qADkWA0XeUl5HhRvY01eYpZlLYsHEwwONt+ycCwFHTJRzxfhKnqwn7K6uE3jtW4MMY
 aC6B3agg13Mps8DpPcUPMfYmgHoidjxUAHzaUmM9TlWq1GscwYuwIA6zCJytZVcENakm
 jS79Dqst4+aSsAEP1IRgZPAtUBjJHkMLmAOiOEBRcepazX3qHVZYNe9aub+MeNX3Ri09
 TncFVN0uF+xlGcz9arJ+DAXWB1/2uk3kJwM+NaSMU+NXoctArVnGxbETMEGIG/MOXeBJ
 fJ+IZSboIxl8oVyR/qWhdzTfZEV72G9VkMd10yEfFoDarM+o0yd692cVCLk+3IO0uATh
 czrw==
X-Gm-Message-State: AOAM532w81ibBLVwupxy7E1B/5FHteMP2HiqX5OqVOOWRZEMUuCbp9CF
 DZn7uETLQ/OHfJ+c+4p0cPV0ALncdUziMCopcx0Y
MIME-Version: 1.0
X-Received: by 2002:a1f:2ad0:: with SMTP id q199mt3226582vkq.20.1606214171007; 
 Tue, 24 Nov 2020 02:36:11 -0800 (PST)
X-No-Auto-Attachment: 1
Message-ID: <00000000000018e26805b4d7e19c@google.com>
Date: Tue, 24 Nov 2020 10:36:16 +0000
Subject: May I humbly solicit your confidence in this transaction,
From: dorathygaby@gmail.com
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
Reply-To: dorathygaby@gmail.com
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
bHRlesKgOg0KaHR0cHM6Ly9kb2NzLmdvb2dsZS5jb20vZm9ybXMvZC9lLzFGQUlwUUxTZGtQYVZM
UnFDOHVpTXJRS0t4dkpUYVRiS09DYnlaN2VoODVhbXY2Sm5yZ1E5Z2J3L3ZpZXdmb3JtP3ZjPTAm
YW1wO2M9MCZhbXA7dz0xJmFtcDtmbHI9MCZhbXA7dXNwPW1haWxfZm9ybV9saW5rDQoNCg0KDQoN
CiBGcm9tIE1ycy4gRG9yYXRoeSBHYWJ5DQpBYmlkamFuLSBDb3RlIEQmIzM5O0l2b2lyZQ0KDQpN
YXkgSSBodW1ibHkgc29saWNpdCB5b3VyIGNvbmZpZGVuY2UgaW4gdGhpcyB0cmFuc2FjdGlvbiwg
YXMgYmVpbmcgdXR0ZXJseQ0KY29uZmlkZW50aWFsIGFuZCB0b3Agc2VjcmV0LiBCdXQgSSBhbSBh
c3N1cmluZyB5b3UgdGhhdCB5b3Ugc2hhbGwgYmUgdmVyeQ0KaGFwcHkgYXQgdGhlIGVuZCBvZiB0
aGUgZGF5LiBJIGRlY2lkZWQgdG8gY29udGFjdCB5b3UgZHVlIHRvIHRoZSB1cmdlbmN5IG9mDQp0
aGlzIHRyYW5zYWN0aW9uLCBhcyBJIHdpc2ggdG8gcmVwb3NlIG15IHRydXN0IGFuZCBjb25maWRl
bmNlIG9uIHlvdXINCmRpc2NyZXRlbmVzcyBhbmQgYWJpbGl0eSBpbiB0cmFuc2FjdGlvbiBvZiB0
aGlzIG5hdHVyZS4gTGV0IG1lIHN0YXJ0IGJ5DQppbnRyb2R1Y2luZyBteSBzZWxmIHByb3Blcmx5
IHRvIHlvdSwgbXkgbmFtZSBpcyBNcnMuIERvcmF0aHkgR2FieSwgSSBhbQ0KdGhlIHJlZ2lvbmFs
IEJhbmsgTWFuYWdlciBvZiBCT0EgQmFuayBBYmlkamFuLUNvdGUgRCYjMzk7IEl2b2lyZS4gSSBj
YW1lIHRvDQprbm93IGFib3V0IHlvdSBpbiBteSBQcml2YXRlIFNlYXJjaCBmb3IgYSByZWxpYWJs
ZSBhbmQgcmVwdXRhYmxlIGZvcmVpZ25lcg0KdG8gaGFuZGxlIHRoaXMgQ29uZmlkZW50aWFsIFRy
YW5zYWN0aW9uLg0KDQpBcyB0aGUgcmVnaW9uYWwgQmFuayBNYW5hZ2VyIG9mIEJPQSBCQU5LOyBp
dCBpcyBteSBkdXR5IHRvIHNlbmQgYSBmaW5hbmNpYWwNCnJlcG9ydCB0byBteSBoZWFkIG9mZmlj
ZSBhdCB0aGUgZW5kIG9mIGVhY2ggeWVhci4gT24gdGhlIGNvdXJzZSBvZiB0aGUgMjAxMg0KeWVh
ciByZXBvcnQsIFdlIGRpc2NvdmVyZWQgYW4gZXhjZXNzIHByb2ZpdCBvZiBGaWZ0ZWVuIE1pbGxp
b24gVXMgRG9sbGFycyAsDQpbICQgMTUsMDAwLDAwMC4wMCBdIHdoaWNoIHdlIGhhdmUga2VwdCBp
biBTVVNQRU5TRSBBQ0NPVU5UIHdpdGhvdXQgYW55DQpiZW5lZmljaWFyeS4NCg0KQXMgYW4gb2Zm
aWNlciBvZiB0aGUgYmFuayBJIGNhbiBub3QgYmUgZGlyZWN0bHkgY29ubmVjdGVkIHRvIHRoaXMg
RnVuZCBmb3INClNlY3VyaXR5IFJlYXNvbnMsIHRoYXQgaXMgd2h5IEkgYW0gY29udGFjdGluZyB5
b3UgZm9yIHVzIHRvIHdvcmsgdG9nZXRoZXINCnRvIGdldCB0aGUgc2FpZCBGdW5kIGludG8geW91
ciBiYW5rIGFjY291bnQgZm9yIElOVkVTVE1FTlQgaW4geW91ciBDb3VudHJ5Lg0KDQpUaGUgcGVy
Y2VudGFnZSBSYXRpbyBpcyB0aHVzOiA0MCUgZm9yIHlvdSAsIDYwICUgZm9yIG1lIGFuZCBteSBj
b2xsZWFndWVzIC4NCg0KTm90ZTogVGhlcmUgYXJlIHByYWN0aWNhbGx5IG5vIHJpc2tzIGludm9s
dmVkIGluIHRoaXMgdHJhbnNhY3Rpb24gYXMgaXQgaXMNCjEwMCUgcmlzayBmcmVlIGFuZCB3aWxs
IGJlIGxlZ2FsbHkgYm9uZGVkLCBpdCB3aWxsIGJlIGJhbmsgdG8gYmFuaw0KdHJhbnNmZXIsIGFs
bCBJIG5lZWQgZnJvbSB5b3UgaXMgdG8gc3RhbmQgYXMgdGhlIG5leHQgb2Yga2luIC8gQmVuZWZp
Y2lhcnkNCnRvIHRoZSBvcmlnaW5hbCBkZXBvc2l0b3Igb2YgdGhpcyBmdW5kIHdobyBtYWRlIHRo
ZSBkZXBvc2l0IHdpdGggS3VtYXNpDQpicmFuY2ggc28gdGhhdCBteSBIZWFkIG9mZmljZSBjYW4g
b3JkZXIgdGhlIHRyYW5zZmVyIHRvIHlvdXIgZGVzaWduYXRlZA0KYmFuayBhY2NvdW50LiBJZiB5
b3UgYWNjZXB0IHRoaXMgb2ZmZXIgdG8gd29yayB3aXRoIG1lLCBpZiB5b3UgZmluZCB0aGlzDQpw
cm9wb3NhbCBzdWl0YWJsZSBmb3IgeW91LCBraW5kbHkgcmVwbHkgZm9yIGZ1bGwgZGV0YWlscyBW
aWEgZW1haWw6DQoNCmRvcmF0aHlnYWJ5M0B5YWhvby5jby5qcCwNCg0KSSB3aWxsIGFwcHJlY2lh
dGUgaXQgdmVyeSBtdWNoLCBJZiB0aGlzIHByb3Bvc2FsIGlzIGFjY2VwdGFibGUgYnkgeW91LCBk
bw0Kbm90IG1ha2UgdW5kdWUgYWR2YW50YWdlIG9mIHRoZSB0cnVzdCBJIGhhdmUgYmVzdG93ZWQg
b24geW91LCBhbmQgSSBhc3N1cmUNCnlvdSB0aGF0IHdlIHNoYWxsIGFjaGlldmUgaXQgc3VjY2Vz
c2Z1bGx5Lg0KDQpCZXN0IHJlZ2FyZHMsDQpNcnMuIERvcmF0aHkgR2FieS4NCg0KR29vZ2xlwqBG
b3JtcyB2b3VzIHBlcm1ldCBkZSBjcsOpZXIgZGVzIGVucXXDqnRlcyBldCBkJ2VuIGFuYWx5c2Vy
IGxlcyAgDQpyw6lzdWx0YXRzLg0K
