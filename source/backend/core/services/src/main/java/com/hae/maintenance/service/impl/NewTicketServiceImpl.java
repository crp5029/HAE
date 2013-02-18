/*
 * Copyright 2012 HAE Project.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.hae.maintenance.service.impl;

import com.hae.data.repositories.MaintenanceRepository;
import com.hae.domain.maintenance.MaintenanceRequest;
import com.hae.domain.maintenanceRequest.impl.MaintenanceRequestImpl;
import com.hae.entities.maintenance.MaintenanceEntity;
//import com.hae.factories.authentication.UserFactory;
import com.hae.maintenance.service.api.NewTicketService;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Chris Purtell
 */
@Service("newMaintenanceRequest")
public class NewTicketServiceImpl implements NewTicketService {

    protected EntityManager em;
    private MaintenanceRequest request;
    
 /*   @Autowired
    UserFactory userFactory; 
 */   
    
    @Autowired
    private MaintenanceRepository maintenanceRepository;
    
    @Override
    public void addNewMaintenanceRequest(MaintenanceRequest request)
    {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("NewTicketServiceImpl");
        em = entityManagerFactory.createEntityManager();
        em.getTransaction().begin();
        this.request = request;
        em.persist(this.request);
        em.getTransaction().commit();
        
        em.close();
        entityManagerFactory.close();
    }

    public EntityManager getEntityManager() 
    {
        return em;
    }
    
    @PersistenceContext
    public void setEntityManager(EntityManager entityManager) 
    {
        this.em = entityManager;
    }

  /*  @Transactional
    public List<Car> getCars() throws DataAccessException 
    {
        Query query = getEntityManager().createQuery("select c from Car c");
        List<Car> resultList = query.getResultList();
        return resultList;
    }

    @Transactional
    public Car getCar(Long carId) throws DataAccessException 
    {
        return getEntityManager().find(Car.class, carId);
    }
*/

        
  /*      
        if (entity != null)
        {
           user = userFactory.createUser(entity, user);
        }
        
        return user;
    }
      
    */
        //return null;
    }
    
    /**
     * Retrieve User from the DB
     * @param userid
     * @param password
     * @return 
     */
 /*   private MaintenanceEntity getMaintenance(MaintenanceRequest description) {
       return maintenanceRepository.addNewRequest(description);
    }*/

