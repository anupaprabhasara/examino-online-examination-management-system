package com.examino.service;

import com.examino.model.Result;
import com.examino.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ResultService {

    // Create Result
    public boolean createResult(Result result) {
        String query = "INSERT INTO results (student_id, exam_id, marks_obtained, grade) VALUES (?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, result.getStudent_id());
            stmt.setInt(2, result.getExam_id());
            stmt.setInt(3, result.getMarks_obtained());
            stmt.setString(4, result.getGrade());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Result by ID
    public Result getResult(int id) {
        String query = "SELECT * FROM results_view WHERE result_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Result result = new Result();
                result.setResult_id(rs.getInt("result_id"));
                result.setStudent_id(rs.getInt("student_id"));
                result.setExam_id(rs.getInt("exam_id"));
                result.setMarks_obtained(rs.getInt("marks_obtained"));
                result.setGrade(rs.getString("grade"));
                result.setStudent_name(rs.getString("student_name"));
                result.setExam_title(rs.getString("exam_title"));
                return result;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Results
    public List<Result> getAllResults() {
        List<Result> results = new ArrayList<>();
        String query = "SELECT * FROM results_view ORDER BY result_id";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Result result = new Result();
                result.setResult_id(rs.getInt("result_id"));
                result.setStudent_id(rs.getInt("student_id"));
                result.setExam_id(rs.getInt("exam_id"));
                result.setMarks_obtained(rs.getInt("marks_obtained"));
                result.setGrade(rs.getString("grade"));
                result.setStudent_name(rs.getString("student_name"));
                result.setExam_title(rs.getString("exam_title"));
                results.add(result);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }
    
    // Get Results by Student ID
    public List<Result> getResultsByStudentId(int studentId) {
        List<Result> results = new ArrayList<>();
        String query = "SELECT * FROM results_view WHERE student_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, studentId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Result result = new Result();
                result.setResult_id(rs.getInt("result_id"));
                result.setStudent_id(rs.getInt("student_id"));
                result.setExam_id(rs.getInt("exam_id"));
                result.setMarks_obtained(rs.getInt("marks_obtained"));
                result.setGrade(rs.getString("grade"));
                result.setStudent_name(rs.getString("student_name"));
                result.setExam_title(rs.getString("exam_title"));
                results.add(result);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }

    // Update Result
    public boolean updateResult(Result result) {
        String query = "UPDATE results SET student_id = ?, exam_id = ?, marks_obtained = ?, grade = ? WHERE result_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, result.getStudent_id());
            stmt.setInt(2, result.getExam_id());
            stmt.setInt(3, result.getMarks_obtained());
            stmt.setString(4, result.getGrade());
            stmt.setInt(5, result.getResult_id());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Result
    public boolean deleteResult(int id) {
        String query = "DELETE FROM results WHERE result_id = ?";
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