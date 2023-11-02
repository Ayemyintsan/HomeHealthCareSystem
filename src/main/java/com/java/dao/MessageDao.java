package com.java.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.java.bean.Message;


public class MessageDao {
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	
	public int  saveMessage(Message message) {
		String sql="insert into message (name) values('"+message.getName()+"') ";
	    return template.update(sql);
	}
	
	public List<Message> getMessage(){
		 List<Message> messageList=template.query("select id,name from message", new RowMapper<Message>() {
			public Message mapRow(ResultSet rs,int row) throws SQLException{
				Message message=new Message();	
				message.setId(rs.getInt(1));
				message.setName(rs.getString(2));		
				
				return message;
			}
		});
		 return messageList;
	}
	
	public void deleteMessage(int id){ 
		 String sql="delete from message where id="+id+""; 
		  template.update(sql); 
		} 
	
	public Message getMessageById(int id) {
		String sql = "select id,name from message where id=" + id;
		return template.queryForObject(sql, new RowMapper<Message>() {
			public Message mapRow(ResultSet rs, int row) throws SQLException {
				Message message= new Message();
				message.setId(rs.getInt(1));
				message.setName(rs.getString(2));
				
				
				return message;
			}
		});
	}
	
	public void updateMessage(Message message) {
		String sql="update message set name='"+message.getName()+"' where id="+message.getId()+""; 
	      template.update(sql);
	}
	
	


}
