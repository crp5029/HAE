/*
 * Copyright 2012 HAE Project.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.hae.domain.menu.impl;

import com.hae.domain.menu.MenuItemPrice;
import java.math.BigDecimal;

/**
 *
 * @author Chris Purtell
 */
public class MenuItemPriceImpl implements MenuItemPrice {

    /* Currency the price is in */
    private Object currency;
    
    
    /* The price of the menu item */
    private BigDecimal price;

    
    
    
    @Override
    public Object getCurrency() {
        return currency;
    }

    @Override
    public void setCurrency(Object currency) {
        this.currency = currency;
    }


    @Override
    public BigDecimal getPrice() {
        return price;
    }

    @Override
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    
    
    
    
    
    
    
    
}
