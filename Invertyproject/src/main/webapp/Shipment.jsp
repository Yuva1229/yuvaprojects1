<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="Aboutus.jsp">About Us</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Login.jsp">Logout</a>
        </li>
       <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle"  role="button" data-bs-toggle="dropdown" aria-expanded="false">
           shpiment infromation
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="Shipment.jsp">Add</a></li>
            <li><a class="dropdown-item" href="viewshipment.jsp">view</a></li>
            
          </ul>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle"  role="button" data-bs-toggle="dropdown" aria-expanded="false">
            suppliers informataion
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="Addsuppliers.jsp">Add</a></li>
            <li><a class="dropdown-item" href="Viewsuppliers.jsp">view</a></li>
            
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Orders.jsp">orders</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle"  role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Product Management
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="Addproduct.jsp">Add</a></li>
            <li><a class="dropdown-item" href="Edit.jsp">Edit</a></li>
            
           
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Login.jsp">Home</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="container mt-3">
    <h2 class="text-center mb-4">add shipments</h2>
    <form method="post" >
        <div class="mb-3">
            <label for="id" class="form-label">product id</label>
            <input type="number" name="id" id="id" class="form-control" placeholder="Enter the product id" required>
        </div>
        <div class="mb-3">
            <label for="quantity" class="form-label">quantity</label>
            <input type="number" name="quantity" id="quantity" class="form-control" placeholder="Enter the quantity " required>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary" name="btn" value="submit">Submit</button>
        </div>
        </form>
</div>
<%
String sub=request.getParameter("btn");
if(sub!=null && sub.equals("submit"))
{
	int name=Integer.parseInt(request.getParameter("id"));
	int ad=Integer.parseInt(request.getParameter("quantity"));
	
	
	 
    	 %>
         <jsp:useBean id="obj" class="Logins.Logindb"></jsp:useBean><% 
        int r = obj.addship(name,ad);
        if (r >= 1) {
        	out.println("<div class='text-success text-center'>success Added</div>");
            
        } else {
            out.println("<div class='text-danger text-center'>Registration failed. Please try again.</div>");
        }
	 }
    
    

%>
</body>
</html>