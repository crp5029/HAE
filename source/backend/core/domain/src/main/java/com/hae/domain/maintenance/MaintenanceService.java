/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.domain.maintenance;

import com.hae.domain.FSDomain;

/**
 *
 * @author chrispurtell
 */
public interface MaintenanceService extends FSDomain {
    
    public long getId();
    public void setId(long id);  
    public String getDescription();
    public void setDescription(String description);
    public boolean isEnabled();
    public void setEnabled(boolean enabled);
    
}
