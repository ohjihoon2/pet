package com.pettoday.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class NoticeVO {
	String not_title, not_content, not_date;
	int not_no, not_hits, rno;


	public String getNot_title() {
		return not_title;
	}

	public void setNot_title(String not_title) {
		this.not_title = not_title;
	}



	public String getNot_content() {
		return not_content;
	}

	public void setNot_content(String not_content) {
		this.not_content = not_content;
	}

	public String getNot_date() {
		return not_date;
	}

	public void setNot_date(String not_date) {
		this.not_date = not_date;
	}

	public int getNot_no() {
		return not_no;
	}

	public void setNot_no(int not_no) {
		this.not_no = not_no;
	}

	public int getNot_hits() {
		return not_hits;
	}

	public void setNot_hits(int not_hits) {
		this.not_hits = not_hits;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}


}