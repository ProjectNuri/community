package com.world.nuri.web.controller.api;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.world.nuri.services.model.User;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("api/user")
public class UserApiController extends GenericApiController<User> {
	
	private static final Logger logger = LoggerFactory.getLogger(UserApiController.class);
}
