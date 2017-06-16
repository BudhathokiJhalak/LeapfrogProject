/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.academy.controller.admin;

import com.leapfrog.academy.dao.AccountDAO;
import com.leapfrog.academy.dao.AdminDAO;
import com.leapfrog.academy.dao.StudentDAO;
import com.leapfrog.academy.entity.Account;
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
@RequestMapping(value = "/admin/account")
public class AccountController {

    @Autowired
    private AdminDAO adminDAO;

    @Autowired
    private AccountDAO accountDAO;

    @Autowired
    private StudentDAO studentDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("accounts", accountDAO.getAll());
        return "admin/account/index";
    }

    @RequestMapping(value = "/payment/view/{id}", method = RequestMethod.GET)
    public String paymentView(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("account", accountDAO.getById(id));
        return "admin/account/paymentView";
    }

    @RequestMapping(value = "/payment/add", method = RequestMethod.GET)
    public String addPayment(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("students", studentDAO.getAll());
        return "admin/account/addPayment";
    }

    @RequestMapping(value = "/payment/save", method = RequestMethod.POST)
    public String savePayment(@ModelAttribute("account") Account account) {
        if (account.getPaymentId() == null) {
            accountDAO.insert(account);
        } else {
            accountDAO.update(account);
        }
        return "redirect:/admin/account?paymentSuccess";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(Model model, String keyword) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("students", studentDAO.findByStudentName(keyword));
        return "admin/account/finding";
    }
    
    @RequestMapping(value = "/payment/view/student/{id}", method = RequestMethod.GET)
    public String paymentViewByStudentId(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", adminDAO.getUser(username));
        model.addAttribute("student", studentDAO.getById(id));
        model.addAttribute("accounts", accountDAO.findByStudentId(id));
        return "admin/account/studentPaymentView";
    }
}
