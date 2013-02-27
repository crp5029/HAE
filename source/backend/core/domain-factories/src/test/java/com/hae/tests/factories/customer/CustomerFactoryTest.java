/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.tests.factories.customer;

import com.hae.domain.customer.Customer;
import com.hae.factories.customer.CustomerFactory;
import com.hae.tests.BaseTest;
import org.junit.*;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author chrispurtell
 */
public class CustomerFactoryTest extends BaseTest {
    
  //  @Autowired
  //  CustomerFactory factory;

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
    public void testCustomerFactory() {
    
        //User aUser = factory.("fsadmin", "test123");
        
        //Assert.assertNotNull("User Object is Null", aUser);
        
    
    }
}
