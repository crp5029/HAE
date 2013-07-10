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

package com.hae.customer.service.impl;

import com.hae.customer.service.api.CustomerService;
import com.hae.repositories.CustomerRepository;
//import com.hae.repositories.VendorRepository;
import com.hae.domain.mapping.customer.CustomerMapper;
//import com.hae.domain.mapping.vendor.VendorMapper;
import com.hae.domain.vendor.Vendor;
import com.hae.domain.vendor.impl.VendorImpl;
//import com.hae.entities.vendor.VendorEntity;
import com.hae.factories.customer.CustomerFactory;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Chris Purtell
 */
@Service("customerService")
public class CustomerServiceImpl implements CustomerService {
    
    @Autowired
    CustomerFactory customerFactory; 
    
    @Autowired
    private CustomerRepository customerRepository;
    
    @Autowired
    private CustomerMapper customerMapper;
  
  /*  
    @Autowired
    private VendorMapper vendorMapper;
    
    @Autowired
    private VendorRepository vendorRepository;
   */ 
    
    /**
     * 
     * Get all vendors service
     * 
     * @return 
     */
   @Override
    public ArrayList<Vendor> getAllVendors()
    {
     /*   
        ArrayList<Vendor> vendors = new ArrayList<Vendor>();
        
        for (VendorEntity entity : getVendors())
        {
            Vendor vendor = new VendorImpl();
            vendorMapper.mapToDomain(entity, vendor);
            vendors.add(vendor);
        }
        */
       // return vendors;
        return null;
    }
    
    
    @Override
    public void saveVendor(Vendor vendor)
    {
       // VendorEntity entity = getVendorById(vendor.getId());
       // vendorMapper.mapFromDomain(entity, vendor);
       // saveVendor(entity);
    }
    
    
    
    /**
     * Get all vendors from the db
     * @return 
     */
  /*  private Iterable<VendorEntity> getVendors()
    {
        
        return vendorRepository.findAll();
        
    }
    
 
    private VendorEntity getVendorById(long id)
    {
        return vendorRepository.findOne(id);
    }
*/
}
