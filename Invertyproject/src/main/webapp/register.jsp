<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Logins.Logindb, java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Inventory Management Form</title>
</head>
<body class="d-flex justify-content-center align-items-center vh-100">
<div class="card p-4" style="width: 500px; border: 1px solid black;">
    <form method="post" onsubmit="return valid()">
        <div id="head" class="mb-3 text-center">
            <h1>Inventory <br> Management <br> Form</h1>
        </div>
        <div class="mb-3">
            <input type="text" name="firstname" placeholder="Enter employee name" id="box1" class="form-control" >
            <span id="sp1" class="text-danger"></span>
        </div>
       
        <div class="mb-3">
            <input type="password" name="password" placeholder="Password" id="box3" class="form-control" minlength="8" >
            <span id="sp3" class="text-danger"></span>
        </div>
        <div class="mb-3">
            <input type="password" name="confirm" placeholder="Confirm password" id="box4" class="form-control" minlength="8" >
            <span id="sp4" class="text-danger"></span>
        </div>
        <p>Use 8 or more characters with a mix of letters, numbers & symbols.</p>
        <h5>Already have an account? <a href="Login.jsp">Login now</a></h5>
        <div class="text-end">
            <input type="submit" value="Register" id="submit" class="btn btn-primary" name="btn">
        </div>
    </form>
</div>

<script>
function valid() {
    let isValid = true;

    let box1 = document.getElementById("box1");
    let sp1 = document.getElementById("sp1");
    if (box1.value.trim() === "") {
        sp1.innerHTML = "Please enter a name.";
        box1.focus();
        isValid = false;
    } else {
        sp1.innerHTML = "";
    }

    let box3 = document.getElementById("box3");
    let sp3 = document.getElementById("sp3");
    if (box3.value.trim() === "") {
        sp3.innerHTML = "Please enter a password.";
        box3.focus();
        isValid = false;
    } else {
        sp3.innerHTML = "";
    }

    let box4 = document.getElementById("box4");
    let sp4 = document.getElementById("sp4");
    if (box4.value.trim() === "") {
        sp4.innerHTML = "Please confirm your password.";
        box4.focus();
        isValid = false;
    } else if (box3.value !== box4.value) {
        sp4.innerHTML = "Passwords do not match.";
        box4.focus();
        isValid = false;
    } else {
        sp4.innerHTML = "";
    }

    return isValid;
}
</script>

<%
String lo = request.getParameter("btn");
if (lo != null && lo.equals("Register")) {
    String user = request.getParameter("firstname");
    String pass = request.getParameter("password");
    String role = "admin"; // Assuming role is fixed as "user" for registration
    
    try {
    	 %>
         <jsp:useBean id="obj" class="Logins.Logindb"></jsp:useBean><% 
        int r = obj.add(user, pass, role);
        if (r >= 1) {
        	
        	  %>
              <jsp:forward page="Login.jsp"></jsp:forward><% 
        } else {
            out.println("<div class='text-danger text-center'>Registration failed. Please try again.</div>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<div class='text-danger text-center'>There was an error processing your request.</div>");
    }
}
%>
</body>
</html>
