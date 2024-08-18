<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h3>
<form:form id="/airport-select" method="post">

Select Airport Code:<input list="allCodes" name="airport-code" id="airport-code"/>
<datalist id="allCodes">
<c:forEach items="${codeList}" var="aircode">
<option value="${aircode}"/>
</c:forEach>
</datalist>
<br/><br/>
<button type="submit">Submit</button>
</form:form>
</h3>
</div>

</body>
</html>