<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>airport.jsp</title>
</head>
<body>
<title>All Flights</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
                     background-color: #f8f9fa;
          
            
        }
        .table-container {
            margin-top: 50px;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .home-link {
            margin-top: 20px;
            display: block;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10 table-container text-center">
                <h1 class="text-center"><u><i>All Flights</i></u></h1>
                <table class="table table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th>Flight Number</th>
                            <th>Airlines Name</th>
                            <th>Route Id</th>
                            <th>Departure</th>
                            <th>Arrival</th>
                            <th>Seat Available</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${efg}" var="flight">
                            <tr>
                                <td>${flight.flightNumber}</td>
                                <td>${flight.carrierName}</td>
                                <td>${flight.routeId}</td>
                                <td>${flight.departure}</td>
                                <td>${flight.arrival}</td>
                                <c:set var="seatAvailable" scope="session" value="${flight.seatCapacity-flight.seatBooked}"/> 
                                <td>${seatAvailable}</td>
                                <form action="/CancelFlight" method="post">
    <input type="hidden" name="FlightNumber" value="${data.flightNumber}"/>
    <button type="submit" class="cancel-button">Cancel</button>
</form>
                                
                            </tr>
                        </c:forEach>
                    </tbody>
                   </table>
                <a href="/index" class="home-link btn btn-primary">Back to Home</a>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>