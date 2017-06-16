/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.academy.dao.impl;

import com.leapfrog.academy.dao.CertificateDAO;
import com.leapfrog.academy.entity.Certificate;
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
@Repository(value = "certificateDAO")
public class CertificateDAOImpl implements CertificateDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;

    @Override
    public void insert(Certificate certificate) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.save(certificate);
        trans.commit();
        session.close();
    }

    @Override
    public void update(Certificate certificate) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.update(certificate);
        trans.commit();
        session.close();
    }

    @Override
    public void delete(int id) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        Certificate certificate = (Certificate) session.get(Certificate.class, id);
        session.delete(certificate);
        trans.commit();
        session.close();
    }

    @Override
    public List<Certificate> getAll() {
        session = sessionFactory.openSession();
        List<Certificate> certifiedList = session.createQuery("SELECT c FROM Certificate c").list();
        session.close();
        return certifiedList;
    }

    @Override
    public Certificate getById(int id) {
        Certificate certificate = null;
        session = sessionFactory.openSession();
        certificate = (Certificate) session.get(Certificate.class, id);
        session.close();
        return certificate;
    }

}
