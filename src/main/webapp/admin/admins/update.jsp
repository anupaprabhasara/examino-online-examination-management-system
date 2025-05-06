<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Examino | Edit Admin</title>
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
          <h3 class="text-lg font-semibold text-green-400"><i class="fas fa-user-edit mr-2"></i> Edit Admin</h3>
          <a href="${pageContext.request.contextPath}/admin/admin" class="text-sm text-green-400 hover:underline">
            ← Back to Admin List
          </a>
        </div>

        <form action="${pageContext.request.contextPath}/admin/admin?action=update" method="POST" class="grid gap-6">
          <input type="hidden" name="id" value="${admin.admin_id}" />

          <!-- Full Name -->
          <div>
            <label class="block text-sm mb-1" for="fullName">Full Name</label>
            <input type="text" id="fullName" name="fullName" required
                   value="${admin.full_name}"
                   class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-green-500" />
          </div>

          <!-- Email -->
          <div>
            <label class="block text-sm mb-1" for="email">Email</label>
            <input type="email" id="email" name="email" required
                   value="${admin.email}"
                   class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-green-500" />
          </div>

          <!-- Password -->
          <div>
            <label class="block text-sm mb-1" for="password">Password</label>
            <input type="password" id="password" name="password" required
                   value="${admin.password}"
                   class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-green-500" />
            <div class="mt-2 text-sm space-y-1">
              <p id="lengthHint" class="text-red-500">• At least 8 characters</p>
              <p id="uppercaseHint" class="text-red-500">• At least one uppercase letter</p>
              <p id="lowercaseHint" class="text-red-500">• At least one lowercase letter</p>
              <p id="digitHint" class="text-red-500">• At least one digit</p>
            </div>
          </div>

          <!-- Submit -->
          <div>
            <button id="submitBtn" type="submit" disabled
                    class="w-full py-2 px-4 bg-green-500 text-white font-semibold rounded-lg transition opacity-50 cursor-not-allowed">
              <i class="fas fa-save mr-2"></i> Update Admin
            </button>
          </div>
        </form>
      </div>
    </main>
  </div>

  <!-- Live Password Validation -->
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
    validatePassword();
  </script>

</body>
</html>