<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Flight Details</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('/images/flights.jpg'); /* Path to your background image */
            background-size: cover; /* Cover the entire page */
            background-position: center; /* Center the image */
            background-repeat: no-repeat; /* Do not repeat the image */
            height: 100vh; 
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .details-container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .details-title {
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: bold;
            color: #333;
            text-align: center;
        }
        .details-container p {
            font-size: 18px;
            color: #555;
        }
        .details-container p strong {
            color: #333;
        }
        .table {
            margin-top: 20px;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }
        .action-links {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }
        .home-link, .cancel-link {
            width: 150px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container details-container">
    <h1 class="details-title">Ticket Information</h1>
    <p><strong>Ticket Number:</strong> ${ticket.ticketNumber}</p>
    <p><strong>Flight Number:</strong> ${ticket.flightNumber}</p>
    <p><strong>Carrier Name:</strong> ${ticket.carrierName}</p>
    <p><strong>From:</strong> ${fromCity}</p>
    <p><strong>To:</strong> ${toCity}</p>
    <p><strong>Fare:</strong> ${fare}</p>

    <h3>Passenger List</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Name</th>
                <th>Date of Birth</th>
                <th>Fare</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="passenger" items="${passengerList}">
                <tr>
                    <td>${passenger.passengerName}</td>
                    <td>${passenger.passengerDOB}</td>
                    <td>${passenger.fare}</td>
                </tr>
                <c:set var="totalFare" value="${totalFare + passenger.fare}" />
                
            </c:forEach>
        </tbody>
    </table>
    <p><strong>Total Fare:</strong> ${totalFare}</p>
<form action="/cancelTicket" method="post">
  <input type="hidden" name="ticketNumber" value="${ticket.ticketNumber}"/>
  <button type="submit" class="cancel-button">Cancel Ticket</button>
</form>
    

    <div class="action-links">
        <a href="/index" class="btn btn-primary home-link">Home</a>
        
        </div>
</div>
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
