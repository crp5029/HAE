/*
 * Copyright 2011 Fassserve Project.
 *
 */
package com.hae.domain.ordering;

import com.hae.domain.FSDomain;
import java.util.List;

/**
 *
 * @author Chris Purtell
 */
public interface Order extends FSDomain {
    
    
    public long getId();
    public void setId(long id);
    public Long getOrderDateTime();
    public void setOrderDateTime(Long orderDateTime);
    public List<SalesTax> getTaxes();
    public void setTaxes(List<SalesTax> taxes);
    
    
}
