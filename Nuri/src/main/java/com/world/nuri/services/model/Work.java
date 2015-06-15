package com.world.nuri.services.model;

import javax.persistence.Column;
import javax.persistence.Entity;

import com.world.nuri.services.model.abstractModel.GenericModel;

@Entity
public class Work extends GenericModel {

	private static final long serialVersionUID = 1L;
	@Column( length = 100000 )
	private String works;
	
	public String getWorks() {
		return works;
	}
	public void setWorks(String works) {
		this.works = works;
	}
	
}
