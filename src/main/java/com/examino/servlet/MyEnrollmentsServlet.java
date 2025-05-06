package com.examino.servlet;

import com.examino.model.Enrollment;
import com.examino.model.Student;
import com.examino.service.EnrollmentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/student/enrollments")
public class MyEnrollmentsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EnrollmentService enrollmentService;

    @Override
    public void init() throws ServletException {
        enrollmentService = new EnrollmentService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check full Student object instead of just studentId
        Student student = (session != null) ? (Student) session.getAttribute("student") : null;

        if (student == null) {
            response.sendRedirect(request.getContextPath() + "/student/login");
            return;
        }

        int studentId = student.getStudent_id();
        String action = request.getParameter("action");

        try {
            if (action == null) {
                // List all enrollments for current student
                List<Enrollment> enrollments = enrollmentService.getEnrollmentsByStudentId(studentId);
                request.setAttribute("enrollments", enrollments);
                request.getRequestDispatcher("/student/enrollments/index.jsp").forward(request, response);

            } else if ("delete".equals(action)) {
                int enrollmentId = Integer.parseInt(request.getParameter("id"));

                // Confirm ownership before deletion
                Enrollment enrollment = enrollmentService.getEnrollment(enrollmentId);
                if (enrollment != null && enrollment.getStudent_id() == studentId) {
                    enrollmentService.deleteEnrollment(enrollmentId);
                }

                response.sendRedirect(request.getContextPath() + "/student/enrollments");

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred.");
        }
    }
}