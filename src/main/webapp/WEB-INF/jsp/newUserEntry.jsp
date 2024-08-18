<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User Registration</title>
<!-- Include Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<style>
    body {
        font-family: Arial, sans-serif;
         background-image: url('/images/allairports.jpg');
         /* Update with your background image path */
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        height: 100vh;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .registration-box {
        background-color: rgba(255, 255, 255, 0.9);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        width: 100%;
        max-width: 500px;
    }
    .registration-box h3 {
        margin-bottom: 20px;
    }
    .form-label {
        font-weight: bold;
    }
</style>
<script type="text/javascript">
    function passwordCheck() {
        var pass1 = document.getElementById("pass1").value;
        var pass2 = document.getElementById("pass2").value;
        if (pass1 == pass2) {
            document.getElementById("registrationForm").submit();
        } else {
            alert("Passwords do not match");
        }
    }
</script>
</head>
<body>
<div class="registration-box">
    <h3 class="text-center">New User Registration</h3>
    <form:form id="registrationForm" action="/register" method="post" modelAttribute="userRecord">
        <div class="form-group">
            <label for="username" class="form-label">Enter New UserId:</label>
            <form:input path="username" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="type" class="form-label">Select User's Type:</label>
            <form:input list="types" name="type" id="type" path="type" class="form-control"/>
            <datalist id="types">
                <option value="Customer">
                <option value="Admin">
            </datalist>
        </div>
        <div class="form-group">
            <label for="pass1" class="form-label">Enter New Password:</label>
            <form:input type="password" id="pass1" path="password" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="pass2" class="form-label">Re-type New Password:</label>
            <input type="password" id="pass2" class="form-control"/>
        </div>
        <div class="form-group text-center">
            <button type="button" class="btn btn-primary" onclick="passwordCheck()">Submit</button>
            <button type="reset" class="btn btn-secondary">Reset</button>
        </div>
    </form:form>
</div>
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
