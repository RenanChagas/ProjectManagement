package br.com.management.dao;

import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import javax.transaction.Transactional;

import java.util.List;

import br.com.management.model.Project;

@Repository("ProjectDao")
public interface ProjectDao extends JpaRepository<Project, Long>{
	
	public Project findById(int id);
	
	public Project findByProjectName(String projectName);
	
	public List<Project> findAllByOrderByIdAsc();
	
	@Transactional
	public void deleteById(int id);

}
