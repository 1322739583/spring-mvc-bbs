package com.joven.model;

import java.util.Date;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

@Entity
@Table(name="bbs_forum")
public class Forum {
	private int id;
	private String name;
	private String description;
	private int sortOrder;
	private int totalTopics;
	private int topicID;
	private String topicTitle;
	private Date topicDate; 
	private String userID;
	private ForumGroup forumGroup;
	
	private Set<ForumMaster> masters;
	private Set<ForumPermission> permission;

	@Id
    @GeneratedValue(strategy = GenerationType.TABLE,generator="forum_generator")
    @TableGenerator(name = "forum_generator",table="BBS_GENERATOR",pkColumnName="gen_name",valueColumnName="gen_value",pkColumnValue="forum_pk",allocationSize=1)
	@Column(name="ForumID")
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	
	@Column(name="ForumName")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getSortOrder() {
		return sortOrder;
	}
	public void setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}
	public int getTotalTopics() {
		return totalTopics;
	}
	public void setTotalTopics(int totalTopics) {
		this.totalTopics = totalTopics;
	}
	public int getTopicID() {
		return topicID;
	}
	public void setTopicID(int topicID) {
		this.topicID = topicID;
	}
	public String getTopicTitle() {
		return topicTitle;
	}
	public void setTopicTitle(String topicTitle) {
		this.topicTitle = topicTitle;
	}
	public Date getTopicDate() {
		return topicDate;
	}
	public void setTopicDate(Date topicDate) {
		this.topicDate = topicDate;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	@OneToMany(fetch=FetchType.LAZY)
	@JoinColumn(name="forumID") 
	@OrderBy("userID ASC") 
	public Set<ForumMaster> getMasters() {
		return masters;
	}
	
	public void setMasters(Set<ForumMaster> masters) {
		this.masters = masters;
	}
	
	@OneToMany(fetch=FetchType.LAZY)
	@JoinColumn(name="forumID")
	public Set<ForumPermission> getPermission() {
		return permission;
	}
	
	public void setPermission(Set<ForumPermission> permission) {
		this.permission = permission;
	}
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="ForumGroupID")
	public ForumGroup getForumGroup() {
		return forumGroup;
	} 
	
	public void setForumGroup(ForumGroup forumGroup) {
		this.forumGroup = forumGroup;
	}
	
	
}