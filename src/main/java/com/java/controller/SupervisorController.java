package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.bean.Caregiver;
import com.java.bean.Department;
import com.java.bean.Supervisor;
import com.java.dao.DepartmentDao;
import com.java.dao.SupervisorDao;



@Controller
public class SupervisorController {
	@Autowired
	SupervisorDao supervisorDao;
	
	@Autowired
	DepartmentDao departmentDao;
	
	@RequestMapping("/allsupervisorList")
	public String showAllSupervisorList(Model m) {
		List<Supervisor> supervisorList=supervisorDao.getJointSupervisor();
		m.addAttribute("supervisorList",supervisorList);
//		List<Department> departmentList=departmentDao.getDepartment();
//		m.addAttribute("departmentList",departmentList);
		return "admin/supervisor";
	}
	
	@RequestMapping("/addsupervisor")
	public String showAddForm(Model m) {
		m.addAttribute("supervisor", new Supervisor());
//		List<Department>departmentList=departmentDao.getDepartment();
//		m.addAttribute("departmentList",departmentList);
		return "admin/add_supervisor";
	}

	
	@RequestMapping(value = "/saveSupervisor", method = RequestMethod.POST)
	public String saveSupervisor(@ModelAttribute("supervisor") Supervisor supervisor,Model m) {
		supervisorDao.saveSupervisor(supervisor);
//		List<Department>departmentList=departmentDao.getDepartment();
//		m.addAttribute("departmentList",departmentList);
		return "redirect:/allsupervisorList";
	}
	
	@RequestMapping("/supervisorList")
	public String showSupervisorList(Model m) {
		List<Supervisor> supervisorList=supervisorDao.getJointSupervisor();
		m.addAttribute("supervisorList",supervisorList);
//		List<Department> departmentList=departmentDao.getDepartment();
//		m.addAttribute("departmentList",departmentList);
		return "admin/supervisor";
	}
//	@RequestMapping(value = "/deleteSupervisor/{supid}", method = RequestMethod.GET)
//	public String deleteSupervisor(@PathVariable int supid,Model m) {
//		supervisorDao.deleteSupervisor(supid);
//		return "redirect:/allsupervisorList";
//	}
	@RequestMapping(value = "/editSupervisor/{supid}")
	public String editSupervisor(@PathVariable int supid, Model m) {	
		Supervisor supervisor = supervisorDao.getJointSupervisorById(supid);
		m.addAttribute("supervisor", supervisor);
//		List<Department>departmentList=departmentDao.getDepartment();
//		m.addAttribute("departmentList",departmentList);
		return "admin/edit_supervisor";
	}
	
	@RequestMapping(value = "/editSaveSupervisor", method = RequestMethod.POST)
	public String eidtsaveSupervisor(@ModelAttribute("supervisor") Supervisor supervisor,Model m) {
		supervisorDao.updateSupervisor(supervisor);
//		List<Department>departmentList=departmentDao.getDepartment();
//		m.addAttribute("departmentList",departmentList);
		return "redirect:/allsupervisorList";
	}
	

	@RequestMapping(value="/cancelSaveSupervisor")
	public String canclesaveSupervisor(@ModelAttribute("supervisor") Supervisor supervisor) {
		return "redirect:/allsupervisorList";
	}
	
	@RequestMapping(value = "/deleteSupervisor/{supid}", method = RequestMethod.GET)
	public String deleteSupervisor(@PathVariable int supid, Model m,RedirectAttributes reAtt) {
		int i= supervisorDao.confirmSupervisorForDelete(supid);
		if(i>0) {
			String message = "Can't delete this patient!";
			reAtt.addFlashAttribute("resultFlag",0);
			return "redirect:/allsupervisorList";
		}else {
			supervisorDao.deleteSupervisor(supid);
			String message="Successfully delete patient information";
			reAtt.addFlashAttribute("resultFlag",1);
			
			System.out.println("Deleted");
			return "redirect:/allsupervisorList";
		}
		
	}
}
