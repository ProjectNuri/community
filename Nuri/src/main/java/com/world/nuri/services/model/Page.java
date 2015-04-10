package com.world.nuri.services.model;

import javax.persistence.Entity;

import com.world.nuri.services.model.abstractModel.GenericModel;

@Entity
public class Page extends GenericModel {

	private static final long serialVersionUID = 1L;
	
	private Integer pageTypeId;
//	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
//	@JoinColumn(name = "boardId", referencedColumnName="id", insertable=false, updatable=false)
//	@OrderBy("createdDate DESC")
//	private List<Content> contents;
	
	public Integer getPageTypeId() {
		return pageTypeId;
	}
	public void setPageTypeId(Integer pageTypeId) {
		this.pageTypeId = pageTypeId;
	}
//	public List<Content> getContents() {
//		if(contents == null) contents = new ArrayList<Content>();
//		return contents;
//	}
//	public void setContents(List<Content> contents) {
//		this.contents = contents;
//	}
}
