package br.com.management.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="NOTIFICATION_TYPE")
public class NotificationType {
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;	
	
	@NotEmpty
	@Column(name="TYPE", nullable=false)
	private String type;
	
	@OneToMany(fetch=FetchType.EAGER, cascade = CascadeType.ALL,mappedBy="notificationType", targetEntity = Notification.class)
    public List<Notification> notification;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<Notification> getNotification() {
		return notification;
	}

	public void setNotification(List<Notification> notification) {
		this.notification = notification;
	}

	@Override
	public String toString() {
		return "NotificationType [id=" + id + ", type=" + type + "]";
	}

}
