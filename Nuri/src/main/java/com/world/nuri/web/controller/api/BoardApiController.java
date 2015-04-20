package com.world.nuri.web.controller.api;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.world.nuri.services.model.Board;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("api/board")
public class BoardApiController extends GenericApiController<Board> {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardApiController.class);
}
