/*
 * Copyright 2011 Fassserve Project.
 *
 */
package com.hae.domain.maintenance;

import com.hae.domain.FSDomain;



/**
 *
 * @author Chris Purtell
 */
public interface MaintenanceRequest extends FSDomain {
    
    
    public long getId();
    public void setId(long id);  
    public String getDescription();
    public void setDescription(String description);
}
