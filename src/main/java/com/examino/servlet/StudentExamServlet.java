package com.examino.servlet;

import com.examino.model.Enrollment;
import com.examino.model.Exam;
import com.examino.model.Student;
import com.examino.service.EnrollmentService;
import com.examino.service.ExamService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.Random;

@WebServlet("/student/exam")
public class StudentExamServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ExamService examService;
    private EnrollmentService enrollmentService;

    @Override
    public void init() throws ServletException {
        examService = new ExamService();
        enrollmentService = new EnrollmentService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("student") == null) {
            response.sendRedirect(request.getContextPath() + "/student/login");
            return;
        }

        List<Exam> exams = examService.getAllExams();
        request.setAttribute("exams", exams);
        request.getRequestDispatcher("/student/exams/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("student") == null) {
            response.sendRedirect(request.getContextPath() + "/student/login");
            return;
        }

        try {
            int examId = Integer.parseInt(request.getParameter("exam_id"));
            Student student = (Student) session.getAttribute("student");
            int studentId = student.getStudent_id();

            // Generate seat number (e.g., "S023")
            String seatNumber = "S" + new Random().nextInt(900) + 100;

            Enrollment enrollment = new Enrollment();
            enrollment.setExam_id(examId);
            enrollment.setStudent_id(studentId);
            enrollment.setSeat_number(seatNumber);

            boolean success = enrollmentService.createEnrollment(enrollment);
            if (success) {
                response.sendRedirect(request.getContextPath() + "/student/exam?enrolled=true");
            } else {
                request.setAttribute("error", "Failed to enroll in exam.");
                doGet(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred during enrollment.");
            doGet(request, response);
        }
    }
}