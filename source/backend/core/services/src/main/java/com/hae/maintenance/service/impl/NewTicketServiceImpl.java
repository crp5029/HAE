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
import com.hae.factories.maintenanceRequest.MaintenanceRequestFactory;
import com.hae.maintenance.service.api.NewTicketService;
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
    
}
