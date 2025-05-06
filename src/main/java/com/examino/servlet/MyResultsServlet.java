package com.examino.servlet;

import com.examino.model.Result;
import com.examino.model.Student;
import com.examino.service.ResultService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/student/my-results")
public class MyResultsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ResultService resultService;

    @Override
    public void init() throws ServletException {
        resultService = new ResultService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("student") == null) {
            response.sendRedirect(request.getContextPath() + "/student/login");
            return;
        }

        Student student = (Student) session.getAttribute("student");
        int studentId = student.getStudent_id();

        List<Result> results = resultService.getResultsByStudentId(studentId);
        request.setAttribute("results", results);
        request.getRequestDispatcher("/student/results/index.jsp").forward(request, response);
    }
}