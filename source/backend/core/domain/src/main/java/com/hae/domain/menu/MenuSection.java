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

package com.hae.domain.menu;

import com.hae.domain.FSDomain;

/**
 *
 * @author Chris Purtell
 */
public interface MenuSection extends FSDomain {
    
    
    public boolean isActive();
    public void setActive(boolean active);
    public String getDisplayName();
    public void setDisplayName(String displayName);
    public String getImageURL();
    public void setImageURL(String imageURL);
    public int getDisplayOrder();
    public void setDisplayOrder(int displayOrder);
    
    
    

}
