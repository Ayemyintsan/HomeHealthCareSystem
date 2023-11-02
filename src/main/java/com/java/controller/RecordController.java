package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.bean.Caregiver;
import com.java.bean.Patient;
import com.java.bean.Record;
import com.java.bean.ServiceType;
import com.java.dao.CaregiverDao;
import com.java.dao.PatientDao;
import com.java.dao.RecordDao;
import com.java.dao.ServiceTypeDao;

public class RecordController {
	
	@Autowired
	ServiceTypeDao serviceTypeDao;
	
	@Autowired
	PatientDao patientDao;
	
	@Autowired
	CaregiverDao caregiverDao;
	
	@Autowired
	RecordDao recordDao;
	
	@RequestMapping("/acceptpatient")
	public String showAddForm(Model m) {
		List<Record>recordList = recordDao.getRecord();
		m.addAttribute("recordList",recordList);
		
		return "admin/acceptpatient";
	}
	@RequestMapping(value = "/saveRecord", method = RequestMethod.POST)
	public String saveRecord(@ModelAttribute("record") Record record,Model m) {
		recordDao.saveRecord(record);
		m.addAttribute("record",new Record());
		List<Patient>patientList=patientDao.getJointPatient();
		m.addAttribute("patientList",patientList);
		List<ServiceType> servicetypeList=serviceTypeDao.getServiceTypes();
		m.addAttribute("servicetypeList",servicetypeList);
		List<Caregiver> caregiverList=caregiverDao.getCaregiver();
		m.addAttribute("caregiverList",caregiverList);
		List<Record> recordList=recordDao.getRecord();
		m.addAttribute("recordList",recordList);
		return "redirect:/recordList";
	}
	@RequestMapping("/recordList")
	public String showRecordList(Model m) {
		List<Record> recordList=recordDao.getRecord();
		m.addAttribute("recordList",recordList);
		return "admin/acceptpatient";
	}

}
