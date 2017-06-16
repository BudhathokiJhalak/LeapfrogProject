/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.academy.dao.impl;

import com.leapfrog.academy.dao.EnquiryStatusDAO;
import com.leapfrog.academy.entity.EnquiryStatus;
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
@Repository(value = "enqiryStatusDAO")
public class EnquiryStatusDAOImpl implements EnquiryStatusDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;

    @Override
    public void insert(EnquiryStatus es) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.save(es);
        trans.commit();
        session.close();
    }

    @Override
    public void update(EnquiryStatus es) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.update(es);
        trans.commit();
        session.close();
    }

    @Override
    public void delete(int id) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        EnquiryStatus es = (EnquiryStatus) session.get(EnquiryStatus.class, id);
        session.delete(es);
        trans.commit();
        session.close();
    }

    @Override
    public List<EnquiryStatus> getAll() {
        session = sessionFactory.openSession();
        List<EnquiryStatus> esList = session.createQuery("SELECT es FROM EnquiryStatus es").list();
        session.close();
        return esList;
    }

    @Override
    public EnquiryStatus getById(int id) {
        EnquiryStatus es = null;
        session = sessionFactory.openSession();
        es = (EnquiryStatus) session.get(EnquiryStatus.class, id);
        session.close();
        return es;
    }

}
