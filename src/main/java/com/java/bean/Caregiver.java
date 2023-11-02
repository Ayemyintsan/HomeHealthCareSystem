package com.java.bean;

public class Caregiver {
	private Integer careid; 
	private String name; 
	private String phone;
	private String email;
	private Double salary;
	private String address;
	private Integer supervisorId;
	private String supervisorName;
	private int id;
	private String deptname;
	
	 
	public Integer getId() { 
		return id; 
	} 
	public void setId(Integer id) { 
		this.id = id; 
	} 
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone=phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email=email;
	}
	public Double getSalary() {
		return salary;
	}
	public void setSalary(Double salary) {
		this.salary=salary;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address=address;
	}
	public Integer getSupervisorId() {
		return supervisorId;
	}
	public void setSupervisorId(Integer supervisorId) {
		this.supervisorId = supervisorId;
	}
	public String getSupervisorName() {
		return supervisorName;
	}
	public void setSupervisorName(String supervisorName) {
		this.supervisorName = supervisorName;
	}
	public Integer getCareid() {
		return careid;
	}
	public void setCareid(Integer careid) {
		this.careid = careid;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}

}
