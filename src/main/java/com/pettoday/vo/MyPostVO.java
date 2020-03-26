package com.pettoday.vo;

public class MyPostVO {

	String title, wcontent, wdate, wsort, rname, rcontent, rdate, rgrade, rimage;
	int rno;
	
	
	
	public String getRimage() {
		return rimage;
	}
	public void setRimage(String rimage) {
		this.rimage = rimage;
	}
	public String getRgrade() {
		return rgrade;
	}
	public void setRgrade(String rgrade) {
		this.rgrade = rgrade;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWcontent() {
		return wcontent;
	}
	public void setWcontent(String wcontent) {
		this.wcontent = wcontent;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getWsort() {
		if( wsort.equals("pc")) {
			wsort = "사진대회"; 
		}else if( wsort.equals("wt")) {
			wsort = "산책해요";
		}else if(wsort.equals("w")) {
			wsort = "질문"; 
		}else if(wsort.equals("a")) {
			wsort = "답변";
		}else if(wsort.equals("r")) {
			wsort = "댓글";
		}
		else if(wsort.equals("review")) {
			wsort = "리뷰";
		}
		return wsort;
	}
	public void setWsort(String wsort) {
		this.wsort = wsort;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	
	
	
}
