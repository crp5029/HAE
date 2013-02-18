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

package com.hae.rest.controllers.admin.tool.login;

import com.hae.domain.authentication.User;
import com.hae.domain.authentication.impl.UserImpl;
import com.hae.user.authentication.service.api.UserAuthenticationService;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Chris Purtell
 */
@Controller
public class LoginController {
    
    
    
    @Autowired
    UserAuthenticationService userAuthService;
    
    
    
    
    @RequestMapping(value = "/admintool/authenticateUser", method = RequestMethod.POST)
    public
    @ResponseBody
    User authenticateUser(@RequestBody UserImpl context, HttpServletResponse response) 
    {
        response.setStatus(HttpServletResponse.SC_OK);
        return userAuthService.authenticateUser(context.getUserid(), context.getPassword());
    }
    
    

}
