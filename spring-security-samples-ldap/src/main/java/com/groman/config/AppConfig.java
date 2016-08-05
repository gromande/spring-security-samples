package com.groman.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.ldap.core.LdapTemplate;
import org.springframework.ldap.core.support.LdapContextSource;

import com.groman.dao.UserDAO;
import com.groman.dao.UserDAOImpl;

@Configuration
public class AppConfig {
    
    @Bean
    public LdapContextSource ldapContextSource() {
        LdapContextSource ctxSrc = new LdapContextSource();
        ctxSrc.setUrl("ldap://localhost:1389");
        ctxSrc.setBase("dc=example,dc=com");
        ctxSrc.setUserDn("cn=directory manager");
        ctxSrc.setPassword("password");
        return ctxSrc;
    }
    
    @Bean
    public LdapTemplate ldapTemplate() {
        return new LdapTemplate(ldapContextSource());
    }
    
    @Bean
    public UserDAO userDAO() {
        return new UserDAOImpl();
    }

}
