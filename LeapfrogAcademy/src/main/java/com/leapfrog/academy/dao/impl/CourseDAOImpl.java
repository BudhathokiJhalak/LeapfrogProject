/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.academy.dao.impl;

import com.leapfrog.academy.dao.CourseDAO;
import com.leapfrog.academy.entity.Course;
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
@Repository(value = "courseDAO")
public class CourseDAOImpl implements CourseDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;

    @Override
    public void insert(Course course) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.save(course);
        trans.commit();
        session.close();
    }

    @Override
    public void update(Course course) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.update(course);
        trans.commit();
        session.close();
    }

    @Override
    public void delete(int id) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        Course course = (Course) session.get(Course.class, id);
        session.delete(course);
        trans.commit();
        session.close();
    }

    @Override
    public List<Course> getAll() {
        session = sessionFactory.openSession();
        List<Course> courseList = session.createQuery("SELECT c FROM Course c").list();
        session.close();
        return courseList;
    }

    @Override
    public Course getById(int id) {
        Course course = null;
        session = sessionFactory.openSession();
        course = (Course) session.get(Course.class, id);
        session.close();
        return course;
    }

    @Override
    public List<Course> find(String keyword) {
        session = sessionFactory.openSession();
        List<Course> courses = session.createQuery("From Course WHERE courseName like " + "'%" + keyword + "%'").list();
        session.close();
        return courses;
    }

}
