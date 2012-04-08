package com.joven.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="bbs_forumpermission")
public class ForumPermission {
	private String id;
	private boolean viewList;
	private boolean viewDetail;
	private boolean addTopic;
	private boolean replyTopic;
	private boolean modifyTopic;
	private boolean deleteTopic;
	
	@Id
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public boolean getViewList() {
		return viewList;
	}
	public void setViewList(boolean viewList) {
		this.viewList = viewList;
	}
	public boolean getViewDetail() {
		return viewDetail;
	}
	public void setViewDetail(boolean viewDetail) {
		this.viewDetail = viewDetail;
	}
	public boolean getAddTopic() {
		return addTopic;
	}
	public void setAddTopic(boolean addTopic) {
		this.addTopic = addTopic;
	}
	public boolean getReplyTopic() {
		return replyTopic;
	}
	public void setReplyTopic(boolean replyTopic) {
		this.replyTopic = replyTopic;
	}
	public boolean getModifyTopic() {
		return modifyTopic;
	}
	public void setModifyTopic(boolean modifyTopic) {
		this.modifyTopic = modifyTopic;
	}
	public boolean getDeleteTopic() {
		return deleteTopic;
	}
	public void setDeleteTopic(boolean deleteTopic) {
		this.deleteTopic = deleteTopic;
	}

}