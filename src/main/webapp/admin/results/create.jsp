<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Examino | Add Result</title>
  <link rel="icon" href="${pageContext.request.contextPath}/admin/assets/favicon.png" type="image/png" />
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body class="bg-gray-900 text-gray-100 min-h-screen flex">

  <!-- Sidebar -->
  <%@ include file="../partials/sidebar.jsp" %>

  <!-- Main Content -->
  <div class="flex-1 md:ml-60 flex flex-col min-h-screen">

    <!-- Topbar -->
    <%@ include file="../partials/header.jsp" %>

    <!-- Form Content -->
    <main class="flex-1 p-6 overflow-y-auto">
      <div class="mx-auto bg-gray-800 border border-gray-700 rounded-2xl shadow-xl p-8 space-y-6 w-full">

        <div class="flex justify-between items-center">
          <h3 class="text-lg font-semibold text-green-400"><i class="fas fa-plus-circle mr-2"></i> Add New Result</h3>
          <a href="${pageContext.request.contextPath}/admin/result" class="text-sm text-green-400 hover:underline">
            ← Back to Result List
          </a>
        </div>

        <form action="${pageContext.request.contextPath}/admin/result?action=create" method="POST" class="grid md:grid-cols-2 gap-6">

          <!-- Student Dropdown -->
          <div>
            <label class="block text-sm mb-1" for="student_id">Student</label>
            <select id="student_id" name="student_id" required
                    class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-green-500">
              <option value="" disabled selected>Select a student</option>
              <c:forEach var="student" items="${students}">
                <option value="${student.student_id}">${student.full_name}</option>
              </c:forEach>
            </select>
          </div>

          <!-- Exam Dropdown -->
          <div>
            <label class="block text-sm mb-1" for="exam_id">Exam</label>
            <select id="exam_id" name="exam_id" required
                    class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-green-500">
              <option value="" disabled selected>Select an exam</option>
              <c:forEach var="exam" items="${exams}">
                <option value="${exam.exam_id}">${exam.exam_title} - ${exam.subject}</option>
              </c:forEach>
            </select>
          </div>

          <!-- Marks -->
          <div>
            <label class="block text-sm mb-1" for="marks_obtained">Marks Obtained</label>
            <input type="number" id="marks_obtained" name="marks_obtained" required min="0" max="100"
                   placeholder="e.g. 85"
                   class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-green-500" />
          </div>

          <!-- Grade (Auto-Assigned) -->
          <div>
            <label class="block text-sm mb-1" for="grade">Grade</label>
            <input type="text" id="grade" name="grade" required readonly
                   placeholder="Auto-assigned grade"
                   class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm text-gray-400 cursor-not-allowed" />
          </div>

          <!-- Submit -->
          <div class="md:col-span-2">
            <button type="submit"
                    class="w-full py-2 px-4 bg-green-500 text-white font-semibold rounded-lg transition hover:bg-green-600">
              <i class="fas fa-save mr-2"></i> Save Result
            </button>
          </div>
        </form>
      </div>
    </main>
  </div>

  <!-- Auto Grade Assignment Script -->
  <script>
    const marksInput = document.getElementById("marks_obtained");
    const gradeField = document.getElementById("grade");

    marksInput.addEventListener("input", function () {
      const marks = parseInt(this.value, 10);
      let grade = "";

      if (marks >= 90) grade = "A+";
      else if (marks >= 80) grade = "A";
      else if (marks >= 75) grade = "A-";
      else if (marks >= 70) grade = "B+";
      else if (marks >= 65) grade = "B";
      else if (marks >= 60) grade = "B-";
      else if (marks >= 55) grade = "C+";
      else if (marks >= 45) grade = "C";
      else if (marks >= 40) grade = "C-";
      else if (marks >= 35) grade = "D+";
      else if (marks >= 30) grade = "D";
      else grade = "E";

      gradeField.value = isNaN(marks) ? "" : grade;
    });
  </script>

</body>
</html>