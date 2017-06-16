/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.academy.controller.admin;

import com.leapfrog.academy.dao.AdminDAO;
import com.leapfrog.academy.dao.MailAddressDAO;
import com.leapfrog.academy.entity.MailAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author zak
 */
@Controller
@RequestMapping(value = "/admin/mail-address")
public class MailAddressController {

    @Autowired
    private MailAddressDAO mailAddressDAO;

    @Autowired
    private AdminDAO adminDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("mailAddress", mailAddressDAO.getAll());
        return "admin/mail-address/index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        return "admin/mail-address/add";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("mailAddress") MailAddress mailAddress) {
        if (mailAddress.getMailAddressId() == null) {
            mailAddressDAO.insert(mailAddress);
        } else {
            mailAddressDAO.update(mailAddress);
        }
        return "redirect:/admin/mail-address?success";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String update(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("mailAddress", mailAddressDAO.getById(id));
        return "admin/mail-address/update";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") int id) {
        mailAddressDAO.delete(id);
        return "redirect:/admin/mail-address?success";
    }
}
