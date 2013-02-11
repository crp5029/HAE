/*
 * Copyright 2012 Fassserve Project.
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

package com.hae.domain.authentication;

import com.hae.domain.FSDomain;
import com.hae.domain.customer.Customer;
import com.hae.domain.vendor.Vendor;

/**
 *
 * @author Chris Purtell
 */
public interface User extends FSDomain {

    public String getPassword();
    public void setPassword(String password);
    public String getUserid();
    public void setUserid(String userid);
    public boolean isIsAdmin();
    public void setIsAdmin(boolean isAdmin);
    public Customer getCustomer();
    public void setCustomer(Customer customer);
    public Vendor getVendor();
    public void setVendor(Vendor vendor);
    
    
    
}
