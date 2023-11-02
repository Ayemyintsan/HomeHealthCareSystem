package com.java.dao;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.java.bean.Admin;

public class AdminDao {
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	
	
	public int authenticateAdmin(String username,String password) throws NoSuchAlgorithmException, IOException {
		
		
		String sql="SELECT count(*) FROM  admin where username= '"+username+"' and password='"+password+"' ";
		return template.queryForObject(sql,Integer.class);		
	}	
	
	public Admin getAdminByUsernameAndPassword(String username,String password) {
		String query = "select * from admin where username='"+username +"'and password='"+password +"'";
		return template.queryForObject(query, new RowMapper<Admin>(){
			
			@Override
			public Admin mapRow(ResultSet rs,int row )throws SQLException{
				Admin admin = new Admin();
				admin.setId(rs.getInt(1));
				admin.setUsername(rs.getString(2));
				admin.setPassword(rs.getString(3));
				return admin;
			}
		});
	}
	
	

}
