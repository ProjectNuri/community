package com.world.nuri.web.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.world.nuri.services.service.LoginService;
import com.world.nuri.web.security.LoginFailureHandler;
import com.world.nuri.web.security.LoginSuccessHandler;
import com.world.nuri.web.security.LogoutSuccessHandler;

@Configuration
@EnableWebSecurity
@ComponentScan(basePackages={"com.world.nuri.services.service"})
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	@Qualifier("loginService")
	private LoginService loginService;
	
//	@Bean
//	public ShaPasswordEncoder passwordEncode() {
//		return new ShaPasswordEncoder(256);
//	}
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//		auth.inMemoryAuthentication()
//		auth.userDetailsService(loginService).passwordEncoder(passwordEncode());
		auth.userDetailsService(loginService);
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
//				.antMatchers("/resources/**").permitAll()
//				.antMatchers("/tiles/**").permitAll()
//				.antMatchers("/tiles/**").permitAll()
//				.antMatchers("/project/**").hasRole("USER")
//				.antMatchers("/server/**").hasRole("USER")
//				.antMatchers("/setting/**").hasRole("USER")
				.antMatchers("/**").permitAll()
				.antMatchers("/login").anonymous()
				.anyRequest().authenticated()
				.and()
			.formLogin()
				.loginPage("/").permitAll()
				.loginProcessingUrl("/login").permitAll()
//				.failureUrl("/?failed")
//				.defaultSuccessUrl("/?success", true)
				.usernameParameter("username")
				.passwordParameter("password")
				.failureHandler(new LoginFailureHandler())
				.successHandler(new LoginSuccessHandler())
				.and()
			.logout()
				.logoutUrl("/logout")
				.logoutSuccessUrl("/?logout")
				.logoutSuccessHandler(new LogoutSuccessHandler())
				.and()
			.rememberMe()
				.and()
//			.addFilterAfter(new SessionTimeoutFilter(), ExceptionTranslationFilter.class)
			.sessionManagement().maximumSessions(3*60*60);
	}
}
