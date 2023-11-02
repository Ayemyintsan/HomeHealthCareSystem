package com.java.bean;

public class Patient {
	private Integer patid; 
	private String name; 
	private String duration;
	private String description;
	private Double price;
	private String sdate;
	private String edate;
	private int servicetypeid;
	private String servicetypename;
	private int careid;
	private String carename;
	private int id;
	private String messagename;
	
	
	
	public int getPatid() {
		return patid;
	}
	public void setPatid(int patid) {
		this.patid = patid;
	}
	
	public int getCareid() {
		return careid;
	}
	public void setCareid(int careid) {
		this.careid = careid;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	public String getServicetypename() {
		return servicetypename;
	}
	public void setServicetypename(String servicetypename) {
		this.servicetypename = servicetypename;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getServicetypeid() {
		return servicetypeid;
	}
	public void setServicetypeid(int servicetypeid) {
		this.servicetypeid = servicetypeid;
	}
	
	
	public String getCarename() {
		return carename;
	}
	public void setCarename(String carename) {
		this.carename = carename;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMessagename() {
		return messagename;
	}
	public void setMessagename(String messagename) {
		this.messagename = messagename;
	}
	
	
	
	
	

}
