package br.com.management.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.management.dao.NotificationDao;
import br.com.management.model.Notification;
import br.com.management.service.NotificationService;

@Service("NotificationService")
@Transactional
public class NotificationServiceImpl implements NotificationService {
	
	@Autowired
	private NotificationDao dao;

	@Override
	public void save(Notification notification) {
		dao.save(notification);
	}

	@Override
	public void update(Notification notification) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Notification findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Notification> findAllByOrderByIdAsc() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Notification> findAllByTaskIdOrderByIdAsc(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}