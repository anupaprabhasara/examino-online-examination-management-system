<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Examino | Edit Exam</title>
  <link rel="icon" href="${pageContext.request.contextPath}/admin/assets/favicon.png" type="image/png" />
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body class="bg-gray-900 text-gray-100 min-h-screen flex">

  <%@ include file="../partials/sidebar.jsp" %>

  <div class="flex-1 md:ml-60 flex flex-col min-h-screen">
    <%@ include file="../partials/header.jsp" %>

    <main class="flex-1 p-6 overflow-y-auto">
      <div class="mx-auto bg-gray-800 border border-gray-700 rounded-2xl shadow-xl p-8 space-y-6 w-full">

        <div class="flex justify-between items-center">
          <h3 class="text-lg font-semibold text-green-400"><i class="fas fa-pen-to-square mr-2"></i> Edit Exam</h3>
          <a href="${pageContext.request.contextPath}/admin/exam" class="text-sm text-green-400 hover:underline">← Back to Exam List</a>
        </div>

        <form id="examForm" action="${pageContext.request.contextPath}/admin/exam?action=update" method="POST" class="grid md:grid-cols-2 gap-6">
          <input type="hidden" name="id" value="${exam.exam_id}" />

          <div>
            <label class="block text-sm mb-1" for="subject">Subject</label>
            <input type="text" id="subject" name="subject" required value="${exam.subject}"
                   class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-green-500" />
          </div>

          <div>
            <label class="block text-sm mb-1" for="exam_title">Exam Title</label>
            <input type="text" id="exam_title" name="exam_title" required value="${exam.exam_title}"
                   class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-green-500" />
          </div>

          <div>
            <label class="block text-sm mb-1" for="exam_date">Exam Date</label>
            <input type="date" id="exam_date" name="exam_date" required value="${exam.exam_date}"
                   class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-green-500" />
            <p id="dateError" class="text-red-500 text-sm mt-1 hidden">Date cannot be in the past</p>
          </div>

          <div>
            <label class="block text-sm mb-1" for="class_room">Class Room</label>
            <input type="text" id="class_room" name="class_room" required value="${exam.class_room}"
                   class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-green-500" />
          </div>

          <div>
            <label class="block text-sm mb-1" for="start_time">Start Time</label>
            <input type="time" id="start_time" name="start_time" required value="${exam.start_time}"
                   class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-green-500" />
          </div>

          <div>
            <label class="block text-sm mb-1" for="end_time">End Time</label>
            <input type="time" id="end_time" name="end_time" required value="${exam.end_time}"
                   class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-green-500" />
            <p id="timeError" class="text-red-500 text-sm mt-1 hidden">End time must be after start time</p>
          </div>

          <div>
            <label class="block text-sm mb-1" for="total_marks">Total Marks</label>
            <input type="number" id="total_marks" name="total_marks" required value="${exam.total_marks}"
                   class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-green-500" />
          </div>

          <div>
            <label class="block text-sm mb-1" for="invigilator_name">Invigilator</label>
            <input type="text" id="invigilator_name" name="invigilator_name" required value="${exam.invigilator_name}"
                   class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-green-500" />
          </div>

          <div class="md:col-span-2">
            <button id="submitBtn" type="submit" disabled
                    class="w-full py-2 px-4 bg-green-500 text-white font-semibold rounded-lg transition opacity-50 cursor-not-allowed">
              <i class="fas fa-save mr-2"></i> Update Exam
            </button>
          </div>
        </form>
      </div>
    </main>
  </div>

  <!-- Validation Script -->
  <script>
    const examDate = document.getElementById('exam_date');
    const startTime = document.getElementById('start_time');
    const endTime = document.getElementById('end_time');
    const dateError = document.getElementById('dateError');
    const timeError = document.getElementById('timeError');
    const submitBtn = document.getElementById('submitBtn');

    function validate() {
      const today = new Date().toISOString().split("T")[0];
      const dateValid = examDate.value >= today;

      const start = startTime.value;
      const end = endTime.value;
      const timeValid = start && end && start < end;

      dateError.classList.toggle("hidden", dateValid);
      timeError.classList.toggle("hidden", timeValid);

      const isValid = dateValid && timeValid;
      submitBtn.disabled = !isValid;
      submitBtn.classList.toggle("opacity-50", !isValid);
      submitBtn.classList.toggle("cursor-not-allowed", !isValid);
      submitBtn.classList.toggle("hover:bg-green-600", isValid);
    }

    examDate.addEventListener('input', validate);
    startTime.addEventListener('input', validate);
    endTime.addEventListener('input', validate);

    // Validate on page load for existing data
    window.addEventListener('DOMContentLoaded', validate);
  </script>

</body>
</html>