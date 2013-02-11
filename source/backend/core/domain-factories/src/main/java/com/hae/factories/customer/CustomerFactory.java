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
package com.hae.factories.customer;

import com.hae.domain.customer.Customer;
import com.hae.domain.customer.impl.CustomerImpl;
import com.hae.domain.mapping.customer.CustomerMapper;
import com.hae.entities.customer.CustomerEntity;

/**
 *
 * @author Chris Purtell
 */
public class CustomerFactory {

    
    /**
     * Create a vendor object from an Entity Object
     * @param entity
     * @return 
     */
    public Customer createCustomer(CustomerEntity entity)
    {
        Customer customer = new CustomerImpl();
        CustomerMapper mapper = new CustomerMapper();
        mapper.mapToDomain(entity, customer);
        return customer;
    }
    
  
}
