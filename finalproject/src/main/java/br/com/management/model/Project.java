package br.com.management.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="PROJECT")
public class Project {
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@NotEmpty
	@Column(name="PROJECT_NAME", nullable=false)
	private String projectName;
	
	@NotEmpty
	@Column(name="PROJECT_DESC", nullable=false)
	private String projectDesc;
	
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name="DUE_DATE")
	private Date dueDate;
	
	@NotEmpty
	@Column(name="ICON", nullable=false)
	private String icon;
	
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
	
	@Column(name="FINISH_STATE")
	private Integer finishState;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectDesc() {
		return projectDesc;
	}

	public void setProjectDesc(String projectDesc) {
		this.projectDesc = projectDesc;
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

	public Integer getFinishState() {
		return finishState;
	}

	public void setFinishState(Integer finishState) {
		this.finishState = finishState;
	}

	@Override
	public String toString() {
		return "Project [id=" + id + ", projectName=" + projectName + ", projectDesc=" + projectDesc + ", dueDate="
				+ dueDate + ", icon=" + icon + ", createDate=" + createDate + ", createUser=" + createUser
				+ ", finishDesc=" + finishDesc + ", finishUser=" + finishUser + ", finishDate=" + finishDate
				+ ", finishState=" + finishState + "]";
	}
	
}
