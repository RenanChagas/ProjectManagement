package br.com.management.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.management.model.Project;
import br.com.management.model.User;
import br.com.management.service.ProjectService;
import br.com.management.service.UserService;

@Controller
public class ProjectController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ProjectService projectService;
	
	@ModelAttribute("user")
	public User getUserName() {
		return userService.findByUsername(getPrincipal());
	}
	
	@RequestMapping("/projects")
	public String list(Model model){
		model.addAttribute("project", projectService.findAllByOrderByIdAsc());
		return "projects";
	}
	
	@RequestMapping(value = "/projects/create", method = RequestMethod.GET)
	public String newProject(ModelMap model) {
		
		Project project = new Project();
		model.addAttribute("project", project);
		return "projectCreate";
	}
	
	@RequestMapping(value = "/projects/create", method = RequestMethod.POST)
	public String newProject(Project project,
			BindingResult result, ModelMap model) {

		System.out.println(project.toString());
		
		//if (result.hasErrors()) {
		//	System.out.println("There are errors");
		//	return "projectCreate";
		//}
		projectService.save(project);

		return "redirect:/projects";
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
