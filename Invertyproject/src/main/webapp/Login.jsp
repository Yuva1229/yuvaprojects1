<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="UTF-8">
    <title>Login Page</title>
</head>
<body class="d-flex justify-content-center align-items-center vh-100">
    <div class="card p-4" style="width: 400px;">
        <form method="post" onsubmit="return checks()">
            <h1 class="text-center">Login Page</h1>
            <div class="mb-3">
                <input type="text" name="usern" placeholder="Username" class="form-control" id="boxs1">
                <div id="sps1" class="text-danger"></div>
            </div>
            <div class="mb-3">
                <input type="password" name="pass" placeholder="Password" class="form-control" id="boxs2">
                <div id="sps2" class="text-danger"></div>
            </div>
            <button type="submit" class="btn btn-primary w-100" name="btn" value="Login">Login</button>
            <p class="mt-3 text-center">Not registered? <a href="register.jsp">Create an account</a></p>
        </form>
    </div>

    <script>
        function checks() {
            let isValid = true;

            let boxs1 = document.getElementById("boxs1");
            let sps1 = document.getElementById("sps1");
            if (boxs1.value.trim() === "") {
                sps1.innerHTML = "Please enter a username.";
                boxs1.classList.add("is-invalid");
                isValid = false;
            } else {
                sps1.innerHTML = "";
                boxs1.classList.remove("is-invalid");
            }

            let boxs2 = document.getElementById("boxs2");
            let sps2 = document.getElementById("sps2");
            if (boxs2.value.trim() === "") {
                sps2.innerHTML = "Please enter a password.";
                boxs2.classList.add("is-invalid");
                isValid = false;
            } else {
                sps2.innerHTML = "";
                boxs2.classList.remove("is-invalid");
            }

            return isValid;
        }
    </script>

    <%
    String lo = request.getParameter("btn");
    if (lo != null && lo.equals("Login")) {
        String user = request.getParameter("usern");
        String pass = request.getParameter("pass");
        %>
        <jsp:useBean id="obj1" class="Logins.Logindb"></jsp:useBean><% 
        
            boolean r = obj1.value(user, pass);
            if (r) {
                %>
                <jsp:forward page="Dasboard.jsp">
                <jsp:param value="<%=user %>" name="user"/></jsp:forward>
                <% 
                
            } else {
                out.println("<div class='text-danger text-center'>Invalid username or password.</div>");
            }
        
    
    }
    
    %>
</body>
</html>
