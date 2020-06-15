package br.com.martins.biblioteca.conf;

import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@EnableWebSecurity
public class SecurityConfiguration 
    extends WebSecurityConfigurerAdapter {
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
        .antMatchers("/resources/**").permitAll()
        .antMatchers("/carrinho/**").permitAll()
        .antMatchers("/pagamento/**").permitAll()
        .antMatchers("/produto/form").hasRole("ADMIN")
        .antMatchers(HttpMethod.POST, "/produto").hasRole("ADMIN")
        .antMatchers(HttpMethod.GET, "/produto").permitAll()
        .antMatchers("/produto/**").permitAll()
        .antMatchers("/").permitAll()
        .anyRequest().authenticated()
        .and().formLogin();
    }

}
