<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Flight Record</title>
    <style>
        body {
        font-family: Arial, sans-serif;
             background-image: url('/images/flights.jpg');
            background-size: cover; /* Cover the entire page */
            background-position: center; /* Center the image */
            background-repeat: no-repeat; /* Do not repeat the image */
            height: 100vh; /* Ensure body takes full height */
            margin: 0;
            
            background-color: #f8f9fa;
            
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h3 {
            color: #333;
        }

        table {
            margin: 20px auto;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
            text-align: left;
        }

        input[type="text"], input[type="number"], input[type="datetime-local"], form:input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        button {
            margin: 10px 5px;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button[type="reset"] {
            background-color: #dc3545;
        }

        button:hover {
            opacity: 0.8;
        }

        a {
            display: inline-block;
            margin: 20px auto;
            padding: 10px 20px;
            text-decoration: none;
            color: #fff;
            background-color: #28a745;
            border-radius: 5px;
        }

        a:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div align="center">
    <h3>
        <form:form action="/flight" method="post" modelAttribute="flightRecord">
            Enter Flight Id: <form:input path="flightNumber"/><br/><br/>
            Enter Airlines Name: <form:input path="carrierName"/><br/><br/>
            Select Route Id: <form:input list="routes" path="routeId"/>
            <datalist id="routes">
                <c:forEach items="${routeList}" var="route">
                    <option value="${route}"></option>
                </c:forEach>
            </datalist><br/><br/>
            Enter Seat Capacity: <form:input path="seatCapacity"/><br/><br/>
            Enter Departure Time: <form:input path="departure"/><br/><br/>
            Enter Arrival Time: <form:input path="arrival"/><br/>
            <form:hidden path="seatBooked" value="0"/>
            <hr size="5" color="lightgreen"/><br/>
            Enter Return Flight's Departure Time: <input type="text" name="dtime"/><br/><br/>
            Enter Return Flight's Arrival Time: <input type="text" name="atime"/><br/><br/>
            <div class="button-container">
                <button type="submit">Submit</button>
                <button type="reset">Reset</button>
            </div>
        </form:form>
    </h3>
</div>
<a href="index">Back to Home</a>
</body>
</html>
