/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.customer.service.api;

import com.hae.domain.vendor.Vendor;
import java.util.ArrayList;

/**
 *
 * @author chrispurtell
 */
public interface CustomerService {

     public ArrayList<Vendor> getAllVendors();
     public void saveVendor(Vendor vendor);
    
}
