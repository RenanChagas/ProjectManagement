package br.com.management.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.management.dao.UserProfileDao;
import br.com.management.model.UserProfile;
import br.com.management.service.UserProfileService;

@Service("UserProfileService")
@Transactional
public class UserProfileServiceImpl implements UserProfileService{
	
	@Autowired
	UserProfileDao dao;
	
	public List<UserProfile> findAll() {
		return dao.findAll();
	}

	public UserProfile findByType(String type){
		return dao.findByType(type);
	}

	public UserProfile findById(int id) {
		return dao.findById(id);
	}

	public List<UserProfile> findAllByOrderByIdAsc() {
		return dao.findAllByOrderByIdAsc();
	}

	@Override
	public List<UserProfile> findNormalUser(int id) {
		return dao.findByIdOrderByIdAsc(id);
	}

	@Override
	public List<UserProfile> findAllByOrderByIdAsc(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}