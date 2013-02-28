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

package com.hae.user.authentication.service.impl;

import com.hae.data.repositories.UserRepository;
import com.hae.entities.authentication.UserEntity;
import com.hae.factories.authentication.UserFactory;
import com.hae.user.authentication.service.api.UserAuthenticationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hae.domain.authentication.DatabaseAuthentication;
import com.hae.domain.authentication.impl.DatabaseAuthenticationImpl;
import com.hae.user.authentication.exceptions.InvalidUseridPasswordException;

/**
 *
 * @author Chris Purtell
 */
@Service("userAuthenticationService")
public class UserAuthenticationServiceImpl implements UserAuthenticationService {

    @Autowired
    private UserFactory userFactory; 
    
    @Autowired
    private UserRepository userRepository;
 
    
    @Override
    public DatabaseAuthentication authenticateUser(String userid, String password) throws Exception
    {
        UserEntity entity = getUser(userid, password);
        
        if (entity == null)
        {
            throw new InvalidUseridPasswordException();
            //user = userFactory.createUser(entity, user);
        }
        DatabaseAuthentication dbAuthentication = new DatabaseAuthenticationImpl();
        dbAuthentication.setIsValid(true);
        return dbAuthentication;
    }
    
    /**
     * Retrieve User from the DB
     * @param userid
     * @param password
     * @return 
     */
    @Override
    public UserEntity getUser(String userid, String password) {
       return userRepository.findByUseridPassword(userid, password);
    }
}
