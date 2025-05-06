package com.examino.service;

import com.examino.model.Student;
import com.examino.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentService {

    // Create Student
    public boolean createStudent(Student student) {
        String query = "INSERT INTO students (full_name, email, password, department) VALUES (?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, student.getFull_name());
            stmt.setString(2, student.getEmail());
            stmt.setString(3, student.getPassword());
            stmt.setString(4, student.getDepartment());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Student by ID
    public Student getStudent(int id) {
        String query = "SELECT * FROM students WHERE student_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Student student = new Student();
                student.setStudent_id(rs.getInt("student_id"));
                student.setFull_name(rs.getString("full_name"));
                student.setEmail(rs.getString("email"));
                student.setPassword(rs.getString("password"));
                student.setDepartment(rs.getString("department"));
                return student;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Students
    public List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();
        String query = "SELECT * FROM students ORDER BY student_id";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Student student = new Student();
                student.setStudent_id(rs.getInt("student_id"));
                student.setFull_name(rs.getString("full_name"));
                student.setEmail(rs.getString("email"));
                student.setPassword(rs.getString("password"));
                student.setDepartment(rs.getString("department"));
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    // Update Student
    public boolean updateStudent(Student student) {
        String query = "UPDATE students SET full_name = ?, email = ?, password = ?, department = ? WHERE student_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, student.getFull_name());
            stmt.setString(2, student.getEmail());
            stmt.setString(3, student.getPassword());
            stmt.setString(4, student.getDepartment());
            stmt.setInt(5, student.getStudent_id());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Student
    public boolean deleteStudent(int id) {
        String query = "DELETE FROM students WHERE student_id = ?";
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