package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.bean.Caregiver;
import com.java.bean.Department;
import com.java.dao.DepartmentDao;

@Controller
public class DepartmentController {

	@Autowired
	DepartmentDao departmentDao;
	
//	@RequestMapping("/")
//	public String showAdminForm(Model m) {
//		m.addAttribute("department", new Department());
//		return "user/home";
//	}

	@RequestMapping("/adddepartment")
	public String showAddForm(Model m) {
		m.addAttribute("department", new Department());
		return "admin/add_department";
	}

	@RequestMapping(value = "/saveDepartment", method = RequestMethod.POST)
	public String saveDepartment(@ModelAttribute("department") Department department,Model m) {
		departmentDao.saveDepartment(department);
		List<Department> departmentList=departmentDao.getDepartment();
		m.addAttribute("departmentList",departmentList);
		return "admin/department";
	}
	
	@RequestMapping("/departmentList")
	public String showDepartmentList(Model m) {
		List<Department> departmentList=departmentDao.getDepartment();
		m.addAttribute("departmentList",departmentList);
		return "admin/department";
	}
	
	@RequestMapping(value = "/deleteDepartment/{id}", method = RequestMethod.GET)
	public String deleteDepartment(@PathVariable int id, Model m) {
		departmentDao.deleteDepartment(id);
		return "redirect:/departmentList";
	}
	
	@RequestMapping(value = "/editDepartment/{id}")
	public String editDepartment(@PathVariable int id, Model m) {	
		Department department = departmentDao.getDepartmentById(id);
		m.addAttribute("department", department);
		return "admin/edit_department";
	}
	
	@RequestMapping(value = "/editSaveDepartment", method = RequestMethod.POST)
	public String eidtsaveDepartment(@ModelAttribute("department") Department department) {
		departmentDao.updateDepartment(department);
		return "redirect:/departmentList";
	}
	

	@RequestMapping(value="/cancelSaveDepartment")
	public String canclesaveDepartment(@ModelAttribute("department") Department department) {
		return "redirect:/departmentList";
	}
	
}
