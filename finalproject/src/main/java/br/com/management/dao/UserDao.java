package br.com.management.dao;

import org.springframework.stereotype.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.management.model.User;

@Repository("UserDao")
public interface UserDao extends JpaRepository<User, Long> {

	public User findByUsername(String username);
	
	public User findById(int id);
	
	public List<User> findAllByOrderByIdAsc();
	
}