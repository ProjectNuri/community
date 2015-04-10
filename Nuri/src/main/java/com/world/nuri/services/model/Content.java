package com.world.nuri.services.model;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import com.world.nuri.services.model.abstractModel.GenericModel;

@Entity
public class Content extends GenericModel {

	private static final long serialVersionUID = 1L;

	@NotNull
	private String boardId;
	private String contents;
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
//	public User getAuthor() {
//		return author;
//	}
//	public void setAuthor(User author) {
//		this.author = author;
//	}
}
