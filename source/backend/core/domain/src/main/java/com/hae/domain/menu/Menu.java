/*
 * Copyright 2011 Fassserve Project.
 *
 *
 */
package com.hae.domain.menu;

import com.hae.domain.FSDomain;
import java.util.List;



/**
 *
 * @author Chris Purtell
 */
public interface Menu extends FSDomain {
  
    public long getId();
    public void setId(long id);
    public String getName();
    public void setName(String name);
    public List<MenuItem> getMenuItems();
    public void setMenuItems(List<MenuItem> menuItems);
}
