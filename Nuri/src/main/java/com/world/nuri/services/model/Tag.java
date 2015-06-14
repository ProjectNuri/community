package com.world.nuri.services.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

import com.world.nuri.services.model.abstractModel.GenericModel;

@Entity
public class Tag extends GenericModel {

	private static final long serialVersionUID = 1L;
	
	@OneToMany(fetch = FetchType.EAGER, cascade=CascadeType.ALL)
	@JoinColumn(name="tagId", referencedColumnName="id")
	@OrderBy("createdDate DESC")
	private List<ContentTag> contentTags;

	public List<ContentTag> getContentTags() {
		return contentTags;
	}

	public void setContentTags(List<ContentTag> contentTags) {
		this.contentTags = contentTags;
	}
	
}
