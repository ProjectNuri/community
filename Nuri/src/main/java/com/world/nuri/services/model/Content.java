package com.world.nuri.services.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.validation.constraints.NotNull;

import com.world.nuri.services.model.abstractModel.GenericModel;

@Entity
public class Content extends GenericModel {

	private static final long serialVersionUID = 1L;

	@NotNull
	private String boardId;
	private String description;
	private String thumbnailUrl;
	private Integer views;
	private Integer likes;
	private Integer favorites;

	@OneToMany(fetch = FetchType.EAGER, cascade=CascadeType.ALL)
	@JoinColumn(name="contentId", referencedColumnName="id")
	@OrderBy("createdDate DESC")
	private List<ContentTag> contentTags;

	//	private User author;

	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public String getThumbnailUrl() {
		return thumbnailUrl;
	}
	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}
	public Integer getViews() {
		return views;
	}
	public void setViews(Integer views) {
		this.views = views;
	}
	public Integer getLikes() {
		return likes;
	}
	public void setLikes(Integer likes) {
		this.likes = likes;
	}
	public Integer getFavorites() {
		return favorites;
	}
	public void setFavorites(Integer favorites) {
		this.favorites = favorites;
	}
	public List<ContentTag> getContentTags() {
		return contentTags;
	}
	public void setContentTags(List<ContentTag> contentTags) {
		this.contentTags = contentTags;
	}

	
//	public User getAuthor() {
//		return author;
//	}
//	public void setAuthor(User author) {
//		this.author = author;
//	}
}
