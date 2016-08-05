package com.groman.dao;

import java.text.MessageFormat;
import java.util.List;

import javax.naming.NamingException;
import javax.naming.directory.Attributes;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ldap.core.AttributesMapper;
import org.springframework.ldap.core.LdapTemplate;

import com.groman.model.User;

public class UserDAOImpl implements UserDAO {
    
    private static final String USERS_BASE_DN = "ou=people";
    private static final String USERS_SEARCH_FILTER = "(|(uid={0})(mail={0}))";
    
    //LDAP Attributes
    private static final String USERNAME_ATTR = "uid";
    private static final String EMAIL_ATTR = "mail";
    private static final String FIRST_NAME_ATTR = "cn";
    private static final String LAST_NAME_ATTR = "sn";
    
    @Autowired
    private LdapTemplate ldapTemplate;
    
    private static final AttributesMapper<User> mapper = new AttributesMapper<User>() {
        
        public User mapFromAttributes(Attributes attributes) throws NamingException {
            User user = new User();
            if (attributes.get(USERNAME_ATTR) != null) {
                user.setUsername(attributes.get(USERNAME_ATTR).get().toString());
            }
            if (attributes.get(EMAIL_ATTR) != null) {
                user.setEmail(attributes.get(EMAIL_ATTR).get().toString());
            }
            if (attributes.get(FIRST_NAME_ATTR) != null) {
                user.setFirstName(attributes.get(FIRST_NAME_ATTR).get().toString());
            }
            if (attributes.get(LAST_NAME_ATTR) != null) {
                user.setLastName(attributes.get(LAST_NAME_ATTR).get().toString());
            }
            return user;
        }
    };

    public User getUser(String userId) {
        List<User> users = ldapTemplate.search(USERS_BASE_DN, MessageFormat.format(USERS_SEARCH_FILTER, userId), mapper);
        return (users != null && !users.isEmpty()) ? users.get(0) : null;
    }

}
