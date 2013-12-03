/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.factories.maintenance;

import com.hae.domain.maintenance.MaintenanceRequest;
import com.hae.domain.mapping.maintenance.MaintenanceRequestMapper;
import com.hae.entities.maintenance.MaintenanceRequestEntity;

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
    public MaintenanceRequestEntity createRequest(MaintenanceRequest maintenanceRequest)
    {
        MaintenanceRequestEntity entity = new MaintenanceRequestEntity();
        MaintenanceRequestMapper mapper = new MaintenanceRequestMapper();
        mapper.mapFromDomain(entity, maintenanceRequest);
        return entity;
    }
    
    public MaintenanceRequest getRequest(MaintenanceRequestEntity entity, MaintenanceRequest maintenanceRequest)
    {
        MaintenanceRequestMapper mapper = new MaintenanceRequestMapper();
        mapper.mapToDomain(entity, maintenanceRequest);
        return maintenanceRequest;
    }
    
}
