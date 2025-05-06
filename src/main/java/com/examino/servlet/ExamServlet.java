package com.examino.servlet;

import com.examino.model.Exam;
import com.examino.service.ExamService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/exam")
public class ExamServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ExamService examService;

    @Override
    public void init() throws ServletException {
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
                request.setAttribute("exams", examService.getAllExams());
                request.getRequestDispatcher("/admin/exams/index.jsp").forward(request, response);

            } else if ("create".equals(action)) {
                request.getRequestDispatcher("/admin/exams/create.jsp").forward(request, response);

            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Exam exam = examService.getExam(id);
                if (exam != null) {
                    request.setAttribute("exam", exam);
                    request.getRequestDispatcher("/admin/exams/update.jsp").forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Exam not found.");
                }

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                examService.deleteExam(id);
                response.sendRedirect(request.getContextPath() + "/admin/exam");

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
            if ("create".equals(action)) {
                Exam exam = new Exam();
                exam.setSubject(request.getParameter("subject"));
                exam.setExam_title(request.getParameter("exam_title"));
                exam.setExam_date(request.getParameter("exam_date"));
                exam.setStart_time(request.getParameter("start_time"));
                exam.setEnd_time(request.getParameter("end_time"));
                exam.setTotal_marks(Integer.parseInt(request.getParameter("total_marks")));
                exam.setClass_room(request.getParameter("class_room"));
                exam.setInvigilator_name(request.getParameter("invigilator_name"));

                if (examService.createExam(exam)) {
                    response.sendRedirect(request.getContextPath() + "/admin/exam");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create exam.");
                }

            } else if ("update".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Exam exam = new Exam();
                exam.setExam_id(id);
                exam.setSubject(request.getParameter("subject"));
                exam.setExam_title(request.getParameter("exam_title"));
                exam.setExam_date(request.getParameter("exam_date"));
                exam.setStart_time(request.getParameter("start_time"));
                exam.setEnd_time(request.getParameter("end_time"));
                exam.setTotal_marks(Integer.parseInt(request.getParameter("total_marks")));
                exam.setClass_room(request.getParameter("class_room"));
                exam.setInvigilator_name(request.getParameter("invigilator_name"));

                if (examService.updateExam(exam)) {
                    response.sendRedirect(request.getContextPath() + "/admin/exam");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update exam.");
                }

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
        }
    }
}