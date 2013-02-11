/*
 * Copyright 2011 HAE Project.
 *
 */
package com.hae.domain.venue.impl;

import com.hae.domain.ordering.Order;
import com.hae.domain.vendor.Vendor;
import com.hae.domain.venue.Concession;
import com.hae.domain.venue.ConcessionMenuItem;
import com.hae.domain.venue.VenueSection;
import java.util.List;

/**
 *
 * @author Chris Purtell
 */
public class ConcessionImpl implements Concession {

    //Attributes
    
    /*
     * Object ID
     */
    private int id;
    
    /*
     * Concession Name
     */
    private String name;
    //Relationships
    
    /*
     * Venue Section
     */
    private VenueSection venueSection;
    
    /*
     * Concession Orders
     */
    private List<Order> orders;
    
    /*
     * Vendor that owns the concession
     */
    private Vendor vendor;
    
    /*
     * List of menu items being served from the concession *?
     */
    private List<ConcessionMenuItem> menuItems;

    
    private boolean isFreeStanding;
    
    
    @Override
    public int getId() {
        return id;
    }

    @Override
    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String getName() {
        return name;
    }

    @Override
    public void setName(String name) {
        this.name = name;
    }

    @Override
    public List<Order> getOrders() {
        return orders;
    }

    @Override
    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    @Override
    public Vendor getVendor() {
        return vendor;
    }

    @Override
    public void setVendor(Vendor vendor) {
        this.vendor = vendor;
    }

    @Override
    public List<ConcessionMenuItem> getMenuItems() {
        return menuItems;
    }

    @Override
    public void setMenuItems(List<ConcessionMenuItem> menuItems) {
        this.menuItems = menuItems;
    }


    @Override
    public VenueSection getVenueSection() {
        return venueSection;
    }

    @Override
    public void setVenueSection(VenueSection venueSection) {
        this.venueSection = venueSection;
    }

    @Override
    public boolean isIsFreeStanding() {
        return isFreeStanding;
    }

    @Override
    public void setIsFreeStanding(boolean isFreeStanding) {
        this.isFreeStanding = isFreeStanding;
    }
    
    
}
