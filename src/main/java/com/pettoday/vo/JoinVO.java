package com.pettoday.vo;

public class JoinVO {
	int rno, jstatus;
	String mem_id, mem_pass, mem_name, mem_petname, mem_dogcat, mem_species, mem_email, mem_email1, mem_email2,
			mem_email3, phone1, phone2, phone3, mem_phone, mem_address, mem_address1, mem_address2, mem_address3, mem_address4, mem_date;
	

	
	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public String getMem_date() {
		return mem_date;
	}

	public void setMem_date(String mem_date) {
		this.mem_date = mem_date;
	}

	public String getMem_address4() {
		return mem_address1 + "/" + mem_address2 + "/" + mem_address3;
	}

	public void setMem_address4(String mem_address4) {
		this.mem_address4 = mem_address4;
	}

	public String getMem_email3() {
		return getMem_email1() + "@" + getMem_email2();
	}

	public void setMem_email3(String mem_email3) {
		this.mem_email3 = mem_email3;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getJstatus() {
		return jstatus;
	}

	public void setJstatus(int jstatus) {
		this.jstatus = jstatus;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pass() {
		return mem_pass;
	}

	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_petname() {
		return mem_petname;
	}

	public void setMem_petname(String mem_petname) {
		this.mem_petname = mem_petname;
	}

	public String getMem_dogcat() {
		return mem_dogcat;
	}

	public void setMem_dogcat(String mem_dogcat) {
		this.mem_dogcat = mem_dogcat;
	}

	public String getMem_species() {
		return mem_species;
	}

	public void setMem_species(String mem_species) {
		this.mem_species = mem_species;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_email1() {
		return mem_email1;
	}

	public void setMem_email1(String mem_email1) {
		this.mem_email1 = mem_email1;
	}

	public String getMem_email2() {
		return mem_email2;
	}

	public void setMem_email2(String mem_email2) {
		this.mem_email2 = mem_email2;
	}

	public String getMem_phone() {
		System.out.println("update");
		System.out.println(phone1 + phone2+ phone3);
		return phone1 + phone2+ phone3;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
		
		phone1 =mem_phone.substring(0, 3);
		phone2 =mem_phone.substring(3, 7);
		phone3 =mem_phone.substring(7, 11);	
		
		System.out.println(phone1);
		System.out.println(phone2);
		System.out.println(phone3);
	}

	public String getMem_address() {
		return mem_address;
	}

	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}

	public String getMem_address1() {
		return mem_address1;
	}

	public void setMem_address1(String mem_address1) {
		this.mem_address1 = mem_address1;
	}

	public String getMem_address2() {
		return mem_address2;
	}

	public void setMem_address2(String mem_address2) {
		this.mem_address2 = mem_address2;
	}

	public String getMem_address3() {
		return mem_address3;
	}

	public void setMem_address3(String mem_address3) {
		this.mem_address3 = mem_address3;
	}
}