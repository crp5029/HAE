/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.security.authenticate.ldap;

import org.springframework.ldap.core.DistinguishedName;
import org.springframework.ldap.core.LdapTemplate;
import org.springframework.ldap.filter.EqualsFilter;
import org.springframework.ldap.core.ContextSource;

import com.hae.security.authenticate.exceptions.InvalidUseridPasswordException;
import org.springframework.ldap.filter.AndFilter;

public class LdapAuthenticate {

	private LdapTemplate ldapTemplate;

	@SuppressWarnings("unused")
	private ContextSource contextSource;

	public void setLdapTemplate(LdapTemplate ldapTemplate) {
            this.ldapTemplate = ldapTemplate;
	}
	public void setContextSource(ContextSource contextSource) {
            this.contextSource = contextSource;
	}

	public boolean authenticate(String userName, String password) throws Exception {
            System.out.println("INSIDE LDAPAUTHENTICATE: " + userName + " " + password);
            if (password.length()<1 || userName.length()<1)
            {
		throw new InvalidUseridPasswordException();
            }

            //boolean isVaild = ldapTemplate.authenticate(DistinguishedName.EMPTY_PATH, (new EqualsFilter("sAMAccountName", userName)).toString(), password);
            AndFilter filter = new AndFilter();

            filter.and(new EqualsFilter("objectclass", "inetOrgPerson")).and(new EqualsFilter("uid", userName));
            boolean isValid = ldapTemplate.authenticate(DistinguishedName.EMPTY_PATH, filter.toString(), password);
            if (!isValid)
            {
                throw new InvalidUseridPasswordException();
            }
            
            return isValid;
	}

}
