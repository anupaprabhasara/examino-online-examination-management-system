<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Examino | Manage Exams</title>
    <link rel="icon" href="${pageContext.request.contextPath}/admin/assets/favicon.png" type="image/png" />
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body class="bg-gray-900 text-gray-100 min-h-screen flex">

    <!-- Sidebar -->
    <%@ include file="../partials/sidebar.jsp" %>

    <!-- Main Content -->
    <div class="flex-1 md:ml-60 flex flex-col min-h-screen">

        <!-- Header -->
        <%@ include file="../partials/header.jsp" %>

        <!-- Exam Table Section -->
        <main class="flex-1 p-6 overflow-hidden">
            <div class="bg-gray-800 border border-gray-700 rounded-2xl shadow-xl h-full overflow-hidden flex flex-col">
                <div class="flex justify-between items-center px-6 py-4 border-b border-gray-700">
                    <h3 class="text-lg font-semibold text-green-400"><i class="fas fa-file-alt mr-2"></i>All Exams</h3>
                    <a href="${pageContext.request.contextPath}/admin/exam?action=create"
                       class="inline-flex items-center px-4 py-2 bg-green-500 hover:bg-green-600 text-white text-sm font-semibold rounded-lg transition">
                        <i class="fas fa-plus mr-2"></i> Add Exam
                    </a>
                </div>
                <div class="overflow-auto flex-1">
                    <table class="min-w-full table-auto divide-y divide-gray-700 text-sm">
                        <thead class="bg-gray-700 sticky top-0 z-10 text-green-200">
                            <tr>
                                <th class="px-6 py-3 text-left font-semibold uppercase">ID</th>
                                <th class="px-6 py-3 text-left font-semibold uppercase">Title</th>
                                <th class="px-6 py-3 text-left font-semibold uppercase">Subject</th>
                                <th class="px-6 py-3 text-left font-semibold uppercase">Date</th>
                                <th class="px-6 py-3 text-left font-semibold uppercase">Start Time</th>
                                <th class="px-6 py-3 text-left font-semibold uppercase">End Time</th>
                                <th class="px-6 py-3 text-left font-semibold uppercase">Room</th>
                                <th class="px-6 py-3 text-left font-semibold uppercase">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-700">
                            <c:forEach var="exam" items="${exams}">
                                <tr class="hover:bg-gray-700/40 transition">
                                    <td class="px-6 py-4">${exam.exam_id}</td>
                                    <td class="px-6 py-4">${exam.exam_title}</td>
                                    <td class="px-6 py-4">${exam.subject}</td>
                                    <td class="px-6 py-4">${exam.exam_date}</td>
                                    <td class="px-6 py-4">${exam.start_time}</td>
                                    <td class="px-6 py-4">${exam.end_time}</td>
                                    <td class="px-6 py-4">${exam.class_room}</td>
                                    <td class="px-6 py-4 space-x-3">
                                        <a href="${pageContext.request.contextPath}/admin/exam?action=edit&id=${exam.exam_id}"
                                           class="text-green-400 hover:text-green-500" title="Edit">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/exam?action=delete&id=${exam.exam_id}"
                                           onclick="return confirm('Are you sure you want to delete this exam?');"
                                           class="text-red-400 hover:text-red-500" title="Delete">
                                            <i class="fas fa-trash-alt"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>
</body>
</html>