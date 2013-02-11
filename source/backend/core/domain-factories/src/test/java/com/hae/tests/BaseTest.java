/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.tests;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import static org.junit.Assert.assertNotNull;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


/**
 *
 * @author Chris Purtell
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"springContext.xml","jpaContext.xml"})
public abstract class BaseTest {
    

    @PersistenceUnit
    @Autowired
    public EntityManagerFactory emf;
    
    
    public EntityManager em;
    
    
    @Test
    public void dummy()
    {
        assertNotNull("Dummy Testing 123","1234");
    }
    
    
}
