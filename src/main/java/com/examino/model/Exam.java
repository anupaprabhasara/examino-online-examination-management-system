package com.examino.model;

public class Exam {
	private int exam_id;
    private String subject;
    private String exam_title;
    private String exam_date;
    private String start_time;
    private String end_time;
    private int total_marks;
    private String class_room;
    private String invigilator_name;
    
	public int getExam_id() {
		return exam_id;
	}
	public String getSubject() {
		return subject;
	}
	public String getExam_title() {
		return exam_title;
	}
	public String getExam_date() {
		return exam_date;
	}
	public String getStart_time() {
		return start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public int getTotal_marks() {
		return total_marks;
	}
	public String getClass_room() {
		return class_room;
	}
	public String getInvigilator_name() {
		return invigilator_name;
	}
	public void setExam_id(int exam_id) {
		this.exam_id = exam_id;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setExam_title(String exam_title) {
		this.exam_title = exam_title;
	}
	public void setExam_date(String exam_date) {
		this.exam_date = exam_date;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public void setTotal_marks(int total_marks) {
		this.total_marks = total_marks;
	}
	public void setClass_room(String class_room) {
		this.class_room = class_room;
	}
	public void setInvigilator_name(String invigilator_name) {
		this.invigilator_name = invigilator_name;
	}
}