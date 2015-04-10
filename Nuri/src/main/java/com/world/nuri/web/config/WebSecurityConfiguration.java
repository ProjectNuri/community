package com.world.nuri.web.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.world.nuri.services.service.LoginService;

//@Configuration
//@EnableWebSecurity
//@ComponentScan(basePackages={"com.gabia.deployment.mvc.services.service"})
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	@Qualifier("loginService")
	private LoginService loginService;
	
	@Bean
	public ShaPasswordEncoder passwordEncode() {
		return new ShaPasswordEncoder(256);
	}
	
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//		auth.inMemoryAuthentication()
		//.withUser("user").password("password").roles("USER");
		auth.userDetailsService(loginService).passwordEncoder(passwordEncode());
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**")
			.and().ignoring().antMatchers("/tiles/**");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
		http
			.authorizeRequests()
				.antMatchers("/resources/**").permitAll()
				.antMatchers("/tiles/**").permitAll()
				.antMatchers("/project/**").hasRole("USER")
				.antMatchers("/server/**").hasRole("USER")
				.antMatchers("/setting/**").hasRole("USER")
				.antMatchers("/login").anonymous()
				.anyRequest().authenticated()
				.and()
			.formLogin()
				.loginPage("/login").permitAll()
				.loginProcessingUrl("/login").permitAll()
				.failureUrl("/login?failed")
				.defaultSuccessUrl("/project", true)
				.and()
			.logout()
				.logoutUrl("/logout")
				.logoutSuccessUrl("/login?logout")
				.and()
			.rememberMe()
				.and()
//			.addFilterAfter(new SessionTimeoutFilter(), ExceptionTranslationFilter.class)
			.sessionManagement().maximumSessions(3*60*60);
	}
}
