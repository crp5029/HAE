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

package com.hae.domain.authentication.impl;

import com.hae.domain.authentication.User;
import com.hae.domain.customer.Customer;
import com.hae.domain.vendor.Vendor;

/**
 *
 * @author Chris Purtell
 */
public class UserImpl implements User {
    
    
    private String userid;
    private String password;
    private boolean isAdmin;
    
    //Releationships
    private Vendor vendor;
    private Customer customer;
    
    

    @Override
    public boolean isIsAdmin() {
        return isAdmin;
    }

    @Override
    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String getUserid() {
        return userid;
    }

    @Override
    public void setUserid(String userid) {
        this.userid = userid;
    }

    @Override
    public Customer getCustomer() {
        return customer;
    }

    @Override
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    @Override
    public Vendor getVendor() {
        return vendor;
    }

    @Override
    public void setVendor(Vendor vendor) {
        this.vendor = vendor;
    }
    
    
    
    
    

}
