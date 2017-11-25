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
	
	public List<Task> findAllByProjectIdOrderByIdAsc(int id);
	
	public List<Task> findAllByUser(User user);
	
	@Transactional
	public void deleteById(int id);

}
