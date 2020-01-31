Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 900D314F031
	for <lists+devel-orangefs@lfdr.de>; Fri, 31 Jan 2020 16:54:21 +0100 (CET)
Received: from [::1] (port=35628 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1ixYce-0006Xg-Nk
	for lists+devel-orangefs@lfdr.de; Fri, 31 Jan 2020 10:54:20 -0500
Received: from relay.sw.ru ([185.231.240.75]:48222)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <vvs@virtuozzo.com>) id 1ixYcd-0006XO-9Z
 for devel@lists.orangefs.org; Fri, 31 Jan 2020 10:54:19 -0500
Received: from vvs-ws.sw.ru ([172.16.24.21])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vvs@virtuozzo.com>)
 id 1ixYbt-0002v0-3l; Fri, 31 Jan 2020 18:53:33 +0300
Subject: Re: [PATCH 1/1] help_next should increase position index
To: Mike Marshall <hubcap@omnibond.com>
References: <33c86368-72e9-955c-2601-467f17a12ec2@virtuozzo.com>
 <CAOg9mSTjKBOGbb0k-SRnFZBUcj10UpOX1Z1tvUxsYGfxbDOZGw@mail.gmail.com>
From: Vasily Averin <vvs@virtuozzo.com>
Message-ID: <ff491a1a-3fe7-9aa0-661e-5549edfb2fba@virtuozzo.com>
Date: Fri, 31 Jan 2020 18:53:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAOg9mSTjKBOGbb0k-SRnFZBUcj10UpOX1Z1tvUxsYGfxbDOZGw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: devel@lists.orangefs.org
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

On 1/31/20 5:59 PM, Mike Marshall wrote:
> Hello Vasily...
> 
> I have applied your patch to Linux 5.5 and tested that it
> fixes the problem that your script demonstrates. Thanks
> for the fix!
> 
> The Linux merge window is open, are you going to submit
> this patch, or should I?

Thank you, please do it

> On Fri, Jan 24, 2020 at 1:10 AM Vasily Averin <vvs@virtuozzo.com> wrote:
>>
>> if seq_file .next fuction does not change position index,
>> read after some lseek can generate unexpected output.
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=206283
>> Signed-off-by: Vasily Averin <vvs@virtuozzo.com>
>> ---
>>  fs/orangefs/orangefs-debugfs.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugfs.c
>> index 25543a9..29eaa45 100644
>> --- a/fs/orangefs/orangefs-debugfs.c
>> +++ b/fs/orangefs/orangefs-debugfs.c
>> @@ -273,6 +273,7 @@ static void *help_start(struct seq_file *m, loff_t *pos)
>>
>>  static void *help_next(struct seq_file *m, void *v, loff_t *pos)
>>  {
>> +       (*pos)++;
>>         gossip_debug(GOSSIP_DEBUGFS_DEBUG, "help_next: start\n");
>>
>>         return NULL;
>> --
>> 1.8.3.1
>>

