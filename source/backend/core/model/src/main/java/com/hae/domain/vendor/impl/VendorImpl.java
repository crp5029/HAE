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

package com.hae.domain.vendor.impl;

import com.hae.domain.authentication.User;
import com.hae.domain.customer.Customer;
import com.hae.domain.menu.Menu;
import com.hae.domain.vendor.Vendor;
import com.hae.domain.venue.Venue;
import java.util.List;

/**
 *
 * @author Chris Purtell
 */
public class VendorImpl implements Vendor {

    
    /*  Object ID */
    private Long id;
    
    /* Vendors name */
    private String name;
    
    /* List of venues the vendor does business at */
    private List<Venue> venues;
    
    /* HAE Customer Releationship */
    private Customer customer;
     
    /* Vendor user authentication */
    private User credentials;
    
    /* Vendor menus */
    private List<Menu> menus;
    
    
    

    @Override
    public long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public String getName() {
        return name;
    }

    @Override
    public void setName(String name) {
        this.name = name;
    }

    @Override
    public List<Venue> getVenues() {
        return venues;
    }

    @Override
    public void setVenues(List<Venue> venues) {
        this.venues = venues;
    }

    @Override
    public User getCredentials() {
        return credentials;
    }

    @Override
    public void setCredentials(User credentials) {
        this.credentials = credentials;
    }


    @Override
    public List<Menu> getMenus() {
        return menus;
    }

    @Override
    public void setMenus(List<Menu> menus) {
        this.menus = menus;
    }
   

    @Override
    public Customer getCustomer() {
        return customer;
    }

    @Override
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

   
    
    
}
