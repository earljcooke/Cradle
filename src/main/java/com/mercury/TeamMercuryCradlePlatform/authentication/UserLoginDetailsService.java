package com.mercury.TeamMercuryCradlePlatform.authentication;

import com.mercury.TeamMercuryCradlePlatform.model.User;
import com.mercury.TeamMercuryCradlePlatform.repository.UserRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserLoginDetailsService implements UserDetailsService {
    private UserRepository userRepository;

    public UserLoginDetailsService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override  //Finds user with matching email
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        //User user = this.userRepository.findByUserId(Integer.valueOf(s));
        User user = this.userRepository.findByEmail(s);
        UserLogin userLogin = new UserLogin(user);
        return userLogin;
    }
}
