Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCE925356
	for <lists+devel-orangefs@lfdr.de>; Tue, 21 May 2019 17:02:48 +0200 (CEST)
Received: from [::1] (port=50870 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.91)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1hT6Hv-0006Ow-9W
	for lists+devel-orangefs@lfdr.de; Tue, 21 May 2019 11:02:47 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:48104)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.91) (envelope-from <dan.carpenter@oracle.com>)
 id 1hT6Hu-0006OP-5l
 for devel@lists.orangefs.org; Tue, 21 May 2019 11:02:46 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4LF1m6I087549;
 Tue, 21 May 2019 15:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=vcLtAHq/nTW9Yr4n2tyGyq7/C1yAHMDyYIV67B4ge5M=;
 b=mP1boTbkaPg4Pg7WpNzllBau8SVyylI+z1Sty74BQMcfqMJnPdjAR2zGLYIUSYwFjM2T
 j02fQdhsgK5LtR4W9C0IhqLjELJ4z7h9V0kiM4SPWZhftu3azQccgMeFjgxy0l1kd5k4
 XOL8BMmaAcn4ncy2CvJsQfWzOm4po+HedslB8xd0KI7z8Xvd1DGnfvuXA585wcryzGCE
 ttgdp7K5mdO4rqglDH27XerVDuCij+HuAACzjmSTglGTccgRvOSc7rgRq/EAsmsJ0sDs
 Oyvdhr/BysiM/cZmjwCSVttoYIMEPkLQ/hFKU54lqvPuruM8GASLslXzrvUMbwBw5vGf kw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2sj9fte2gp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 May 2019 15:02:02 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4LF1UbY077208;
 Tue, 21 May 2019 15:02:01 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2sks1y8j2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 May 2019 15:02:01 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4LF20Fm002830;
 Tue, 21 May 2019 15:02:00 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 21 May 2019 15:01:59 +0000
Date: Tue, 21 May 2019 18:01:52 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] orangefs: remove redundant assignment to variable
 buffer_index
Message-ID: <20190521150152.GK31203@kadam>
References: <20190511132700.4862-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190511132700.4862-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9263
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905210094
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9264
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905210094
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 devel@lists.orangefs.org
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

On Sat, May 11, 2019 at 02:27:00PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable buffer_index is being initialized however this is never
> read and later it is being reassigned to a new value. The initialization
> is redundant and hence can be removed.
> 
> Addresses-Coverity: ("Unused Value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/orangefs/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/orangefs/file.c b/fs/orangefs/file.c
> index a35c17017210..80f06ee794c5 100644
> --- a/fs/orangefs/file.c
> +++ b/fs/orangefs/file.c
> @@ -52,7 +52,7 @@ ssize_t wait_for_direct_io(enum ORANGEFS_io_type type, struct inode *inode,
>  	struct orangefs_inode_s *orangefs_inode = ORANGEFS_I(inode);
>  	struct orangefs_khandle *handle = &orangefs_inode->refn.khandle;
>  	struct orangefs_kernel_op_s *new_op = NULL;
> -	int buffer_index = -1;
> +	int buffer_index;
>  	ssize_t ret;
>  	size_t copy_amount;
>  

There is a second pointless assignment at the end of the function as
well:

   247  
   248          ret = new_op->downcall.resp.io.amt_complete;
   249  
   250  out:
   251          if (buffer_index >= 0) {
   252                  if ((readahead_size) && (type == ORANGEFS_IO_READ)) {
   253                          /* readpage */
   254                          *index_return = buffer_index;
   255                          gossip_debug(GOSSIP_FILE_DEBUG,
   256                                  "%s: hold on to buffer_index :%d:\n",
   257                                  __func__, buffer_index);
   258                  } else {
   259                          /* O_DIRECT */
   260                          orangefs_bufmap_put(buffer_index);
   261                          gossip_debug(GOSSIP_FILE_DEBUG,
   262                                  "%s(%pU): PUT buffer_index %d\n",
   263                                  __func__, handle, buffer_index);
   264                  }
   265                  buffer_index = -1;
                        ^^^^^^^^^^^^^^^^^

   266          }
   267          op_release(new_op);
   268          return ret;
   269  }

You often send these patches before they hit linux-next so I had skipped
reviewing this one when you sent it.  I'm coming back to work today
after the flu so I was going through my inbox reviewing old unread
messages...

regards,
dan carpenter

