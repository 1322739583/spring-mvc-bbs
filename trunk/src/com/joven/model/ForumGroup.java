package com.joven.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

@Entity
@Table(name="bbs_forumgroups")
public class ForumGroup {
	private int id;
	private String name;
	private int order;
	private Set<Forum> forums=new HashSet<Forum>();
	
	@Id
    @GeneratedValue(strategy = GenerationType.TABLE,generator="forumgroup_generator")
    @TableGenerator(name = "forumgroup_generator",table="BBS_GENERATOR",pkColumnName="gen_name",valueColumnName="gen_value",pkColumnValue="forumgroup_pk",allocationSize=1)
	@Column(name="FGID")
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="FGName")
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name="FGOrder")
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	
	@OneToMany(mappedBy="forumGroup",fetch=FetchType.LAZY)
	@OrderBy("id") 
	public Set<Forum> getForums() {
		return forums;  
	}
	public void setForums(Set<Forum> forums) {
		this.forums = forums;
	}
	
}
