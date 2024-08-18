<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Route Entry Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
         background-image: url('/images/airportreport.jpg');
         background-size: cover; /* Cover the entire page */
            background-position: center; /* Center the image */
            background-repeat: no-repeat; /* Do not repeat the image */
            height: 100vh; /* Ensure body takes full height */
            margin: 0;
        background-color: #f0f0f0;
        margin: 0;
        padding: 0;
    }
    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    h3 {
        background-color: #ffffff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    form {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    form input {
        padding: 10px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    form button {
        padding: 10px 20px;
        margin: 10px 5px;
        border: none;
        border-radius: 5px;
        background-color: #007bff;
        color: white;
        cursor: pointer;
    }
    form button[type="reset"] {
        background-color: #dc3545;
    }
    form button:hover {
        opacity: 0.8;
    }
</style>
</head>
<body>
<div class="container">
<h3>
<form:form action="/route" method="post" modelAttribute="routeRecord">
<form:hidden path="routeId"/>
Enter Source City:<form:input path="sourceAirportCode" />
<br/><br/>
Enter Destination City:<form:input path="destinationAirportCode"/>
<br/><br/>
Enter Route Fair:<form:input path="fare"/>
<br/><br/>
<button type="submit">Submit</button>
<button type="reset">Reset</button>
</br></br>
 <a href="/index" class="home-button">Back to Home</a>
</form:form>
</h3>
</div>
</body>
</html>
