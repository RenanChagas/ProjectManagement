package br.com.management.model;

public enum TaskState {
	PENDING("Pending"),
	COMPLETED("Completed"),
	CANCELLED("Cancelled"),
	FAILED("Failed");
	
	String TaskState;
	
	private TaskState(String TaskState){
		this.TaskState = TaskState;
	}
	
	public String getTaskState(){
		return TaskState;
	}
	
}