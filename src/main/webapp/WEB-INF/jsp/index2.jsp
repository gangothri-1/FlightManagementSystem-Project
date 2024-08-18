<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    
    
        body {
            font-family: Arial, sans-serif;
            background-image: url('/images/flight.jpg'); /* Path to your background image */
            background-size: cover; /* Cover the entire page */
            background-position: center; /* Center the image */
            background-repeat: no-repeat; /* Do not repeat the image */
            height: 100vh; /* Ensure body takes full height */
            margin: 0; /* Remove default margin */
        }
        .navbar {
            display: flex;
            background-color: #4602FB;
            padding: 20px;
        }
        .navbar a {
            color: white;
            padding: 20px 30px;
            text-decoration: none;
            text-align: center;
        }
        .dropdown {
            position: relative;
            display: inline-block;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 220px;
            box-shadow: 0px 8px 16px 0px rgb(0,0,0,0);
            z-index: 1;
        }
        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }
        .dropdown-content a:hover {
            background-color: #f1f1f1;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        .dropdown:hover .dropbtn {
            background-color: red;
        }
        .title {
            text-align: center;
            margin: 20px;
            font-size: 24px;
            font-weight: italic;
        }
    </style>
</head>
<body>

<div class="title">
WELCOME TO FLIGHT MANAGEMENT SYSTEM
</div>

<div class="navbar">

<div class="dropdown">
<button class="dropbtn">Flight Booking
<i class="fa fa-caret-down"></i>
</button>
<div class="dropdown-content">
<a href="/flight-search">Flight Search</a>
</div>
</div>
<div class="dropdown">
        <a href="/loginpage">Logout</a>
        </div>  
</head>
<body>

</body>
</html>