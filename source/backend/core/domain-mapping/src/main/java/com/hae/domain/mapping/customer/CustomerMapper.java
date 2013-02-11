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

package com.hae.domain.mapping.customer;

import com.hae.domain.FSDomain;
import com.hae.domain.customer.Customer;
import com.hae.domain.mapping.interfaces.Mapper;
import com.hae.entities.customer.CustomerEntity;

/**
 *
 * @author Chris Purtell
 */
public class CustomerMapper implements Mapper {

    
    public CustomerMapper()
    {
        
    }

    @Override
    public <E, D extends FSDomain> void mapToDomain(E entity, D domain) {
         
        Customer domainObject = (Customer) domain;
        CustomerEntity entityObject = (CustomerEntity)entity;
        domainObject.setId(entityObject.getId());
        domainObject.setName(entityObject.getName());
        
    }

    @Override
    public <E, D extends FSDomain> void mapFromDomain(E entity, D domain) {
          
        Customer domainObject = (Customer) domain;
        CustomerEntity entityObject = (CustomerEntity)entity;
        entityObject.setName(domainObject.getName());
        
    }
    
    
    
    
    
    
}
