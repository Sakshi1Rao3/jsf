
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Information</title>
</head>
<body>

<h2>Employee Information Result</h2>

<%
String employeeId = request.getParameter("employeeId");
String name = request.getParameter("name");
String ageStr = request.getParameter("age");
String department = request.getParameter("department");
String email = request.getParameter("email");

String employeeIdError = "", nameError = "", ageError = "";
String departmentError = "", emailError = "";
boolean isValid = true;

// Validate Employee ID
if (employeeId == null || employeeId.trim().isEmpty()) {
    employeeIdError = "Employee ID is required.";
    isValid = false;
}

// Validate Name
if (name == null || !name.matches("^[a-zA-Z\\s]+$")) {
    nameError = "Name must contain only letters and spaces.";
    isValid = false;
}

// Validate Age
int age = 0;
try {
    age = Integer.parseInt(ageStr);
    if (age < 18 || age > 65) {
        ageError = "Age must be between 18 and 65.";
        isValid = false;
    }
} catch (NumberFormatException e) {
    ageError = "Age must be a valid numeric value.";
    isValid = false;
}

// Validate Department
if (department == null || department.trim().isEmpty()) {
    departmentError = "Department is required.";
    isValid = false;
} else if (!department.matches("HR|Finance|IT|Sales")) {
    departmentError = "Invalid department selected.";
    isValid = false;
}

// Validate Email
if (email == null ||
    !email.matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$")) {
    emailError = "Email must be in a valid format (e.g., name@example.com).";
    isValid = false;
}

if (isValid) {
    int currentYear = java.util.Calendar.getInstance()
            .get(java.util.Calendar.YEAR);
    int birthYear = currentYear - age;
    String nameAndDepartment = name + " (" + department + ")";
    String formattedEmail = email.toLowerCase();
%>

<h3>Employee Details</h3>
<p><b>Employee ID:</b> <%= employeeId %></p>
<p><b>Name and Department:</b> <%= nameAndDepartment %></p>
<p><b>Birth Year:</b> <%= birthYear %></p>
<p><b>Formatted Email:</b> <%= formattedEmail %></p>

<%
} else {
%>

<h3>Validation Errors</h3>
<ul>
    <% if (!employeeIdError.isEmpty()) { %>
        <li><b>Employee ID:</b> <%= employeeIdError %></li>
    <% } %>
    <% if (!nameError.isEmpty()) { %>
        <li><b>Name:</b> <%= nameError %></li>
    <% } %>
    <% if (!ageError.isEmpty()) { %>
        <li><b>Age:</b> <%= ageError %></li>
    <% } %>
    <% if (!departmentError.isEmpty()) { %>
        <li><b>Department:</b> <%= departmentError %></li>
    <% } %>
    <% if (!emailError.isEmpty()) { %>
        <li><b>Email:</b> <%= emailError %></li>
    <% } %>
</ul>

<a href="employeeForm.jsp">Go back to the form</a>

<%
}
%>

</body>
</html>
