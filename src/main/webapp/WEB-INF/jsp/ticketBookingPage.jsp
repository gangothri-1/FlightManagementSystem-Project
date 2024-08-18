<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket Booking</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-image: url('/images/ticketbooking.jpg'); /* Path to your background image */
            background-size: cover; /* Cover the entire page */
            background-position: center; /* Center the image */
            background-repeat: no-repeat; /* Do not repeat the image */
            height: 100vh; 
        background-color: #f0f0f0;
        margin: 0;
        padding: 0;
    }
    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        padding-top: 20px; /* Reduce padding top */
    }
    form {
        background-color: #ffffff;
        padding: 10px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 70%;
        font-size: 14px; /* Reduce font size */
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 10px 0; /* Reduce margin */
        text-align: center; /* Center table content */
    }
    th, td {
        padding: 5px; /* Reduce padding */
        text-align: left;
    }
    label {
        font-weight: bold;
    }
    input[type="text"], input[type="date"] {
        width: 95%; /* Slightly reduce width */
        padding: 5px; /* Reduce padding */
        margin: 3px 0; /* Reduce margin */
        border: 1px solid #ccc;
        border-radius: 3px; /* Reduce border radius */
    }
    .btn-container {
        text-align: center;
        margin-top: 20px;
    }
    button {
        padding: 8px 15px; /* Reduce padding */
        margin: 5px 3px; /* Reduce margin */
        border: none;
        border-radius: 3px; /* Reduce border radius */
        background-color: #007bff;
        color: white;
        cursor: pointer;
    }
    button:hover {
        opacity: 0.8;
    }
    hr {
        margin: 10px 0; /* Reduce margin */
    }
    .required::after {
        content: "*";
        color: red;
    }
    .passenger-details {
        margin-top: 10px; /* Reduce margin top */
    }
    .home-link {
        display: block;
        margin: 20px auto;
        width: 150px;
        text-align: center;
        background-color: #6c757d;
        color: white;
        text-decoration: none;
        padding: 8px 15px;
        border-radius: 3px;
    }
    .home-link:hover {
        opacity: 0.8;
    }
</style>
</head>
<body>
<div class="container">
<form:form action="/ticket" method="post" modelAttribute="ticketRecord">
    <form:hidden path="ticketNumber"/>
    <form:hidden path="flightNumber"/>
    <form:hidden path="carrierName"/>

    <input type="hidden" name="fromLocation" value="${route.sourceAirportCode}" /> 
    <input type="hidden" name="toLocation" value="${route.destinationAirportCode}"/> 
    <input type="hidden" name="fare" value="${route.fare}"/> 
    <hr title="Ticking" color="magenta" width="5"/>

    <h3>
    <table>
    <tr>
    <td><label class="required">Ticket Number:</label><form:input path="ticketNumber" disabled="true" /></td>
    <td><label class="required">Flight Number:</label><form:input path="flightNumber" disabled="true" /></td>
    <td><label class="required">Airlines Name:</label><form:input path="carrierName" disabled="true"/></td>
    </tr>
    <tr>
    <td><label class="required">From:</label><input type="text" value="${route.sourceAirportCode}" disabled="true"/></td>
    <td><label class="required">To:</label><input type="text" value="${route.destinationAirportCode}" disabled="true"/></td>
    <td><label class="required">Fare:</label><input type="text" value="${route.fare}" disabled="true"/></td>
    </tr>
    </table>

    <hr color="lightgreen" width="5"/>

    <div class="passenger-details">
    Enter Passenger Details:-
    <table>
    <tr>
    <td>Name:<input type="text" name="name1" value="--"/></td>
    <td>Date of Birth:<input type="date" name="dob1" pattern="\d{1,2}-\d{1,2}-\d{4}" placeholder="25-10-2024" /></td>
    </tr>
    <tr>
    <td>Name:<input type="text" name="name2" value="--"/></td>
    <td>Date of Birth:<input type="date" name="dob2" pattern="\d{1,2}-\d{1,2}-\d{4}" placeholder="25-10-2024" /></td>
    </tr>
    <tr>
    <td>Name:<input type="text" name="name3" value="--"/></td>
    <td>Date of Birth:<input type="date" name="dob3" pattern="\d{1,2}-\d{1,2}-\d{4}" placeholder="25-10-2024" /></td>
    </tr>
    <tr>
    <td>Name:<input type="text" name="name4" value="--"/></td>
    <td>Date of Birth:<input type="date" name="dob4" pattern="\d{1,2}-\d{1,2}-\d{4}" placeholder="25-10-2024" /></td>
    </tr>
    </table>
    </div>
    </h3>

    <div class="btn-container">
        <button type="submit">Submit</button>
    </div>
</form:form>

  
</div>
</div>
</body>
</html>
