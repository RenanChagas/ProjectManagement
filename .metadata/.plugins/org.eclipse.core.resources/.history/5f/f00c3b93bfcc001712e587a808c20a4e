package br.com.management.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.management.model.Notification;
import br.com.management.model.User;

@Repository("NotificationDao")
public interface NotificationDao extends JpaRepository<Notification, Long>{
	
	public Notification findById(int id);
	
	public List<Notification> findAllByOrderByIdAsc();
	
	public List<Notification> findAllByTaskIdOrderByIdAsc(int id);
	
	public List<Notification> findAllByUserOrderByIdAsc(User user);
	
	@Transactional
	public void deleteById(int id);

}
