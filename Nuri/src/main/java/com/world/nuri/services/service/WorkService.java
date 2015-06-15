package com.world.nuri.services.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.world.nuri.services.model.Work;

@Service
@Transactional
public class WorkService extends GenericService<Work> {
	
}
