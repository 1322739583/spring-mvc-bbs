package com.joven.model;

import java.io.Serializable;

import javax.persistence.Column;


public class ForumPermissionPK implements Serializable {
	private static final long serialVersionUID = -5405036959712204148L;
	private Integer roleID;
	private Integer forumID;
	
	@Override
	public int hashCode() {
		int rt=roleID.hashCode();
		rt=29*rt+forumID.hashCode();
		return rt;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this==obj) return true;
		if (!(obj instanceof ForumPermissionPK)) return false;
		
		ForumPermissionPK pk=(ForumPermissionPK)obj;
		if (!this.forumID.equals(pk.getForumID())) return false;
		if (!this.roleID.equals(pk.getRoleID())) return false;
		return true;
	}
	
	public Integer getRoleID() {
		return roleID;
	}
	public void setRoleID(Integer roleID) {
		this.roleID = roleID;
	}
	
	@Column(nullable=false)
	public Integer getForumID() {
		return forumID; 
	}
	public void setForumID(Integer forumID) {
		this.forumID = forumID;
	}

}