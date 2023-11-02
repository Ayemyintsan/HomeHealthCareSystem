package com.java.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.bean.Admin;
import com.java.bean.Caregiver;
import com.java.bean.Department;
import com.java.bean.Message;
import com.java.bean.Patient;
import com.java.bean.ServiceType;
import com.java.bean.Supervisor;
import com.java.bean.User;
import com.java.dao.CaregiverDao;
import com.java.dao.DepartmentDao;
import com.java.dao.MessageDao;
import com.java.dao.PatientDao;
import com.java.dao.ServiceTypeDao;
import com.java.dao.SupervisorDao;
import com.java.dao.UserDao;
@Controller
public class UserController {
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	ServiceTypeDao servicetypeDao;
	
	@Autowired
	SupervisorDao supervisorDao;
	
	@Autowired
	CaregiverDao caregiverDao;
	
	@Autowired
	PatientDao patientDao;
	
	@Autowired 
	DepartmentDao departmentDao;
	
	@Autowired
	MessageDao messageDao;
	
	@RequestMapping("/contact")
	public String showAddForm(Model m) {
		m.addAttribute("user",new User());
		List<Message> messageList=messageDao.getMessage();
		m.addAttribute("messageList",messageList);
		return "user/contact";
	}

	@RequestMapping(value = "/saveUser", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("user") User user,Model m,HttpSession httpSession)throws NoSuchAlgorithmException, IOException {
		int a=userDao.authenticateUser(user.getEmail(), user.getPassword());
		if(a>0) {
			m.addAttribute("wrong_login",true);
			return "user/contact";
		}
		else {
			userDao.saveUser(user);
			m.addAttribute("patient",new Patient());
			List<User> userList=userDao.getUser();
			m.addAttribute("useList",userList);
			List<ServiceType> servicetypeList=servicetypeDao.getServiceTypes();
			m.addAttribute("servicetypeList",servicetypeList);
			List<Message> messageList=messageDao.getMessage();
			m.addAttribute("messageList",messageList);
			
			return "user/register";
		}
		
	}
	
	@RequestMapping("/userList")
	public String showUserList(Model m) {
		List<User> userList=userDao.getUser();
		m.addAttribute("userList",userList);
		return "admin/userList";
	}
	
	@RequestMapping(value = "/deleteUser/{id}", method = RequestMethod.GET)
	public String deleteUser(@PathVariable int id, Model m) {
		userDao.deleteUser(id);
		return "redirect:/userList";
	}
	
	@RequestMapping(value="/cancelSaveUser")
	public String canclesaveUser(@ModelAttribute("user") User user) {
		return "user/home";
	}
	
	@RequestMapping("/dashboard")
	public String showDashboard(Model m,HttpSession httpSession) {
		List<User> countuser = userDao.countUsers();
		m.addAttribute("countuser",countuser);
		m.addAttribute("user",new User());
		
		
		List<ServiceType> countservicetype = servicetypeDao.countServicetypes();
		m.addAttribute("countservicetype",countservicetype);
		m.addAttribute("servicetype",new ServiceType());
		
		List<Supervisor> countsupervisor = supervisorDao.countSupervisors();
		m.addAttribute("countsupervisor",countsupervisor);
		m.addAttribute("supervisor",new Supervisor());
		
		List<Caregiver> countcaregiver = caregiverDao.countCaregivers();
		m.addAttribute("countcaregiver",countcaregiver);
		m.addAttribute("caregiver",new Caregiver());
		
		List<Patient> countpatient = patientDao.countPatients();
		m.addAttribute("countpatient",countpatient);
		m.addAttribute("patient",new Patient());
		
//		List<Department> countdepartment = departmentDao.countDepartments();
//		m.addAttribute("countdepartment",countdepartment);
//		m.addAttribute("department",new Department());
		
		Admin admin=(Admin)httpSession.getAttribute("adminSession");
		httpSession.setAttribute("adminSession", admin);
		
		return "admin/dashboard";
	}
	
	
}
