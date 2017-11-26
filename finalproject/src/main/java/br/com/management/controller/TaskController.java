package br.com.management.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.management.model.Project;
import br.com.management.model.Task;
import br.com.management.model.User;
import br.com.management.model.TaskType;
import br.com.management.service.ProjectService;
import br.com.management.service.TaskService;
import br.com.management.service.UserService;

@Controller
public class TaskController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ProjectService projectService;
	
	@Autowired
	TaskService taskService;
	
	@ModelAttribute("user")
	public User getUserName() {
		return userService.findByUsername(getPrincipal());
	}
	
	@ModelAttribute("allUsers")
	public List<User> getAllUsers() {
		return userService.findAllByOrderByIdAsc();
	}
	
	@RequestMapping(value = "/projects/tasks", method = RequestMethod.GET)
	public String list(@RequestParam("id") int projectId, Model model){
		Project project = projectService.findById(projectId);
		
		model.addAttribute("currentSorting", "Latest");
		model.addAttribute("task", taskService.findProjectTasksByFilter("Latest", projectId));
		model.addAttribute("project", project);
		return "tasks";
	}
	
	//FILTER
	@RequestMapping(value= "/projects/tasks/filter/{sortingType}", method = RequestMethod.GET)
	public String sortTask(@RequestParam("id") int projectId, Model model, 
			@PathVariable String sortingType){
		
		Project project = projectService.findById(projectId);
			
		model.addAttribute("currentSorting", sortingType);
		model.addAttribute("task", taskService.findProjectTasksByFilter(sortingType, projectId));
		model.addAttribute("project", project);
		return "tasks";
	}
	
	
	@RequestMapping(value = "/task/myTasks", method = RequestMethod.GET)
	public String myTask(Model model){
		model.addAttribute("currentSorting", "Latest");
		model.addAttribute("task", taskService.findMyTaskByFilter("Latest", getUserName()));
		return "myTasks";
	}
	
	//FILTER MY TASKS
	@RequestMapping(value= "/task/filter/{sortingType}", method = RequestMethod.GET)
	public String sortMyTasks(ModelMap model, @PathVariable String sortingType){
		
		model.addAttribute("currentSorting", sortingType);
		model.addAttribute("task", taskService.findMyTaskByFilter(sortingType, getUserName()));
		return "myTasks";
	}
	
	
	@RequestMapping(value = "/task/create", method = RequestMethod.GET)
	public String newTask(@RequestParam("id") int projectId, @RequestParam("taskType") int taskType, ModelMap model) {
		Project project = projectService.findById(projectId);
		Task task = new Task();
		
		model.addAttribute("task", task);
		model.addAttribute("project", project);
		model.addAttribute("user2",new User());
		return "taskCreate";
	}
	
	@RequestMapping(value = "/task/create", method = RequestMethod.POST)
	public String newTask(@RequestParam("id") int projectId, @RequestParam("taskType") int taskType, ModelMap model, Task task,
			BindingResult result, RedirectAttributes ra, @ModelAttribute("user") User selectedUser) {
		
		TaskType taskType2 = new TaskType();
		taskType2.setId(taskType);
		task.setTaskType(taskType2);
	
		//SETANDO O USUARIO DA TASK
		User user = userService.findByUsername(selectedUser.getUsername());
		task.setUser(user);
		
		if (task.getCreateUser() == null){
			Date date = new Date();
			task.setCreateDate(date);
			task.setCreateUser(getPrincipal());
		}
		
		System.out.println("Verificando objeto Usuario" + task);
		
		Project project = projectService.findById(projectId);
		task.setProject(project);
		
		taskService.save(task);
		ra.addAttribute("id", projectId);
		return "redirect:/projects/tasks";
	}
	
	@RequestMapping(value = "/task/details", method = RequestMethod.GET)
	public String updateProject(@RequestParam("id") int taskId, Model model, @RequestParam("projectId") int projectId){
		
		Project project = projectService.findById(projectId);
		Task task = taskService.findById(taskId);
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		Date date = task.getDueDate();
		dateFormat.format(date);
		task.setDueDate(date);
		
		model.addAttribute("project", project);
		model.addAttribute("task", taskService.findById(taskId));
		System.out.println(taskService.findById(taskId));
		return "taskDetail";
	}
	
	@RequestMapping(value = "/task/details", method = RequestMethod.POST)
	public String updateProject(Task task, BindingResult result, ModelMap model, RedirectAttributes atributes) {
	
		
		if (task.getState() != 1){
			Date date = new Date();
			task.setFinishDate(date);
			task.setFinishUser(getPrincipal());
		}
		
		Task search = taskService.findById(task.getId());
		taskService.update(task);
		
		
		atributes.addAttribute("id", search.getProject().getId());
		return "redirect:/projects/tasks?";
	}
	
	@RequestMapping(value = "/deleteTask")
	public String deleteTask(@Valid Task task,
			BindingResult result, ModelMap model, RedirectAttributes atributes){
		
		Task deleteTask = new Task();
		deleteTask = taskService.findById(task.getId());
		
		
		atributes.addAttribute("id", deleteTask.getProject().getId());
		System.out.println("Task Deletado: " +deleteTask.toString());
		taskService.deleteById(deleteTask.getId());
		
		return "redirect:/projects/tasks?";
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
