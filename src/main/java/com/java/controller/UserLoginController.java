package com.java.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.bean.Caregiver;
import com.java.bean.Message;
import com.java.bean.Patient;
import com.java.bean.ServiceType;
import com.java.bean.User;
import com.java.bean.UserLogin;
import com.java.dao.CaregiverDao;
import com.java.dao.MessageDao;
import com.java.dao.PatientDao;
import com.java.dao.ServiceTypeDao;
import com.java.dao.UserLoginDao;
@Controller
public class UserLoginController {
	@Autowired
	UserLoginDao userloginDao;
	
	@Autowired
	ServiceTypeDao serviceTypeDao;
	
	@Autowired
	MessageDao messageDao;
	
	@RequestMapping("/showUserLoginForm")
	public String showUserLoginForm(Model m,HttpSession session) {
		m.addAttribute("user",new User());
		session.invalidate();
		return "user/userlogin";
    }
	
	@RequestMapping(value = "/userlogin", method = RequestMethod.POST)
	public String userLogin(@ModelAttribute("user") User user,Model m,HttpSession httpSession) throws NoSuchAlgorithmException, IOException {
		int a = userloginDao.authenticateUser(user.getEmail(), user.getPassword());
//		int a1 = userloginDao.getUsername(user.getEmail());
//		int a2 = userloginDao.getPassword(user.getPassword());
//		
//		if(a1<=0) {
//			m.addAttribute("wrong_email",true);
//			return "user/userlogin";
//		}
////		else
////			{
////			m.addAttribute("patient", new Patient());
////			List<ServiceType> servicetypeList=serviceTypeDao.getServiceTypes();
////			m.addAttribute("servicetypeList",servicetypeList);
////			List<Message> messageList=messageDao.getMessage();
////			m.addAttribute("messageList",messageList);
////			httpSession.setAttribute("userSession", user);
////			return "user/register";
////		}
//		
//		else if(a2<=0) {
//				m.addAttribute("wrong_password",true);
//				return "user/userlogin";
//			}
		//else
//			{
//				m.addAttribute("patient", new Patient());
//				List<ServiceType> servicetypeList=serviceTypeDao.getServiceTypes();
//				m.addAttribute("servicetypeList",servicetypeList);
//				List<Message> messageList=messageDao.getMessage();
//				m.addAttribute("messageList",messageList);
//				httpSession.setAttribute("userSession", user);
//				return "user/register";
//			}
		
		 if(a<=0)
		 {
			m.addAttribute("wrong_login",true);
			return "user/userlogin";
		}else  {
			//@RequestMapping("/register")
			// public String showRegisterForm(Model m) {
				m.addAttribute("patient", new Patient());
				List<ServiceType> servicetypeList=serviceTypeDao.getServiceTypes();
				m.addAttribute("servicetypeList",servicetypeList);
				List<Message> messageList=messageDao.getMessage();
				m.addAttribute("messageList",messageList);
				httpSession.setAttribute("userSession", user);
				return "user/register";
			}
			}
		
		
		
			//return "user/register";
		
	
	
	
	@RequestMapping("/logout")
	public String Logout(Model m,HttpSession session) {
		if(session!=null && session.getAttribute("userSession")==null) {
			session.invalidate();
		}
		m.addAttribute("user",new User());
		return "user/logout";
	}
	
	@RequestMapping(value="/cancelUser")
	public String canclesaveUser(@ModelAttribute("user") User user) {
		return "user/contact";
	}
	

	//@RequestMapping(value = "/saveUserLogin", method = RequestMethod.POST)
	//public String saveUserLogin(@ModelAttribute("userlogin") UserLogin userlogin,Model m) {
		//userloginDao.saveUserLogin(userlogin);
		//List<Patient> patientList=patientDao.getPatient();
		//m.addAttribute("patientList",patientList);
		//List<ServiceType> servicetypeList=serviceTypeDao.getServiceTypes();
		//m.addAttribute("servicetypeList",servicetypeList);
		//List<Caregiver> caregiverList=caregiverDao.getCaregiver();
		//m.addAttribute("caregiverList",caregiverList);
		//return "user/useInfo";
//}
}
