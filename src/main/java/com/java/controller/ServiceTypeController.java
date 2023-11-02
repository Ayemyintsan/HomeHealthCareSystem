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

import com.java.bean.Patient;
import com.java.bean.ServiceType;
import com.java.dao.ServiceTypeDao;



@Controller

public class ServiceTypeController {
	@Autowired
	ServiceTypeDao servicetypeDao;

	@RequestMapping("/addservicetype")
	public String showAddForm(Model m) {
		m.addAttribute("servicetype", new ServiceType());
		return "admin/add_servicetype";
	}

	@RequestMapping(value = "/saveServiceType", method = RequestMethod.POST)
	public String saveServiceType(@ModelAttribute("servicetype") ServiceType servicetype,Model m) {
		servicetypeDao.saveServiceType(servicetype);
		List<ServiceType> servicetypeList=servicetypeDao.getServiceTypes();
		m.addAttribute("servicetypeList",servicetypeList);
		return "redirect:/servicetypeList";
	}
	
	@RequestMapping("/servicetypeList")
	public String showServiceTypeList(Model m) {
		List<ServiceType> serviceTypeList=servicetypeDao.getServiceTypes();
		m.addAttribute("servicetypeList",serviceTypeList);
		return "admin/servicetypeList";
	}
	
	@RequestMapping(value = "/deleteServiceType/{id}", method = RequestMethod.GET)
	public String deleteServiceType(@PathVariable int id, Model m,RedirectAttributes reAtt) {
		int i= servicetypeDao.confirmServiceTypeForDelete(id);
		if(i>0) {
			String message = "Can't delete this patient!";
			reAtt.addFlashAttribute("resultFlag",0);
			return "redirect:/servicetypeList";
		}else {
			servicetypeDao.deleteServiceType(id);
			String message="Successfully delete patient information";
			reAtt.addFlashAttribute("resultFlag",1);
			
			System.out.println("Deleted");
			return "redirect:/servicetypeList";
		}
//		servicetypeDao.deleteServiceType(id);
//		return "redirect:/servicetypeList";
	}
	
	@RequestMapping(value = "/editServiceType/{id}")
	public String editServiceType(@PathVariable int id, Model m) {	
		ServiceType servicetype = servicetypeDao.getServiceTypeById(id);
		m.addAttribute("servicetype", servicetype);
		return "admin/edit_servicetype";
	}
	
	@RequestMapping(value = "/editSaveServiceType", method = RequestMethod.POST)
	public String eidtsaveServiceType(@ModelAttribute("servicetype") ServiceType servicetype) {
		servicetypeDao.updateServiceType(servicetype);
		return "redirect:/servicetypeList";
	}
	
	@RequestMapping(value="/cancelSaveServiceType")
	public String canclesaveServiceType(@ModelAttribute("servicetype") ServiceType servicetype) {
		return "redirect:/servicetypeList";
	}
	
	
	
}
