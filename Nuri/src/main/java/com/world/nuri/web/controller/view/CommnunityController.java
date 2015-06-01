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

import com.world.nuri.services.model.Content;
import com.world.nuri.services.service.ContentService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/community")
public class CommnunityController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommnunityController.class);
	
	@Autowired ContentService contentService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String main(HttpServletRequest request, Model model) {
		model.addAttribute(Content.class.getSimpleName() + "s", contentService.list());
		return "template/community";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, Model model) {
		model.addAttribute(Content.class.getSimpleName() + "s", contentService.list());
		return "community/list";
	}
	
	@RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
	public String view(@PathVariable Integer id, HttpServletRequest request, Model model) {
		model.addAttribute(Content.class.getSimpleName(), contentService.get(1));
		return "community/view";
	}
	
	@RequestMapping(value = "/contents2", method = RequestMethod.GET)
	public String contents2(HttpServletRequest request, Model model) {
		model.addAttribute(Content.class.getSimpleName(), contentService.get(1));
		return "board_contents2";
	}
	
	@RequestMapping(value = "/viewon", method = RequestMethod.GET)
	public String viewon(HttpServletRequest request, Model model) {
//		model.addAttribute(Content.class.getSimpleName(), contentService.get(1));
		return "community/sider/leftSider";
	}
}
