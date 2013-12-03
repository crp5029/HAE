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

package com.hae.domain.mapping.maintenance;

import com.hae.domain.FSDomain;
import com.hae.domain.maintenance.MaintenanceRequest;
import com.hae.domain.mapping.interfaces.Mapper;
import com.hae.entities.maintenance.MaintenanceRequestEntity;


/**
 *
 * @author Chris Purtell
 */
public class MaintenanceRequestMapper implements Mapper {

    
    
    @Override
    public <E, D extends FSDomain> void mapToDomain(E entity, D domain) 
    {
        MaintenanceRequestEntity maintenanceEntity = (MaintenanceRequestEntity) entity;
        MaintenanceRequest maintenanceDomain = (MaintenanceRequest) domain;
        maintenanceDomain.setId(maintenanceEntity.getId());
        maintenanceDomain.setDescription(maintenanceEntity.getDescription());
    }

     
    @Override
    public <E, D extends FSDomain> void mapFromDomain(E entity, D domain) 
    {
        MaintenanceRequest maintenanceDomain = (MaintenanceRequest) domain;
        MaintenanceRequestEntity maintenanceEntity = (MaintenanceRequestEntity) entity;
        maintenanceEntity.setDescription(maintenanceDomain.getDescription());
    }
    
    
    
    
   

}
