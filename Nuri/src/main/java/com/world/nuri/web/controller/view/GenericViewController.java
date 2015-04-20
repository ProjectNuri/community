package com.world.nuri.web.controller.view;

import org.apache.log4j.Logger;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public abstract class GenericViewController<T> {

	private Logger logger = Logger.getLogger(this.getClass());
	
//	@Autowired GenericService<T> genericService;
	
	@RequestMapping(value = "/template/top", method = RequestMethod.GET)
	public String top(Model model) {
		return "left";
	}
	
	@RequestMapping(value = "/template/bottom", method = RequestMethod.GET)
	public String bottom(Model model) {
		return "left";
	}
	
	@RequestMapping(value = "/template/left", method = RequestMethod.GET)
	public String left(Model model) {
		return "left";
	}
	
	@RequestMapping(value = "/template/right", method = RequestMethod.GET)
	public String right(Model model) {
		return "left";
	}
}
