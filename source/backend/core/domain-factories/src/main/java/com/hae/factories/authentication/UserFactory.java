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
package com.hae.factories.authentication;

import com.hae.domain.authentication.User;
import com.hae.domain.authentication.impl.UserImpl;
import com.hae.domain.mapping.authentication.UserMapper;
import com.hae.entities.authentication.UserEntity;

/**
 *
 * @author Chris Purtell
 */
public class UserFactory {

    
     /**
     * Create a user object from a user entity object
     * @param entity
     * @return 
     */
    public User createUser(UserEntity entity)
    {
        User user = new UserImpl();
        UserMapper mapper = new UserMapper();
        mapper.mapToDomain(entity, user);
        return user;
    }
    
    
} 
