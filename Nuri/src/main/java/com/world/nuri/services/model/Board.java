package com.world.nuri.services.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

import com.world.nuri.services.model.abstractModel.GenericModel;

@Entity
public class Board extends GenericModel {

	private static final long serialVersionUID = 1L;
	
//	@OneToOne(fetch = FetchType.EAGER)
//	@JoinColumns({@JoinColumn(name = "groupId", referencedColumnName="groupId", insertable=false, updatable=false), @JoinColumn(name = "artifactId", referencedColumnName="artifactId", insertable=false, updatable=false)})
	
//	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "boardId", referencedColumnName="id", insertable=false, updatable=false)
	@OrderBy("createdDate DESC")
	private List<Content> contents;
	
	public List<Content> getContents() {
		if(contents == null) contents = new ArrayList<Content>();
		return contents;
	}

	public void setContents(List<Content> contents) {
		this.contents = contents;
	}
}
