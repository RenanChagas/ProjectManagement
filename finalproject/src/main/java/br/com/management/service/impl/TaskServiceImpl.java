package br.com.management.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.management.dao.NotificationDao;
import br.com.management.dao.TaskDao;
import br.com.management.model.Notification;
import br.com.management.model.Task;
import br.com.management.model.User;
import br.com.management.service.NotificationService;
import br.com.management.service.NotificationTypeService;
import br.com.management.service.TaskService;

@Service("TaskService")
@Transactional
public class TaskServiceImpl implements TaskService{
	
	@Autowired
	private TaskDao dao;
	
	@Autowired
	private NotificationService notificationService;
	
	@Autowired
	private NotificationTypeService notificationTypeService;
	
	@Autowired
	private NotificationDao notificationDao;

	@Override
	public void save(Task task) {
		
		switch(task.getTaskType().getId()){
		
		case 1:
			task.setIcon("test");
			break;
		case 2:
			task.setIcon("error");
			break;
		}
		
		task.setState(1);

		Task createTask = dao.saveAndFlush(task);

		//Criar Objeto para criação de notificação da tarefa
		Notification notification = new Notification();
		notification.setFlRead(false);
		notification.setNotificationType(notificationTypeService.findByType("CREATED"));
		notification.setTask(createTask);		
		notification.setUser(createTask.getUser());
		notification.setCreateDate(createTask.getCreateDate());
		
		notificationService.save(notification);
	}

	@Override
	public void update(Task task) {
		
		Task updateTask = findById(task.getId());
		
		updateTask.setName(task.getName());
		updateTask.setDescription(task.getDescription());
		updateTask.setDueDate(task.getDueDate());
		updateTask.setState(task.getState());
		updateTask.setFinishDesc(task.getFinishDesc());
		updateTask.setFinishDate(task.getFinishDate());
		updateTask.setFinishUser(task.getFinishUser());
		updateTask.setHoursUsed(task.getHoursUsed());
		updateTask.setHours(task.getHours());
		
		dao.save(updateTask);
	}

	@Override
	public void deleteById(int id) {
		notificationDao.deleteInBatch(notificationService.findAllByTaskOrderByIdAsc(dao.findAllById(id)));
		dao.deleteInBatch(dao.findAllById(id));
		
	}

	@Override
	public Task findById(int id) {
		return dao.findById(id);
	}

	@Override
	public Task findByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Task> findAllByOrderByIdAsc() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Task> findAllByProjectIdOrderByIdAsc(int id) {
		return dao.findAllByProjectIdOrderByIdAsc(id);
	}

	@Override
	public List<Task> findAllByUser(User user) {
		return dao.findAllByUser(user);
	}

}
