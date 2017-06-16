/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.academy.controller.admin;

import com.leapfrog.academy.dao.AdminDAO;
import com.leapfrog.academy.dao.CourseDAO;
import com.leapfrog.academy.dao.EnquiryDAO;
import com.leapfrog.academy.dao.EnquiryStatusDAO;
import com.leapfrog.academy.dao.IspDAO;
import com.leapfrog.academy.dao.MailAddressDAO;
import com.leapfrog.academy.entity.Enquiry;
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
@RequestMapping(value = "/admin/enquiry")
public class EnquiryController {

    @Autowired
    private EnquiryDAO enquiryDAO;

    @Autowired
    private EnquiryStatusDAO esDAO;

    @Autowired
    private CourseDAO courseDAO;

    @Autowired
    private IspDAO ispDAO;

    @Autowired
    private MailAddressDAO mailAddressDAO;
    
    @Autowired
    private AdminDAO adminDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("enquiries", enquiryDAO.getAll());
        return "admin/enquiry/index";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("enquiry") Enquiry enquiry) {
        if (enquiry.getEnquiryId() == null) {
            enquiryDAO.insert(enquiry);
        } else {
            enquiryDAO.update(enquiry);
        }
        return "redirect:/admin/enquiry?success";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String update(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("enquiry", enquiryDAO.getById(id));
        model.addAttribute("enquiryStatus", esDAO.getAll());
        model.addAttribute("courses", courseDAO.getAll());
        return "admin/enquiry/update";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") int id) {
        enquiryDAO.delete(id);
        return "redirect:/admin/enquiry?success";
    }

    @RequestMapping(value = "/mail/{id}", method = RequestMethod.GET)
    public String mail(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("enquiry", enquiryDAO.getById(id));
        model.addAttribute("isps", ispDAO.getAll());
        model.addAttribute("mailAddress", mailAddressDAO.getAll());
        return "admin/enquiry/mail";
    }
}
