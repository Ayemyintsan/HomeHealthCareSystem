package com.java.bean;

public class Service {
	private Integer id; 
	private String name; 
	private String description;
	private Integer serviceTypeId;
	private Double price;
	private String serviceTypename;
	 
	public Integer getId() { 
		return id; 
	} 
	public void setId(Integer id) { 
		this.id = id; 
	} 
	public String getName() {
		return name;
	}
	public int getServiceTypeId() {
		return serviceTypeId;
	}
	public void setServiceTypeId(int serviceTypeId) {
		this.serviceTypeId = serviceTypeId;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description=description;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price=price;
	}
	public String getServiceTypename() {
		return serviceTypename;
	}
	public void setServiceTypename(String serviceTypename) {
		this.serviceTypename = serviceTypename;
	}

}
