package com.Voxce.mail;


import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

/**
 *
 * @author Administrator
 */
/**
 * Simple Class to send an email using JavaMail API (javax.mail) and Gmail SMTP server
 * @author Dunith Dhanushka, <a href="mailto:dunithd@gmail.com">dunithd@gmail.com</a>
 * @version 1.0
 */
public class Mail {
    
   

   
   

    public String send_mail(String host, String user, String password, String port, String from, String to,String subject ,String email_message) {
        //Use Properties object to set environment properties

     String socket_Factory = "javax.net.ssl.SSLSocketFactory";
       
     
     	Properties properties = new Properties();
     	properties.put("mail.smtp.host", host);
     	properties.put("mail.smtp.port", port);
     	properties.put("mail.smtp.user", user);
     	properties.put("mail.smtp.auth", "true");
     	properties.put("mail.smtp.starttls.enable", "true");
     	properties.put("mail.smtp.debug", "true");
        properties.put("mail.smtp.socketFactory.port", port);
        properties.put("mail.smtp.socketFactory.class", socket_Factory);
        properties.put("mail.smtp.socketFactory.fallback", "false");

        try {

            //Obtain the default mail session
            Session session = Session.getDefaultInstance(properties, null);
            session.setDebug(true);

            //Construct the mail message
            MimeMessage message = new MimeMessage(session);
            message.setSubject(subject);
            message.setContent(email_message, "text/html");
            message.setFrom(new InternetAddress(from));
            message.addRecipient(RecipientType.TO, new InternetAddress(to));
            message.addRecipients(RecipientType.CC, InternetAddress.parse("info@voxce.com"));
            message.saveChanges();

            //Use Transport to deliver the message
            Transport transport = session.getTransport("smtp");
            transport.connect(host, user, password);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            return "mail sent";

        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }

    }

    public static void main(String[] args) {
       Mail hello = new Mail();
       System.out.println(hello.send_mail("smtpout.secureserver.net", "zeeshan.sikander@talismaworks.com", "password", "465", "zeeshan@pagal.com", "zeeshii03@gmail.com", "Email Test", "This is test message from zeeshan"));
    }
}