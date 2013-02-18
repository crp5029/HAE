/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.daos.impl;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceException;
import org.springframework.orm.jpa.JpaCallback;
import org.springframework.orm.jpa.support.JpaDaoSupport;

import com.hae.daos.api.MaintenanceRequestDao;
import com.hae.entities.maintenance.MaintenanceEntity;

/**
 *
 * @author chrispurtell
 */
public class MaintenanceRequestDaoImpl extends JpaDaoSupport implements MaintenanceRequestDao {
    
    
public void update(MaintenanceEntity entity) 
{
    getJpaTemplate().merge(entity);
}

public void remove(final String id) 
{
  getJpaTemplate().execute(new JpaCallback() {
    public Object doInJpa(EntityManager em) throws PersistenceException 
    {
        em.getTransaction().begin();
        em.remove(em.find(MaintenanceEntity.class, id));
        em.flush();
        em.getTransaction().commit();
        return null;
     }
  });
}

 public void save(final MaintenanceEntity entity) 
 {
    getJpaTemplate().execute(new JpaCallback() {
    public Object doInJpa(EntityManager em) throws PersistenceException 
    {
        em.getTransaction().begin();
        em.persist(entity);
        em.getTransaction().commit();
        return null;
     }
  });
}
    
}
