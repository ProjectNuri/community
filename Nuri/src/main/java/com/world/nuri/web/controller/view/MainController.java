package com.world.nuri.web.controller.view;

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
@RequestMapping("/")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String main(HttpServletRequest request, Model model) {
		return "template/main";
	}
	
	@RequestMapping(value = "floatnav", method = RequestMethod.GET)
	public String floatnav(HttpServletRequest request, Model model) {
		return "common/floatnav";
	}
	
	@RequestMapping(value = "iconSvg", method = RequestMethod.GET)
	public String iconSvg(HttpServletRequest request, Model model) {
		return "common/iconSvg";
	}
	
}
