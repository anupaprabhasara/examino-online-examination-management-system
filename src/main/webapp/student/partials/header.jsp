<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header class="flex justify-between items-center p-4 bg-gray-800 border-b border-gray-700 shadow-sm sticky top-0 z-40">
    <h2 class="text-xl font-bold text-green-400"><span id="pageTitleText">Loading...</span></h2>
    <div class="flex items-center space-x-4">
        <div class="text-right text-sm">
            <p class="font-medium text-gray-100">${sessionScope.fullName}</p>
            <p class="text-gray-400 text-xs">Student</p>
        </div>
        <img src="https://ui-avatars.com/api/?name=${sessionScope.fullName}&background=22c55e&color=fff"
             alt="Admin Avatar"
             class="w-10 h-10 rounded-full shadow-md ring-2 ring-green-500" />
    </div>
</header>

<script>
  const fullTitle = document.title;
  const separatorIndex = fullTitle.indexOf("|");
  const headerTitle = (separatorIndex !== -1)
      ? fullTitle.substring(separatorIndex + 1).trim()
      : fullTitle;
  document.getElementById("pageTitleText").textContent = headerTitle;
</script>