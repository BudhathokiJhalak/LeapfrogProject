/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.academy.controller.admin;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author zak
 */
@Controller
@RequestMapping(value = "/admin/mail")
public class MailController {

    @RequestMapping(value = "/send", method = RequestMethod.POST)
    public String send(HttpServletRequest req){
        String to = req.getParameter("to");
        String from = req.getParameter("from");
        String host = req.getParameter("hostName");

        Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", host);

        Session session = Session.getDefaultInstance(properties);
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(req.getParameter("subject"));
            message.setText(req.getParameter("message"));

            Transport.send(message);
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }

        return "redirect:/admin?mail_sent_success" ;
    }
    
}
