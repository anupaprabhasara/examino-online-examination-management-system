package com.examino.model;

public class Enrollment {
	private int enrollment_id;
    private int student_id;
    private int exam_id;
    private String seat_number;

    // Extra fields from enrollments_view
    private String student_name;
    private String exam_title;
    private String subject;
    private String exam_date;
    private String class_room;
    
	public int getEnrollment_id() {
		return enrollment_id;
	}
	public int getStudent_id() {
		return student_id;
	}
	public int getExam_id() {
		return exam_id;
	}
	public String getSeat_number() {
		return seat_number;
	}
	public String getStudent_name() {
		return student_name;
	}
	public String getExam_title() {
		return exam_title;
	}
	public String getSubject() {
		return subject;
	}
	public String getExam_date() {
		return exam_date;
	}
	public String getClass_room() {
		return class_room;
	}
	public void setEnrollment_id(int enrollment_id) {
		this.enrollment_id = enrollment_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	public void setExam_id(int exam_id) {
		this.exam_id = exam_id;
	}
	public void setSeat_number(String seat_number) {
		this.seat_number = seat_number;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public void setExam_title(String exam_title) {
		this.exam_title = exam_title;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setExam_date(String exam_date) {
		this.exam_date = exam_date;
	}
	public void setClass_room(String class_room) {
		this.class_room = class_room;
	}
}