<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Examino | Edit Result</title>
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
          <h3 class="text-lg font-semibold text-green-400"><i class="fas fa-pen mr-2"></i> Edit Result</h3>
          <a href="${pageContext.request.contextPath}/admin/result" class="text-sm text-green-400 hover:underline">
            ← Back to Result List
          </a>
        </div>

        <form action="${pageContext.request.contextPath}/admin/result?action=update" method="POST" class="grid md:grid-cols-2 gap-6">
          <input type="hidden" name="id" value="${result.result_id}" />

          <!-- Student Dropdown -->
          <div>
            <label class="block text-sm mb-1" for="student_id">Student</label>
            <select id="student_id" name="student_id" required
                    class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-green-500">
              <c:forEach var="student" items="${students}">
                <option value="${student.student_id}"
                        <c:if test="${student.student_id == result.student_id}">selected</c:if>>
                  ${student.full_name}
                </option>
              </c:forEach>
            </select>
          </div>

          <!-- Exam Dropdown -->
          <div>
            <label class="block text-sm mb-1" for="exam_id">Exam</label>
            <select id="exam_id" name="exam_id" required
                    class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-green-500">
              <c:forEach var="exam" items="${exams}">
                <option value="${exam.exam_id}"
                        <c:if test="${exam.exam_id == result.exam_id}">selected</c:if>>
                  ${exam.exam_title} - ${exam.subject}
                </option>
              </c:forEach>
            </select>
          </div>

          <!-- Marks -->
          <div>
            <label class="block text-sm mb-1" for="marks_obtained">Marks Obtained</label>
            <input type="number" id="marks_obtained" name="marks_obtained" required min="0" max="100"
                   value="${result.marks_obtained}"
                   class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-green-500" />
          </div>

          <!-- Grade (Auto-filled) -->
          <div>
            <label class="block text-sm mb-1" for="grade">Grade</label>
            <input type="text" id="grade" name="grade" required readonly
                   value="${result.grade}"
                   class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm text-gray-400 cursor-not-allowed" />
          </div>

          <!-- Submit -->
          <div class="md:col-span-2">
            <button type="submit"
                    class="w-full py-2 px-4 bg-green-500 text-white font-semibold rounded-lg transition hover:bg-green-600">
              <i class="fas fa-save mr-2"></i> Update Result
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

    function assignGrade(marks) {
      if (marks >= 90) return "A+";
      else if (marks >= 80) return "A";
      else if (marks >= 75) return "A-";
      else if (marks >= 70) return "B+";
      else if (marks >= 65) return "B";
      else if (marks >= 60) return "B-";
      else if (marks >= 55) return "C+";
      else if (marks >= 45) return "C";
      else if (marks >= 40) return "C-";
      else if (marks >= 35) return "D+";
      else if (marks >= 30) return "D";
      else return "E";
    }

    marksInput.addEventListener("input", function () {
      const marks = parseInt(this.value, 10);
      gradeField.value = isNaN(marks) ? "" : assignGrade(marks);
    });

    // Initialize grade on page load
    window.addEventListener("DOMContentLoaded", () => {
      const initialMarks = parseInt(marksInput.value, 10);
      gradeField.value = isNaN(initialMarks) ? "" : assignGrade(initialMarks);
    });
  </script>

</body>
</html>