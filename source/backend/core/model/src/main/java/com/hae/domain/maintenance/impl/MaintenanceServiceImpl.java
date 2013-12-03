/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.domain.maintenance.impl;

import com.hae.domain.maintenance.MaintenanceService;

/**
 *
 * @author chrispurtell
 */
public class MaintenanceServiceImpl implements MaintenanceService {

    private long id;
    private String description;
    private boolean enabled;

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

    @Override
    public boolean isEnabled() {
        return enabled;
    }

    @Override
    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
      
}
