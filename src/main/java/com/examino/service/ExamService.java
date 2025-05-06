package com.examino.service;

import com.examino.model.Exam;
import com.examino.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ExamService {

    // Create Exam
    public boolean createExam(Exam exam) {
        String query = "INSERT INTO exams (subject, exam_title, exam_date, start_time, end_time, total_marks, class_room, invigilator_name) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, exam.getSubject());
            stmt.setString(2, exam.getExam_title());
            stmt.setString(3, exam.getExam_date());
            stmt.setString(4, exam.getStart_time());
            stmt.setString(5, exam.getEnd_time());
            stmt.setInt(6, exam.getTotal_marks());
            stmt.setString(7, exam.getClass_room());
            stmt.setString(8, exam.getInvigilator_name());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Exam by ID
    public Exam getExam(int id) {
        String query = "SELECT * FROM exams WHERE exam_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Exam exam = new Exam();
                exam.setExam_id(rs.getInt("exam_id"));
                exam.setSubject(rs.getString("subject"));
                exam.setExam_title(rs.getString("exam_title"));
                exam.setExam_date(rs.getString("exam_date"));
                exam.setStart_time(rs.getString("start_time"));
                exam.setEnd_time(rs.getString("end_time"));
                exam.setTotal_marks(rs.getInt("total_marks"));
                exam.setClass_room(rs.getString("class_room"));
                exam.setInvigilator_name(rs.getString("invigilator_name"));
                return exam;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Exams
    public List<Exam> getAllExams() {
        List<Exam> exams = new ArrayList<>();
        String query = "SELECT * FROM exams ORDER BY exam_date, start_time";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Exam exam = new Exam();
                exam.setExam_id(rs.getInt("exam_id"));
                exam.setSubject(rs.getString("subject"));
                exam.setExam_title(rs.getString("exam_title"));
                exam.setExam_date(rs.getString("exam_date"));
                exam.setStart_time(rs.getString("start_time"));
                exam.setEnd_time(rs.getString("end_time"));
                exam.setTotal_marks(rs.getInt("total_marks"));
                exam.setClass_room(rs.getString("class_room"));
                exam.setInvigilator_name(rs.getString("invigilator_name"));
                exams.add(exam);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exams;
    }

    // Update Exam
    public boolean updateExam(Exam exam) {
        String query = "UPDATE exams SET subject = ?, exam_title = ?, exam_date = ?, start_time = ?, end_time = ?, total_marks = ?, class_room = ?, invigilator_name = ? WHERE exam_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, exam.getSubject());
            stmt.setString(2, exam.getExam_title());
            stmt.setString(3, exam.getExam_date());
            stmt.setString(4, exam.getStart_time());
            stmt.setString(5, exam.getEnd_time());
            stmt.setInt(6, exam.getTotal_marks());
            stmt.setString(7, exam.getClass_room());
            stmt.setString(8, exam.getInvigilator_name());
            stmt.setInt(9, exam.getExam_id());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Exam
    public boolean deleteExam(int id) {
        String query = "DELETE FROM exams WHERE exam_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}