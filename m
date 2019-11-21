Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 206301054C3
	for <lists+devel-orangefs@lfdr.de>; Thu, 21 Nov 2019 15:44:25 +0100 (CET)
Received: from [::1] (port=44658 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.92)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1iXnh1-000082-Tc
	for lists+devel-orangefs@lfdr.de; Thu, 21 Nov 2019 09:44:23 -0500
Received: from b2.em.tnds.info ([208.234.11.237]:36175)
 by mm1.emwd.com with esmtps (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <info@em.tnds.info>) id 1iXnh1-00007A-9N
 for devel@lists.orangefs.org; Thu, 21 Nov 2019 09:44:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=em.tnds.info;
 q=dns/txt; s=1573493771.tnds;
 bh=T+BYPAcQDs88vFGImgxhq6D/BWWMwl20z3aSrzIu4Ic=;
 h=from:reply-to:subject:date:message-id:to:mime-version:content-type:list-id:list-unsubscribe;
 b=uC7A6AcJE8OgXRxcxn498i/xZILVjSABYr6PHaaKhB35Pf9WpByR2dsjfC5KhssOsMfdPK4iL
 MP8BDVnZd0FiSJb9DNjUkhtMGUR7BmmChqjIZhwYNM2PDUn97UrkT9CkYxl7f71y3ssVAjKJM15
 xgaqIc8wyNwToHoeiMbwggc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b2.em.tnds.info;
 q=dns/txt; s=1573493771.tnds;
 bh=T+BYPAcQDs88vFGImgxhq6D/BWWMwl20z3aSrzIu4Ic=;
 h=from:reply-to:subject:date:message-id:to:mime-version:content-type:list-id:list-unsubscribe;
 b=C4z6HiDYjpNbc4tpJiqB8e5w37Vc50RdqwGH/4wPtff71RAU6S5G04/9vQW6FHI8hLkDZENUK
 K9r8XwxlkaAokWRQJbJu8k4Pc4+yKeRqQQTqo4YGYm0daZbQWv5GwgHZzh3Gg8IizO7ps1SWjDO
 0ZOl7xpjUjF6cRf73zWNOzQ=
Received: from [127.0.0.1] ([127.0.0.1] localhost) (Authenticated sender: tnds)
 by b2.em.tnds.info (em.tnds.info) with ESMTPA id 16e8e6b14cd003fb61.001
 for <devel@lists.orangefs.org>; Thu, 21 Nov 2019 14:43:32 +0000
