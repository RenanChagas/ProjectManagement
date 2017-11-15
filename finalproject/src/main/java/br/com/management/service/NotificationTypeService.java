package br.com.management.service;

import br.com.management.model.NotificationType;

public interface NotificationTypeService {
	
	public NotificationType findById(int id);
	
	public NotificationType findByType(String type);

}
