/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.security.authenticate.exceptions;

/**
 *
 * @author chrispurtell
 */
public class InvalidUseridPasswordException extends Exception {
    
    private static final long serialVersionUID = 1L;
   
    /**
        *  Detail message of the exception 
    */
    public String getMessage() {
	return "Invalid Userid or Password";
	}  
}
