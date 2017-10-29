package br.com.management.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.management.model.Notification;
import br.com.management.model.Task;
import br.com.management.model.User;
import br.com.management.service.NotificationService;
import br.com.management.service.TaskService;
import br.com.management.service.UserService;

@Controller
public class NotificationController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	NotificationService notificationService;
	
	@Autowired
	TaskService taskService;
	
	@ModelAttribute("user")
	public User getUserName() {
		return userService.findByUsername(getPrincipal());
	}
	
	@RequestMapping(value = "/notifications", method = RequestMethod.GET)
	public String findNotification(@RequestParam("id") int taskId, ModelMap model) {
		Task task = taskService.findById(taskId);
		
		model.addAttribute("notification", notificationService.findAllByTaskIdOrderByIdAsc(taskId));
		model.addAttribute("task", task);
		return "notification";
	}
	
	@RequestMapping(value = "/notifications/create", method = RequestMethod.POST)
	public String newNotification(@RequestParam("id") int taskId, ModelMap model) {
		Notification notification = new Notification();
		notificationService.save(notification);
		return "redirect:/notifications";
	}
	
	
	
	private String getPrincipal(){
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			userName = ((UserDetails)principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

}
