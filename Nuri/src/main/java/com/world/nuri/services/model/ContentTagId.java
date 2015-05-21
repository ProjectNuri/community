package com.world.nuri.services.model;

import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;

@Embeddable
public class ContentTagId implements java.io.Serializable {
	
	@ManyToOne
	private Content content;
	@ManyToOne
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
