/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.academy.controller.admin;

import com.leapfrog.academy.dao.AdminDAO;
import com.leapfrog.academy.dao.CertificateDAO;
import com.leapfrog.academy.dao.StudentDAO;
import com.leapfrog.academy.entity.Certificate;
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
@RequestMapping(value = "/admin/certificate")
public class CertificateController {

    @Autowired
    private CertificateDAO certificateDAO;

    @Autowired
    private StudentDAO studentDAO;

    @Autowired
    private AdminDAO adminDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("certificates", certificateDAO.getAll());
        return "admin/certificate/index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("students", studentDAO.getAll());
        return "admin/certificate/add";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("certificate") Certificate certificate) {
        if (certificate.getCertificateId() == null) {
            certificateDAO.insert(certificate);
        }
        return "redirect:/admin/certificate?success";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") int id) {
        certificateDAO.delete(id);
        return "redirect:/admin/certificate?success";
    }

}
