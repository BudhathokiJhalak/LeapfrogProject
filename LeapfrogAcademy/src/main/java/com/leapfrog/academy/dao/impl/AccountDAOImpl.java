/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.academy.dao.impl;

import com.leapfrog.academy.dao.AccountDAO;
import com.leapfrog.academy.entity.Account;
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
@Repository(value = "accountDAO")
public class AccountDAOImpl implements AccountDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;

    @Override
    public void insert(Account payment) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.save(payment);
        trans.commit();
        session.close();
    }

    @Override
    public void update(Account t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Account> getAll() {
        session = sessionFactory.openSession();
        List<Account> AccountList = session.createQuery("SELECT a FROM Account a ORDER BY a.addedDate DESC").list();
        session.close();
        return AccountList;
    }

    @Override
    public Account getById(int id) {
        Account account = null;
        session = sessionFactory.openSession();
        account = (Account) session.get(Account.class, id);
        session.close();
        return account;
    }

    @Override
    public List<Account> findByStudentId(int id) {
        session = sessionFactory.openSession();
        List<Account> paymentList = session.createQuery("From Account a WHERE a.studentId = " + id).list();
        session.close();
        return paymentList;
    }

}
