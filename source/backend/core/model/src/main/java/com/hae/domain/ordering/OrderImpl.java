/*
 * Copyright 2011 HAE Project.
 *
 */
package com.hae.domain.ordering;

import java.util.List;

/**
 *
 * @author Chris Purtell
 */
public class OrderImpl implements Order {
    
    
    //Attributes
    
    /**
     * Object id
     */
    private long id;
    
    
    /**
     * Order Date and Time 
     * Expressed in a long seconds from 01,01 1970(Unix Time)
     */
    private Long orderDateTime;
    
    //Relationships

    
    /**
     * Collection of sales taxes
     */
    private List<SalesTax> taxes;
    
    
    
    @Override
    public long getId() {
        return id;
    }

    @Override
    public void setId(long id) {
        this.id = id;
    }

    @Override
    public Long getOrderDateTime() {
        return orderDateTime;
    }

    @Override
    public void setOrderDateTime(Long orderDateTime) {
        this.orderDateTime = orderDateTime;
    }

    @Override
    public List<SalesTax> getTaxes() {
        return taxes;
    }

    @Override
    public void setTaxes(List<SalesTax> taxes) {
        this.taxes = taxes;
    }
    
    
    
    
    
    
}
