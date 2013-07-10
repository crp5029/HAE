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

package com.hae.entities.venue;

import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author Chris Purtell
 */
@Entity
@Table(name="CONCESSION")
public class ConcessionEntity implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private String userId;
    private long vendorId;
    private long venueSectionId;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public long getVendorId() {
        return vendorId;
    }

    public void setVendorId(long vendorId) {
        this.vendorId = vendorId;
    }
    
    public long getVenueSectionId() {
        return venueSectionId;
    }
    
    public void setVenueSectionId(long venueSectionId) {
        this.venueSectionId = venueSectionId;
    }
    
    

}
