package com.java.dao;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.java.bean.Patient;
import com.java.bean.User;

public class UserDao {
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	
	public int  saveUser(User user) {
		String sql="insert into user (name,age,gender,address,phone,email,password) values('"+user.getName()+"',"+user.getAge()+",'"+user.getGender()+"','"+user.getAddress()+"','"+user.getPhone()+"','"+user.getEmail()+"','"+user.getPassword()+"')";
	    return template.update(sql);
	}
	
	public List<User> getUser(){
		List<User> userList=template.query("select * from user", new RowMapper<User>() {
			public User mapRow(ResultSet rs,int row) throws SQLException{
				User user=new User();	
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setAge(rs.getInt(3));
				user.setGender(rs.getString(4));
				user.setAddress(rs.getString(5));
				user.setPhone(rs.getString(6));
				user.setEmail(rs.getString(7));
				user.setPassword(rs.getString(8));
//				user.setDescription(rs.getString(9));
				return user;
			}
		});
		 return userList;
	}
	public void deleteUser(int id) {
		String sql="delete from user where id="+id+"";
		template.update(sql);
	}
	
	public User getUserById(int id) {
		String sql = "select id,name,age,gender,address,phone,email,password from user where id="+id;
		return template.queryForObject(sql, new RowMapper<User>() {
			public User mapRow(ResultSet rs, int row) throws SQLException {
				User user= new User();	
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setAge(rs.getInt(3));
				
				user.setGender(rs.getString(4));
				user.setAddress(rs.getString(5));
				user.setPhone(rs.getString(6));
				user.setEmail(rs.getString(7));
				user.setPassword(rs.getString(8));
				
//				user.setDescription(rs.getString(9));
				
				return user;
			}
		});
	}
	
	public List<User> countUsers(){
		return template.query("select count(*)from user", new RowMapper<User>(){
			public User mapRow(ResultSet rs,int row)throws SQLException{
				User u =new User();
				u.setId(rs.getInt(1));
				return u;
			}
		});
	}
	
public int authenticateUser(String email,String password) throws NoSuchAlgorithmException, IOException {
		
		
		String sql="SELECT count(*) FROM  user where email= '"+email+"' and password='"+password+"' ";
		return template.queryForObject(sql,Integer.class);		
	}	
	
	public User getUserByUsernameAndPassword(String email,String password) {
		String query = "select * from user where email='"+email +"'and password='"+password +"'";
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
}
