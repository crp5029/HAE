/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.factories.maintenanceRequest;

import com.hae.domain.maintenance.MaintenanceRequest;
import com.hae.domain.maintenanceRequest.impl.MaintenanceRequestImpl;
import com.hae.domain.mapping.maintenanceRequest.MaintenanceRequestMapper;
import com.hae.entities.maintenance.MaintenanceEntity;

/**
 *
 * @author chrispurtell
 */
public class MaintenanceRequestFactory {
    
     /**
     * Create a user object from a user entity object
     * @param entity
     * @return 
     */
    public MaintenanceEntity createRequest(MaintenanceRequest maintenanceRequest)
    {
        MaintenanceEntity entity = new MaintenanceEntity();
        MaintenanceRequestMapper mapper = new MaintenanceRequestMapper();
        mapper.mapFromDomain(entity, maintenanceRequest);
        return entity;
    }
    
}
