/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.academy.dao.impl;

import com.leapfrog.academy.dao.MailAddressDAO;
import com.leapfrog.academy.entity.MailAddress;
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
@Repository(value = "mailAddressDAO")
public class MailAddressDAOImpl implements MailAddressDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;

    @Override
    public void insert(MailAddress mailAddress) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.save(mailAddress);
        trans.commit();
        session.close();
    }

    @Override
    public void update(MailAddress mailAddress) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.update(mailAddress);
        trans.commit();
        session.close();
    }

    @Override
    public void delete(int id) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        MailAddress mailAddress = (MailAddress) session.get(MailAddress.class, id);
        session.delete(mailAddress);
        trans.commit();
        session.close();
    }

    @Override
    public List<MailAddress> getAll() {
        session = sessionFactory.openSession();
        List<MailAddress> mailAddressList = session.createQuery("SELECT m FROM MailAddress m").list();
        session.close();
        return mailAddressList;
    }

    @Override
    public MailAddress getById(int id) {
        MailAddress mailAddress = null;
        session = sessionFactory.openSession();
        mailAddress = (MailAddress) session.get(MailAddress.class, id);
        session.close();
        return mailAddress;
    }

}
