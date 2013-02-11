/*
 * Copyright 2011 Fassserve Project.
 *
 */
package com.hae.domain.customer;

import com.hae.domain.FSDomain;
import com.hae.domain.authentication.User;
import com.hae.domain.vendor.Vendor;
import java.util.ArrayList;


/**
 *
 * @author Chris Purtell
 */
public interface Customer extends FSDomain {
    
    
    public long getId();
    public void setId(long id);  
    public String getName();
    public void setName(String name);
    public User getCredentials();
    public void setCredentials(User credentials);
    public ArrayList<Vendor> getVendors();
    public void setVendors(ArrayList<Vendor> vendors);
    
    
}
