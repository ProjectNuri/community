package com.world.nuri.services.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.world.nuri.services.model.Menu;

@Service
@Transactional
public class MenuService extends GenericService<Menu> {
	
}
