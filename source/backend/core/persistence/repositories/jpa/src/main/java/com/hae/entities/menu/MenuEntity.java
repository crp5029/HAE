/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.entities.menu;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author chrispurtell
 */
@Entity
@Table(name="MENU")
public class MenuEntity implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    
    private List<MenuItemEntity> menuItems;
    
    public long getId(){
        return id;
    }
    
    public void setId(long id){
        this.id = id;
    }
    
    public String getName(){
        return name;
    }
    
    public void setName(String name){
        this.name = name;
    }
    
    public List<MenuItemEntity> getMenuItems() {
        return menuItems;
    }

    public void setVendors(List<MenuItemEntity> menuItems) {
        this.menuItems = menuItems;
    }
    
}
