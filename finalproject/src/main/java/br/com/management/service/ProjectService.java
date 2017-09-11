package br.com.management.service;

import java.util.List;

import br.com.management.model.Project;

public interface ProjectService {
	
	public void save(Project project);
	
	public void update(Project project);
	
	public Project findById(int id);
	
	public Project findByProjectName(String projectName);
	
	public List<Project> findAllByOrderByIdAsc();

}
