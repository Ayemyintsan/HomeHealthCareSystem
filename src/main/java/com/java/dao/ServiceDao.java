package com.java.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.java.bean.Service;

public class ServiceDao {
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	
	public int  saveService(Service service) {
		String sql="insert into service(servicetypeid,servicename,servicedescription,price) values("+service.getServiceTypeId()+",'"+service.getName()+"','"+service.getDescription()+"','"+service.getPrice()+"')";
	    return template.update(sql);
	}
	
	public List<Service> getService(){
		 List<Service> serviceList=template.query("select serviceid,servicename,servicedescription,price from service", new RowMapper<Service>() {
			public Service mapRow(ResultSet rs,int row) throws SQLException{
				Service service=new Service();	
				service.setId(rs.getInt(1));
				service.setName(rs.getString(2));		
				service.setDescription(rs.getString(3));
				service.setPrice(rs.getDouble(4));
				return service;
			}
		});
		 return serviceList;
	}
	public void deleteService(int id){ 
		 String sql="delete from service where serviceid="+id+""; 
		  template.update(sql); 
		} 
	
	public Service getServiceById(int id) {
		String sql = "select serviceid,servicename,servicedescription,price,servicetypeid from service where serviceid=" + id;
		return template.queryForObject(sql, new RowMapper<Service>() {
			public Service mapRow(ResultSet rs, int row) throws SQLException {
				Service service= new Service();
				service.setId(rs.getInt(1));
				service.setName(rs.getString(2));
				service.setDescription(rs.getString(3));
				service.setPrice(rs.getDouble(4));
				service.setServiceTypeId(rs.getInt(5));
				return service;
			}
		});
	}
	
	public void updateService(Service service) {
		String sql="update service set servicetypeid="+service.getServiceTypeId()+" ,servicename='"+service.getName()+"',servicedescription='"+service.getDescription()+"',price='"+ service.getPrice()+"' where serviceid="+service.getId()+""; 
	      template.update(sql);
	}

	public List<Service> getJointServiceType() {
		 List<Service> serviceList=template.query("select service.serviceid,servicetype.servicetypename,service.servicename,service.servicedescription,service.price,service.servicetypeid from service inner join servicetype on servicetype.servicetypeid=service.servicetypeid", new RowMapper<Service>() {
			public Service mapRow(ResultSet rs,int row) throws SQLException{
				Service stype= new Service();
				stype.setId(rs.getInt(1));
				stype.setServiceTypename(rs.getString(2));
				stype.setName(rs.getString(3));
				stype.setDescription(rs.getString(4));
				stype.setPrice(rs.getDouble(5));
				stype.setServiceTypeId(rs.getInt(6));
				
				return stype;
			}
		});
		 return serviceList;
	}
	
	public Service getJointServiceById(int id) {
		String sql = "select service.serviceid,servicetype.servicetypename,service.servicename,service.servicedescription,service.price,service.servicetypeid from service inner join servicetype on service.servicetypeid=servicetype.servicetypeid where serviceid=" + id;
		return template.queryForObject(sql, new RowMapper<Service>() {
			public Service mapRow(ResultSet rs, int row) throws SQLException {
				Service service= new Service();
				service.setId(rs.getInt(1));
				service.setServiceTypename(rs.getString(2));
				service.setName(rs.getString(3));
				service.setDescription(rs.getString(4));
				service.setPrice(rs.getDouble(5));
				service.setServiceTypeId(rs.getInt(6));
				return service;
			}
		});
	}
	}


