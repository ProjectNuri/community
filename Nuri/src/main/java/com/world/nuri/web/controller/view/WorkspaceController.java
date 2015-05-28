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
@RequestMapping("/workspace")
public class WorkspaceController {
	
	private static final Logger logger = LoggerFactory.getLogger(WorkspaceController.class);
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String main(HttpServletRequest request, Model model) {
		return "workspace/main";
	}
	
}
