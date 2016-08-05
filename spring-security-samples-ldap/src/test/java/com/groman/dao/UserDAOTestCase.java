package com.groman.dao;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.groman.config.AppConfig;
import com.groman.model.User;

public class UserDAOTestCase {
    
    private static UserDAO dao;
    
    @BeforeClass
    public static void setUp() {
        ApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        dao = context.getBean(UserDAO.class);
        assertNotNull(dao);
    }

    @Test
    public void testGetUserByUsername() {
        User user = dao.getUser("jdoe");
        assertNotNull(user);
        assertEquals("jdoe", user.getUsername());
    }

}
