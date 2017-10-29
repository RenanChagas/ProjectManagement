package br.com.management.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;


@Entity
@Table(name="NOTIFICATION")
public class Notification {
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Column(name="FL_READ", nullable=false)
	@Type(type = "org.hibernate.type.NumericBooleanType")
	private boolean flRead;
	
	@ManyToOne(fetch=FetchType.EAGER, optional = false)
	@JoinColumn(name="TYPE",referencedColumnName="id")  
    private NotificationType notificationType;
	
	@ManyToOne(fetch=FetchType.EAGER, optional = false)
	@JoinColumn(name="TASK_ID",referencedColumnName="id")  
    private Task task;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isFlRead() {
		return flRead;
	}

	public void setFlRead(boolean flRead) {
		this.flRead = flRead;
	}

	
	public NotificationType getNotificationType() {
		return notificationType;
	}

	public void setNotificationType(NotificationType notificationType) {
		this.notificationType = notificationType;
	}

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}
	
}