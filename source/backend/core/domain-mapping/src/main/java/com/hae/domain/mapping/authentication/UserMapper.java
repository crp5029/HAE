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

package com.hae.domain.mapping.authentication;

import com.hae.domain.FSDomain;
import com.hae.domain.authentication.User;
import com.hae.domain.customer.Customer;
import com.hae.domain.customer.impl.CustomerImpl;
import com.hae.domain.mapping.customer.CustomerMapper;
import com.hae.domain.mapping.interfaces.Mapper;
import com.hae.domain.mapping.vendor.VendorMapper;
import com.hae.domain.vendor.Vendor;
import com.hae.domain.vendor.impl.VendorImpl;
import com.hae.entities.authentication.UserEntity;

/**
 *
 * @author Chris Purtell
 */
public class UserMapper implements Mapper {

    
    
    @Override
    public <E, D extends FSDomain> void mapToDomain(E entity, D domain) {
        
        
        UserEntity user = (UserEntity) entity;
        User userDomain = (User) domain;
        userDomain.setPassword(user.getPassword());
        userDomain.setUserid(user.getUserid());
        userDomain.setIsAdmin(user.isIsAdmin());
        
        if (user.getCustomer() != null)
        {
            Customer customer = new CustomerImpl();
            CustomerMapper mapper = new CustomerMapper();
            mapper.mapToDomain(user.getCustomer(), customer);
            userDomain.setCustomer(customer);
        }
        
        
        if (user.getVendor() != null)
        {
            Vendor vendor = new VendorImpl();
            VendorMapper mapper = new VendorMapper();
            mapper.mapToDomain(user.getVendor(), vendor);
            userDomain.setVendor(vendor);
            
        }
    }

     
    @Override
    public <E, D extends FSDomain> void mapFromDomain(E entity, D domain) 
    {
    }
    
    
    
    
   

}
