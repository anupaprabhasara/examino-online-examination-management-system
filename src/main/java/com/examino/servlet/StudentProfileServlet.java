package com.examino.servlet;

import com.examino.model.Student;
import com.examino.service.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/student/profile")
public class StudentProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentService studentService;

    @Override
    public void init() throws ServletException {
        studentService = new StudentService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Student student = (session != null) ? (Student) session.getAttribute("student") : null;

        if (student == null) {
            response.sendRedirect(request.getContextPath() + "/student/login");
            return;
        }

        // Optional: refresh latest data from DB
        Student refreshedStudent = studentService.getStudent(student.getStudent_id());
        if (refreshedStudent != null) {
            request.setAttribute("student", refreshedStudent);
            request.getRequestDispatcher("/student/profile.jsp").forward(request, response);
        } else {
            session.invalidate(); // Invalidate if student no longer exists
            response.sendRedirect(request.getContextPath() + "/student/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Student sessionStudent = (session != null) ? (Student) session.getAttribute("student") : null;

        if (sessionStudent == null) {
            response.sendRedirect(request.getContextPath() + "/student/login");
            return;
        }

        int studentId = sessionStudent.getStudent_id();
        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String department = request.getParameter("department");

        Student updatedStudent = new Student();
        updatedStudent.setStudent_id(studentId);
        updatedStudent.setFull_name(fullName);
        updatedStudent.setEmail(email);
        updatedStudent.setPassword(password);
        updatedStudent.setDepartment(department);

        if (studentService.updateStudent(updatedStudent)) {
            session.setAttribute("student", updatedStudent); // Update session with new values
            request.setAttribute("success", "Profile updated successfully.");
        } else {
            request.setAttribute("error", "Failed to update profile.");
        }

        request.setAttribute("student", updatedStudent);
        request.getRequestDispatcher("/student/profile.jsp").forward(request, response);
    }
}