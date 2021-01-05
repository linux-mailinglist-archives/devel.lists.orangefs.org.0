Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAE82EAF93
	for <lists+devel-orangefs@lfdr.de>; Tue,  5 Jan 2021 17:05:09 +0100 (CET)
Received: from [::1] (port=41468 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1kwopT-0007xe-HR
	for lists+devel-orangefs@lfdr.de; Tue, 05 Jan 2021 11:05:03 -0500
Received: from mailout04.yourhostingaccount.com ([65.254.254.66]:36049
 helo=walmailout04.yourhostingaccount.com)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from
 <SRS0=5jf79/=GI=a3cube-inc.com=federico@yourhostingaccount.com>)
 id 1kwopR-0007xE-GJ
 for devel@lists.orangefs.org; Tue, 05 Jan 2021 11:05:01 -0500
Received: from mailscan04.yourhostingaccount.com ([10.1.15.4]
 helo=walmailscan04.yourhostingaccount.com)
 by walmailout04.yourhostingaccount.com with esmtp (Exim)
 id 1kwoom-0006Xy-Ut
 for devel@lists.orangefs.org; Tue, 05 Jan 2021 11:04:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=a3cube-inc.com; s=dkim; h=Sender:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:To:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ATJgR6kXDeQeNFt9m2llDCgBuRTFKi1WaolPnFHK/4Y=; b=1mxInzr+qo6m2DOaAFdXRqTUez
 6utJcHOpSmoXvbQWmwMBF+9pkv8r4+aT13Ny70qteXXoKGPclZt7rNvPd2WMpTnyZDjieBHc8V4sY
 QgcHbWPcWf0LsLRHWT0ynz8+KrKjJP839YejRTt2TGejKVecNmP2zZQwFoiAJGkxjpjJ6oHCbT9NS
 bE9xlI4jvEhK6ys8LgECBn+xBqvcrOC/wk3t71RmpPUMboghAFy6+nMHhM2tzRicOOD6e7jRhYj5M
 6tAPqJJBcPsPPffMtU14y2rqSvjGYTc3+R3Ww2OiYvxD26xc3fhzB0PNlM+cExVw3EHexFOpCfMNe
 A3t23GIA==;
Received: from [10.114.3.22] (helo=walimpout02)
 by walmailscan04.yourhostingaccount.com with esmtp (Exim)
 id 1kwoom-0005Oo-N4
 for devel@lists.orangefs.org; Tue, 05 Jan 2021 11:04:20 -0500
Received: from walauthsmtp58.yourhostingaccount.com ([10.1.18.58])
 by walimpout02 with 
 id D44H2400G1FATLi0144LrZ; Tue, 05 Jan 2021 11:04:20 -0500
X-Authority-Analysis: v=2.3 cv=BvkGPbf5 c=1 sm=1 tr=0
 a=mQqFl7BC3sBhAACsXUcyHA==:117 a=wwTng74EcZ0buN1tViw3lg==:17
 a=IkcTkHD0fZMA:10 a=EmqxpYm9HcoA:10 a=ddCU1J1SIDsA:10 a=mV9VRH-2AAAA:8
 a=lOuxqPblUzKIRfRDcS8A:9 a=QEXdDO2ut3YA:10
Received: from 195-72-210-229-static.intercom.it ([195.72.210.229]:38288
 helo=[192.168.1.147])
 by walauthsmtp58.yourhostingaccount.com with esmtpa (Exim)
 id 1kwooj-0008PF-Cg
 for devel@lists.orangefs.org; Tue, 05 Jan 2021 11:04:17 -0500
To: devel@lists.orangefs.org
From: Federico Strati <federico@a3cube-inc.com>
Subject: failing jni compilation on CentOS 8.2/8.2 with latest packages
Message-ID: <ad65f828-e8ac-a0fb-28b5-eab83d916313@a3cube-inc.com>
Date: Tue, 5 Jan 2021 17:04:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EN-UserInfo: 5e98131c36d934fff30f0e78511f000a:931c98230c6409dcc37fa7e93b490c27
X-EN-AuthUser: federico@a3cube-inc.com
X-EN-OrigIP: 195.72.210.229
X-EN-OrigHost: 195-72-210-229-static.intercom.it
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

Hello,

I got this error from the jni compilation:

-----------------------------------

JAVA_HOME="/usr/lib/jvm/java-15-openjdk-15.0.1.9-2.rolling.el8.x86_64-fastdebug" 
mvn -f src/client/jni/pom.xml clean install
[INFO] Scanning for projects...
[INFO]
[INFO] ------------------< org.orangefs.usrint:orangefs-jni 
 >------------------
[INFO] Building orangefs-jni 2.9.7
[INFO] --------------------------------[ jar 
]---------------------------------
[INFO]
[INFO] --- maven-clean-plugin:2.5:clean (default-clean) @ orangefs-jni ---
[INFO] Deleting /root/orangefs-v.2.9.8.tar/src/client/jni/target
[INFO]
[INFO] --- maven-resources-plugin:2.6:resources (default-resources) @ 
orangefs-jni ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] skip non existing resourceDirectory 
/root/orangefs-v.2.9.8.tar/src/client/jni/src/main/resources
[INFO]
[INFO] --- maven-compiler-plugin:3.1:compile (default-compile) @ 
orangefs-jni ---
[INFO] Changes detected - recompiling the module!
[INFO] Compiling 14 source files to 
/root/orangefs-v.2.9.8.tar/src/client/jni/target/classes
[INFO] -------------------------------------------------------------
[ERROR] COMPILATION ERROR :
[INFO] -------------------------------------------------------------
[ERROR] Source option 5 is no longer supported. Use 7 or later.
[ERROR] Target option 5 is no longer supported. Use 7 or later.
[INFO] 2 errors
[INFO] -------------------------------------------------------------
[INFO] 
------------------------------------------------------------------------
[INFO] BUILD FAILURE
[INFO] 
------------------------------------------------------------------------
[INFO] Total time: 2.547 s
[INFO] Finished at: 2021-01-05T16:38:53+01:00
[INFO] 
------------------------------------------------------------------------
[ERROR] Failed to execute goal 
org.apache.maven.plugins:maven-compiler-plugin:3.1:compile 
(default-compile) on project orangefs-jni: Compilation failure: 
Compilation failure:
[ERROR] Source option 5 is no longer supported. Use 7 or later.
[ERROR] Target option 5 is no longer supported. Use 7 or later.
[ERROR] -> [Help 1]
[ERROR]
[ERROR] To see the full stack trace of the errors, re-run Maven with the 
-e switch.
[ERROR] Re-run Maven using the -X switch to enable full debug logging.
[ERROR]
[ERROR] For more information about the errors and possible solutions, 
please read the following articles:
[ERROR] [Help 1] 
http://cwiki.apache.org/confluence/display/MAVEN/MojoFailureException
make: Nothing to be done for 'all'.
-----------------------------------

for java I use the latest packages from CentOS 8.2:

dnf install java-latest-openjdk.x86_64

dnf install java-latest-openjdk-devel-fastdebug.x86_64

dnf install maven

Any idea on the error cause ?

Thanks in advance

Federico


