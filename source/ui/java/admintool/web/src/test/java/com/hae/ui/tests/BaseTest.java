/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.ui.tests;

import static org.junit.Assert.assertNotNull;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


/**
 *
 * @author chrispurtell
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"springContext.xml"})
public abstract class BaseTest {
    
    
    @Test
    public void dummy()
    {
        assertNotNull("Dummy Testing 123","1234");
    }
    
    
}
