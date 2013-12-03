/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.maintenance.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import com.hae.domain.maintenance.MaintenanceService;
import com.hae.domain.maintenance.impl.MaintenanceServiceImpl;
import com.hae.maintenance.service.api.MaintenanceServices;
import com.hae.entities.maintenance.MaintenanceServiceEntity;
import com.hae.factories.maintenance.MaintenanceServiceFactory;
import com.hae.repositories.MaintenanceServiceRepository;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;


/**
 *
 * @author chrispurtell
 */
@Service("getMaintenanceServices")
public class MaintenanceServicesImpl implements MaintenanceServices {
    
    private static final Logger LOGGER = LoggerFactory.getLogger(MaintenanceServicesImpl.class);

    @Autowired
    private MaintenanceServiceFactory maintenanceServiceFactory;
    
    @Autowired
    private MaintenanceServiceRepository maintenanceServiceRepository;
    

    @Override
    public List<MaintenanceService> getMaintenanceServices()
    {
        ArrayList<MaintenanceService> maintenanceServices = new ArrayList<MaintenanceService>();
       List<MaintenanceServiceEntity> maintenanceServiceList = (List<MaintenanceServiceEntity>) maintenanceServiceRepository.findAll();
        
        for (MaintenanceServiceEntity aEntity : maintenanceServiceList)
        {
            MaintenanceService service = new MaintenanceServiceImpl();
            maintenanceServices.add(maintenanceServiceFactory.getRequest(aEntity, service));
        }
        
        return maintenanceServices;
    }
    
}
