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

package com.hae.entities.authentication;

import com.hae.entities.customer.CustomerEntity;
import com.hae.entities.vendor.VendorEntity;
import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author Chris Purtell
 */
@Entity
@Table(name="FS_USER")
public class UserEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String userid;
    private String password;
    
  /*  
    @ManyToOne
    @JoinColumn(name="VENDOR_ID")
    private VendorEntity vendor;
    
    @ManyToOne
    @JoinColumn(name="CUSTOMER_ID")
    private CustomerEntity customer;
  */  

    public long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }
/*
    public CustomerEntity getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerEntity customer) {
        this.customer = customer;
    }

    public VendorEntity getVendor() {
        return vendor;
    }

    public void setVendor(VendorEntity vendor) {
        this.vendor = vendor;
    }

   */
    
    
}

