<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<aside class="w-60 hidden md:flex flex-col bg-gray-800 border-r border-gray-700 shadow-md fixed h-full">
    <div class="p-6 text-center border-b border-gray-700">
        <h1 class="text-2xl font-bold text-green-400">Examino</h1>
        <p class="text-sm text-gray-400">Student Panel</p>
    </div>

    <nav id="sidebarNav" class="flex-1 px-4 py-6 space-y-2 overflow-y-auto">
        <a href="${pageContext.request.contextPath}/student/profile" class="flex items-center p-3 rounded hover:bg-green-600/20 transition">
            <i class="fas fa-home mr-3"></i> Home
        </a>
        <a href="${pageContext.request.contextPath}/student/exam" class="flex items-center p-3 rounded hover:bg-green-600/20 transition">
            <i class="fas fa-file-alt mr-3"></i> Exams
        </a>
        <a href="${pageContext.request.contextPath}/student/enrollments" class="flex items-center p-3 rounded hover:bg-green-600/20 transition">
            <i class="fas fa-chair mr-3"></i> My Enrollments
        </a>
        <a href="${pageContext.request.contextPath}/student/my-results" class="flex items-center p-3 rounded hover:bg-green-600/20 transition">
            <i class="fas fa-poll mr-3"></i> My Results
        </a>
    </nav>

    <div class="p-4 border-t border-gray-700">
        <button onclick="logout()" class="w-full flex items-center justify-center text-red-500 hover:text-red-400 font-semibold transition">
            <i class="fas fa-sign-out-alt mr-2"></i> Logout
        </button>
    </div>
</aside>

<script>
    function logout() {
        window.location.href = "${pageContext.request.contextPath}/student/logout";
    }

    // Highlight current section based on title
    window.addEventListener('DOMContentLoaded', () => {
        const fullTitle = document.title;
        const suffix = fullTitle.includes("|") ? fullTitle.split("|")[1].trim() : fullTitle;
        const keyword = suffix.split(" ").pop().toLowerCase();

        const links = document.querySelectorAll("#sidebarNav a");
        links.forEach(link => {
            const linkText = link.textContent.trim().toLowerCase();
            if (linkText.includes(keyword)) {
                link.classList.add("bg-green-700/30", "font-semibold");
            } else {
                link.classList.remove("bg-green-700/30", "font-semibold");
            }
        });
    });
</script>