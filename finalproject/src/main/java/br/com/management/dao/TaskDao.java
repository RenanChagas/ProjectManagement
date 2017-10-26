package br.com.management.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.management.model.Task;

@Repository("TaskDao")
public interface TaskDao extends JpaRepository<Task, Long>{
	
	public Task findById(int id);
	
	public Task findByName(String name);
	
	public List<Task> findAllByOrderByIdAsc();
	
	public List<Task> findAllByProjectIdOrderByIdAsc(int id);
	
	@Transactional
	public void deleteById(int id);

}
