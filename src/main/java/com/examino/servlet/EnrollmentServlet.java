package com.examino.servlet;

import com.examino.service.EnrollmentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/enrollment")
public class EnrollmentServlet extends HttpServlet {
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
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        String action = request.getParameter("action");

        try {
            if (action == null) {
                // Show all enrollments
                request.setAttribute("enrollments", enrollmentService.getAllEnrollments());
                request.getRequestDispatcher("/admin/enrollments/index.jsp").forward(request, response);

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                enrollmentService.deleteEnrollment(id);
                response.sendRedirect(request.getContextPath() + "/admin/enrollment");

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred.");
        }
    }
}