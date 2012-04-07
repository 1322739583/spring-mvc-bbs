package com.joven.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import com.joven.model.User;

@Entity
@Table(name="bbs_topics")
public class Topic {
	private int forumID;
	private int topicID;
	private Date postTime;
	private Date lastReplyDate;
	private int totalReply;
	private String lastReplyUserID;
	private String title;
	private boolean setTop;
	private String content;
	private Date lastUpdate;
	private User author;

	public Date getLastReplyDate() {
		return lastReplyDate;
	}

	public void setLastReplyDate(Date lastReplyDate) {
		this.lastReplyDate = lastReplyDate;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.TABLE,generator="topic_generator")
	@TableGenerator(name = "topic_generator",table="BBS_GENERATOR",pkColumnName="gen_name",valueColumnName="gen_value",pkColumnValue="topic_pk",allocationSize=1)
	public int getTopicID() {
		return topicID;
	}

	public void setTopicID(int topicID) {
		this.topicID = topicID;
	}

	public Date getPostTime() {
		return postTime;
	}

	public void setPostTime(Date postTime) {
		this.postTime = postTime;
	}

	public int getTotalReply() { 
		return totalReply;
	}

	public void setTotalReply(int totalReply) {
		this.totalReply = totalReply;
	}

	public String getLastReplyUserID() {
		return lastReplyUserID;
	}

	public void setLastReplyUserID(String lastReplyUserID) {
		this.lastReplyUserID = lastReplyUserID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public boolean getSetTop() {
		return setTop; 
	}

	public void setSetTop(boolean setTop) {
		this.setTop = setTop;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getForumID() {
		return forumID;
	}

	public void setForumID(int forumID) {
		this.forumID = forumID;
	}

	public Date getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="userID")
	public User getAuthor() {
		return author;
	}

	public void setAuthor(User author) {
		this.author = author;
	}

}