Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B3F7FE4A
	for <lists+devel-orangefs@lfdr.de>; Fri,  2 Aug 2019 18:10:32 +0200 (CEST)
Received: from [::1] (port=45848 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hta8W-0008Tr-2R
	for lists+devel-orangefs@lfdr.de; Fri, 02 Aug 2019 12:10:32 -0400
Received: from mga18.intel.com ([134.134.136.126]:31583)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <ira.weiny@intel.com>) id 1hta8U-0008Ny-Gb
 for devel@lists.orangefs.org; Fri, 02 Aug 2019 12:10:30 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2019 09:09:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,338,1559545200"; d="scan'208";a="372996055"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga006.fm.intel.com with ESMTP; 02 Aug 2019 09:09:47 -0700
Received: from fmsmsx122.amr.corp.intel.com (10.18.125.37) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 2 Aug 2019 09:09:48 -0700
Received: from crsmsx103.amr.corp.intel.com (172.18.63.31) by
 fmsmsx122.amr.corp.intel.com (10.18.125.37) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 2 Aug 2019 09:09:47 -0700
Received: from crsmsx101.amr.corp.intel.com ([169.254.1.115]) by
 CRSMSX103.amr.corp.intel.com ([169.254.4.51]) with mapi id 14.03.0439.000;
 Fri, 2 Aug 2019 10:09:45 -0600
From: "Weiny, Ira" <ira.weiny@intel.com>
To: Juergen Gross <jgross@suse.com>, John Hubbard <jhubbard@nvidia.com>,
 "john.hubbard@gmail.com" <john.hubbard@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: RE: [PATCH 20/34] xen: convert put_page() to put_user_page*()
Thread-Topic: [PATCH 20/34] xen: convert put_page() to put_user_page*()
Thread-Index: AQHVSNjlYWPmavKIo0aaO/eIo60VTqbnqrGAgAAT84CAAAYcgIAAQruQ
Date: Fri, 2 Aug 2019 16:09:44 +0000
Message-ID: <2807E5FD2F6FDA4886F6618EAC48510E79E66216@CRSMSX101.amr.corp.intel.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-21-jhubbard@nvidia.com>
 <4471e9dc-a315-42c1-0c3c-55ba4eeeb106@suse.com>
 <d5140833-e9ee-beb5-ff0a-2d13a4fe819f@nvidia.com>
 <d4931311-db01-e8c3-0f8c-d64685dc2143@suse.com>
In-Reply-To: <d4931311-db01-e8c3-0f8c-d64685dc2143@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTRmN2E3MTYtMGM4Yi00ZWFmLTk2Y2YtNDU3NGNhMWI3OGZmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoicmZLd2FNcXRLU2Rkc2k3dFluUytKTjZ2XC9UUlFtczVETG53ZjA3V1hcL0FrcFBtWE5EdUh2U1dwRnZrV1dScDdtIn0=
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [172.18.205.10]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "Williams, Dan
 J" <dan.j.williams@intel.com>,
 "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "devel@lists.orangefs.org" <devel@lists.orangefs.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
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

