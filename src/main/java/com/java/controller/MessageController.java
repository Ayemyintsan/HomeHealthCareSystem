package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.bean.Message;
import com.java.bean.Supervisor;
import com.java.dao.MessageDao;


@Controller
public class MessageController {
	@Autowired
	MessageDao messageDao;
	
	@RequestMapping("/messageList")
	public String showMessageList(Model m) {
		List<Message> messageList=messageDao.getMessage();
		m.addAttribute("messageList",messageList);
		
		return "admin/message";
	}
//	@RequestMapping("/allmessageList")
//	public String showAllMessageList(Model m) {
//		List<Message> messageList=messageDao.getMessage();
//		m.addAttribute("messageList",messageList);
////		List<Department> departmentList=departmentDao.getDepartment();
////		m.addAttribute("departmentList",departmentList);
//		return "admin/message";
//	}
	
	@RequestMapping("/addmessage")
	public String showAddForm(Model m) {
		m.addAttribute("message", new Message());
		
		return "admin/add_message";
	}

	@RequestMapping(value = "/saveMessage", method = RequestMethod.POST)
	public String saveMessage(@ModelAttribute("message") Message message,Model m) {
		messageDao.saveMessage(message);
		
		return "redirect:/messageList";
	}
	
	
	
	@RequestMapping(value = "/deleteMessage/{id}", method = RequestMethod.GET)
	public String deleteMessage(@PathVariable int id, Model m) {
		messageDao.deleteMessage(id);
		return "redirect:/messageList";
	}
	
	@RequestMapping(value = "/editMessage/{id}")
	public String editMessage(@PathVariable int id, Model m) {	
		Message message = messageDao.getMessageById(id);
		m.addAttribute("message", message);
		List<Message> messageList=messageDao.getMessage();
		m.addAttribute("messageList",messageList);
		
		return "admin/edit_message";
	}
	
	@RequestMapping(value = "/editSaveMessage", method = RequestMethod.POST)
	public String eidtsaveMessage(@ModelAttribute("message") Message message,Model m) {
		messageDao.updateMessage(message);
		
		return "redirect:/messageList";
	}
	
	@RequestMapping(value="/cancelSaveMessage")
	public String canclesaveMessage(@ModelAttribute("message") Message message) {
		return "redirect:/messageList";
	}


}
