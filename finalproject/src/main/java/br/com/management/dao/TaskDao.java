package br.com.management.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.management.model.Task;
import br.com.management.model.User;

@Repository("TaskDao")
public interface TaskDao extends JpaRepository<Task, Long>{
	
	public Task findById(int id);
	
	public Task findByName(String name);
	
	public List<Task> findAllById(int id);
	
	public List<Task> findAllByOrderByIdAsc();
	
	public List<Task> findAllByUser(User user);
	
	//Filter Project Tasks
	//Latest
	public List<Task> findAllByProjectIdOrderByIdDesc(int id);
	
	//Oldest
	public List<Task> findAllByProjectIdOrderByIdAsc(int id);
	
	//Done
	public List<Task> findAllByProjectIdAndStateOrderByIdAsc(int id, Integer state);
	
	//Filter My Task
	//Latest
	public List<Task> findAllByUserOrderByIdDesc(User user);
	
	//Oldest
	public List<Task> findAllByUserOrderByIdAsc(User user);
	
	//Done
	public List<Task> findAllByUserAndStateOrderByIdDesc(User user, Integer state);
	
	
	@Transactional
	public void deleteById(int id);

}
