<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Routes</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        margin: 0;
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
    .all-routes {
        font-size: 24px; /* Adjust the font size as needed */
        font-style: italic;
        text-decoration: underline;
    }
</style>
</head>
<body>
<div class="container">
<span class="all-routes">All Routes</span>
<br/>
<table border="2">
<tr>
<th>Source Number</th>
<th>Source Airport Code</th>
<th>Target Airport Code</th>
<th>Route Fair</th>
</tr>
<c:forEach items="${abc}" var="route">
<tr>
<td>${route.routeId}</td>
<td>${route.sourceAirportCode}</td>
<td>${route.destinationAirportCode}</td>
<td>${route.fare}</td>
</tr>
</c:forEach>
</table>
<a href="/index" class="home-link btn btn-primary">Back to Home</a>
<br/><br/>
</div>
</body>
</html>
