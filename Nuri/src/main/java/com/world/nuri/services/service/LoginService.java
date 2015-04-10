package com.world.nuri.services.service;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

@Component("loginService")
public class LoginService implements UserDetailsService {

//	@Autowired EmployeeService employeeService;
//	@Autowired AdminService adminService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserDetails userDetails = null;
//		try {
//			Employee employee = employeeService.getById(username.toUpperCase());
//			if(employee != null) {
//				Admin admin = adminService.getById(employee.getId());
//				if(admin == null) throw new Exception("Not admin user Error");
//				userDetails = new User(employee.getId(), employee.getPassword(), true, true, true, true, getAuthorities());
//			}
//		} catch (UsernameNotFoundException e){
//			throw e;
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		return userDetails;
	}
	
	public Collection<GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
		
		authList.add(new SimpleGrantedAuthority("ROLE_USER"));
		
		return authList;
	}

}
