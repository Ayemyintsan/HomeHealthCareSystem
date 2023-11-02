package com.java.controller;

import java.util.List;

import org.apache.catalina.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.bean.ServiceType;
import com.java.bean.User;
import com.java.bean.Admin;
import com.java.bean.Caregiver;
import com.java.bean.Department;
import com.java.bean.Message;
import com.java.bean.Patient;
import com.java.bean.Record;
import com.java.dao.ServiceTypeDao;
import com.java.dao.CaregiverDao;
import com.java.dao.DepartmentDao;
import com.java.dao.MessageDao;
import com.java.dao.PatientDao;
import com.java.dao.RecordDao;


import javax.servlet.http.*;
@Controller
public class PateintController {
	@Autowired
	PatientDao patientDao;
	
	@Autowired
	ServiceTypeDao serviceTypeDao;
	
	@Autowired 
	CaregiverDao caregiverDao;
	
	@Autowired 
	RecordDao recordDao;
	
	@Autowired
	DepartmentDao departmentDao;
	
	@Autowired 
	MessageDao messageDao;
	
	
	@RequestMapping("/allpatientList")
	public String showAllPatientList(Model m) {
		List<Patient>patientList=patientDao.getListPatient();
		m.addAttribute("patientList",patientList);
		List<ServiceType> serviceTypeList=serviceTypeDao.getServiceTypes();
		m.addAttribute("serviceTypeList",serviceTypeList);
		List<Message> messageList=messageDao.getMessage();
		m.addAttribute("messageList",messageList);
		return "admin/patient_request_form";
	}
	
	@RequestMapping("/register")
	public String showAddForm(Model m,HttpSession httpSession) {
		m.addAttribute("patient", new Patient());
		List<ServiceType> servicetypeList=serviceTypeDao.getServiceTypes();
		m.addAttribute("servicetypeList",servicetypeList);
		List<Message> messageList=messageDao.getMessage();
		m.addAttribute("messageList",messageList);
		//session
		User user=(User)httpSession.getAttribute("userSession");
		httpSession.setAttribute("userSession", user);
		return "user/register";
	}
	
	
	@RequestMapping(value = "/savePatient", method = RequestMethod.POST)
	public String savePatient(@ModelAttribute("patient") Patient patient,Model m,HttpSession httpSession) {
		patientDao.savePatient(patient);
		m.addAttribute("patient",new Patient());
		List<Patient>patientList=patientDao.getListPatient();
		m.addAttribute("patientList",patientList);
		List<ServiceType> servicetypeList=serviceTypeDao.getServiceTypes();
		m.addAttribute("servicetypeList",servicetypeList);
		List<Message> messageList=messageDao.getMessage();
		m.addAttribute("messageList",messageList);
		//session
		User user=(User)httpSession.getAttribute("userSession");
		httpSession.setAttribute("userSession", user);
		return "index";
	}
	
	@RequestMapping("/patientList")
	public String showPatientList(Model m) {
		List<Patient> patientList=patientDao.getListPatient();
		m.addAttribute("patientList",patientList);
		List<ServiceType> servicetypeList=serviceTypeDao.getServiceTypes();
		m.addAttribute("servicetypeList",servicetypeList);
		List<Message> messageList=messageDao.getMessage();
		m.addAttribute("messageList",messageList);
		return "admin/patient_request_form";
	}
	
	@RequestMapping(value = "/deletePatient/{patid}", method = RequestMethod.GET)
	public String deletePatient(@PathVariable int patid,RedirectAttributes reAtt) {
		int i=patientDao.confirmPatientForDelete(patid);
		if(i>0) {
			String message="Can't delete this caregiver!";
			reAtt.addFlashAttribute("resultFlag",0);
			reAtt.addFlashAttribute("message",message);
			return "redirect:/allpatientList";
		}else {
		patientDao.deletePatient(patid);
		String message="Successfully delete patient information";
		reAtt.addFlashAttribute("resultFlag",1);
		reAtt.addFlashAttribute("message",message);
		return "redirect:/allpatientList";
		}
		
	}
	
	@RequestMapping(value="/editPatient/{patid}")
	public String editPatient(@PathVariable int patid,Model m) {
		Patient patient=patientDao.getJointPatientById(patid);
		m.addAttribute("patient",patient);
		
		List<ServiceType> servicetypeList=serviceTypeDao.getServiceTypes();
		m.addAttribute("servicetypeList",servicetypeList);
		
		List<Message> messageList=messageDao.getMessage();
		m.addAttribute("messageList",messageList);
		
		List<Caregiver> caregiverList=caregiverDao.getCaregiver();
		m.addAttribute("caregiverList",caregiverList);
		
		return "admin/reply";
	}
	
	@RequestMapping(value="/editSavePatient", method = RequestMethod.POST)
	public String editsavePatient(@ModelAttribute("patient") Patient patient,Model m) {
		//recordDao.saveRecord(record);
		//m.addAttribute("record",new Record());
		patientDao.updatePatient(patient);
		m.addAttribute("patient",new Patient());
		List<Patient> patientList=patientDao.getJointCaregiver();
		m.addAttribute("patientList",patientList);
		List<ServiceType> servicetypeList=serviceTypeDao.getServiceTypes();
		m.addAttribute("servicetypeList",servicetypeList);
		List<Caregiver> caregiverList=caregiverDao.getCaregiver();
		m.addAttribute("caregiverList",caregiverList);
		//List<Record> recordList=recordDao.getRecord();
		//m.addAttribute("recordList",recordList);
		List<Message> messageList=messageDao.getMessage();
		m.addAttribute("messageList",messageList);
		return "admin/acceptpatient";
	}
	
	@RequestMapping("/acceptpatient")
	public String showAcceptPatientForm(Model m) {
		//m.addAttribute("record", new Record());
		m.addAttribute("patient",new Patient());
		List<Patient> patientList=patientDao.getJointCaregiver();
		m.addAttribute("patientList",patientList);
		List<ServiceType> servicetypeList=serviceTypeDao.getServiceTypes();
		m.addAttribute("servicetypeList",servicetypeList);
		List<Caregiver> caregiverList=caregiverDao.getCaregiver();
		m.addAttribute("caregiverList",caregiverList);
		List<Message> messageList=messageDao.getMessage();
		m.addAttribute("messageList",messageList);
		return "admin/acceptpatient";
	}
	

	@RequestMapping(value="/cancelSavePatient")
	public String canclesavePatient(@ModelAttribute("patient") Patient patient) {
		return "user/contact";
	}
	@RequestMapping(value = "/deleteAcceptPatient/{patid}", method = RequestMethod.GET)
	public String deleteAcceptPatient(@PathVariable int patid) {
		patientDao.deletePatient(patid);
		return "redirect:/allpatientList";
	}
	
}
