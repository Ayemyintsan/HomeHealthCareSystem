package com.java.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;


import com.java.bean.Record;

public class RecordDao {
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	
	public int  saveRecord(Record record){
		String sql="insert into record (name,age,address,duration,sdate,edate,description,servicetypeid,carid) values('"+record.getName()+"',"+record.getAge()+",'"+record.getAddress()+"','"+record.getDuration()+"','"+record.getSdate()+"','"+record.getEdate()+"','"+record.getDescription()+"','"+record.getServicetypeid()+"','"+record.getCareid()+"')";
	    return template.update(sql);
	}
	
	public List<Record> getRecord(){
		List<Record> recordList=template.query("select * from record", new RowMapper<Record>() {
			public Record mapRow(ResultSet rs,int row) throws SQLException{
				Record record=new Record();	
				record.setId(rs.getInt(1));
				record.setName(rs.getString(2));
				record.setAge(rs.getInt(3));
				record.setAddress(rs.getString(6));
				record.setDuration(rs.getString(9));
				record.setSdate(rs.getString(10));
				record.setEdate(rs.getString(11));
				record.setDescription(rs.getString(12));
				record.setServicetypeid(rs.getInt(13));
				record.setCareid(rs.getInt(14));
				return record;
			}
		});
		 return recordList;
	}

}
