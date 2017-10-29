package br.com.management.service;

import java.util.List;

import br.com.management.model.Task;

public interface TaskService {
	
	public void save(Task task);
	
	public void update(Task task);
	
	public void deleteById(int id);
	
	public Task findById(int id);
	
	public Task findByName(String name);
	
	public List<Task> findAllByOrderByIdAsc();
	
	public List<Task> findAllByProjectIdOrderByIdAsc(int id);

}