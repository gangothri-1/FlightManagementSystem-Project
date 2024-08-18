<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Airports(airportReportPage.jsp)</title>
<style>
    body {
            font-family: Arial, sans-serif;
           /* Path to your background image */
            background-size: cover; /* Cover the entire page */
            background-position: center; /* Center the image */
            background-repeat: no-repeat; /* Do not repeat the image */
            height: 100vh; /* Ensure body takes full height */
            margin: 0; 
   
        background-color: #f0f0f0;
       
        padding: 0;
    }
    h1 {
        color: #333;
        text-shadow: 1px 1px 2px #aaa;
    }
    table {
        width: 80%;
        border-collapse: collapse;
        margin: 20px auto;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    th, td {
        padding: 12px;
        text-align: center;
        border: 1px solid #ddd;
    }
    th {
        background-color: #007bff;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #e9ecef;
    }
    a {
        text-decoration: none;
        color: #007bff;
        font-weight: bold;
    }
    a:hover {
        text-decoration: underline;
    }
    .container {
        text-align: center;
        margin-top: 50px;
    }
</style>
</head>
<body>
<div class="container">
<h1><u><i>All Airports</i></u></h1>
<br/>
<table border="2">
<tr>
<th>Airport Code</th>
<th>Airport Location</th>
<th>Enquire</th>
</tr>
<c:forEach items="${bcd}" var="airport">
<tr>
<td>${airport.airportCode}</td>
<td>${airport.airportLocation}</td>
<td><a href="/airport/${airport.airportCode}">Enquire</a></td>
</tr>
</c:forEach>
</table>
<br/><br/>
<a href="/index">return</a>
</div>
</body>
</html>
