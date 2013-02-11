/*
 * Copyright 2012 Fassserve Project.
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

package com.hae.domain.vendor;

import com.hae.domain.FSDomain;
import com.hae.domain.authentication.User;
import com.hae.domain.customer.Customer;
import com.hae.domain.menu.Menu;
import com.hae.domain.venue.Venue;
import java.util.List;

/**
 *
 * @author Chris Purtell
 */
public interface Vendor extends FSDomain {

    
    public long getId();
    public void setId(Long id);
    public String getName();
    public void setName(String name);
    public List<Venue> getVenues();
    public void setVenues(List<Venue> venues);
    public User getCredentials();
    public void setCredentials(User credentials);
    public Customer getCustomer();
    public void setCustomer(Customer customer);
    public List<Menu> getMenus();
    public void setMenus(List<Menu> menus);
    
    
}
