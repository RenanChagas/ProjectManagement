package br.com.management.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.management.dao.ProjectDao;
import br.com.management.model.Project;
import br.com.management.service.ProjectService;

@Service("ProjectService")
@Transactional
public class ProjectServiceImpl implements ProjectService{
	
	@Autowired
	private ProjectDao dao;

	@Override
	public void save(Project project) {
		dao.save(project);
	}

	@Override
	public void update(Project project) {
		
		//Fixing null values that werent changed
		Project projectRealValue = findById(project.getId());
		if (project.getDueDate() == null){
			project.setDueDate(projectRealValue.getDueDate());
		}
		if (project.getCreateUser() == null){
			project.setCreateUser(projectRealValue.getCreateUser());
		}
		if (project.getCreateDate() == null){
			project.setCreateDate(projectRealValue.getCreateDate());
		}
		
		System.out.println(project);
		System.out.println(projectRealValue);
		
		dao.save(project);
	}

	@Override
	public Project findById(int id) {
		return dao.findById(id);
	}

	@Override
	public Project findByProjectName(String projectName) {
		return dao.findByProjectName(projectName);
	}
	
	public List<Project> findAllByOrderByIdAsc() {
		return dao.findAllByOrderByIdAsc();
	}
	
	@Override
	public void deleteById(int id) {
		dao.deleteById(id);
	}

}
