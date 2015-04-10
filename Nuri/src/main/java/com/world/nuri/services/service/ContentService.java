package com.world.nuri.services.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.world.nuri.services.model.Content;

@Service
@Transactional
public class ContentService extends GenericService<Content> {
	
}
