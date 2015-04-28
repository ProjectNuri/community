package com.world.nuri.web.controller.api;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.world.nuri.services.service.GenericService;

public abstract class GenericApiController<T> {

	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired GenericService<T> genericService;
	
	@ResponseBody
	@RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
	public T get(@PathVariable Integer id) {
		return genericService.get(id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/gets", method = RequestMethod.GET)
	public List<T> gets() {
		return genericService.gets();
	}
	
	@ResponseBody
	@RequestMapping(value = "/gets/{keyword}", method = RequestMethod.GET)
	public List<T> gets(@RequestParam String keyword, @RequestParam String[] keys) {
		return genericService.search(keyword, keys);
	}
	
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public T update(@PathVariable Integer id, @RequestBody T entity) {
		return genericService.update(entity);
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public Integer delte(@PathVariable Integer id) {
		return genericService.delete(id);
	}
}
