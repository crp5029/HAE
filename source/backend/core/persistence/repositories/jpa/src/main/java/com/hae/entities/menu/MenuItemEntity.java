/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.entities.menu;

import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author chrispurtell
 */
@Entity
@Table(name="MENUITEM")
public class MenuItemEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String detailedText;
    private String displayName;
    private int displayOrder;
    private String imageUrl;
    private MenuItemPriceEntity itemPrice;

    
    
    public String getDetailedText() {
        return detailedText;
    }

    public void setDetailedText(String detailedText) {
        this.detailedText = detailedText;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public int getDisplayOrder() {
        return displayOrder;
    }

    public void setDisplayOrder(int displayOrder) {
        this.displayOrder = displayOrder;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public MenuItemPriceEntity getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(MenuItemPriceEntity itemPrice) {
        this.itemPrice = itemPrice;
    }
    
 
    
    
    
    
    
}
