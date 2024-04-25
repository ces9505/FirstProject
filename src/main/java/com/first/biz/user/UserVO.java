package com.first.biz.user;

import java.util.Date;



public class UserVO {

	private String userid;;
	private String userpw;
	private Date time;
	private int score;
	private String name;
	private String email;
	private String phone;
	private String level;
	private String blockdate;
	private String remarks;
	
	
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getBlockdate() {
		return blockdate;
	}
	public void setBlockdate(String blockdate) {
		this.blockdate = blockdate;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public Date getTime() {
		return time;
	}

	
	
	
	
	
}
