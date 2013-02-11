/*
 * Copyright 2011 Fassserve Project.
 */
package com.hae.domain.menu;

import com.hae.domain.FSDomain;

/**
 *
 * @author Chris Purtell
 */
public interface MenuItem extends FSDomain {
    
    
     public long getId();
     public void setId(long id);
     public String getDetailedText();
     public void setDetailedText(String detailedText); 
     public String getDisplayName();
     public void setDisplayName(String displayName);
     public int getDisplayOrder();
     public void setDisplayOrder(int displayOrder);
     public String getImageURL();
     public void setImageURL(String imageURL);
     public MenuItemPrice getPrice();
     public void setPrice(MenuItemPrice price);
     
     
     
     
}
