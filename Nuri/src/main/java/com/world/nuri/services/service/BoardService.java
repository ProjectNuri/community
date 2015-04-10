package com.world.nuri.services.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.world.nuri.services.model.Board;

@Service
@Transactional
public class BoardService extends GenericService<Board> {
	
}
