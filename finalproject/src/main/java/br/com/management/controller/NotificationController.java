package br.com.management.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.management.model.Notification;
import br.com.management.model.User;
import br.com.management.service.NotificationService;
import br.com.management.service.TaskService;
import br.com.management.service.UserService;

@Controller
@RequestMapping("/notification")
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
	
	@RequestMapping(value = { "" , "/" })
	public String findNotification(ModelMap model) {
		
		model.addAttribute("currentSorting", "Latest");
		model.addAttribute("notification", notificationService.findAllByUserOrderByIdAsc(userService.findByUsername(getPrincipal())));
		return "notifications";
	}
	
	@RequestMapping(value= "/filter/{sortingType}", method = RequestMethod.GET)
	public String sortNotification(ModelMap model, @PathVariable String sortingType){
		
		model.addAttribute("currentSorting", sortingType);
		
		model.addAttribute("notification", notificationService.findByFilter(sortingType, userService.findByUsername(getPrincipal())));
		return "notifications";
	}
	
	
	@RequestMapping(value = "/updateNotificationStatus", method = RequestMethod.POST)
	public void updateStatus(Notification notification, HttpServletResponse response){
		notificationService.updateNotificationStatus(notification);
		response.setStatus(200);
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
