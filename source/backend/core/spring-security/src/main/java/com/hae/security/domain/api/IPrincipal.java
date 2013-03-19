/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hae.security.domain.api;

/**
 *
 * @author chrispurtell
 */
public interface IPrincipal {

	public String getFirstName();
	public void setFirstName(String firstName);
	public String getLastName();
	public void setLastName(String lastName);
	public String getId();
	public void setId(String id);
}
