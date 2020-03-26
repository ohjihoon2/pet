package com.pettoday.vo;

public class WonderAnswerReplyVO {

	int wonder_answer_reply_no , wonder_answer_no;
	String wonder_answer_reply_writer , wonder_answer_reply_content, wonder_answer_reply_date;
	
	
	
	public int getWonder_answer_no() {
		return wonder_answer_no;
	}
	public void setWonder_answer_no(int wonder_answer_no) {
		this.wonder_answer_no = wonder_answer_no;
	}
	public int getWonder_answer_reply_no() {
		return wonder_answer_reply_no;
	}
	public void setWonder_answer_reply_no(int wonder_answer_reply_no) {
		this.wonder_answer_reply_no = wonder_answer_reply_no;
	}
	public String getWonder_answer_reply_writer() {
		return wonder_answer_reply_writer;
	}
	public void setWonder_answer_reply_writer(String wonder_answer_reply_writer) {
		this.wonder_answer_reply_writer = wonder_answer_reply_writer;
	}
	public String getWonder_answer_reply_content() {
		return wonder_answer_reply_content;
	}
	public void setWonder_answer_reply_content(String wonder_answer_reply_content) {
		this.wonder_answer_reply_content = wonder_answer_reply_content.replace("\r\n", "<br>");
	}
	public String getWonder_answer_reply_date() {
		return wonder_answer_reply_date;
	}
	public void setWonder_answer_reply_date(String wonder_answer_reply_date) {
		this.wonder_answer_reply_date = wonder_answer_reply_date;
	}
	
	
	  
	  
	  
}
