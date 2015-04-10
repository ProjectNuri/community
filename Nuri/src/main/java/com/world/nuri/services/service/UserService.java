package com.world.nuri.services.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.world.nuri.services.model.User;

@Service
@Transactional
public class UserService extends GenericService<User> {
	
}
