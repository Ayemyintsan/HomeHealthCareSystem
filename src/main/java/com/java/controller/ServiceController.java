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
import com.java.bean.Service;
import com.java.bean.ServiceType;
import com.java.dao.ServiceDao;
import com.java.dao.ServiceTypeDao;


@Controller
public class ServiceController {
	@Autowired
	ServiceDao serviceDao;
	
	@Autowired
	ServiceTypeDao serviceTypeDao;
	
	@RequestMapping("/allserviceList")
	public String showAllServiceList(Model m) {
		List<Service> serviceList=serviceDao.getJointServiceType();
		m.addAttribute("serviceList",serviceList);
		List<ServiceType> serviceTypeList=serviceTypeDao.getServiceTypes();
		m.addAttribute("serviceTypeList",serviceTypeList);
		return "admin/service";
	}
	

	@RequestMapping("/addservice")
	public String showAddForm(Model m) {
		m.addAttribute("service", new Service());
		List<ServiceType> serviceTypeList=serviceTypeDao.getServiceTypes();
		m.addAttribute("serviceTypeList",serviceTypeList);
		
		return "admin/add_service";
	}

	@RequestMapping(value = "/saveService", method = RequestMethod.POST)
	public String saveService(@ModelAttribute("service") Service service,Model m) {
		serviceDao.saveService(service);
		List<Service>serviceList=serviceDao.getJointServiceType();
		m.addAttribute("serviceList",serviceList);
		return "admin/service";
	}
	
	@RequestMapping("/serviceList")
	public String showServiceList(Model m) {
		List<Service> serviceList=serviceDao.getService();
		m.addAttribute("serviceList",serviceList);
		List<ServiceType> serviceTypeList=serviceTypeDao.getServiceTypes();
		m.addAttribute("serviceTypeList",serviceTypeList);
		return "admin/service";
	}
	
	
	
	@RequestMapping(value = "/deleteService/{id}", method = RequestMethod.GET)
	public String deleteService(@PathVariable int id, Model m) {
		serviceDao.deleteService(id);
		return "redirect:/allserviceList";
	}
	
	@RequestMapping(value = "/editService/{id}")
	public String editService(@PathVariable int id, Model m) {	
		Service service = serviceDao.getJointServiceById(id);
		List<ServiceType> serviceTypeList=serviceTypeDao.getServiceTypes();
		m.addAttribute("service", service);
		m.addAttribute("serviceTypeList",serviceTypeList);
		return "admin/edit_service";
	}
	
	@RequestMapping(value = "/editSaveService", method = RequestMethod.POST)
	public String eidtsaveService(@ModelAttribute("service") Service service,Model m) {
		serviceDao.updateService(service);
		List<ServiceType> serviceTypeList=serviceTypeDao.getServiceTypes();
		m.addAttribute("serviceTypeList",serviceTypeList);
		return "redirect:/allserviceList";
	}
	

	@RequestMapping(value="/cancelSaveService")
	public String canclesaveService(@ModelAttribute("service") Service service) {
		return "redirect:/allserviceList";
	}

}
