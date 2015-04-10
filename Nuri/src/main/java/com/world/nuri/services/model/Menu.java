package com.world.nuri.services.model;

import javax.persistence.Entity;

import com.world.nuri.services.model.abstractModel.TreeModel;

@Entity
public class Menu extends TreeModel<Menu> {

	private static final long serialVersionUID = 1L;
	
	private String link;
	
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
}
