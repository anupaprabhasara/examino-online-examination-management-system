<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Examino | Student Register</title>
  <link rel="icon" href="${pageContext.request.contextPath}/student/assets/favicon.png" type="image/png">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body class="bg-gray-900 text-gray-100 min-h-screen flex items-center justify-center">

  <!-- Register Card -->
  <div class="bg-gray-800 rounded-2xl shadow-xl my-16 p-8 w-full max-w-lg space-y-6 border border-gray-700">

    <!-- Logo + Title -->
    <div class="text-center">
      <i class="fas fa-user-graduate text-green-400 text-4xl mb-2"></i>
      <h1 class="text-2xl font-bold text-green-400">Examino</h1>
      <p class="text-sm text-gray-400 mt-1">Student Registration</p>
    </div>

    <!-- Messages -->
    <c:if test="${not empty error}">
      <div class="text-sm font-medium px-4 py-3 rounded border bg-red-900/25 text-red-200 border-red-600">
        <i class="fas fa-exclamation-circle mr-2"></i>${error}
      </div>
    </c:if>
    <c:if test="${not empty success}">
      <div class="text-sm font-medium px-4 py-3 rounded border bg-green-900/25 text-green-200 border-green-600">
        <i class="fas fa-check-circle mr-2"></i>${success}
      </div>
    </c:if>

    <!-- Register Form -->
    <form action="${pageContext.request.contextPath}/student/register" method="POST" class="space-y-5">
      <!-- Full Name -->
      <div>
        <label class="block text-sm mb-1" for="full_name">Full Name</label>
        <input type="text" id="full_name" name="full_name" required placeholder="Enter full name"
               class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:ring-2 focus:ring-green-500" />
      </div>

      <!-- Email -->
      <div>
        <label class="block text-sm mb-1" for="email">Email</label>
        <input type="email" id="email" name="email" required placeholder="student@example.com"
               class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:ring-2 focus:ring-green-500" />
      </div>

      <!-- Password -->
      <div>
        <label class="block text-sm mb-1" for="password">Password</label>
        <input type="password" id="password" name="password" required placeholder="Create a password"
               class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:ring-2 focus:ring-green-500" />
        <div class="mt-2 text-sm space-y-1">
          <p id="lengthHint" class="text-red-500">• At least 8 characters</p>
          <p id="uppercaseHint" class="text-red-500">• At least one uppercase letter</p>
          <p id="lowercaseHint" class="text-red-500">• At least one lowercase letter</p>
          <p id="digitHint" class="text-red-500">• At least one digit</p>
        </div>
      </div>

      <!-- Department -->
      <div>
        <label class="block text-sm mb-1" for="department">Department</label>
        <select id="department" name="department" required
                class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:ring-2 focus:ring-green-500">
          <option value="" disabled selected>Select department</option>
          <option value="Computer Science">Computer Science</option>
          <option value="Information Technology">Information Technology</option>
          <option value="Software Engineering">Software Engineering</option>
          <option value="Data Science">Data Science</option>
          <option value="Business Management">Business Management</option>
          <option value="Accounting">Accounting</option>
          <option value="Law">Law</option>
          <option value="Psychology">Psychology</option>
          <option value="Nursing">Nursing</option>
          <option value="Engineering">Engineering</option>
        </select>
      </div>

      <!-- Submit Button -->
      <div>
        <button id="submitBtn" type="submit" disabled
                class="w-full py-2 px-4 bg-green-500 text-white font-semibold rounded-lg transition opacity-50 cursor-not-allowed">
          <i class="fas fa-user-plus mr-2"></i> Register
        </button>
      </div>
    </form>

    <!-- Footer -->
    <div class="text-center text-xs text-gray-500 pt-4 border-t border-gray-700">
      Already have an account? <a href="${pageContext.request.contextPath}/student/login" class="text-green-400 hover:underline">Login</a>
    </div>
  </div>

  <!-- JS for Password Validation -->
  <script>
    const passwordInput = document.getElementById("password");
    const lengthHint = document.getElementById("lengthHint");
    const uppercaseHint = document.getElementById("uppercaseHint");
    const lowercaseHint = document.getElementById("lowercaseHint");
    const digitHint = document.getElementById("digitHint");
    const submitBtn = document.getElementById("submitBtn");

    function validatePassword() {
      const val = passwordInput.value;
      const hasLength = val.length >= 8;
      const hasUpper = /[A-Z]/.test(val);
      const hasLower = /[a-z]/.test(val);
      const hasDigit = /\d/.test(val);

      lengthHint.className = hasLength ? "text-green-500" : "text-red-500";
      uppercaseHint.className = hasUpper ? "text-green-500" : "text-red-500";
      lowercaseHint.className = hasLower ? "text-green-500" : "text-red-500";
      digitHint.className = hasDigit ? "text-green-500" : "text-red-500";

      const isValid = hasLength && hasUpper && hasLower && hasDigit;
      submitBtn.disabled = !isValid;
      submitBtn.classList.toggle("opacity-50", !isValid);
      submitBtn.classList.toggle("cursor-not-allowed", !isValid);
      submitBtn.classList.toggle("hover:bg-green-600", isValid);
    }

    passwordInput.addEventListener("input", validatePassword);
  </script>

</body>
</html>