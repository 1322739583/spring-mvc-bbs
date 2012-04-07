package com.joven.model;

import java.util.Date;

import javax.persistence.Column;
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
@Table(name="bbs_reply")
public class Reply {
	private int ID;
	private String title;
	private int topicID;
	private String Content;
	private int building;
	private Date replyDate;
	private Date lastUpdate;
	private User author;


	@Id
	 @GeneratedValue(strategy = GenerationType.TABLE,generator="reply_generator")
	 @TableGenerator(name = "reply_generator",table="BBS_GENERATOR",pkColumnName="gen_name",valueColumnName="gen_value",pkColumnValue="reply_pk",allocationSize=1)
	@Column(name="ReplyID")
	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	@Column(name="ReplyTitle")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	public int getTopicID() {
		return topicID;
	}

	public void setTopicID(int topicID) {
		this.topicID = topicID;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	public int getBuilding() {
		return building;
	}

	public void setBuilding(int building) {
		this.building = building;
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