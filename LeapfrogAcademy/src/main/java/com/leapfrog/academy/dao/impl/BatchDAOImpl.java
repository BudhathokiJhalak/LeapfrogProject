/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.academy.dao.impl;

import com.leapfrog.academy.dao.BatchDAO;
import com.leapfrog.academy.entity.Batch;
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
@Repository(value = "batchDAO")
public class BatchDAOImpl implements BatchDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;

    @Override
    public void insert(Batch batch) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.save(batch);
        trans.commit();
        session.close();
    }

    @Override
    public void update(Batch batch) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.update(batch);
        trans.commit();
        session.close();
    }

    @Override
    public void delete(int id) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        Batch batch = (Batch) session.get(Batch.class, id);
        session.delete(batch);
        trans.commit();
        session.close();
    }

    @Override
    public List<Batch> getAll() {
        session = sessionFactory.openSession();
        List<Batch> batchList = session.createQuery("SELECT b FROM Batch b").list();
        session.close();
        return batchList;
    }

    @Override
    public Batch getById(int id) {
        Batch batch = null;
        session = sessionFactory.openSession();
        batch = (Batch) session.get(Batch.class, id);
        session.close();
        return batch;
    }

}
