package com.world.nuri.services.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.world.nuri.services.model.Tag;

@Service
@Transactional
public class TagService extends GenericService<Tag> {
	
}
