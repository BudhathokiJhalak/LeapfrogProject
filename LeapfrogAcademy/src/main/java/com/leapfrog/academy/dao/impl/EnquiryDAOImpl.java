/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.academy.dao.impl;

import com.leapfrog.academy.dao.EnquiryDAO;
import com.leapfrog.academy.entity.Enquiry;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author zak
 */
@Repository(value = "enquiryDAO")
public class EnquiryDAOImpl implements EnquiryDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;

    @Override
    public void insert(Enquiry enquiry) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.save(enquiry);
        trans.commit();
        session.close();
    }

    @Override
    public void update(Enquiry enquiry) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.update(enquiry);
        trans.commit();
        session.close();
    }

    @Override
    public void delete(int id) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        Enquiry enquiry = (Enquiry) session.get(Enquiry.class, id);
        session.delete(enquiry);
        trans.commit();
        session.close();
    }

    @Override
    public List<Enquiry> getAll() {
        session = sessionFactory.openSession();
        List<Enquiry> enquiryList = session.createQuery("SELECT e FROM Enquiry e").list();
        session.close();
        return enquiryList;
    }

    @Override
    public Enquiry getById(int id) {
        Enquiry enquiry = null;
        session = sessionFactory.openSession();
        enquiry = (Enquiry) session.get(Enquiry.class, id);
        session.close();
        return enquiry;
    }

}
