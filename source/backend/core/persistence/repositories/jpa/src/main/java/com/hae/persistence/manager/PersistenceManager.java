/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.persistence.manager;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author chrispurtell
 */
public class PersistenceManager {
    
    EntityManager em;
    
    protected void setUp() throws Exception 
    {
      //EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory( "org.hibernate.tutorial.jpa" );
      addTest();
    }

    protected void addTest()
    {
/*        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist( new Event( "Our very first event!" ) );
        entityManager.persist( new Event( "A follow up event" ) );
        entityManager.getTransaction().commit();
        entityManager.close();*/
    }
    
/*    public EntityManager getEm() {
        return em;
    }

    public void setEm(EntityManager em) {
        this.em = em;
    }
  */  
}
