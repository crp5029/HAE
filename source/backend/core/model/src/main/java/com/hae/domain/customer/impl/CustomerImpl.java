/*
 * Copyright 2011 HAE Project.
 *
 */
package com.hae.domain.customer.impl;

import com.hae.domain.authentication.User;
import com.hae.domain.customer.Customer;
import com.hae.domain.vendor.Vendor;
import java.util.ArrayList;

/**
 *
 * @author Chris Purtell
 */
public class CustomerImpl implements Customer {
    
    
    //Attributes
    
    /**
     * object id
     */
    private long id;
    
   
    /**
     * Customer Name
     * 
     */
    private String name;
    
    
    /**
     * Customers user credentials;
     */
    private User credentials;
    
    
    /**
     * Customer Vendors
     * @return 
     */
    private ArrayList<Vendor> vendors;
    
    
    
    

    @Override
    public long getId() {
        return id;
    }

    @Override
    public void setId(long id) {
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
    public User getCredentials() {
        return credentials;
    }

    @Override
    public void setCredentials(User credentials) {
        this.credentials = credentials;
    }

    public ArrayList<Vendor> getVendors() {
        return vendors;
    }

    public void setVendors(ArrayList<Vendor> vendors) {
        this.vendors = vendors;
    }

   
    
    
    
}
