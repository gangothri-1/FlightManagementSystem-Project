<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Flight Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('/images/bookflight.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        hr {
            width: 100%;
            border: 0;
            height: 5px;
            background-color: yellow;
            margin: 0;
        }
        h3 {
            margin-top: 20px;
            font-size: 24px;
        }
        table {
            border-collapse: collapse;
            width: 80%;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        a, button {
            color: blue;
            text-decoration: none;
            padding: 10px;
            border: none;
            background: none;
            cursor: pointer;
        }
        a:hover, button:hover {
            text-decoration: underline;
        }
        .home-button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
        }
        .home-button:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <hr/>
    <h3>Flight Booking Details</h3>
    <div align="center">
        <table border="2" cellspacing="5" cellpadding="5">
            <tr>
                <th>Flight Number</th>
                <th>Airlines Name</th>
                <th>Route Id</th>
                <th>Departure</th>
                <th>Arrival</th>
                <th>Book Flight</th>
                
            </tr>
            <c:forEach items="${flightList}" var="flight">
                <tr>
                    <td>${flight.flightNumber}</td>
                    <td>${flight.carrierName}</td>
                    <td>${flight.routeId}</td>
                    <td>${flight.departure}</td>
                    <td>${flight.arrival}</td>
                    <td><a href="/ticket/${flight.flightNumber}">Book Flight</a></td>
                 
                    
                </tr>
            </c:forEach>
        </table>
        <br/><br/>
        <a href="/index" class="home-button">Back to Home</a>
    </div>
</body>
</html>
