<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>airportShowPage.jsp</title>
</head>
<body>
<div align="center">
<h1 style="color:blue">
<u><i>Airport Details for ${airport.airportCode}</i></u>
</h1>
<br/>
<h2>
Airport Code:${airport.airportCode}
<br/><br/>
Airport City:${airport.airportLocation }
<br/><br/>
<a href="/airports">Return</a>
</h2>
</div>
</body>
</html>