PiANCj4gT24gMDIuMDguMTkgMDc6NDgsIEpvaG4gSHViYmFyZCB3cm90ZToNCj4gPiBPbiA4LzEv
MTkgOTozNiBQTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gPj4gT24gMDIuMDguMTkgMDQ6MTks
IGpvaG4uaHViYmFyZEBnbWFpbC5jb20gd3JvdGU6DQo+ID4+PiBGcm9tOiBKb2huIEh1YmJhcmQg
PGpodWJiYXJkQG52aWRpYS5jb20+DQo+ID4gLi4uDQo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy94ZW4vcHJpdmNtZC5jIGIvZHJpdmVycy94ZW4vcHJpdmNtZC5jIGluZGV4DQo+ID4+PiAyZjVj
ZTcyMzBhNDMuLjI5ZTQ2MWRiZWUyZCAxMDA2NDQNCj4gPj4+IC0tLSBhL2RyaXZlcnMveGVuL3By
aXZjbWQuYw0KPiA+Pj4gKysrIGIvZHJpdmVycy94ZW4vcHJpdmNtZC5jDQo+ID4+PiBAQCAtNjEx
LDE1ICs2MTEsMTAgQEAgc3RhdGljIGludCBsb2NrX3BhZ2VzKA0KPiA+Pj4gwqAgc3RhdGljIHZv
aWQgdW5sb2NrX3BhZ2VzKHN0cnVjdCBwYWdlICpwYWdlc1tdLCB1bnNpZ25lZCBpbnQNCj4gPj4+
IG5yX3BhZ2VzKQ0KPiA+Pj4gwqAgew0KPiA+Pj4gLcKgwqDCoCB1bnNpZ25lZCBpbnQgaTsNCj4g
Pj4+IC0NCj4gPj4+IMKgwqDCoMKgwqAgaWYgKCFwYWdlcykNCj4gPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm47DQo+ID4+PiAtwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBucl9wYWdlczsgaSsr
KSB7DQo+ID4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKHBhZ2VzW2ldKQ0KPiA+Pj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcHV0X3BhZ2UocGFnZXNbaV0pOw0KPiA+Pj4gLcKgwqDCoCB9DQo+ID4+
PiArwqDCoMKgIHB1dF91c2VyX3BhZ2VzKHBhZ2VzLCBucl9wYWdlcyk7DQo+ID4+DQo+ID4+IFlv
dSBhcmUgbm90IGhhbmRsaW5nIHRoZSBjYXNlIHdoZXJlIHBhZ2VzW2ldIGlzIE5VTEwgaGVyZS4g
T3IgYW0gSQ0KPiA+PiBtaXNzaW5nIGEgcGVuZGluZyBwYXRjaCB0byBwdXRfdXNlcl9wYWdlcygp
IGhlcmU/DQo+ID4+DQo+ID4NCj4gPiBIaSBKdWVyZ2VuLA0KPiA+DQo+ID4gWW91IGFyZSBjb3Jy
ZWN0LS10aGlzIG5vIGxvbmdlciBoYW5kbGVzIHRoZSBjYXNlcyB3aGVyZSBwYWdlc1tpXSBpcw0K
PiA+IE5VTEwuIEl0J3MgaW50ZW50aW9uYWwsIHRob3VnaCBwb3NzaWJseSB3cm9uZy4gOikNCj4g
Pg0KPiA+IEkgc2VlIHRoYXQgSSBzaG91bGQgaGF2ZSBhZGRlZCBteSBzdGFuZGFyZCBibHVyYiB0
byB0aGlzIGNvbW1pdA0KPiA+IGRlc2NyaXB0aW9uLiBJIG1pc3NlZCB0aGlzIG9uZSwgYnV0IHNv
bWUgb2YgdGhlIG90aGVyIHBhdGNoZXMgaGF2ZSBpdC4NCj4gPiBJdCBtYWtlcyB0aGUgZm9sbG93
aW5nLCBwb3NzaWJseSBpbmNvcnJlY3QgY2xhaW06DQo+ID4NCj4gPiAiVGhpcyBjaGFuZ2VzIHRo
ZSByZWxlYXNlIGNvZGUgc2xpZ2h0bHksIGJlY2F1c2UgZWFjaCBwYWdlIHNsb3QgaW4gdGhlDQo+
ID4gcGFnZV9saXN0W10gYXJyYXkgaXMgbm8gbG9uZ2VyIGNoZWNrZWQgZm9yIE5VTEwuIEhvd2V2
ZXIsIHRoYXQgY2hlY2sNCj4gPiB3YXMgd3JvbmcgYW55d2F5LCBiZWNhdXNlIHRoZSBnZXRfdXNl
cl9wYWdlcygpIHBhdHRlcm4gb2YgdXNhZ2UgaGVyZQ0KPiA+IG5ldmVyIGFsbG93ZWQgZm9yIE5V
TEwgZW50cmllcyB3aXRoaW4gYSByYW5nZSBvZiBwaW5uZWQgcGFnZXMuIg0KPiA+DQo+ID4gVGhl
IHdheSBJJ3ZlIHNlZW4gdGhlc2UgcGFnZSBhcnJheXMgdXNlZCB3aXRoIGdldF91c2VyX3BhZ2Vz
KCksIHRoaW5ncw0KPiA+IGFyZSBlaXRoZXIgZG9uZSBzaW5nbGUgcGFnZSwgb3Igd2l0aCBhIGNv
bnRpZ3VvdXMgcmFuZ2UuIFNvIHVubGVzcyBJJ20NCj4gPiBtaXNzaW5nIGEgY2FzZSB3aGVyZSBz
b21lb25lIGlzIGVpdGhlcg0KPiA+DQo+ID4gYSkgcmVsZWFzaW5nIGluZGl2aWR1YWwgcGFnZXMg
d2l0aGluIGEgcmFuZ2UgKGFuZCB0aHVzIGxpa2VseSBtZXNzaW5nDQo+ID4gdXAgdGhlaXIgY291
bnQgb2YgcGFnZXMgdGhleSBoYXZlKSwgb3INCj4gPg0KPiA+IGIpIGFsbG9jYXRpbmcgdHdvIGd1
cCByYW5nZXMgd2l0aGluIHRoZSBzYW1lIHBhZ2VzW10gYXJyYXksIHdpdGggYSBnYXANCj4gPiBi
ZXR3ZWVuIHRoZSBhbGxvY2F0aW9ucywNCj4gPg0KPiA+IC4uLnRoZW4gaXQgc2hvdWxkIGJlIGNv
cnJlY3QuIElmIHNvLCB0aGVuIEknbGwgYWRkIHRoZSBhYm92ZSBibHVyYiB0bw0KPiA+IHRoaXMg
cGF0Y2gncyBjb21taXQgZGVzY3JpcHRpb24uDQo+ID4NCj4gPiBJZiB0aGF0J3Mgbm90IHRoZSBj
YXNlIChib3RoIGhlcmUsIGFuZCBpbiAzIG9yIDQgb3RoZXIgcGF0Y2hlcyBpbiB0aGlzDQo+ID4g
c2VyaWVzLCB0aGVuIGFzIHlvdSBzYWlkLCBJIHNob3VsZCBhZGQgTlVMTCBjaGVja3MgdG8gcHV0
X3VzZXJfcGFnZXMoKQ0KPiA+IGFuZCBwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCkuDQo+IA0K
PiBJbiB0aGlzIGNhc2UgaXQgaXMgbm90IGNvcnJlY3QsIGJ1dCBjYW4gZWFzaWx5IGJlIGhhbmRs
ZWQuIFRoZSBOVUxMIGNhc2UgY2FuDQo+IG9jY3VyIG9ubHkgaW4gYW4gZXJyb3IgY2FzZSB3aXRo
IHRoZSBwYWdlcyBhcnJheSBmaWxsZWQgcGFydGlhbGx5IG9yIG5vdCBhdCBhbGwuDQo+IA0KPiBJ
J2QgcHJlZmVyIHNvbWV0aGluZyBsaWtlIHRoZSBhdHRhY2hlZCBwYXRjaCBoZXJlLg0KDQpJJ20g
bm90IGFuIGV4cGVydCBpbiB0aGlzIGNvZGUgYW5kIGhhdmUgbm90IGxvb2tlZCBhdCBpdCBjYXJl
ZnVsbHkgYnV0IHRoYXQgcGF0Y2ggZG9lcyBzZWVtIHRvIGJlIHRoZSBiZXR0ZXIgZml4IHRoYW4g
Zm9yY2luZyBOVUxMIGNoZWNrcyBvbiBldmVyeW9uZS4NCg0KSXJhDQoNCg==

