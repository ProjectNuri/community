package com.world.nuri.services.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

import com.world.nuri.services.model.abstractModel.GenericModel;

@Entity
public class Content extends GenericModel {

	private static final long serialVersionUID = 1L;

	@NotNull
	private String boardId;
	private String contents;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "pk.content", cascade=CascadeType.ALL)
	private Set<ContentTag> ContentTags = new HashSet<ContentTag>(0);
//	private User author;

	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}

	public Set<ContentTag> getContentTags() {
		return ContentTags;
	}
	public void setContentTags(Set<ContentTag> contentTags) {
		ContentTags = contentTags;
	}

	
//	public User getAuthor() {
//		return author;
//	}
//	public void setAuthor(User author) {
//		this.author = author;
//	}
}
