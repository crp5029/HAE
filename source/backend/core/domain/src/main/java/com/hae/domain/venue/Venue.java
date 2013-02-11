/*
 * Copyright 2011 Fassserve Project.
 *
 */
package com.hae.domain.venue;

import com.hae.domain.FSDomain;

/**
 *
 * @author Chris Purtell
 */
public interface Venue extends FSDomain {
    
    
    public int getId();
    public void setId(int id);
    public String getName();
    public void setName(String name);
    
    
}
