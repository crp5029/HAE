/*
 * Copyright 2011 HAE Project.
 *
 */
package com.hae.domain.menu.impl;

import com.hae.domain.menu.MenuItem;
import com.hae.domain.menu.MenuItemPrice;

/**
 *
 * @author Chris Purtell
 */
public class MenuItemImpl implements MenuItem {
  
    
    //Attributes
    
    /**
     * Object Id
     */
    private long id;
    
    
    /**
     * Menu Detailed Text
     */
    private String detailedText;
    
    
    /**
     * Display Name
     */
    private String displayName;
    
    
    /**
     * Display Order
     */
    private int displayOrder;
    
    /**
     * Menu Item Price
     */
    private MenuItemPrice price;
    
    
    /**
     * Image URL
     */
    private String imageURL;

 
    
    
    @Override
    public String getDetailedText() {
        return detailedText;
    }

    @Override
    public void setDetailedText(String detailedText) {
        this.detailedText = detailedText;
    }

    @Override
    public String getDisplayName() {
        return displayName;
    }

    @Override
    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    @Override
    public int getDisplayOrder() {
        return displayOrder;
    }

    @Override
    public void setDisplayOrder(int displayOrder) {
        this.displayOrder = displayOrder;
    }

 
    @Override
    public long getId() {
        return id;
    }

    @Override
    public void setId(long id) {
        this.id = id;
    }

    @Override
    public String getImageURL() {
        return imageURL;
    }

    @Override
    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }


    @Override
    public MenuItemPrice getPrice() {
        return price;
    }

    @Override
    public void setPrice(MenuItemPrice price) {
        this.price = price;
    }

    
    
}
