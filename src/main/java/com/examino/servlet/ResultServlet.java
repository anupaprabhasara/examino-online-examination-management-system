package com.examino.servlet;

import com.examino.model.Result;
import com.examino.model.Student;
import com.examino.model.Exam;
import com.examino.service.ResultService;
import com.examino.service.StudentService;
import com.examino.service.ExamService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@SuppressWarnings("unused")
@WebServlet("/admin/result")
public class ResultServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ResultService resultService;
    private StudentService studentService;
    private ExamService examService;

    @Override
    public void init() throws ServletException {
        resultService = new ResultService();
        studentService = new StudentService();
        examService = new ExamService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        String action = request.getParameter("action");

        try {
            if (action == null) {
                List<Result> results = resultService.getAllResults();
                request.setAttribute("results", results);
                request.getRequestDispatcher("/admin/results/index.jsp").forward(request, response);

            } else if ("create".equals(action)) {
                request.setAttribute("students", studentService.getAllStudents());
                request.setAttribute("exams", examService.getAllExams());
                request.getRequestDispatcher("/admin/results/create.jsp").forward(request, response);

            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Result result = resultService.getResult(id);
                if (result != null) {
                    request.setAttribute("result", result);
                    request.setAttribute("students", studentService.getAllStudents());
                    request.setAttribute("exams", examService.getAllExams());
                    request.getRequestDispatcher("/admin/results/update.jsp").forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Result not found.");
                }

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                resultService.deleteResult(id);
                response.sendRedirect(request.getContextPath() + "/admin/result");

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        String action = request.getParameter("action");

        try {
            int studentId = Integer.parseInt(request.getParameter("student_id"));
            int examId = Integer.parseInt(request.getParameter("exam_id"));
            int marks = Integer.parseInt(request.getParameter("marks_obtained"));
            String grade = request.getParameter("grade");

            Result result = new Result();
            result.setStudent_id(studentId);
            result.setExam_id(examId);
            result.setMarks_obtained(marks);
            result.setGrade(grade);

            if ("create".equals(action)) {
                if (resultService.createResult(result)) {
                    response.sendRedirect(request.getContextPath() + "/admin/result");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create result.");
                }

            } else if ("update".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                result.setResult_id(id);

                if (resultService.updateResult(result)) {
                    response.sendRedirect(request.getContextPath() + "/admin/result");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update result.");
                }

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request.");
        }
    }
}