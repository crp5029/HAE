/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.daos.api;

import com.hae.entities.maintenance.MaintenanceEntity;

/**
 *
 * @author chrispurtell
 */
public interface MaintenanceRequestDao {
   // public MaintenanceEntity findById(String id);
    public void save(MaintenanceEntity aRequest);
    public void update(MaintenanceEntity aRequest);
    
}
