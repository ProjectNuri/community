package com.world.nuri.services.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.world.nuri.services.model.abstractModel.GenericModel;

@Entity
public class ContentTag extends GenericModel{
	private static final long serialVersionUID = 1L;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="contentId", referencedColumnName="id")
	private Content content;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="tagId", referencedColumnName="id")
	private Tag tag;

	public Content getContent() {
		return content;
	}

	public void setContent(Content content) {
		this.content = content;
	}

	public Tag getTag() {
		return tag;
	}

	public void setTag(Tag tag) {
		this.tag = tag;
	}
	

}
