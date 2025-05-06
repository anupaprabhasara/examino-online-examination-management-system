package com.examino.model;

public class Result {
	private int result_id;
    private int student_id;
    private int exam_id;
    private int marks_obtained;
    private String grade;

    // Extra fields from results_view
    private String student_name;
    private String exam_title;
    
	public int getResult_id() {
		return result_id;
	}
	public int getStudent_id() {
		return student_id;
	}
	public int getExam_id() {
		return exam_id;
	}
	public int getMarks_obtained() {
		return marks_obtained;
	}
	public String getGrade() {
		return grade;
	}
	public String getStudent_name() {
		return student_name;
	}
	public String getExam_title() {
		return exam_title;
	}
	public void setResult_id(int result_id) {
		this.result_id = result_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	public void setExam_id(int exam_id) {
		this.exam_id = exam_id;
	}
	public void setMarks_obtained(int marks_obtained) {
		this.marks_obtained = marks_obtained;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public void setExam_title(String exam_title) {
		this.exam_title = exam_title;
	}
}