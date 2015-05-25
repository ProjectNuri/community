package com.world.nuri.services.model;

import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Transient;

import com.world.nuri.services.model.abstractModel.GenericModel;

@Entity
@AssociationOverrides({
		@AssociationOverride(name = "pk.content", joinColumns = @JoinColumn(name = "contentId")),
		@AssociationOverride(name = "pk.tag", joinColumns = @JoinColumn(name = "tagId"))
})
public class ContentTag extends GenericModel{
	private static final long serialVersionUID = 1L;
	
	@EmbeddedId
	private ContentTagId pk = new ContentTagId();

	public ContentTagId getPk() {
		return pk;
	}

	public void setPk(ContentTagId pk) {
		this.pk = pk;
	}
	
	@Transient
	public Content getContent() {
		return getPk().getContent();
	}
	public void setContent(Content content) {
		getPk().setContent(content);
	}
	
	@Transient
	public Tag getTag() {
		return getPk().getTag();
	}
	public void setTag(Tag tag) {
		getPk().setTag(tag);
	}
}
