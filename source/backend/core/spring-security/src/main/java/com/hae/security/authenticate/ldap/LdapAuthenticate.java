/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.security.authenticate.ldap;

import com.hae.ldap.spring.LdapContextSource;
import com.hae.security.authenticate.exceptions.InvalidUseridPasswordException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ldap.core.DistinguishedName;
import org.springframework.ldap.core.LdapTemplate;
import org.springframework.ldap.filter.EqualsFilter;

public class LdapAuthenticate {
    
 	@Autowired
	private LdapContextSource ldapContextSource;      
    
        @Autowired
	private LdapTemplate ldapTemplate;

	public void setLdapTemplate(LdapTemplate ldapTemplate) {
            this.ldapTemplate = ldapTemplate;
	}
	public void setLdapContextSource(LdapContextSource ldapContextSource) {
            this.ldapContextSource = ldapContextSource;
	}

	public boolean authenticate(String userName, String password) throws Exception {
            if (password.length()<1 || userName.length()<1)
            {
		throw new InvalidUseridPasswordException();
            }
            boolean isValid = ldapTemplate.authenticate(DistinguishedName.EMPTY_PATH, (new EqualsFilter("uid", userName)).toString(), password);
            System.out.println("IN LDAPAUTHENTICATE: VALID???????? " + isValid);
            if (!isValid)
            {
                throw new InvalidUseridPasswordException();
            }
            
            return isValid;
	}

}
