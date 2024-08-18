<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Error</title>
</head>
<body>
<div align="center">
<h1 style="color:red">
Login Failed
</h1>
<p>Invalid username or password</p>
<a href="/loginpage">TryAgain</a>
</div>
<jsp:include page="loginPage.jsp" flush="true"/>
</body>
</html>