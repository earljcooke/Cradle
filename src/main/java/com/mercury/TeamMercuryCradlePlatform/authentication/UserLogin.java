package com.mercury.TeamMercuryCradlePlatform.authentication;

import com.mercury.TeamMercuryCradlePlatform.model.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class UserLogin implements UserDetails {
    private User user;

    public UserLogin(User user) {
        this.user = user;
    }

    @Override //Grants users authorities based on his/her roles
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> roles = new ArrayList<>();
        this.user.getRoles().forEach(p -> {
            GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + p);
            roles.add(authority);
        });
        return roles;
    }

    @Override
    public String getPassword() {
        return this.user.getPassword();
    }

    @Override
    public String getUsername() {
        return this.user.getUserId().toString();
    }

    public String getUserEmail() {
        return this.user.getEmail();
    }

    public Integer getUserId() {
        return this.user.getUserId();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
