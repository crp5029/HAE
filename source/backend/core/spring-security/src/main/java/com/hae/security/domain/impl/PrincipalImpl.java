/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.security.domain.impl;

/**
 *
 * @author chrispurtell
 */


import com.hae.security.domain.api.IPrincipal;

public class PrincipalImpl implements IPrincipal {

    private String firstName = "";
    private String lastName = "";
    private String id = "";

    public String getFirstName() {
	return firstName;
    }
    public void setFirstName(String firstName) {
	this.firstName = firstName;
    }
    public String getLastName() {
	return lastName;
    }

    public void setLastName(String lastName) {
	this.lastName = lastName;
    }
    
    public String getId() {
	return id;
    }
    public void setId(String id) {
	this.id = id;
    }
	
}