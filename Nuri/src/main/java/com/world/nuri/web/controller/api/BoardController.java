package com.world.nuri.web.controller.api;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("api/board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String list(HttpServletRequest request, Model model) {
		return "board";
	}
	
	@RequestMapping(value = "/contents", method = RequestMethod.GET)
	public String contents(HttpServletRequest request, Model model) {
		return "board_contents";
	}
}
