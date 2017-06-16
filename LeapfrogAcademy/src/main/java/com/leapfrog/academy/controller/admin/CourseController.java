/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.academy.controller.admin;

import com.leapfrog.academy.dao.AdminDAO;
import com.leapfrog.academy.dao.CourseDAO;
import com.leapfrog.academy.entity.Course;
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
@RequestMapping(value = "/admin/course")
public class CourseController {

    @Autowired
    private CourseDAO courseDAO;
    
    @Autowired
    private AdminDAO adminDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("courses", courseDAO.getAll());
        return "admin/course/index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        return "admin/course/add";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("course") Course course) {
        if (course.getCourseId() == null) {
            courseDAO.insert(course);
        } else {
            courseDAO.update(course);
        }
        return "redirect:/admin/course?success";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String update(@PathVariable("id") int id, Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("course", courseDAO.getById(id));
        return "admin/course/update";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") int id) {
        courseDAO.delete(id);
        return "redirect:/admin/course?success";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(Model model, String keyword) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("courses", courseDAO.find(keyword));
        return "admin/search/courseFound";
    }
}
