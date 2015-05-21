package com.world.nuri.services.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;

import com.world.nuri.services.model.abstractModel.GenericModel;

@Entity
public class Tag extends GenericModel {

	private static final long serialVersionUID = 1L;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "pk.tag", cascade=CascadeType.ALL)
	private Set<ContentTag> ContentTags = new HashSet<ContentTag>(0);

	public Set<ContentTag> getContentTags() {
		return ContentTags;
	}
	public void setContentTags(Set<ContentTag> contentTags) {
		ContentTags = contentTags;
	}
	
}
