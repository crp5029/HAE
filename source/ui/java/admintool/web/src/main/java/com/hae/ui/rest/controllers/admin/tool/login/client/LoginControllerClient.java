/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.ui.rest.controllers.admin.tool.login.client;

import com.hae.domain.authentication.User;
import com.hae.domain.authentication.impl.UserImpl;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJacksonHttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author chrispurtell
 */
@Controller
@RequestMapping(value = "/ajax")
public class LoginControllerClient  {
    
    
    private Logger log = LoggerFactory.getLogger(this.getClass().getName());
    
    public static String authenticateUserUrl = "http://localhost:8080/hae/admintool/authenticateUser";
    
    
    @RequestMapping(value = "/authenticateUser", method = RequestMethod.POST)
    public
    @ResponseBody
    Boolean authenticateUser(@RequestBody UserImpl context, HttpServletResponse response) 
    {
        System.out.println("INSIDE authenticateUser!!!!!!!!!!");
        log.warn("INSIDE AUTHENTICATEUSERRRRRRRRR!");
        
        response.setStatus(HttpServletResponse.SC_OK);
        RestTemplate restTemplate = new RestTemplate();
        
       User result = restTemplate.postForObject(authenticateUserUrl, context, UserImpl.class);
        
       return true;
    }
    
  
    
//    @RequestMapping(value = "/admintool/authenticateUser", method = RequestMethod.POST, headers="Accept=applicaton/json")
//    public ModelAndView post(@RequestBody UserImpl user){
//        log.info("Received Credentials: " + user.toString());
//        return new ModelAndView("jsonView").addObject(user);
//    }

}

