package com.hae.security.properties;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

//import com.geico.encrypted.properties.impl.EncryptedProperties;

public class LdapProperties {

	private static String BASE_PROPERTY = "base";
	private static String URL_PROPERTY = "url";
	private static String USERDN_PROPERTY = "userdn";
	private static String PASSWORD_PROPERTY = "password";
	
  //  private EncryptedProperties properties;
    
    /*
	public LdapProperties(String fileName)
	{
		try {
		    properties = new EncryptedProperties();
			properties.load(new FileInputStream(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public EncryptedProperties getProperties() {
		return properties;
	}


	public void setProperties(EncryptedProperties properties) {
		this.properties = properties;
	}


	public String getUserdn()
	{
		return this.getProperties().getProperty(LdapProperties.USERDN_PROPERTY);
	}
	
	public String getPassword()
	{
		return this.getProperties().getProperty(LdapProperties.PASSWORD_PROPERTY);
	}	
	
	public String getUrl()
	{
		return this.getProperties().getProperty(LdapProperties.URL_PROPERTY);
	}
	
	public String getBase()
	{
		return this.getProperties().getProperty(LdapProperties.BASE_PROPERTY);
	}
	*/
}
