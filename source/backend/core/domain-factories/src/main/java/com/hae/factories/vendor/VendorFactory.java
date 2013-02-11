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
package com.hae.factories.vendor;

import com.hae.domain.mapping.vendor.VendorMapper;
import com.hae.domain.vendor.Vendor;
import com.hae.domain.vendor.impl.VendorImpl;
import com.hae.entities.vendor.VendorEntity;

/**
 *
 * @author Chris Purtell
 */
public class VendorFactory {

    
    /**
     * Create a vendor object from an Entity Object
     * @param entity
     * @return 
     */
    public Vendor createVendor(VendorEntity entity)
    {
        Vendor vendor = new VendorImpl();
        VendorMapper mapper = new VendorMapper();
        mapper.mapToDomain(entity, vendor);
        return vendor;
    }
    
}
