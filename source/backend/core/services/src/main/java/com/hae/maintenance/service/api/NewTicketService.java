/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.maintenance.service.api;

import com.hae.domain.maintenance.MaintenanceRequest;
import java.util.List;

/**
 *
 * @author chrispurtell
 */
public interface NewTicketService {
    
     public void addNewMaintenanceRequest(MaintenanceRequest description);
     public List<MaintenanceRequest> getMaintenanceRequests();
    
}
