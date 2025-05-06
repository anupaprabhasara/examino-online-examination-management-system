package com.examino.servlet;

import com.examino.model.Student;
import com.examino.service.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/student/register")
public class StudentRegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final StudentService studentService = new StudentService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String department = request.getParameter("department");

        // Input validation
        String error = null;

        if (fullName == null || fullName.trim().isEmpty()) {
            error = "Full name is required.";
        } else if (email == null || !email.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")) {
            error = "Invalid email format.";
        } else if (password == null || !password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[\\W_]).{8,}$")) {
            error = "Password must be at least 8 characters long and include uppercase, lowercase, number, and special character.";
        } else if (department == null || department.trim().isEmpty()) {
            error = "Department is required.";
        }

        if (error != null) {
            request.setAttribute("error", error);
            request.getRequestDispatcher("/student/register.jsp").forward(request, response);
            return;
        }

        // Create student object
        Student student = new Student();
        student.setFull_name(fullName);
        student.setEmail(email);
        student.setPassword(password);
        student.setDepartment(department);

        boolean success = studentService.createStudent(student);

        if (success) {
            request.setAttribute("success", "Registration successful!");
            request.setAttribute("redirect", true);
        } else {
            request.setAttribute("error", "Something went wrong. Please try again.");
        }

        request.getRequestDispatcher("/student/register.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("student") != null) {
            String lastPage = request.getHeader("Referer");
            if (lastPage == null || lastPage.contains("/register")) {
                lastPage = request.getContextPath() + "/student/login";
            }
            response.sendRedirect(lastPage);
        } else {
            request.getRequestDispatcher("/student/register.jsp").forward(request, response);
        }
    }
}