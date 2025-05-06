package com.examino.service;

import com.examino.model.Enrollment;
import com.examino.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EnrollmentService {

    // Create Enrollment
    public boolean createEnrollment(Enrollment enrollment) {
        String query = "INSERT INTO enrollments (student_id, exam_id, seat_number) VALUES (?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, enrollment.getStudent_id());
            stmt.setInt(2, enrollment.getExam_id());
            stmt.setString(3, enrollment.getSeat_number());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Enrollment by ID
    public Enrollment getEnrollment(int id) {
        String query = "SELECT * FROM enrollments_view WHERE enrollment_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Enrollment enrollment = new Enrollment();
                enrollment.setEnrollment_id(rs.getInt("enrollment_id"));
                enrollment.setStudent_id(rs.getInt("student_id"));
                enrollment.setExam_id(rs.getInt("exam_id"));
                enrollment.setSeat_number(rs.getString("seat_number"));
                enrollment.setStudent_name(rs.getString("student_name"));
                enrollment.setExam_title(rs.getString("exam_title"));
                enrollment.setSubject(rs.getString("subject"));
                enrollment.setExam_date(rs.getString("exam_date"));
                enrollment.setClass_room(rs.getString("class_room"));
                return enrollment;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Enrollments
    public List<Enrollment> getAllEnrollments() {
        List<Enrollment> enrollments = new ArrayList<>();
        String query = "SELECT * FROM enrollments_view ORDER BY enrollment_id";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Enrollment enrollment = new Enrollment();
                enrollment.setEnrollment_id(rs.getInt("enrollment_id"));
                enrollment.setStudent_id(rs.getInt("student_id"));
                enrollment.setExam_id(rs.getInt("exam_id"));
                enrollment.setSeat_number(rs.getString("seat_number"));
                enrollment.setStudent_name(rs.getString("student_name"));
                enrollment.setExam_title(rs.getString("exam_title"));
                enrollment.setSubject(rs.getString("subject"));
                enrollment.setExam_date(rs.getString("exam_date"));
                enrollment.setClass_room(rs.getString("class_room"));
                enrollments.add(enrollment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return enrollments;
    }
    
    // Get Enrollments by Student ID
    public List<Enrollment> getEnrollmentsByStudentId(int studentId) {
        List<Enrollment> enrollments = new ArrayList<>();
        String query = "SELECT * FROM enrollments_view WHERE student_id = ? ORDER BY enrollment_id";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, studentId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Enrollment enrollment = new Enrollment();
                enrollment.setEnrollment_id(rs.getInt("enrollment_id"));
                enrollment.setStudent_id(rs.getInt("student_id"));
                enrollment.setExam_id(rs.getInt("exam_id"));
                enrollment.setSeat_number(rs.getString("seat_number"));
                enrollment.setStudent_name(rs.getString("student_name"));
                enrollment.setExam_title(rs.getString("exam_title"));
                enrollment.setSubject(rs.getString("subject"));
                enrollment.setExam_date(rs.getString("exam_date"));
                enrollment.setClass_room(rs.getString("class_room"));
                enrollments.add(enrollment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return enrollments;
    }

    // Update Enrollment
    public boolean updateEnrollment(Enrollment enrollment) {
        String query = "UPDATE enrollments SET student_id = ?, exam_id = ?, seat_number = ? WHERE enrollment_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, enrollment.getStudent_id());
            stmt.setInt(2, enrollment.getExam_id());
            stmt.setString(3, enrollment.getSeat_number());
            stmt.setInt(4, enrollment.getEnrollment_id());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Enrollment
    public boolean deleteEnrollment(int id) {
        String query = "DELETE FROM enrollments WHERE enrollment_id = ?";
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