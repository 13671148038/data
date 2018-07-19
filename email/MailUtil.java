package com.ocst.utils;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.Properties;

public class MailUtil {
    private static final String HOST = MailConfig.host;
    private static final String PORT = MailConfig.port;
    private static final String USERNAME = MailConfig.userName;
    private static final String PASSWORD = MailConfig.passWord;
    private static final String emailForm = MailConfig.emailForm;
    private static final String timeout = MailConfig.timeout;
    /**
     * 邮件发送器
     *
     * @return 配置好的工具
     */
   public Boolean sendMail(String email,String pass) throws GeneralSecurityException {

       Properties props = new Properties();
       props.setProperty("mail.transport.protocol", "SMTP");
       props.setProperty("mail.smtp.host", HOST);
       props.setProperty("mail.smtp.port", PORT);
       // 指定验证为true
       props.setProperty("mail.smtp.auth", "true");
       props.setProperty("mail.smtp.timeout",timeout);
       MailSSLSocketFactory sf = new MailSSLSocketFactory();
       sf.setTrustAllHosts(true);
       props.put("mail.smtp.ssl.enable", "true");
       props.put("mail.smtp.ssl.socketFactory", sf);
       // 验证账号及密码，密码需要是第三方授权码
       Authenticator auth = new Authenticator() {
           public PasswordAuthentication getPasswordAuthentication(){
               return new PasswordAuthentication(USERNAME, PASSWORD);
           }
       };
       Session session = Session.getInstance(props, auth);

        // 2.创建一个Message，它相当于是邮件内容
       Message message = new MimeMessage(session);
        // 设置发送者
       try {
           message.setFrom(new InternetAddress(emailForm));
        // 设置发送方式与接收者
           message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(email));
        // 设置主题
           message.setSubject("重置密码");
        //设置发送时间
           message.setSentDate(new Date());
        // 设置内容
           message.setContent("登录密码重置为"+pass, "text/html;charset=utf-8");
        // 3.创建 Transport用于将邮件发送
           Transport.send(message);
       }  catch (Exception e) {
               e.printStackTrace();
           }
       return true;
   }
}
