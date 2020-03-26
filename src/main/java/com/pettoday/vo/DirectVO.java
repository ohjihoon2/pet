package com.pettoday.vo;

public class DirectVO {
	int rno, direct_no,qty,item_no,item_price,sum;
	String mem_id,item_name,item_simg;
	
	public int getSum() {
		return (qty*item_price);
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getDirect_no() {
		return direct_no;
	}
	public void setDirect_no(int direct_no) {
		this.direct_no = direct_no;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
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
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_simg() {
		return item_simg;
	}
	public void setItem_simg(String item_simg) {
		this.item_simg = item_simg;
	}
	
}
