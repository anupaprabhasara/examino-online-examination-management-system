<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Examino | Home</title>
    <link rel="icon" href="${pageContext.request.contextPath}/student/assets/favicon.png" type="image/png" />
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body class="bg-gray-900 text-gray-100 min-h-screen flex">

<!-- Sidebar -->
<%@ include file="./partials/sidebar.jsp" %>

<!-- Main Content -->
<div class="flex-1 md:ml-60 flex flex-col min-h-screen">

    <!-- Header -->
    <%@ include file="./partials/header.jsp" %>

    <!-- Profile Form Section -->
    <main class="flex-1 p-6 overflow-auto">
        <div class="mx-auto w-full bg-gray-800 border border-gray-700 rounded-2xl shadow-xl p-8 space-y-6">

            <h3 class="text-lg font-semibold text-green-400 text-center">
                <i class="fas fa-user-circle mr-2"></i> My Profile
            </h3>

            <c:if test="${not empty success}">
                <div class="text-sm font-medium px-4 py-3 rounded border bg-green-900/25 text-green-200 border-green-600">
                    <i class="fas fa-check-circle mr-2"></i>${success}
                </div>
            </c:if>

            <c:if test="${not empty error}">
                <div class="text-sm font-medium px-4 py-3 rounded border bg-red-900/25 text-red-200 border-red-600">
                    <i class="fas fa-exclamation-circle mr-2"></i>${error}
                </div>
            </c:if>

            <form method="POST" action="${pageContext.request.contextPath}/student/profile" class="space-y-4">

                <div>
                    <label for="full_name" class="block text-sm mb-1">Full Name</label>
                    <input type="text" id="full_name" name="full_name" required value="${student.full_name}"
                           class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:ring-2 focus:ring-green-500"/>
                </div>

                <div>
                    <label for="email" class="block text-sm mb-1">Email</label>
                    <input type="email" id="email" name="email" required value="${student.email}"
                           class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:ring-2 focus:ring-green-500"/>
                </div>

                <div>
                    <label for="password" class="block text-sm mb-1">Password</label>
                    <input type="password" id="password" name="password" required value="${student.password}"
                           class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:ring-2 focus:ring-green-500"/>
                    <div class="mt-2 ml-1 text-xs text-gray-400 space-y-1">
                        <div id="lengthHint">• At least 8 characters</div>
                        <div id="uppercaseHint">• At least one uppercase letter</div>
                        <div id="lowercaseHint">• At least one lowercase letter</div>
                        <div id="digitHint">• At least one digit</div>
                    </div>
                </div>

                <div>
                    <label for="department" class="block text-sm mb-1">Department</label>
                    <select id="department" name="department" required
                            class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:ring-2 focus:ring-green-500">
                        <option value="Computer Science" <c:if test="${student.department == 'Computer Science'}">selected</c:if>>Computer Science</option>
                        <option value="Information Technology" <c:if test="${student.department == 'Information Technology'}">selected</c:if>>Information Technology</option>
                        <option value="Software Engineering" <c:if test="${student.department == 'Software Engineering'}">selected</c:if>>Software Engineering</option>
                        <option value="Data Science" <c:if test="${student.department == 'Data Science'}">selected</c:if>>Data Science</option>
                        <option value="Business Management" <c:if test="${student.department == 'Business Management'}">selected</c:if>>Business Management</option>
                        <option value="Accounting" <c:if test="${student.department == 'Accounting'}">selected</c:if>>Accounting</option>
                        <option value="Law" <c:if test="${student.department == 'Law'}">selected</c:if>>Law</option>
                        <option value="Psychology" <c:if test="${student.department == 'Psychology'}">selected</c:if>>Psychology</option>
                        <option value="Nursing" <c:if test="${student.department == 'Nursing'}">selected</c:if>>Nursing</option>
                        <option value="Engineering" <c:if test="${student.department == 'Engineering'}">selected</c:if>>Engineering</option>
                    </select>
                </div>

                <div class="text-center">
                    <button id="submitBtn" type="submit"
                            class="inline-flex items-center px-6 py-2 bg-green-500 text-white text-sm font-semibold rounded-lg opacity-50 cursor-not-allowed transition">
                        <i class="fas fa-save mr-2"></i> Save Changes
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