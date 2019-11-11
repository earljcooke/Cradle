package com.mercury.TeamMercuryCradlePlatform.configuration;

import com.mercury.TeamMercuryCradlePlatform.authentication.UserLoginDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.util.Set;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserLoginDetailsService userLoginDetailsService;

    public WebSecurityConfiguration(UserLoginDetailsService userLoginDetailsService) {
        this.userLoginDetailsService = userLoginDetailsService;
    }

    @Autowired
    private DataSource dataSource;

    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
        daoAuthenticationProvider.setPasswordEncoder(passwordEncoder());
        daoAuthenticationProvider.setUserDetailsService(this.userLoginDetailsService);
        return daoAuthenticationProvider;
    }

    @Override //data-base authentication
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authenticationProvider());
    }


    @Override //HTTP authentication based on role
    protected void configure(HttpSecurity httpSecurity) throws Exception {
        httpSecurity
                .csrf().disable()
            .authorizeRequests()
                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/vht/**").hasAnyRole("ADMIN", "VHT")
                .antMatchers("/healthworker/**").hasRole("HEALTHWORKER")
                .antMatchers("/patient/**").hasAnyRole("ADMIN", "HEALTHWORKER", "VHT")
                .antMatchers("/profile/**").hasAnyRole("ADMIN", "HEALTHWORKER", "VHT")
                .antMatchers("/reading/**").hasAnyRole("ADMIN", "HEALTHWORKER", "VHT")
                .antMatchers("/referral/**").hasAnyRole("ADMIN", "HEALTHWORKER", "VHT")
                .antMatchers("/statistics/**").hasAnyRole("ADMIN", "HEALTHWORKER", "VHT")
                .and()
            .formLogin()
                .successHandler(new AuthenticationSuccessHandler() {
                    @Override
                    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
                        Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
                        if(roles.contains("ROLE_ADMIN")) {
                            httpServletResponse.sendRedirect("/admin/index");
                        } else if(roles.contains("ROLE_VHT")) {
                            httpServletResponse.sendRedirect("/vht/index");
                        } else if(roles.contains("ROLE_HEALTHWORKER")) {
                            httpServletResponse.sendRedirect("/healthworker/index");
                        } else {

                        }
                    }
                })
                .loginPage("/login")
                .permitAll()
                .and()
            .logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout")).logoutSuccessUrl("/login")
                .permitAll();
    }

}
