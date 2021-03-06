package br.com.management.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.management.model.NotificationType;

@Repository("NotificationTypeDao")
public interface NotificationTypeDao extends JpaRepository<NotificationType, Long>{
	
	public NotificationType findById(int id);
	
	public NotificationType findByType(String type);

}
