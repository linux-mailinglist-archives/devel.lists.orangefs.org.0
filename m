Return-Path: <devel-bounces@lists.orangefs.org>
X-Original-To: lists+devel-orangefs@lfdr.de
Delivered-To: lists+devel-orangefs@lfdr.de
Received: from mm1.emwd.com (mm1.emwd.com [172.104.12.73])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0022A4448
	for <lists+devel-orangefs@lfdr.de>; Tue,  3 Nov 2020 12:30:20 +0100 (CET)
Received: from [::1] (port=48344 helo=mm1.emwd.com)
	by mm1.emwd.com with esmtp (Exim 4.93)
	(envelope-from <devel-bounces@lists.orangefs.org>)
	id 1kZuW3-000537-6r
	for lists+devel-orangefs@lfdr.de; Tue, 03 Nov 2020 06:30:19 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46572)
 by mm1.emwd.com with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <aayra@webmobrilz.co.in>)
 id 1kZuW2-00051A-Jc
 for devel@lists.orangefs.org; Tue, 03 Nov 2020 06:30:18 -0500
Received: by mail-pg1-f196.google.com with SMTP id w4so3224000pgg.13
 for <devel@lists.orangefs.org>; Tue, 03 Nov 2020 03:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=webmobrilz-co-in.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version:thread-index
 :content-language;
 bh=LQzRYDoMap8kXxzLNneOkzPgElZgazoWvttZQOk9yK8=;
 b=sbEIz/Bh5JuzY/h4MX8ka8K0V0T7yP382WuYWYxjcQJ1kdMy+VIfrdWmW30qoQlNw6
 SQt5wbI9c0fHfwXei55Z9M18KGSeTjRdbYY8tTNGMOc3HGqLVoGTOnqaZVcCdevCborS
 rP38pSnG9i8fpbwP20r4CvAW9WNvQtp91TOqpPq3rHd3LTVkNQSBlzsKhKp8xqkzGdwR
 B9jqwAz/vAfpsqFk7fbloLJCRvwwT7vF7kZ+4D9iKRzfO5nK9MWL7gHiSg0wk2NtTGMv
 ssTyzK7V6avBUE3+CmnjNepGG2mxLW6T5D8h4SzVP+e4x3yR5Gz9uK1bqvSdSvorSUwq
 0+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :thread-index:content-language;
 bh=LQzRYDoMap8kXxzLNneOkzPgElZgazoWvttZQOk9yK8=;
 b=aIMtMK8COEwlSNpf34/fnZGFp0hMCVP5NdAm57KZj9c9o03ZE/SQYCsXMi2LQkJ3zd
 Dtykgyzoblagmx+U5rT8+QvvnM2PDGHWfpcGImKna5OTpjp8GEDchSlq4p0z9Dr6HtNh
 Mcl48Pl0isAjaKWbFB1gPB4EPL4Od1R4i37cWDTcHALmEg7hanm4RWFR+DAOLNCWfY0r
 T9atITtnt0D+6+1avpeeY6QrJjv0QNnhvDmAitH9pQpQT0AQPGwkR0gAFqWK6ScD91Mp
 jsEk2Kjhlq7DSsoJPU9DoFbCt3wMoYYOSNc6R3qEh4h28zQidjUwPEPOhM8SBYgQqHDI
 D88w==
X-Gm-Message-State: AOAM530X0yyvmLJlXBTqzcxdJzYYYhXEz0058C4wavnsL/HQLj8fTAwT
 COycN3TRlRMT5QK7ESwkBjLh0HTaZypvBA==
X-Google-Smtp-Source: ABdhPJyIE/lTbPYxZ6rC39wTKw0whdVxnrwPlF5Yl0wRrbU3nU0jb0/fdACSzEUTIibl6uAWAs3+iA==
X-Received: by 2002:a65:5383:: with SMTP id x3mr16469708pgq.341.1604402977286; 
 Tue, 03 Nov 2020 03:29:37 -0800 (PST)
Received: from adminPC ([106.215.0.50])
 by smtp.gmail.com with ESMTPSA id bo16sm3268170pjb.41.2020.11.03.03.29.35
 for <devel@lists.orangefs.org>
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Tue, 03 Nov 2020 03:29:36 -0800 (PST)
From: "Aayra" <aayra@webmobrilz.co.in>
To: <devel@lists.orangefs.org>
Subject: web and app Development 
Date: Tue, 3 Nov 2020 16:57:56 +0530
Message-ID: <2248001d6b1d4$9d0f5860$d72e0920$@co.in>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Adax0jpD6+6QPB2mRjGg1j4dysvtwA==
Content-Language: en-us
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

Hi devel@lists.orangefs.org

Hope you are doing well.

We are global based web design and mobile apps Development Company
specializing in business-specific solutions at a modest rate. No =
compromise
on quality!

Our services include:

=FC PHP/Word Press/Drupal/Joomla/Angular Js Development

=FC Java/Magento/ROR/React/Jscript Development

=FC Android/IOS/Native/Hybrid Mobile Apps Development

=FC e-Commerce Apps/Social Media Apps/Game Apps Development

=FC Responsive Website Design/e-Commerce Solutions

=FC SEO Package/Logo Design/Re-Design and Development

Please let me know if we can help you. I can send you more details on =
the
portfolio/quotation/past work details/proposal.

Looking forward to hearing from you.

Kind Regards,

Aayra,

Note: If you are not interested then you can reply with a simple =
\"NO\",We
will never contact you again.

=20

