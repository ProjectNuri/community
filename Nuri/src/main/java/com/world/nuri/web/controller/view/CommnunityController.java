package com.world.nuri.web.controller.view;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.world.nuri.services.model.Content;
import com.world.nuri.services.model.Tag;
import com.world.nuri.services.service.ContentService;
import com.world.nuri.services.service.ContentTagService;
import com.world.nuri.services.service.TagService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/community")
public class CommnunityController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommnunityController.class);
	
	@Autowired ContentService contentService;
	@Autowired TagService tagService;
	@Autowired ContentTagService contentTagService;
	
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
	
	@ResponseBody
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public List<Content> search(@RequestParam() String[] tags
			, @RequestParam() String[] key_and
			, @RequestParam() String[] key_or
			, HttpServletRequest request, Model model) {
		
		
		List<Content> contents = new ArrayList<Content>();
		if (tags.length != 0) {
			List<Tag> tagList = new ArrayList<Tag>();
			for (String tag : tags) {
				Tag temp = tagService.getByKey("name", tag);
				if (temp != null) {
					tagList.add(temp);
				}
			}
			
			contents = contentTagService.listByTags(tagList)
					.stream()
					.map(e -> e.getContent())
					.collect(Collectors.toList());
		} else {
			contents = contentService.list();
		}
		
		return contents;
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
