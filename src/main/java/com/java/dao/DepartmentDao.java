package com.java.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.java.bean.Department;
import com.java.bean.Patient;

public class DepartmentDao {

	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	
	public int  saveDepartment(Department d) {
		String sql="insert into department (deptname,description) values('"+d.getDeptname()+"','"+d.getDescription()+"') ";
	    return template.update(sql);
	}
	
	public List<Department> getDepartment(){
		 List<Department> departmentList=template.query("select * from department", new RowMapper<Department>() {
			public Department mapRow(ResultSet rs,int row) throws SQLException{
				Department d=new Department();	
				d.setId(rs.getInt(1));
				d.setDeptname(rs.getString(2));	
				d.setDescription(rs.getString(3));
				
				return d;
			}
		});
		 return departmentList;
	}
	public void deleteDepartment(int id){ 
		 String sql="delete from department where id="+id+""; 
		  template.update(sql); 
		} 
	
	public Department getDepartmentById(int id) {
		String sql = "select * from department where id=" + id;
		return template.queryForObject(sql, new RowMapper<Department>() {
			public Department mapRow(ResultSet rs, int row) throws SQLException {
				Department d= new Department();
				d.setId(rs.getInt(1));
				d.setDeptname(rs.getString(2));
				d.setDescription(rs.getString(3));
				return d;
			}
		});
	}
	
	public void updateDepartment(Department d) {
		String sql="update department set  deptname='"+d.getDeptname()+"',description='"+d.getDescription()+"' where id="+d.getId()+""; 
	      template.update(sql);
	}
	
//	public List<Department> countDepartments(){
//		return template.query("select count(*)from department", new RowMapper<Department>(){
//		public Department mapRow(ResultSet rs,int row)throws SQLException{
//			Department department =new Department();
//			department.setId(rs.getInt(1));
//			return department;
//		}
//	});
//}
}
