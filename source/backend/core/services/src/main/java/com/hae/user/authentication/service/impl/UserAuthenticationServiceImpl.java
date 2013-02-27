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
import com.hae.domain.authentication.User;
import com.hae.domain.authentication.impl.UserImpl;
import com.hae.entities.authentication.UserEntity;
import com.hae.factories.authentication.UserFactory;
import com.hae.user.authentication.service.api.UserAuthenticationService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Chris Purtell
 */
@Service("userAuthenticationService")
public class UserAuthenticationServiceImpl implements UserAuthenticationService {

    
    @Autowired
    UserFactory userFactory; 
    
    
    @Autowired
    private UserRepository userRepository;
    
    @Override
    public List<User> authenticateUser(String userid, String password)
    {
     
        User user = new UserImpl();
        UserEntity entity = getUser(userid,password);
        ArrayList<User> users = new ArrayList<User>();
        
        if (entity != null)
        {
           //user = userFactory.createUser(entity, user);
            users.add(userFactory.createUser(entity, user));
        }
        
        return users;
        
    }
    
    /**
     * Retrieve User from the DB
     * @param userid
     * @param password
     * @return 
     */
    private UserEntity getUser(String userid, String password) {
       return userRepository.findByUseridPassword(userid, password);
    }
}
