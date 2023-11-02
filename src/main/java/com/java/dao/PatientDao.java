package com.java.dao;

import java.sql.Connection;
import java.sql.Connection.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;


import com.java.bean.Patient;
import com.java.bean.User;


public class PatientDao {
	
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	
	public int  savePatient(Patient patient) {
		String sql="insert into patient (name,duration,id,servicetypeid) values('"+patient.getName()+"','"+patient.getDuration()+"',"+patient.getId()+","+patient.getServicetypeid()+")";
	    return template.update(sql);
	}
	
	public List<Patient> getPatient(){
		List<Patient> patientList=template.query("select patid,name,duration from patient where careid is null", new RowMapper<Patient>() {
			public Patient mapRow(ResultSet rs,int row) throws SQLException{
				Patient patient=new Patient();	
				patient.setPatid(rs.getInt(1));
				patient.setName(rs.getString(2));
				patient.setDuration(rs.getString(3));
				//patient.setDescription(rs.getString(4));
				return patient;
			}
		});
		 return patientList;
	}
	public void deletePatient(int patid) {
		String sql="delete from patient where patid="+patid+"";
		template.update(sql);
	}
	
	public Patient getPatientById(int patid) {
		String sql = "select patid,name,duration,id,servicetypeid from patient where patid="+patid;
		return template.queryForObject(sql, new RowMapper<Patient>() {
			public Patient mapRow(ResultSet rs, int row) throws SQLException {
				Patient patient= new Patient();	
				patient.setPatid(rs.getInt(1));
				patient.setName(rs.getString(2));
				patient.setDuration(rs.getString(3));
				patient.setId(rs.getInt(4));
				patient.setServicetypeid(rs.getInt(5));
				
				return patient;
			}
		});
	}
	
	public void updatePatient(Patient patient) {
		String sql="update patient set  name='"+patient.getName()+"',duration='"+patient.getDuration()+"',sdate='"+patient.getSdate()+"',edate='"+patient.getEdate()+"',servicetypeid="+patient.getServicetypeid()+",id="+patient.getId()+",careid="+patient.getCareid()+",price='"+patient.getPrice()+"' where patid="+patient.getPatid()+""; 
	      template.update(sql);
	}
	public List<Patient> getJointPatient() {
		 List<Patient> patientList=template.query("select patient.patid,patient.name,patient.duration,messsage.name,servicetype.servicetypename,patient.servicetypeid,patient.id from patient inner join servicetype inner join message on servicetype.servicetypeid=patient.servicetypeid and message.id=patient.id", new RowMapper<Patient>() {
			public Patient mapRow(ResultSet rs,int row) throws SQLException{
				Patient patient= new Patient();
				patient.setPatid(rs.getInt(1));
				patient.setName(rs.getString(2));
				patient.setDuration(rs.getString(3));
				patient.setMessagename(rs.getString(4));
				patient.setId(rs.getInt(5));
				patient.setServicetypename(rs.getString(6));
				patient.setServicetypeid(rs.getInt(7));
				
				return patient;
			}
		});
		 return patientList;
	}


	
	public Patient getJointPatientById(int patid) {
		String sql = "select patient.patid,patient.name,patient.duration,message.name,servicetype.servicetypename,patient.servicetypeid,patient.id from patient inner join servicetype inner join message on patient.servicetypeid=servicetype.servicetypeid and patient.id=message.id where patid=" + patid;
		return template.queryForObject(sql, new RowMapper<Patient>() {	
		public Patient mapRow(ResultSet rs, int row) throws SQLException {
				Patient patient= new Patient();
				patient.setPatid(rs.getInt(1));
				patient.setName(rs.getString(2));
				patient.setDuration(rs.getString(3));
				patient.setMessagename(rs.getString(4));
				//patient.setId(rs.getInt(5));
				patient.setServicetypename(rs.getString(5));
				patient.setServicetypeid(rs.getInt(6));
				patient.setId(rs.getInt(7));
				return patient;
		}
	});
		
	}
		

