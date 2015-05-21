package com.world.nuri.web.controller.view;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.world.nuri.services.model.Board;
import com.world.nuri.services.model.Content;
import com.world.nuri.services.service.ContentService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired ContentService contentService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String main(HttpServletRequest request, Model model) {
		model.addAttribute(Content.class.getSimpleName() + "s", contentService.list());
		return "board";
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String board(@PathVariable Integer id, HttpServletRequest request, Model model) {
		List<Content> contents = contentService.listByParent(id, Board.class.getName());
		model.addAttribute(Content.class.getSimpleName() + "s", contents);
		return "board2";
	}
	
	@RequestMapping(value = "/contents", method = RequestMethod.GET)
	public String contents(HttpServletRequest request, Model model) {
		model.addAttribute(Content.class.getSimpleName(), (Content)contentService.get(1));
		return "board_contents";
	}
	
	@RequestMapping(value = "/contents2", method = RequestMethod.GET)
	public String contents2(HttpServletRequest request, Model model) {
		model.addAttribute(Content.class.getSimpleName(), (Content)contentService.get(1));
		return "board_contents2";
	}
}
