package com.java.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.java.bean.Caregiver;
import com.java.bean.Supervisor;



public class CaregiverDao {
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	
	public int  saveCaregiver(Caregiver care) {
		String sql="insert into caregiver(name,supid,phone,email,salary,address) values('"+care.getName()+"',"+care.getSupervisorId()+",'"+care.getPhone()+"','"+care.getEmail()+"',"+care.getSalary()+",'"+care.getAddress()+"')";
	    return template.update(sql);
	}
	
	public List<Caregiver> getCaregiver(){
		 List<Caregiver> caregiverList=template.query("select careid,name,phone,email,salary,address from caregiver", new RowMapper<Caregiver>() {
			public Caregiver mapRow(ResultSet rs,int row) throws SQLException{
				Caregiver care=new Caregiver();	
				care.setCareid(rs.getInt(1));
				care.setName(rs.getString(2));		
				care.setPhone(rs.getString(3));
				care.setEmail(rs.getString(4));
				care.setSalary(rs.getDouble(5));
				care.setAddress(rs.getString(6));
				return care;
			}
		});
		 return caregiverList;
	}
	public void deleteCaregiver(int careid){ 
		 String sql="delete from caregiver where careid="+careid+""; 
		  template.update(sql); 
		} 
	
	public Caregiver getCaregiverById(int careid) {
		String sql = "select careid,name,phone,email,salary,address,supid from caregiver where careid=" + careid;
		return template.queryForObject(sql, new RowMapper<Caregiver>() {
			public Caregiver mapRow(ResultSet rs, int row) throws SQLException {
				Caregiver care= new Caregiver();
				care.setCareid(rs.getInt(1));
				care.setName(rs.getString(2));
				care.setPhone(rs.getString(3));
				care.setEmail(rs.getString(4));
				care.setSalary(rs.getDouble(5));
				care.setAddress(rs.getString(6));
				care.setSupervisorId(rs.getInt(7));
				
				return care;
			}
		});
	}
	
	public void updateCaregiver(Caregiver care) {
		String sql="update caregiver set  name='"+care.getName()+"',supid="+care.getSupervisorId()+",phone='"+care.getPhone()+"',email='"+care.getEmail()+"',salary="+care.getSalary()+",address='"+care.getAddress()+"' where careid="+care.getCareid()+""; 
	      template.update(sql);
	}
	
	public List<Caregiver> getJointCaregiver() {
		 List<Caregiver> caregiverList=template.query("select caregiver.careid,caregiver.name,supervisor.name,caregiver.phone,caregiver.email,caregiver.salary,caregiver.address,caregiver.supid from caregiver inner join supervisor on supervisor.supid=caregiver.supid", new RowMapper<Caregiver>() {
			public Caregiver mapRow(ResultSet rs,int row) throws SQLException{
				Caregiver care= new Caregiver();
				care.setCareid(rs.getInt(1));
				care.setName(rs.getString(2));
				care.setSupervisorName(rs.getString(3));
				
				care.setPhone(rs.getString(4));
				care.setEmail(rs.getString(5));
				care.setSalary(rs.getDouble(6));
				care.setAddress(rs.getString(7));
				care.setSupervisorId(rs.getInt(8));
				
				return care;
			}
		});
		 return caregiverList;
	}
	
	public Caregiver getJointCaregiverById(int careid) {
		String sql = "select caregiver.careid,caregiver.name,supervisor.name,caregiver.phone,caregiver.email,caregiver.salary,caregiver.address,caregiver.supid from caregiver inner join supervisor on caregiver.supid=supervisor.supid where careid=" + careid;
		return template.queryForObject(sql, new RowMapper<Caregiver>() {
			public Caregiver mapRow(ResultSet rs, int row) throws SQLException {
				Caregiver caregiver= new Caregiver();
				caregiver.setCareid(rs.getInt(1));
				caregiver.setName(rs.getString(2));
				caregiver.setSupervisorName(rs.getString(3));
				
				caregiver.setPhone(rs.getString(4));
				caregiver.setEmail(rs.getString(5));
				caregiver.setSalary(rs.getDouble(6));
				caregiver.setAddress(rs.getString(7));
				caregiver.setSupervisorId(rs.getInt(8));
				
				return caregiver;
			}
		});
	}
	public List<Caregiver> countCaregivers(){
		return template.query("select count(*)from caregiver", new RowMapper<Caregiver>(){
			public Caregiver mapRow(ResultSet rs,int row)throws SQLException{
				Caregiver care =new Caregiver();
				care.setCareid(rs.getInt(1));
				return care;
			}
		});
	}
	public int confirmCaregiverForDelete(int careid) {
		String sql="SELECT COUNT(*) FROM patient WHERE careid='"+careid+"'";
		int count=template.queryForObject(sql,Integer.class);
		return count;
	}
}
