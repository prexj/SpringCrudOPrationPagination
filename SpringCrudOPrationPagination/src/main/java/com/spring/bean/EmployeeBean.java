package com.spring.bean;

public class EmployeeBean {
	private int id;
	private String fname,lname,skill,city,gen;
	
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getFname() {
		return fname;
	}


	public void setFname(String fname) {
		this.fname = fname;
	}


	public String getLname() {
		return lname;
	}


	public void setLname(String lname) {
		this.lname = lname;
	}


	public String getSkill() {
		return skill;
	}


	public void setSkill(String skill) {
		this.skill = skill;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getGen() {
		return gen;
	}


	public void setGen(String gen) {
		this.gen = gen;
	}


	@Override
	public String toString() {
		return "EmployeeBean [id=" + id + ", fname=" + fname + ", lname="
				+ lname + ", skill=" + skill + ", city=" + city + ", gen="
				+ gen + "]";
	}

	

	
}
