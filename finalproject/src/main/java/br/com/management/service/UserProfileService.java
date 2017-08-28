package br.com.management.service;

import java.util.List;

import br.com.management.model.UserProfile;

public interface UserProfileService {
	
	public List<UserProfile> findAll();
	
	public List<UserProfile> findAllByOrderByIdAsc();

	public UserProfile findByType(String type);

	public UserProfile findById(int id);
}