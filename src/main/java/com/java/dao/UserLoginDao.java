package com.java.dao;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.java.bean.Admin;
import com.java.bean.User;
import com.java.bean.UserLogin;

public class UserLoginDao {
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	
	
	public int authenticateUser(String email,String password) throws NoSuchAlgorithmException, IOException {
		
		
		String sql="SELECT count(*) FROM  user where email= '"+email+"' and password='"+password+"' ";
		return template.queryForObject(sql,Integer.class);		
	}	
	
	public User getUserByUsernameAndPassword(String email,String password) {
		String query = "select count(*) from user where email='"+email +"'and password='"+password +"'";
		return template.queryForObject(query, new RowMapper<User>(){
			
			@Override
			public User mapRow(ResultSet rs,int row )throws SQLException{
				User user = new User();
				user.setId(rs.getInt(1));
				user.setEmail(rs.getString(2));
				user.setPassword(rs.getString(3));
				return user;
			}
		});
	}
	public int getUsername(String email) {
		try {
			String sql = "select* from  user where email='"+email+"'";
			int count = template.queryForObject(sql, Integer.class);
			return count;
		
		}catch(EmptyResultDataAccessException e){
			return 0;
			
		}
		
	}
	public int getPassword(String password) {
		try {
			String sql = "select count(*)from user where password='"+password +"'";
			int count = template.queryForObject(sql, Integer.class);
			return count;
		
		}catch(EmptyResultDataAccessException e) {
			return 0;
		}
}

	public int  saveUserLogin(UserLogin userlogin) {
		String sql="insert into userlogin (email,password) values('"+userlogin.getEmail()+"','"+userlogin.getPassword()+"')";
	    return template.update(sql);
	}
}

