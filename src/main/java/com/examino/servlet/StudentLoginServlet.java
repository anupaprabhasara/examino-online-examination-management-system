package com.examino.servlet;

import com.examino.model.Student;
import com.examino.service.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/student/login")
public class StudentLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final StudentService studentService = new StudentService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        Student student = authenticateStudent(email, password);

        if (student != null) {
            // Set session
            HttpSession session = request.getSession(true);
            session.setAttribute("student", student);
            session.setAttribute("studentId", student.getStudent_id());
            session.setAttribute("fullName", student.getFull_name());
            session.setMaxInactiveInterval(30 * 60); // 30 minutes

            // Handle "Remember Me"
            if ("on".equals(remember)) {
                Cookie rememberCookie = new Cookie("rememberStudentEmail", email);
                rememberCookie.setMaxAge(60 * 60 * 24 * 7); // 7 days
                rememberCookie.setPath(request.getContextPath());
                response.addCookie(rememberCookie);
            } else {
                Cookie removeCookie = new Cookie("rememberStudentEmail", "");
                removeCookie.setMaxAge(0);
                removeCookie.setPath(request.getContextPath());
                response.addCookie(removeCookie);
            }

            response.sendRedirect(request.getContextPath() + "/student/profile");
        } else {
            // Failed login
            request.setAttribute("error", "Invalid email or password!");
            request.setAttribute("email", email);
            request.getRequestDispatcher("/student/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("student") != null) {
            response.sendRedirect(request.getContextPath() + "/student/profile");
            return;
        }

        // Load remembered email from cookie
        String rememberedEmail = "";
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("rememberStudentEmail".equals(cookie.getName())) {
                    rememberedEmail = cookie.getValue();
                    break;
                }
            }
        }

        request.setAttribute("rememberedEmail", rememberedEmail);
        request.getRequestDispatcher("/student/login.jsp").forward(request, response);
    }

    private Student authenticateStudent(String email, String password) {
        List<Student> students = studentService.getAllStudents();
        for (Student student : students) {
            if (student.getEmail().equalsIgnoreCase(email) && student.getPassword().equals(password)) {
                return student;
            }
        }
        return null;
    }
}