<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('/images/airportimage.jpg');
            background-size: cover; /* Cover the entire page */
            background-position: center; /* Center the image */
            background-repeat: no-repeat; /* Do not repeat the image */
            height: 100vh; /* Ensure body takes full height */
            margin: 0; /* Remove default margin */
            display: flex; /* Use flexbox */
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
        }
        #airportForm {
            width: 400px;
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        #airportForm table {
            width: 100%;
        }
        #airportForm td {
            padding: 10px;
        }
        #airportForm .buttons {
            display: flex;
            justify-content: center;
            width: 100%;
            margin-top: 20px;
            gap: 20px; /* Space between buttons */
        }
        #airportForm button,
        #airportForm .home-button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none; /* No underline for links */
            text-align: center; /* Center text */
        }
        #airportForm button[type="reset"] {
            background-color: #f44336;
        }
        #airportForm button[type="submit"]:hover,
        #airportForm button[type="reset"]:hover,
        #airportForm .home-button:hover {
            opacity: 0.8;
        }
        #airportForm h3 {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form:form id="airportForm" action="/airport" method="post" modelAttribute="airportRecord">
        <h3>Airport Details</h3>
        <table>
            <tr>
                <td>Enter Airport City:</td>
                <td><form:input path="airportLocation"/></td>
            </tr>
            <tr>
                <td>Enter Airport Code:</td>
                <td><form:input path="airportCode"/></td>
            </tr>
        </table>
        <div class="buttons">
            <button type="submit">Submit</button>
            <button type="reset">Reset</button>
        </div>
        </br></br>
        <a href="/index" class="home-button">Back to Home</a>
    </form:form>
</body>
</html>
