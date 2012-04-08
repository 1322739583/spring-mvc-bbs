package com.joven.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="bbs_user")
public class User {
	private String id;
	private String passWord;
	private boolean sex;
	private String email;
	private boolean forbidden;
	private Date regDate;
	private int totalTopics;
	private int totalReplys;
	private int role;
	private String face;

	@Column(name="roleid")
	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public boolean getSex() {
		return sex;
	}

	public void setSex(boolean sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean getForbidden() {
		return forbidden;
	}

	public void setForbidden(boolean forbidden) {
		this.forbidden = forbidden;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getTotalTopics() {
		return totalTopics;
	}

	public void setTotalTopics(int totalTopics) {
		this.totalTopics = totalTopics;
	}

	public int getTotalReplys() {
		return totalReplys;
	}

	public void setTotalReplys(int totalReplys) {
		this.totalReplys = totalReplys;
	}

	public String getFace() {
		return face;
	}

	public void setFace(String face) {
		this.face = face;
	}

	@Id
	@Column(name="userID")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}