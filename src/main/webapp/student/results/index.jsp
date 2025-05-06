<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Examino | My Results</title>
    <link rel="icon" href="${pageContext.request.contextPath}/student/assets/favicon.png" type="image/png" />
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

        <!-- Result Table Section -->
        <main class="flex-1 p-6 overflow-hidden">
            <div class="bg-gray-800 border border-gray-700 rounded-2xl shadow-xl h-full overflow-hidden flex flex-col">
                <div class="px-6 py-4 border-b border-gray-700">
                    <h3 class="text-lg font-semibold text-green-400"><i class="fas fa-file-alt mr-2"></i>My Exam Results</h3>
                </div>
                <div class="overflow-auto flex-1">
                    <table class="min-w-full table-auto divide-y divide-gray-700 text-sm">
                        <thead class="bg-gray-700 sticky top-0 z-10 text-green-200">
                            <tr>
                                <th class="px-6 py-3 text-left font-semibold uppercase">Result ID</th>
                                <th class="px-6 py-3 text-left font-semibold uppercase">Exam</th>
                                <th class="px-6 py-3 text-left font-semibold uppercase">Marks</th>
                                <th class="px-6 py-3 text-left font-semibold uppercase">Grade</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-700">
                            <c:forEach var="result" items="${results}">
                                <tr class="hover:bg-gray-700/40 transition">
                                    <td class="px-6 py-4">${result.result_id}</td>
                                    <td class="px-6 py-4">${result.exam_title}</td>
                                    <td class="px-6 py-4">${result.marks_obtained}</td>
                                    <td class="px-6 py-4 font-semibold text-green-400">${result.grade}</td>
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