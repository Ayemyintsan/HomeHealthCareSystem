package com.java.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.bean.Caregiver;
import com.java.bean.Department;
import com.java.bean.ServiceType;
import com.java.bean.Supervisor;
import com.java.dao.CaregiverDao;
import com.java.dao.DepartmentDao;
import com.java.dao.SupervisorDao;



@Controller
public class CaregiverController {
	@Autowired
	CaregiverDao caregiverDao;
	
	@Autowired
	SupervisorDao supervisorDao;
	
	@Autowired
	DepartmentDao departmentDao;
	
	@RequestMapping("/allcaregiverList")
	public String showAllCaregiverList(Model m) {
		List<Caregiver> caregiverList=caregiverDao.getJointCaregiver();
		m.addAttribute("caregiverList",caregiverList);
		List<Supervisor>supervisorList=supervisorDao.getSupervisors();
		m.addAttribute("supervisorList",supervisorList);
//		List<Department> departmentList=departmentDao.getDepartment();
//		m.addAttribute("departmentList",departmentList);
		return "admin/caregiver";
	}
	
	@RequestMapping("/addcaregiver")
	public String showAddForm(Model m) {
		m.addAttribute("caregiver", new Caregiver());
		List<Supervisor>supervisorList=supervisorDao.getSupervisors();
		m.addAttribute("supervisorList",supervisorList);
		List<Department> departmentList=departmentDao.getDepartment();
		m.addAttribute("departmentList",departmentList);
		return "admin/add_caregiver";
	}

	@RequestMapping(value = "/saveCaregiver", method = RequestMethod.POST)
	public String savePhysician(@ModelAttribute("caregiver") Caregiver caregiver,Model m) {
		caregiverDao.saveCaregiver(caregiver);
		List<Supervisor>supervisorList=supervisorDao.getSupervisors();
		m.addAttribute("supervisorList",supervisorList);
		List<Department> departmentList=departmentDao.getDepartment();
		m.addAttribute("departmentList",departmentList);
		return "redirect:/allcaregiverList";
	}
	
	@RequestMapping("/caregiverList")
	public String showCaregiverList(Model m) {
		List<Caregiver> caregiverList=caregiverDao.getCaregiver();
		m.addAttribute("caregiverList",caregiverList);
		List<Supervisor>supervisorList=supervisorDao.getSupervisors();
		m.addAttribute("supervisorList",supervisorList);
		List<Department> departmentList=departmentDao.getDepartment();
		m.addAttribute("departmentList",departmentList);
		return "admin/caregiver";
	}
	
	@RequestMapping(value = "/deleteCaregiver/{careid}", method = RequestMethod.GET)
	public String deleteCaregiver(@PathVariable int careid, Model m,RedirectAttributes reAtt) {
		int i= caregiverDao.confirmCaregiverForDelete(careid);
		if(i>0) {
			String message = "Can't delete this patient!";
			reAtt.addFlashAttribute("resultFlag",0);
			return "redirect:/allcaregiverList";
		}else {
			caregiverDao.deleteCaregiver(careid);
			String message="Successfully delete patient information";
			reAtt.addFlashAttribute("resultFlag",1);
			
			System.out.println("Deleted");
			return "redirect:/allcaregiverList";
		}
		
	}
	
//	 @DeleteMapping("/deleteCaregiver/{careid}")
//	  public String deleteCaregiver(@PathVariable("careid") int careid,Model m) {
//			caregiverDao.deleteCaregiver(careid);
//			System.out.println("Deleted");
//			return "redirect:/allcaregiverList";
//	  }
	
	
	
	@RequestMapping(value = "/editCaregiver/{careid}")
	public String editCaregiver(@PathVariable int careid, Model m) {	
		Caregiver caregiver = caregiverDao.getJointCaregiverById(careid);
		m.addAttribute("caregiver", caregiver);
		List<Caregiver> caregiverList=caregiverDao.getCaregiver();
		m.addAttribute("caregiverList",caregiverList);
		List<Supervisor> supervisorList=supervisorDao.getSupervisors();
		m.addAttribute("supervisorList",supervisorList);
//		List<Department> departmentList=departmentDao.getDepartment();
//		m.addAttribute("departmentList",departmentList);
		return "admin/edit_caregiver";
	}
	
	@RequestMapping(value = "/editSaveCaregiver", method = RequestMethod.POST)
	public String eidtsaveCaregiver(@ModelAttribute("caregiver") Caregiver caregiver,Model m) {
		caregiverDao.updateCaregiver(caregiver);
		List<Supervisor>supervisorList=supervisorDao.getSupervisors();
		m.addAttribute("supervisorList",supervisorList);
//		List<Department> departmentList=departmentDao.getDepartment();
//		m.addAttribute("departmentList",departmentList);
		return "redirect:/allcaregiverList";
	}
	
	@RequestMapping(value="/cancelSaveCaregiver")
	public String canclesaveCaregiver(@ModelAttribute("caregiver") Caregiver caregiver) {
		return "redirect:/allcaregiverList";
	}

}
