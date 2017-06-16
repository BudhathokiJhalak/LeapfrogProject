/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.academy.controller.admin;

import com.leapfrog.academy.dao.AdminDAO;
import com.leapfrog.academy.dao.CourseDAO;
import com.leapfrog.academy.dao.IspDAO;
import com.leapfrog.academy.dao.MailAddressDAO;
import com.leapfrog.academy.dao.TutorDAO;
import com.leapfrog.academy.entity.Tutor;
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
@RequestMapping(value = "/admin/tutor")
public class TutorController {

    @Autowired
    private TutorDAO tutorDAO;

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
        model.addAttribute("tutors", tutorDAO.getAll());
        return "admin/tutor/index";
    }

    @RequestMapping(value = "/profile/{id}", method = RequestMethod.GET)
    public String profile(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("tutor", tutorDAO.getById(id));
        return "admin/tutor/profile";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("courses", courseDAO.getAll());
        return "admin/tutor/add";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("tutor") Tutor tutor) {
        if (tutor.getTutorId() == null) {
            tutorDAO.insert(tutor);
        } else {
            tutorDAO.update(tutor);
        }
        return "redirect:/admin/tutor?success";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String update(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("tutor", tutorDAO.getById(id));
        model.addAttribute("courses", courseDAO.getAll());
        return "admin/tutor/update";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") int id) {
        tutorDAO.delete(id);
        return "redirect:/admin/tutor?success";
    }
    
    @RequestMapping(value = "/mail/{id}", method = RequestMethod.GET)
    public String mail(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("tutor", tutorDAO.getById(id));
        model.addAttribute("isps", ispDAO.getAll());
        model.addAttribute("mailAddress", mailAddressDAO.getAll());
        return "admin/tutor/mail";
    }
}
