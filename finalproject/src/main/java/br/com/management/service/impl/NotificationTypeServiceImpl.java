package br.com.management.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.management.dao.NotificationTypeDao;
import br.com.management.model.NotificationType;
import br.com.management.service.NotificationTypeService;

@Service("NotificationTypeService")
public class NotificationTypeServiceImpl implements NotificationTypeService{

	@Autowired
	private NotificationTypeDao dao;
	
	@Override
	public NotificationType findById(int id) {
		return dao.findById(id);
	}

	@Override
	public NotificationType findByType(String type) {
		return dao.findByType(type);
	}
}
