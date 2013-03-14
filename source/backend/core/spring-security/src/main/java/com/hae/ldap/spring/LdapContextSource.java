/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.ldap.spring;

import com.hae.security.properties.LdapProperties;


/**
 * We had to extend the spring core ldap context source so we
 * can pass in values that have been encrypted in the properties file.
 * 
 * @author chrispurtell
 *
 */
public class LdapContextSource extends org.springframework.ldap.core.support.LdapContextSource {

	private LdapProperties ldapProperties;
	
	
	public LdapProperties getLdapProperties() {
		return ldapProperties;
	}

	public void setLdapProperties(LdapProperties ldapProperties) {
		this.ldapProperties = ldapProperties;
	}

	public void init()
	{
		
		//this.setPassword(this.ldapProperties.getPassword());
	}
}