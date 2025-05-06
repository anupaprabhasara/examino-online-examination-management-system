<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Examino | Admin Login</title>
    <link rel="icon" href="${pageContext.request.contextPath}/admin/assets/favicon.png" type="image/png">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body class="bg-gray-900 text-gray-100 min-h-screen flex items-center justify-center">

    <!-- Login Card -->
    <div class="bg-gray-800 rounded-2xl shadow-xl p-8 w-full max-w-md space-y-6 border border-gray-700">

        <!-- Logo + Title -->
        <div class="text-center">
            <i class="fas fa-user-shield text-green-400 text-4xl mb-2"></i>
            <h1 class="text-2xl font-bold text-green-400">Examino</h1>
            <p class="text-sm text-gray-400 mt-1">Admin Login</p>
        </div>

        <!-- Error Message -->
        <c:if test="${not empty error}">
            <div class="text-sm font-medium px-4 py-3 rounded border
                        bg-red-900/25 text-red-200 border-red-600">
                <i class="fas fa-exclamation-circle mr-2"></i>${error}
            </div>
        </c:if>

        <!-- Login Form -->
        <form action="${pageContext.request.contextPath}/admin/login" method="POST" class="space-y-4">
            <div>
                <label class="block text-sm mb-1" for="email">Email</label>
                <input type="email" id="email" name="email" required
                       value="${rememberedEmail}"
                       placeholder="admin@example.com"
                       class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-green-500">
            </div>
            <div>
                <label class="block text-sm mb-1" for="password">Password</label>
                <input type="password" id="password" name="password" required
                       placeholder="Enter your password"
                       class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-green-500">
            </div>
            <div class="flex items-center justify-between text-sm">
                <label class="flex items-center">
                    <input type="checkbox" name="remember"
                           class="form-checkbox text-green-500 bg-gray-800 border-gray-600" />
                    <span class="ml-2 text-gray-300">Remember me</span>
                </label>
                <a href="#" class="text-green-400 hover:underline">Forgot password?</a>
            </div>
            <button type="submit"
                    class="w-full py-2 px-4 bg-green-500 hover:bg-green-600 text-white font-semibold rounded-lg transition">
                <i class="fas fa-sign-in-alt mr-2"></i> Login
            </button>
        </form>

        <!-- Footer -->
        <div class="text-center text-xs text-gray-500 pt-4 border-t border-gray-700">
            &copy; 2024 Examino Admin Panel. All rights reserved.
        </div>
    </div>

</body>
</html>