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

package com.hae.entities.customer;

import com.hae.entities.authentication.UserEntity;
import com.hae.entities.vendor.VendorEntity;
import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author Chris Purtell
 */
@Entity
@Table(name="CUSTOMER")
public class CustomerEntity implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    
    @OneToMany(mappedBy = "customer")
    private List<VendorEntity> vendors;
    

    @OneToMany(mappedBy = "customer")
    private List<UserEntity> users;

    public long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<VendorEntity> getVendors() {
        return vendors;
    }

    public void setVendors(List<VendorEntity> vendors) {
        this.vendors = vendors;
    }

    public List<UserEntity> getUsers() {
        return users;
    }

    public void setUsers(List<UserEntity> users) {
        this.users = users;
    }
    

    
    
    
}
