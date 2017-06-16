/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.academy.dao.impl;

import com.leapfrog.academy.dao.TutorDAO;
import com.leapfrog.academy.entity.Tutor;
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
@Repository(value = "tutorDAO")
public class TutorDAOImpl implements TutorDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;

    @Override
    public void insert(Tutor tutor) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.save(tutor);
        trans.commit();
        session.close();
    }

    @Override
    public void update(Tutor tutor) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.update(tutor);
        trans.commit();
        session.close();
    }

    @Override
    public void delete(int id) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        Tutor tutor = (Tutor) session.get(Tutor.class, id);
        session.delete(tutor);
        trans.commit();
        session.close();
    }

    @Override
    public List<Tutor> getAll() {
        session = sessionFactory.openSession();
        List<Tutor> tutorList = session.createQuery("SELECT t FROM Tutor t").list();
        session.close();
        return tutorList;
    }

    @Override
    public Tutor getById(int id) {
        Tutor tutor = null;
        session = sessionFactory.openSession();
        tutor = (Tutor) session.get(Tutor.class, id);
        session.close();
        return tutor;
    }

}
