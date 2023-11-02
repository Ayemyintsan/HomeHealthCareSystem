package com.java.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.java.bean.Service;
import com.java.bean.ServiceType;
import com.java.bean.User;

public class ServiceTypeDao {
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	
	public int  saveServiceType(ServiceType stype) {
		String sql="insert into servicetype (servicetypename,servicetypedescription) values('"+stype.getName()+"','"+stype.getDescription()+"') ";
	    return template.update(sql);
	}
	
	public List<ServiceType> getServiceTypes(){
		 List<ServiceType> serviceTypeList=template.query("select servicetypeid,servicetypename,servicetypedescription from servicetype", new RowMapper<ServiceType>() {
			public ServiceType mapRow(ResultSet rs,int row) throws SQLException{
				ServiceType stype=new ServiceType();	
				stype.setId(rs.getInt(1));
				stype.setName(rs.getString(2));		
				stype.setDescription(rs.getString(3));
				
				return stype;
			}
		});
		 return serviceTypeList;
	}
	
	public void deleteServiceType(int id){ 
		 String sql="delete from servicetype where servicetypeid="+id+""; 
		  template.update(sql); 
		} 
	
	public ServiceType getServiceTypeById(int id) {
		String sql = "select servicetypeid,servicetypename,servicetypedescription from servicetype where servicetypeid=" + id;
		return template.queryForObject(sql, new RowMapper<ServiceType>() {
			public ServiceType mapRow(ResultSet rs, int row) throws SQLException {
				ServiceType stype= new ServiceType();
				stype.setId(rs.getInt(1));
				stype.setName(rs.getString(2));
				stype.setDescription(rs.getString(3));
				
				return stype;
			}
		});
	}
	
	public void updateServiceType(ServiceType stype) {
		String sql="update servicetype set  servicetypename='"+stype.getName()+"',servicetypedescription='"+stype.getDescription()+"' where servicetypeid="+stype.getId()+""; 
	      template.update(sql);
	}
	
	public List<ServiceType> countServicetypes(){
		return template.query("select count(*)from servicetype", new RowMapper<ServiceType>(){
			public ServiceType mapRow(ResultSet rs,int row)throws SQLException{
				ServiceType  stype =new ServiceType();
				stype.setId(rs.getInt(1));
				return stype;
			}
		});
	}
	public int confirmServiceTypeForDelete(int servicetypeid) {
		String sql="SELECT COUNT(*) FROM patient WHERE servicetypeid='"+servicetypeid+"'";
		int count=template.queryForObject(sql,Integer.class);
		return count;
	}
	
	}
	


