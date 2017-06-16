/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.academy.dao.impl;

import com.leapfrog.academy.dao.AdminDAO;
import com.leapfrog.academy.entity.Admin;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author zak
 */
@Repository(value = "adminDAO")
public class AdminDAOImpl implements AdminDAO{

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;
    
    @Override
    public void insert(Admin t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Admin admin) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.update(admin);
        trans.commit();
        session.close();
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Admin> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Admin getById(int id) {
        Admin admin = null;
        session = sessionFactory.openSession();
        admin = (Admin) session.get(Admin.class, id);
        session.close();
        return admin;
    }

    @Override
    public Admin getUser(String username) {
        Admin admin = null;
        session = sessionFactory.openSession();
        Query query = session.createQuery("from Admin where username=:username");
        query.setParameter("username", username);
        admin = (Admin) query.uniqueResult();
        session.close();
        return admin;
    }
    
}
