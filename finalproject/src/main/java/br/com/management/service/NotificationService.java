package br.com.management.service;

import java.util.List;

import br.com.management.model.Notification;
import br.com.management.model.Task;
import br.com.management.model.User;

public interface NotificationService {

	public void save(Notification notification);
	
	public void update(Notification notification);
	
	public List<Notification> findAllByUserOrderByIdAsc(User user);
	
	public List<Notification> findAllByTaskOrderByIdAsc(List<Task> list);
	
	public List<Notification> findByFilter(String sortingType, User user);
	
	public void updateNotificationStatus(Notification notification);

}
