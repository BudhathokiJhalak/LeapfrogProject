/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.academy.controller.admin;

import com.leapfrog.academy.dao.AdminDAO;
import com.leapfrog.academy.entity.Admin;
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
@RequestMapping({"/admin", "/admin/dashboard"})
public class DashboardController {

    @Autowired
    private AdminDAO adminDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        return "admin/index";
    }

    @RequestMapping(value = "/profile/{id}", method = RequestMethod.GET)
    public String profile(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("admin", adminDAO.getById(id));
        return "admin/profile";
    }
    @RequestMapping(value = "/profile/update/{id}", method = RequestMethod.GET)
    public String profileUpdate(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("admin", adminDAO.getById(id));
        return "admin/updateProfile";
    }
    
    @RequestMapping(value = "/profile/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("admin") Admin admin){
        adminDAO.update(admin);
        return "redirect:/admin?profileUpdated";
    }
}
