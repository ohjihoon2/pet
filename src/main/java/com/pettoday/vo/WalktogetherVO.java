package com.pettoday.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class WalktogetherVO {
	String wal_file, wal_sfile, wal_name, wal_dog, wal_address, wal_favorite, wal_content, wal_date, mem_id;
	int wal_no, wal_age, wal_hits, rno;
	CommonsMultipartFile wal_cfile;

	public CommonsMultipartFile getWal_cfile() {
		return wal_cfile;
	}

	public void setWal_cfile(CommonsMultipartFile wal_cfile) {
		this.wal_cfile = wal_cfile;
	}

	public String getWal_file() {
		return wal_file;
	}

	public void setWal_file(String wal_file) {
		this.wal_file = wal_file;
	}

	public String getWal_sfile() {
		return wal_sfile;
	}

	public void setWal_sfile(String wal_sfile) {
		this.wal_sfile = wal_sfile;
	}

	public String getWal_name() {
		return wal_name;
	}

	public void setWal_name(String wal_name) {
		this.wal_name = wal_name;
	}

	public String getWal_dog() {
		return wal_dog;
	}

	public void setWal_dog(String wal_dog) {
		this.wal_dog = wal_dog;
	}

	public String getWal_address() {
		return wal_address;
	}

	public void setWal_address(String wal_address) {
		this.wal_address = wal_address;
	}

	public String getWal_favorite() {
		return wal_favorite;
	}

	public void setWal_favorite(String wal_favorite) {
		this.wal_favorite = wal_favorite;
	}

	public String getWal_content() {
		return wal_content;
	}

	public void setWal_content(String wal_content) {
		this.wal_content = wal_content;
	}

	public String getWal_date() {
		return wal_date;
	}

	public void setWal_date(String wal_date) {
		this.wal_date = wal_date;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getWal_no() {
		return wal_no;
	}

	public void setWal_no(int wal_no) {
		this.wal_no = wal_no;
	}

	public int getWal_age() {
		return wal_age;
	}

	public void setWal_age(int wal_age) {
		this.wal_age = wal_age;
	}

	public int getWal_hits() {
		return wal_hits;
	}

	public void setWal_hits(int wal_hits) {
		this.wal_hits = wal_hits;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

}