X-Zone-Loop: 39409bfa9edb4f0f6a345b9cb20919200cefe88b3a78
X-FBL: bJzrm6JDq.cL0X5LLQX.tpnvJobREN
X-Msys-Api: {"campaign_id":"bJzrm6JDq.cL0X5LLQX.tpnvJobREN"}
X-SMTPAPI: {"unique_args":{"campaign_id":"bJzrm6JDq.cL0X5LLQX.tpnvJobREN"}}
X-Mailgun-Variables: {"campaign_id":"bJzrm6JDq.cL0X5LLQX.tpnvJobREN"}
From: Todd Earingdaile <info@em.tnds.info>
To: devel@lists.orangefs.org
Subject: how to keep visitors on your website?
Message-ID: <c6c21bb4-315a-e80d-4352-17a56054c99c@em.tnds.info>
X-Mailer: EM TNDS (+https://em.tnds.info/)
Date: Thu, 21 Nov 2019 14:43:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Reply-To: info@em.tnds.info
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

how to keep visitors on your website?

Do visitors who come to your website stay there or move on quickly?  In =
other words, does your website catch the attention of your visitors?  If =
not, you are spinning your virtual wheels. Let=E2=80=99s get right to the =
point. Most websites have bounce rates as high as 85% or in other words, =
visitors come to the site and abandon it immediately. Why? Because the =
website has not been custom designed to attract and retain the specific =
audience for which it was intended. Many websites are template based or a =
one size fits all approach. Are they cheap? Yes. Are they effective? No. =
These simple tips will help you improve your visitor retention and keep =
them on your site longer and keep them coming back. The key just like a =
good clothing fit, a custom built house, or that special gift is =
customization.=20


1.	Put the Bottom Line Up Front.

You would be surprised at the number of sites that simply don=E2=80=99t =
tell a visitor what the purpose of the site is or why they need the =
information, product or service that it offers. Your website should help =
them find what they need clearly and quickly. Here are some questions you =
may want to consider: How is the website relevant to the visitor? What does=
 it offer that the visitor needs? If visitors cannot comprehend what you do=
 and how it will benefit them they will be gone in the blink of an eye. =
They visit your website for a reason. Many times that =
=E2=80=9Creason=E2=80=9D is the search term they may use in a search engine=
. A great place to look up popular search terms is on Google Trends =
https://trends.google.com/trends/?geo=3DUS . You may use a popular search =
term that matches your website=E2=80=99s purpose then customize it as your =
tagline or slogan. The Bottom Line Up Front is your customized message that=
 differentiates you. If you do it effectively it becomes your brand. So for=
 example Nike =3D Shoes=E2=80=A6Just do it. If you look at Google Trends =
search volume you can see that one equals the other when comparing the =
popularity of the search terms.=20

2.	Keep Your Website=E2=80=99s Promises.=20

Nothing is more disappointing to a visitor to arrive at a website just to =
be let down by the experience. Yes, this means managing expectations, or =
under promise and over perform. It is like going to a restaurant with a big=
, fancy neon sign with stylish architecture only to discover that the menu =
is lacking and the food is terrible. So don=E2=80=99t make promises that =
you cannot or will not keep. Your site reviews and SEO will suffer. Instead=
, grab their attention and don=E2=80=99t let go. In almost all cases it is =
better to show and tell. To say a picture is worth a thousand words sounds =
like a clich=C3=A9 but it is oh so true. Custom photos, messages and videos=
 are superb for establishing rapport with your visitors. So make sure your =
site is clean, professional and reputable. You can include positive reviews=
 and testimonials where it is appropriate. Invest in a good website when =
your budget allows. If you skimp on your website design, photography and =
videos you will pay the price. In fact, many of your visitors would rather =
watch an engaging video rather than scroll through text. Market studies =
have shown that good videos attract and grow users So be sure to give them =
that option. They are an extremely  effective way of getting your =
customized information delivered to your target audience with respect to =
creating a satisfied experience for you visitors. So remember, promises =
made, promises kept and show it to them.=20

3.	Ensure Your Site is Fast.

No one wants to browse a slow sight. People are short on time and long on =
their =E2=80=9Cto do=E2=80=9D lists. No one has the patience to wait for =
slow page loading. This is even more true when they are using a mobile =
device. So your site needs to have cross browser compatibility for desktop =
browsers like IE or Chrome and for mobile devices as well such as Safari. =
It needs to be mobile friendly too and adjust to the infinite number of =
screen sizes and shapes nowadays. Did you know that for every one second =
delay in page loading results there is an up to a ten percent conversion =
reduction? Doesn=E2=80=99t matter how good your content is if your site is =
slow. Some other the things you can do to speed your site up include image =
compression. Images have an enormous impact on page loading time and there =
are any number of applications that reduce page loading time. The other =
thing you can  do is use a content delivery network (CDN) which consists of=
 multiple data centers and servers distributed throughout the world to =
reduce load times for your website. The CDN provider caches the files of =
your website and delivers the content of your site to your visitors =
providing them with the fastest experience. This may be geographical or =
logical proximity or both. If you do not know why your site is slow, seek =
out professional help. Again, custom development of your website by someone=
 who understands how to implement these site acceleration techniques is =
critical.  A content delivery network you may want to check out is www.=
cloudflare.com .=20

4.	Customize Your Content

So we are going to really emphasize customization yet again. Good content =
has a couple of dimensions that include what you say and how you present it=
. Again, a cookie cutter, templated model does not fit all sizes. The first=
 thing is knowing your target audience and what they like in terms of =
themes and symbols. One audience=E2=80=99s art is another=E2=80=99s =
graffiti and vice versa. You have to get this right.  Depending your =
site=E2=80=99s purpose, everything from your text layout, font choice, =
color scheme and even grammar and syntax matter. Typos, unless they are =
intentional and poor grammar tell your visitors that you are sloppy and =
don=E2=80=99t care about details. So if you don=E2=80=99t care about =
details, how can you care about your product or service and your visitors? =
If you want to convey a professional, trustworthy and reputable message =
ensure your grammar is on point.  Another point about content is be =
specific. In other words, if your website tries to communicate with =
everyone, you will likely attract and engage no one. Remember, get to the =
point. Also, ensure you keep your content fresh and current. Your audience =
will likely be up to speed on your particular website=E2=80=99s purpose and=
 topics. So they will expect and want fresh content. Tell them something =
new. And don=E2=80=99t forget to make your site user friendly. Again, your =
site should be easy to navigate and your visitors can find what they are =
looking for quickly and easily. A good way to test this is have friends or =
colleagues or even strangers browse your website for two minutes, stop them=
 and ask them to tell you what the site is about and its purpose. If they =
can, great. If not, then you may want to relook your content.=20


5.	Use a call to action

Ok, what do you want your visitors to do? Don=E2=80=99t assume they will =
miraculously know exactly what you want them to do. In this instance =
simplicity beats clever all day, every day. You need to tell them in =
different ways repeatedly. A good call to action is short, simple, starts =
with a verb and gets to the point. For example buy now, sign here, fill out=
 the form, schedule and appointment, call now, etc., are effective and =
clear calls to action. If you have blogs on your site, put a call to action=
 at the end of each blog. Ensure your contact forms, email addresses, Skype=
 information, chat icons are on each page. They can be discreet but should =
be present. You want to give your visitors every opportunity to do what you=
 want them to do. A good call to action might also include motion such as a=
 slide-in opt-in at one of the bottom corners so as the user scrolls down =
your page the call to action is always there but not intrusive. If you use =
a chat application drop down you ought to be able to set the amount of time=
 a visitor is on your website before the chat icon actually drops down. =
Exit intent popups also work to help retain visitors who are about to leave=
 your site. They allow you to re-engage visitors who may be about to leave =
your site. You can find some great examples of exit intent popups here =
https://wisepops.com/exit-popup-examples/ .

We have talked about five ways to attract and keep your visitors engaged =
and on your website. Remember one size doesn=E2=80=99t fit all. Hope this =
helps and until next time Good Luck!=20

AIT is a full service, inexpensive and hassle free web design & services =
company. We want to be your technology partner so you can focus on running =
your organization. It is a proven fact that visitors stay longer on a =
custom build website as opposed to the cheap, templated ones.  All of our =
websites are custom built by a dedicated web design team. You are =
immediately connected with your dedicated project manager who stays with =
you throughout the entire development and deployment process. We know what =
we are doing as a two time INC 500 company that has been in business for =
over 20 years. Our sole purpose is to provide you with the technology and =
business tools tailored specifically to your business so that you can gain =
and retain clients through your web presence. Below are just a few of the =
features and benefits that are included with our basic package. Again, this=
 full service offering comes with a dedicated project manager and =
developers who are committed to understanding you and your business. In =
fact, we also specialize in building custom apps and have deployed our =
technology at venues such as Lollapalooza, Nascar, and the NFL Draft. We =
have tens of thousands of satisfied clients. Many of them are displayed on =
the portfolio page of our website so you can look at the quality of our =
work for yourself and check our references. That=E2=80=99s how confident we=
 are that we can win and keep our clients=E2=80=99 business. So get in =
touch with us today for a courtesy consultation and ask how we can attract =
and keep visitors on your website.=20

Standard low cost Package Includes:

1.     Custom Web Design & Development
2.     Dedicated Project Manager
3.     Domain Registration
4.     Logo Design
5.     Structured Data
6.     SSL Certificate
7.     Monthly Web Hosting
8.     On Page SEO
9.     Mobile Responsiveness
10.  Cross Browser Compatibility
11.  Google Page Speed Testing
12.  Google Analytics Tools
13.  24x7 US Based Support
14.  Monthly Website Maintenance
15.  Custom application development
16.  Website Analytics
17. cPanel Control Panel
=20
Contact Us Now!  em.tnds.info/portfolio

Thank You,
Todd Earingdaile
todd.earing@outlook.com



Preferences: https://em.tnds.info/subscription/cL0X5LLQX/manage/tpnvJobREN
Unsubscribe: https://em.tnds.info/subscription/cL0X5LLQX/unsubscribe/tpnvJo=
bREN?c=3DbJzrm6JDq
View this email in your browser: https://em.tnds.info/archive/bJzrm6JDq/cL0=
X5LLQX/tpnvJobREN
