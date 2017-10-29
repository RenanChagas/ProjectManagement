package br.com.management.service;

import java.util.List;

import br.com.management.model.Notification;

public interface NotificationService {

	public void save(Notification notification);
	
	public void update(Notification notification);
	
	public void deleteById(int id);
	
	public Notification findById(int id);
	
	public List<Notification> findAllByOrderByIdAsc();
	
	public List<Notification> findAllByTaskIdOrderByIdAsc(int id);

}
