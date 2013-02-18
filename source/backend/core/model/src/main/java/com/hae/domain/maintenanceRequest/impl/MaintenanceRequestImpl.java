/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.domain.maintenanceRequest.impl;

import com.hae.domain.maintenance.MaintenanceRequest;

/**
 *
 * @author chrispurtell
 */
public class MaintenanceRequestImpl implements MaintenanceRequest {
    
        //Attributes
    
    /**
     * object id
     */
    private long id;
    
   
    /**
     * Maintenance Description
     * 
     */
    private String description;

    @Override
    public long getId() {
        return id;
    }

    @Override
    public void setId(long id) {
        this.id = id;
    }
    
    @Override
    public void setDescription(String description) {
        this.description = description;
    }
    
    @Override
    public String getDescription() {
        return description;
    }
       
}
