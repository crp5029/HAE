/*
 * Copyright 2011 HAE Project.
 *
 */
package com.hae.domain.ordering;

/**
 *
 * @author Chris Purtell
 */
public class SalesTaxImpl implements SalesTax {
    
    
    //Attributes
    
    /**
     * Object Id
     */
   private int id;
   
   /**
    * Sale Tax Name
    */
   private String name;
   
   /**
    * Location - State
    */
   private String state;
   
   /**
    * Sale Tax Rate
    */
   private double rate;

   
   
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
    public double getRate() {
        return rate;
    }

    @Override
    public void setRate(double rate) {
        this.rate = rate;
    }

    @Override
    public String getState() {
        return state;
    }

    @Override
    public void setState(String state) {
        this.state = state;
    }
   
    
   
   
   
   
   
   
   
}
