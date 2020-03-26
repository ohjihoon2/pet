package com.pettoday.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class ItemVO {
	int rno,item_no, item_price,item_hits;
	
	String  item_name, item_img,item_simg, item_description,item_sdescription, item_date, 
	 item_cate_cate1,item_cate_brand1,item_cate_feature1,item_cate_material1,
	 item_cate_no;
	
	CommonsMultipartFile item_cimg, item_cdescription;

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getItem_no() {
		return item_no;
	}

	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}

	public int getItem_price() {
		return item_price;
	}

	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}

	public int getItem_hits() {
		return item_hits;
	}

	public void setItem_hits(int item_hits) {
		this.item_hits = item_hits;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getItem_img() {
		return item_img;
	}

	public void setItem_img(String item_img) {
		this.item_img = item_img;
	}

	public String getItem_simg() {
		return item_simg;
	}

	public void setItem_simg(String item_simg) {
		this.item_simg = item_simg;
	}

	public String getItem_description() {
		return item_description;
	}

	public void setItem_description(String item_description) {
		this.item_description = item_description;
	}

	public String getItem_sdescription() {
		return item_sdescription;
	}

	public void setItem_sdescription(String item_sdescription) {
		this.item_sdescription = item_sdescription;
	}

	public String getItem_date() {
		return item_date;
	}

	public void setItem_date(String item_date) {
		this.item_date = item_date;
	}

	public String getItem_cate_cate1() {
		return item_cate_cate1;
	}

	public void setItem_cate_cate1(String item_cate_cate1) {
		this.item_cate_cate1 = item_cate_cate1;
	}

	public String getItem_cate_brand1() {
		return item_cate_brand1;
	}

	public void setItem_cate_brand1(String item_cate_brand1) {
		this.item_cate_brand1 = item_cate_brand1;
	}

	public String getItem_cate_feature1() {
		return item_cate_feature1;
	}

	public void setItem_cate_feature1(String item_cate_feature1) {
		this.item_cate_feature1 = item_cate_feature1;
	}

	public String getItem_cate_material1() {
		return item_cate_material1;
	}

	public void setItem_cate_material1(String item_cate_material1) {
		this.item_cate_material1 = item_cate_material1;
	}

	public String getItem_cate_no() {
		return item_cate_no;
	}

	public void setItem_cate_no(String item_cate_no) {
		this.item_cate_no = item_cate_no;
	}

	public CommonsMultipartFile getItem_cimg() {
		return item_cimg;
	}

	public void setItem_cimg(CommonsMultipartFile item_cimg) {
		this.item_cimg = item_cimg;
	}

	public CommonsMultipartFile getItem_cdescription() {
		return item_cdescription;
	}

	public void setItem_cdescription(CommonsMultipartFile item_cdescription) {
		this.item_cdescription = item_cdescription;
	}

}
