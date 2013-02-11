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

package com.hae.domain.mapping.menu;

import com.hae.domain.FSDomain;
import com.hae.domain.mapping.interfaces.Mapper;
import com.hae.domain.menu.Menu;
import com.hae.entities.menu.MenuEntity;

/**
 *
 * @author Chris Purtell
 */
public class MenuMapper implements Mapper {

    
    public <E extends MenuEntity, D extends Menu> MenuMapper()
    {
        
    }
    
    
    @Override
    public <E, D extends FSDomain> void mapToDomain(E entity, D domain) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public <E, D extends FSDomain> void mapFromDomain(E entity, D domain) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
