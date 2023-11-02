package com.java.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.java.bean.Caregiver;
import com.java.bean.Department;
import com.java.bean.Supervisor;
import com.java.bean.User;

public class SupervisorDao {

	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	public int  saveSupervisor(Supervisor sup) {
		String sql="insert into supervisor (name,phone,email,salary,address) values('"+sup.getName()+"',"+sup.getPhone()+",'"+sup.getEmail()+"',"+sup.getSalary()+",'"+sup.getAddress()+"') ";
	    return template.update(sql);
	}
	
	public List<Supervisor> getSupervisors(){
		 List<Supervisor> supervisorList=template.query("select supid,name,phone,email,salary,address from supervisor", new RowMapper<Supervisor>() {
			public Supervisor mapRow(ResultSet rs,int row) throws SQLException{
				Supervisor sup=new Supervisor();	
				sup.setSupid(rs.getInt(1));
				sup.setName(rs.getString(2));		
				sup.setPhone(rs.getString(3));
				sup.setEmail(rs.getString(4));
				sup.setSalary(rs.getString(5));
				sup.setAddress(rs.getString(6));
				return sup;
			}
		});
		 return supervisorList;
	}
	public void deleteSupervisor(int supid){ 
		 String sql="delete from supervisor where supid="+supid+""; 
		 template.update(sql); 
		} 
	
	public Supervisor getSupervisorById(int supid) {
		String sql = "select supid,name,phone,email,salary,address,id from supervisor where supid="+supid;
		return template.queryForObject(sql, new RowMapper<Supervisor>() {
			public Supervisor mapRow(ResultSet rs, int row) throws SQLException {
				Supervisor sup= new Supervisor();
				sup.setSupid(rs.getInt(1));
				sup.setName(rs.getString(2));
				sup.setPhone(rs.getString(3));
				sup.setEmail(rs.getString(4));
				sup.setSalary(rs.getString(5));
				sup.setAddress(rs.getString(6));
				sup.setId(rs.getInt(7));
				return sup;
			}
		});
	}
	
	public void updateSupervisor(Supervisor sup) {
		String sql="update supervisor set  name='"+sup.getName()+"',phone='"+sup.getPhone()+"',email='"+sup.getEmail()+"',salary="+sup.getSalary()+",address='"+sup.getAddress()+"' where supid="+sup.getSupid()+""; 
	      template.update(sql);
	}
	
	public List<Supervisor> getJointSupervisor() {
		 List<Supervisor> supervisorList=template.query("select supervisor.supid,supervisor.name,supervisor.phone,supervisor.email,supervisor.salary,supervisor.address from supervisor", new RowMapper<Supervisor>() {
			public Supervisor mapRow(ResultSet rs,int row) throws SQLException{
				Supervisor sup= new Supervisor();
				sup.setSupid(rs.getInt(1));
				sup.setName(rs.getString(2));
				
				sup.setPhone(rs.getString(3));
				sup.setEmail(rs.getString(4));
				sup.setSalary(rs.getString(5));
				sup.setAddress(rs.getString(6));
				
				
				return sup;
			}
		});
		 return supervisorList;
	}
	
	public Supervisor getJointSupervisorById(int supid) {
		String sql = "select supervisor.supid,supervisor.name,supervisor.phone,supervisor.email,supervisor.salary,supervisor.address from supervisor where supid=" + supid;
		return template.queryForObject(sql, new RowMapper<Supervisor>() {
			public Supervisor mapRow(ResultSet rs, int row) throws SQLException {
				Supervisor sup= new Supervisor();
				sup.setSupid(rs.getInt(1));
				sup.setName(rs.getString(2));
				
				sup.setPhone(rs.getString(3));
				sup.setEmail(rs.getString(4));
				sup.setSalary(rs.getString(5));
				sup.setAddress(rs.getString(6));
				
				return sup;
			}
		});
	}
	
	
	
	public List<Supervisor> countSupervisors(){
		return template.query("select count(*)from supervisor", new RowMapper<Supervisor>(){
			public Supervisor mapRow(ResultSet rs,int row)throws SQLException{
				Supervisor sup =new Supervisor();
				sup.setSupid(rs.getInt(1));
				return sup;
			}
		});
	}
	public int confirmSupervisorForDelete(int supid) {
		String sql="SELECT COUNT(*) FROM caregiver WHERE supid='"+supid+"'";
		int count=template.queryForObject(sql,Integer.class);
		return count;
	}
}
