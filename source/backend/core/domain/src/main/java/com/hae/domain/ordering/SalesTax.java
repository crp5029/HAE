/*
 * Copyright 2011 Fassserve Project.
 *
 */
package com.hae.domain.ordering;

import com.hae.domain.FSDomain;

/**
 *
 * @author Chris Purtell
 */
public interface SalesTax extends FSDomain {
    
     public int getId();
     public void setId(int id);
     public String getName();
     public void setName(String name);
     public double getRate();
     public void setRate(double rate);
     public String getState();
     public void setState(String state);
    
}
