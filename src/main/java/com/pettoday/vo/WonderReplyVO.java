package com.pettoday.vo;

public class WonderReplyVO {

	int wonder_reply_no , wonder_no, wonder_reply_count;
	String wonder_reply_writer , wonder_reply_content ,wonder_reply_date;
	
	
	public int getWonder_reply_count() {
		return wonder_reply_count;
	}
	public void setWonder_reply_count(int wonder_reply_count) {
		this.wonder_reply_count = wonder_reply_count;
	}
	public int getWonder_reply_no() {
		return wonder_reply_no;
	}
	public void setWonder_reply_no(int wonder_reply_no) {
		this.wonder_reply_no = wonder_reply_no;
	}
	public int getWonder_no() {
		return wonder_no;
	}
	public void setWonder_no(int wonder_no) {
		this.wonder_no = wonder_no;
	}
	public String getWonder_reply_writer() {
		return wonder_reply_writer;
	}
	public void setWonder_reply_writer(String wonder_reply_writer) {
		this.wonder_reply_writer = wonder_reply_writer;
	}
	public String getWonder_reply_content() {
		return wonder_reply_content;
	}
	public void setWonder_reply_content(String wonder_reply_content) {
		this.wonder_reply_content = wonder_reply_content.replace("\r\n", "<br>");
	}
	public String getWonder_reply_date() {
		return wonder_reply_date;
	}
	public void setWonder_reply_date(String wonder_reply_date) {
		this.wonder_reply_date = wonder_reply_date;
	}

	
	
}
