/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.academy.controller.admin;

import com.leapfrog.academy.dao.AdminDAO;
import com.leapfrog.academy.dao.BatchDAO;
import com.leapfrog.academy.dao.CourseDAO;
import com.leapfrog.academy.dao.IspDAO;
import com.leapfrog.academy.dao.MailAddressDAO;
import com.leapfrog.academy.dao.StudentDAO;
import com.leapfrog.academy.entity.Student;
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
@RequestMapping(value = "/admin/student")
public class StudentController {

    @Autowired
    private StudentDAO studentDAO;

    @Autowired
    private CourseDAO courseDAO;

    @Autowired
    private BatchDAO batchDAO;
    
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
        model.addAttribute("students", studentDAO.getAll());
        return "admin/student/index";
    }

    @RequestMapping(value = "/profile/{id}", method = RequestMethod.GET)
    public String profile(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("student", studentDAO.getById(id));
        return "admin/student/profile";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("courses", courseDAO.getAll());
        model.addAttribute("batches", batchDAO.getAll());
        return "admin/student/add";
    }
    
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("student") Student student) {
        if (student.getStudentId() == null) {
            studentDAO.insert(student);
        } else {
            studentDAO.update(student);
        }
        return "redirect:/admin/student?success";
    }
    
    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String update(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("student", studentDAO.getById(id));
        model.addAttribute("batches", batchDAO.getAll());
        model.addAttribute("courses", courseDAO.getAll());
        return "admin/student/update";
    }
    
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") int id) {
        studentDAO.delete(id);
        return "redirect:/admin/student?success";
    }
    
    @RequestMapping(value = "/mail/{id}", method = RequestMethod.GET)
    public String mail(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("student", studentDAO.getById(id));
        model.addAttribute("isps", ispDAO.getAll());
        model.addAttribute("mailAddress", mailAddressDAO.getAll());
        return "admin/student/mail";
    }
}
