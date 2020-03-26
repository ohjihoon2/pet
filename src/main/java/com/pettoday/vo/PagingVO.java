package com.pettoday.vo;

import java.util.List;

public class PagingVO {

	List list;
	String sid;
	int dbcount, rpage, pagesize;


	
	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public int getDbcount() {
		return dbcount;
	}

	public void setDbcount(int dbcount) {
		this.dbcount = dbcount;
	}

	public int getRpage() {
		return rpage;
	}

	public void setRpage(int rpage) {
		this.rpage = rpage;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	
	
}
