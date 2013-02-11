/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.tests.factories.user;

import com.hae.domain.authentication.User;
import com.hae.factories.authentication.UserFactory;
import com.hae.tests.BaseTest;
import org.junit.*;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Chris Purtell
 */
public class UserFactoryTest extends BaseTest {
    
    @Autowired
    UserFactory factory;

    @BeforeClass
    public static void setUpClass() throws Exception {
    }

    @AfterClass
    public static void tearDownClass() throws Exception {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }
   
    
    @Test
    public void testUserFactory() {
    
        //User aUser = factory.("fsadmin", "test123");
        
        //Assert.assertNotNull("User Object is Null", aUser);
        
    
    }
}
