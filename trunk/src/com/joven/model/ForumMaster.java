package com.joven.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="bbs_forummaster")
public class ForumMaster {
	private String id;
	private int forumID;
	private String userID;
	
	@Id
	@Column(name="mngID")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Column(nullable=false)
	public int getForumID() {
		return forumID;
	}
	public void setForumID(int forumID) {
		this.forumID = forumID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
}
