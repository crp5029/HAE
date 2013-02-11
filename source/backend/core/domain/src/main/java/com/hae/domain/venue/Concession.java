 /*
 * Copyright 2011 Fassserve Project.
 * 
 */
package com.hae.domain.venue;

import com.hae.domain.FSDomain;
import com.hae.domain.menu.MenuItem;
import com.hae.domain.ordering.Order;
import com.hae.domain.vendor.Vendor;
import java.util.List;

/**
 *
 * @author Chris Purtell
 */
public interface Concession extends FSDomain {
    
    public int getId();
    public void setId(int id);
    public String getName();
    public void setName(String name);
    public List<Order> getOrders();
    public void setOrders(List<Order> orders);
    public Vendor getVendor();
    public void setVendor(Vendor vendor);
    public List<ConcessionMenuItem> getMenuItems();
    public void setMenuItems(List<ConcessionMenuItem> menuItems);
    public VenueSection getVenueSection();
    public void setVenueSection(VenueSection venueSection);
    public boolean isIsFreeStanding() ;
    public void setIsFreeStanding(boolean isFreeStanding);
    
}
