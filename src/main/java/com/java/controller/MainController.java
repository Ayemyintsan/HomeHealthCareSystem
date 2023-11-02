package com.java.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSession.*;

import org.apache.catalina.Manager;
import org.apache.log4j.chainsaw.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.bean.Admin;
import com.java.bean.Caregiver;
import com.java.bean.Department;
import com.java.bean.Patient;
import com.java.bean.ServiceType;
import com.java.bean.Supervisor;
import com.java.bean.User;
import com.java.dao.AdminDao;
import com.java.dao.CaregiverDao;
import com.java.dao.DepartmentDao;
import com.java.dao.PatientDao;
import com.java.dao.ServiceTypeDao;
import com.java.dao.SupervisorDao;
import com.java.dao.UserDao;
import com.java.dao.UserLoginDao;
import com.mysql.cj.Session;

@Controller
public class MainController {
	@Autowired
	AdminDao adminDao;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	PatientDao patientDao;
	
	@Autowired
	ServiceTypeDao servicetypeDao;
	
	@Autowired
	SupervisorDao supervisorDao;
	
	@Autowired
	CaregiverDao caregiverDao;
	
	@Autowired
	DepartmentDao departmentDao;
	
	
	
	@RequestMapping("/")
	public String index(Model m) {
		return "index";
    }
	
	@RequestMapping("/home")
	public String showHomeForm(Model m,HttpSession session) {
		session.invalidate();
		
		return "user/home";
    }
	
	@RequestMapping("/about_us")
	public String showAboutForm(Model m,HttpSession session) {
		session.invalidate();
		return "user/about_us";
    }
	
	@RequestMapping("/service")
	public String showServiceForm(Model m,HttpSession session) {
		session.invalidate();
		return "user/service";
    }
	@RequestMapping("/service2")
	public String showService2Form(Model m,HttpSession session) {
		session.invalidate();
		return "user/service2";
    }
	
	@RequestMapping("/physician")
	public String showPhysicianForm(Model m,HttpSession session) {
		session.invalidate();
		return "user/physician";
    }
	@RequestMapping("/signup")
	public String showSignUpForm(Model m,HttpSession httpSession) {
//		User user=(User)httpSession.getAttribute("userSession");
//		httpSession.setAttribute("userSession", user);
//		//httpSession.invalidate();
		return "user/signup";
    }

	@RequestMapping("/showLoginForm")
	public String showAdminForm(Model m,HttpSession session) {
		
		session.invalidate();
		
		m.addAttribute("admin",new Admin());
		return "admin/login";
    }
	
	@RequestMapping("/login")
	public String adminLogin(@ModelAttribute("admin") Admin admin,Model m,HttpSession httpSession) throws NoSuchAlgorithmException, IOException {
		int a = adminDao.authenticateAdmin(admin.getUsername(), admin.getPassword());
		if(a <=0)
		 {
			m.addAttribute("wrong_login",true);
			return "admin/login";
		}
		else {
			List<User> countuser = userDao.countUsers();
			m.addAttribute("countuser",countuser);
			m.addAttribute("user",new User());
			httpSession.setAttribute("countuser", countuser);
			
			List<ServiceType> countservicetype = servicetypeDao.countServicetypes();
			m.addAttribute("countservicetype",countservicetype);
			m.addAttribute("servicetype",new ServiceType());
			httpSession.setAttribute("countservicetype", countservicetype);
			
			List<Supervisor> countsupervisor = supervisorDao.countSupervisors();
			m.addAttribute("countsupervisor",countsupervisor);
			m.addAttribute("supervisor",new Supervisor());
			httpSession.setAttribute("countsupervisor", countsupervisor);
			
			List<Caregiver> countcaregiver = caregiverDao.countCaregivers();
			m.addAttribute("countcaregiver",countcaregiver);
			m.addAttribute("caregiver",new Caregiver());
			httpSession.setAttribute("countcaregiver", countcaregiver);
			
			List<Patient> countpatient = patientDao.countPatients();
			m.addAttribute("countpatient",countpatient);
			m.addAttribute("patient",new Patient());
			httpSession.setAttribute("countpatient", countpatient);
			
			
			//List<Department> countdepartment = departmentDao.countDepartments();
			//m.addAttribute("countdepartment",countdepartment);
			//m.addAttribute("department",new Department());
			//httpSession.setAttribute("countuser", countuser);
			httpSession.setAttribute("adminSession", admin);
			
			return "admin/dashboard";
			
		}
    }
	
	
}
	
	