	public List<Patient> getJointCaregiver() {
		 List<Patient>patientList=template.query("select patient.patid,patient.name,patient.duration,patient.sdate,patient.edate,message.name,servicetype.servicetypename,caregiver.name,patient.price,patient.servicetypeid,patient.careid,patient.id from patient inner join servicetype inner join caregiver inner join message  on patient.servicetypeid = servicetype.servicetypeid and caregiver.careid=patient.careid and message.id=patient.id ",new RowMapper<Patient>() {
		 public Patient mapRow(ResultSet rs,int row) throws SQLException{
				Patient patient= new Patient();
				patient.setPatid(rs.getInt(1));
				patient.setName(rs.getString(2));
				patient.setDuration(rs.getString(3));
				//patient.setMessagename(rs.getString(4));
				patient.setSdate(rs.getString(4));
				patient.setEdate(rs.getString(5));
				patient.setMessagename(rs.getString(6));
				//patient.setId(rs.getInt(7));
				patient.setServicetypename(rs.getString(7));
				patient.setCarename(rs.getString(8));
				patient.setPrice(rs.getDouble(9));
				patient.setServicetypeid(rs.getInt(10));
				patient.setCareid(rs.getInt(11));
				patient.setId(rs.getInt(12));
				return patient;
			}
		});
		return patientList;
	}
	
	public List<Patient> getPatientInfo() {
		 List<Patient> patientList=template.query("select patient.patid,patient.name,patient.duration,message.name,servicetype.servicetypename,patient.servicetypeid,patient.id from patient inner join servicetype inner join message on servicetype.servicetypeid=patient.servicetypeid and message.id=patient.id ", new RowMapper<Patient>() {
			public Patient mapRow(ResultSet rs,int row) throws SQLException{
				Patient patient= new Patient();
				patient.setPatid(rs.getInt(1));
				patient.setName(rs.getString(2));
				patient.setDuration(rs.getString(3));
				patient.setMessagename(rs.getString(4));
				patient.setId(rs.getInt(5));
				patient.setServicetypename(rs.getString(6));
				patient.setServicetypeid(rs.getInt(7));
				
				return patient;
			}
		});
		 return patientList;
	}

	public List<Patient> getAuthenticatePatient() {
		List<Patient>patientList=template.query("select patient.patid,patient.name,patient.duration,message.name,servicetype.servicetypename,patient.servicetypeid,patient.careid ,patient.id from patient inner join servicetype inner join caregiver inner join user inner join message inner join userlogin on servicetype.servicetypeid=patient.servicetypeid and caregiver.careid=patient.careid and message.id=patient.id and user.password=userlogin.password ",new RowMapper<Patient>() {
			 public Patient mapRow(ResultSet rs,int row) throws SQLException{
					Patient patient= new Patient();
					patient.setPatid(rs.getInt(1));
					patient.setName(rs.getString(2));
					patient.setDuration(rs.getString(3));
					patient.setSdate(rs.getString(4));
					patient.setEdate(rs.getString(5));
					patient.setServicetypename(rs.getString(6));
					patient.setMessagename(rs.getString(7));
					patient.setCarename(rs.getString(8));
					patient.setPrice(rs.getDouble(9));
					patient.setServicetypeid(rs.getInt(10));
					patient.setCareid(rs.getInt(11));
					patient.setId(rs.getInt(12));
					return patient;
				}
			});
			return patientList;
		}
		public List<Patient> countPatients(){
			return template.query("select count(*)from patient", new RowMapper<Patient>(){
			public Patient mapRow(ResultSet rs,int row)throws SQLException{
				Patient patient =new Patient();
				patient.setPatid(rs.getInt(1));
				return patient;
			}
		});
	}
		
		public List<Patient> getListPatient() {
			 List<Patient> patientList=template.query("select p.patid,p.name,p.duration,m.name,s.servicetypename,s.servicetypeid,m.id from patient p,servicetype s,message m where careid is null and p.servicetypeid=s.servicetypeid and p.id=m.id ", new RowMapper<Patient>() {
				public Patient mapRow(ResultSet rs,int row) throws SQLException{
					Patient patient= new Patient();
					patient.setPatid(rs.getInt(1));
					patient.setName(rs.getString(2));
					patient.setDuration(rs.getString(3));
					patient.setMessagename(rs.getString(4));
					patient.setServicetypename(rs.getString(5));
					
					patient.setServicetypeid(rs.getInt(6));
					patient.setId(rs.getInt(7));
					return patient;
				}
			});
			 return patientList;
		}
 
		public int confirmPatientForDelete(int patientId) {
			  int count = 0;
			  try (Connection conn = getConnection();
			       PreparedStatement pstmt = conn.prepareStatement("SELECT COUNT(*) FROM appointments WHERE patient_id = ?")) {
			    pstmt.setInt(1, patientId);
			    try (ResultSet rs = pstmt.executeQuery()) {
			      if (rs.next()) {
			        count = rs.getInt(1);
			      }
			    }
			  } catch (SQLException e) {
			    // Handle any exceptions
			    e.printStackTrace();
			  }
			  return count;
			}

		private Connection getConnection() {
			// TODO Auto-generated method stub
			return null;
		}
	
}
