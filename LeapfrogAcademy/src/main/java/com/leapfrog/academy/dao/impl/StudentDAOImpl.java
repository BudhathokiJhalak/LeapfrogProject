/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.academy.dao.impl;

import com.leapfrog.academy.dao.StudentDAO;
import com.leapfrog.academy.entity.Student;
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
@Repository(value = "studentDAO")
public class StudentDAOImpl implements StudentDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;

    @Override
    public void insert(Student student) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.save(student);
        trans.commit();
        session.close();
    }

    @Override
    public void update(Student student) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.update(student);
        trans.commit();
        session.close();
    }

    @Override
    public void delete(int id) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        Student student = (Student) session.get(Student.class, id);
        session.delete(student);
        trans.commit();
        session.close();
    }

    @Override
    public List<Student> getAll() {
        session = sessionFactory.openSession();
        List<Student> studentList = session.createQuery("SELECT s FROM Student s").list();
        session.close();
        return studentList;
    }

    @Override
    public Student getById(int id) {
        Student student = null;
        session = sessionFactory.openSession();
        student = (Student) session.get(Student.class, id);
        session.close();
        return student;
    }

    @Override
    public List<Student> findByStudentName(String keyword) {
        session = sessionFactory.openSession();
        List<Student> studentList = session.createQuery("From Student s WHERE s.firstName like " + "'%" + keyword + "%'").list();
        session.close();
        return studentList;
    }

}
