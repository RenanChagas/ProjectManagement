package br.com.management.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="TASK")
public class Task {

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@NotEmpty
	@Column(name="NAME", nullable=false)
	private String name;
	
	@NotEmpty
	@Column(name="DESCRIPTION", nullable=false)
	private String description;
	
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name="DUE_DATE")
	private Date dueDate;
	
	@NotEmpty
	@Column(name="ICON", nullable=false)
	private String icon;
	
	@Column(name="STATE", nullable=false)
	private Integer state;
	
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name="CREATE_DATE")
	private Date createDate;
	
	@Column(name="CREATE_USER")
	private String createUser;
	
	@Column(name="FINISH_DESC")
	private String finishDesc; 
	
	@Column(name="FINISH_USER")
	private String finishUser;
	
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name="FINISH_DATE")
	private Date finishDate;
	
	@Column(name="HOURS")
	private float hours;
	
	@Column(name="HOURS_USED")
	private float hoursUsed;
	
	@ManyToOne(fetch=FetchType.EAGER, optional = false)
	@JoinColumn(name="TYPE",referencedColumnName="id")  
    private TaskType taskType;
	
	@ManyToOne(fetch=FetchType.EAGER, optional = false)
	@JoinColumn(name="PROJECT_ID",referencedColumnName="id")  
    private Project project;
	
	@ManyToOne(fetch=FetchType.EAGER, optional = false)
	@JoinColumn(name="USER_ID",referencedColumnName="id")  
    private User user;
	
	@OneToMany(fetch=FetchType.EAGER, cascade= {CascadeType.PERSIST, CascadeType.REMOVE} ,mappedBy="task", targetEntity = Notification.class)
    public List<Notification> notification;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public String getFinishDesc() {
		return finishDesc;
	}

	public void setFinishDesc(String finishDesc) {
		this.finishDesc = finishDesc;
	}

	public String getFinishUser() {
		return finishUser;
	}

	public void setFinishUser(String finishUser) {
		this.finishUser = finishUser;
	}

	public Date getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}

	public float getHours() {
		return hours;
	}

	public void setHours(float hours) {
		this.hours = hours;
	}

	public TaskType getTaskType() {
		return taskType;
	}

	public void setTaskType(TaskType taskType) {
		this.taskType = taskType;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public float getHoursUsed() {
		return hoursUsed;
	}

	public void setHoursUsed(float hoursUsed) {
		this.hoursUsed = hoursUsed;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Notification> getNotification() {
		return notification;
	}

	public void setNotification(List<Notification> notification) {
		this.notification = notification;
	}

	@Override
	public String toString() {
		return "Task [id=" + id + ", name=" + name + ", description=" + description + ", dueDate=" + dueDate + ", icon="
				+ icon + ", state=" + state + ", createDate=" + createDate + ", createUser=" + createUser
				+ ", finishDesc=" + finishDesc + ", finishUser=" + finishUser + ", finishDate=" + finishDate
				+ ", hours=" + hours + ", hoursUsed=" + hoursUsed + ", taskType=" + taskType + ", project=" + project
				+ ", user=" + user + "]";
	}
}
