Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFD51C0E44
	for <lists+devel-orangefs@lfdr.de>; Fri,  1 May 2020 08:38:46 +0200 (CEST)
Received: from [::1] (port=40576 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1jUPJt-0000Z0-OL
	for lists+devel-orangefs@lfdr.de; Fri, 01 May 2020 02:38:45 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26866)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <riteshh@linux.ibm.com>)
 id 1jUPJr-0000YQ-Pm
 for devel@lists.orangefs.org; Fri, 01 May 2020 02:38:43 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0416XqW9160045; Fri, 1 May 2020 02:37:54 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30r821rte6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 May 2020 02:37:54 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0416WEqt015322;
 Fri, 1 May 2020 06:37:52 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 30mcu7y8ur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 May 2020 06:37:51 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0416afcx65929600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 May 2020 06:36:41 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BACEFAE045;
 Fri,  1 May 2020 06:37:49 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8FD8AE04D;
 Fri,  1 May 2020 06:37:47 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.81.13])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  1 May 2020 06:37:47 +0000 (GMT)
Subject: Re: [RESEND PATCH 0/1] Use inode_lock/unlock class of provided APIs
 in filesystems
To: Al Viro <viro@zeniv.linux.org.uk>
References: <20200101105248.25304-1-riteshh@linux.ibm.com>
 <20200501043741.GK23230@ZenIV.linux.org.uk>
From: Ritesh Harjani <riteshh@linux.ibm.com>
Date: Fri, 1 May 2020 12:07:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200501043741.GK23230@ZenIV.linux.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Message-Id: <20200501063747.D8FD8AE04D@d06av26.portsmouth.uk.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-01_01:2020-04-30,
 2020-05-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011
 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=748 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005010044
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
Cc: linux-nfs@vger.kernel.org, jlayton@kernel.org,
 linux-unionfs@vger.kernel.org, willy@infradead.org, dsterba@suse.cz,
 devel@lists.orangefs.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-btrfs@vger.kernel.org
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



On 5/1/20 10:07 AM, Al Viro wrote:
> On Wed, Jan 01, 2020 at 04:22:47PM +0530, Ritesh Harjani wrote:
>> Al, any comments?
>> Resending this after adding Reviewed-by/Acked-by tags.
> 
> .... argh.  My apologies - that got fallen through the cracks.
> Could you rebase and resend it?
> 
Np.
Sure, will rebase and resend.

-ritesh


