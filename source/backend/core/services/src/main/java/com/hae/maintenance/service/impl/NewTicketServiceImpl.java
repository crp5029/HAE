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
import com.hae.factories.maintenanceRequest.MaintenanceRequestFactory;
import com.hae.maintenance.service.api.NewTicketService;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Chris Purtell
 */
@Service("newMaintenanceRequest")
public class NewTicketServiceImpl implements NewTicketService {

    private static final Logger LOGGER = LoggerFactory.getLogger(NewTicketServiceImpl.class);
    
    @Autowired
    private MaintenanceRequestFactory maintenanceRequestFactory;
    
    @Autowired
    private MaintenanceRepository maintenanceRepository;
    
    @Override
    public void addNewMaintenanceRequest(MaintenanceRequest description)
    {
        maintenanceRepository.save(maintenanceRequestFactory.createRequest(description));   
    }
    
    @Override
    public List<MaintenanceRequest> getMaintenanceRequests()
    {
        ArrayList<MaintenanceRequest> maintenanceRequests = new ArrayList<MaintenanceRequest>();
        List<MaintenanceEntity> maintenanceRequestList = (List<MaintenanceEntity>) maintenanceRepository.findAll();
        
        for (MaintenanceEntity aEntity : maintenanceRequestList)
        {
            MaintenanceRequest request = new MaintenanceRequestImpl();
            maintenanceRequests.add(maintenanceRequestFactory.getRequest(aEntity, request));
        }
        
        return maintenanceRequests;
    }
    
}