/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.academy.dao;

import com.leapfrog.academy.dao.generic.GenericDAO;
import com.leapfrog.academy.entity.Course;
import java.util.List;

/**
 *
 * @author zak
 */
public interface CourseDAO extends GenericDAO<Course> {

    List<Course> find(String keyword);
}
