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
import com.hae.domain.authentication.User;
import com.hae.domain.authentication.impl.DatabaseAuthenticationImpl;
import com.hae.domain.authentication.impl.UserImpl;
import com.hae.user.authentication.exceptions.InvalidUseridPasswordException;
import com.hae.security.authenticate.ldap.LdapAuthenticate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

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
    
    @Autowired
    private LdapAuthenticate adAuthenticate;
    
    @Override
    public DatabaseAuthentication authenticateUser(String userid, String password) throws Exception
    {
        /*UserEntity entity = getUser(userid,password);
        
        if (entity == null)
        {
            throw new InvalidUseridPasswordException();
            //user = userFactory.createUser(entity, user);
        }
        DatabaseAuthentication dbAuthentication = new DatabaseAuthenticationImpl();
        dbAuthentication.setIsValid(true);
        return dbAuthentication;
           //user = userFactory.createUser(entity, user);
            users.add(userFactory.createUser(entity, user));
        }*/
        User user = new UserImpl();
        boolean isValid = false;
        
        System.out.println("IN SERVICE IMPL");
        System.out.println("USERID: " + userid);
        System.out.println("PASSWORD: " + password);
        
        //LdapAuthenticate ldapAuthenticate = new LdapAuthenticate();
        try {
//            isValid = adAuthenticate.authenticate(userid, password);
        } catch (Exception ex) {
            Logger.getLogger(UserAuthenticationServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        System.out.println("AFTER AUTHENTICATE: " + isValid);
        
        if(isValid){
            user.setId(Long.MIN_VALUE);
            user.setUserid("fsadmin");
            user.setPassword("test123");
        }
        
        return null;
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
