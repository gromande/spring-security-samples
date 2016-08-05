package com.groman.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ldap.core.support.LdapContextSource;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

@EnableWebSecurity
public class SecurityConfig {

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        LdapContextSource ctxSrc = new LdapContextSource();
        ctxSrc.setUrl("ldap://localhost:1389");
        ctxSrc.setBase("dc=example,dc=com");
        ctxSrc.setUserDn("cn=directory manager");
        ctxSrc.setPassword("password");
        ctxSrc.afterPropertiesSet();
        
        auth
        .ldapAuthentication()
        .contextSource(ctxSrc)
        .userSearchBase("ou=people")
        //Either an LdapUserSearch or DN pattern (or both) must be supplied.
        //.userDnPatterns("uid={0},ou=people")
        .userSearchFilter("(|(uid={0})(mail={0}))")
        .groupRoleAttribute("cn") //Default is CN
        //.rolePrefix("ROLE-")  Add prefix to role name
        .groupSearchBase("ou=groups");
        //.groupSearchFilter("(objectClass=groupOfUniqueNames)");
    }

}
