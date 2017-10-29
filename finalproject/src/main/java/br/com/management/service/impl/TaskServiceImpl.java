package br.com.management.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.management.dao.TaskDao;
import br.com.management.model.Task;
import br.com.management.service.TaskService;

@Service("TaskService")
@Transactional
public class TaskServiceImpl implements TaskService{
	
	@Autowired
	private TaskDao dao;

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
		dao.save(task);
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
		// TODO Auto-generated method stub
		
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

}