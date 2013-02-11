/*
 * Copyright 2011 HAE Project.
 *
 */
package com.hae.domain.menu.impl;


import com.hae.domain.menu.Menu;
import com.hae.domain.menu.MenuItem;
import java.util.List;

/**
 *
 * @author Chris Purtell
 */
public class MenuImpl implements Menu {
   
    
    //Attributes
    
    /**
     * Object ID
     */
    private long id;
    
    
    /**
     * Menu Name
     */
    private String name;
    
    
    
    //Relationships
    
    /* List of menu items for a menu */
    private List<MenuItem> menuItems;
    
    
    @Override
    public long getId() {
        return id;
    }

    @Override
    public void setId(long id) {
        this.id = id;
    }


    @Override
    public List<MenuItem> getMenuItems() {
        return menuItems;
    }

    @Override
    public void setMenuItems(List<MenuItem> menuItems) {
        this.menuItems = menuItems;
    }

    @Override
    public String getName() {
        return name;
    }

    @Override
    public void setName(String name) {
        this.name = name;
    }
    
    
    
    
    
    
    
    
}
