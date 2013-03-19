package com.hae.security.dao.ldap.ad;

import com.hae.ldap.spring.LdapContextSource;
import com.hae.security.domain.impl.PrincipalImpl;
import java.util.List;
import javax.naming.NamingException;
import javax.naming.directory.Attributes;
import org.springframework.ldap.core.AttributesMapper;
import org.springframework.ldap.core.DistinguishedName;
import org.springframework.ldap.core.LdapTemplate;
import org.springframework.ldap.filter.EqualsFilter;


/**
 * Data Access Object for the Principal Domain Object. 
 * 
 * This will be going against the corporate Active Directory.
 * 
 * @author chrispurtell
 *
 */
public class PrincipalDao {

/*	private LdapTemplate ldapTemplate;

	@SuppressWarnings("unused")
	private LdapContextSource ldapContextSource;
	
	
	public void setLdapTemplate(LdapTemplate ldapTemplate) {
		this.ldapTemplate = ldapTemplate;
	}
	
	public void setContextSource(LdapContextSource ldapContextSource) {
		this.ldapContextSource = ldapContextSource;
	}
        
   private class PrincipalAttributesMapper implements AttributesMapper {
      public Object mapFromAttributes(Attributes attrs) throws NamingException {
         PrincipalImpl principal = new PrincipalImpl();
         principal.setFirstName((String)attrs.get("cn").get());
         principal.setLastName((String)attrs.get("sn").get());
         principal.setId((String)attrs.get("title").get());
         return principal;
      }
   }
	
	@SuppressWarnings("unchecked")
	public List<Object> findById(String anID)
	{
            
		return ldapTemplate.search(
				DistinguishedName.EMPTY_PATH,
				(new EqualsFilter("uid", anID)).toString(),
				 new PrincipalAttributeMapper());
                return ldapTemplate.search(
				DistinguishedName.EMPTY_PATH,
				(new EqualsFilter("uid", anID)).toString(),
				 new PrincipalAttributesMapper());
	}
	
	*/
	
}
