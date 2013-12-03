/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.factories.maintenance;

import com.hae.domain.maintenance.MaintenanceService;
import com.hae.domain.mapping.maintenance.MaintenanceServiceMapper;
import com.hae.entities.maintenance.MaintenanceServiceEntity;

/**
 *
 * @author chrispurtell
 */
public class MaintenanceServiceFactory {
    
     /**
     * Create a user object from a user entity object
     * @param entity
     * @return 
     */
    public MaintenanceServiceEntity createRequest(MaintenanceService maintenanceService)
    {
        MaintenanceServiceEntity entity = new MaintenanceServiceEntity();
        MaintenanceServiceMapper mapper = new MaintenanceServiceMapper();
        mapper.mapFromDomain(entity, maintenanceService);
        return entity;
    }
    
    public MaintenanceService getRequest(MaintenanceServiceEntity entity, MaintenanceService maintenanceService)
    {
        MaintenanceServiceMapper mapper = new MaintenanceServiceMapper();
        mapper.mapToDomain(entity, maintenanceService);
        return maintenanceService;
    }
    
}
