package br.com.management.service;

import br.com.management.model.User;

public interface UserService{
	
	public void save(User user);
	
	public void update(User user);
	
	public User findById(int id);
	
	public User findByUsername(String username);

}