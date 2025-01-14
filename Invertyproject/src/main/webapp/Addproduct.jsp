<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="Logins.Logindb, java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="UTF-8">
    <title>Product Entry Form</title>
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
    <h2 class="text-center mb-4">Add New Product</h2>
    <form method="post" >
        <div class="mb-3">
            <label for="name" class="form-label">Product Name</label>
            <input type="text" name="name" id="name" class="form-control" placeholder="Enter the product name" required>
        </div>
        <div class="mb-3">
            <label for="category" class="form-label">Category</label>
            <input type="text" name="category" id="category" class="form-control" placeholder="Enter the product category" required>
        </div>
        <div class="mb-3">
            <label for="quantity" class="form-label">Quantity</label>
            <input type="number" name="quantity" id="quantity" class="form-control" placeholder="Enter the quantity" required>
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Price</label>
            <input type="number" step="0.01" name="price" id="price" class="form-control" placeholder="Enter the price" required>
        </div>
        <div class="mb-3">
            <label for="supplier" class="form-label">Supplier ID</label>
            <input type="number" name="supplier" id="supplier" class="form-control" placeholder="Enter the supplier ID" required>
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
	String name=request.getParameter("name");
	String cat=request.getParameter("category");
	int qu=Integer.parseInt(request.getParameter("quantity"));
	int pr=Integer.parseInt(request.getParameter("price"));
	int sid=Integer.parseInt(request.getParameter("supplier"));
	
	 try {
    	 %>
         <jsp:useBean id="obj" class="Logins.Logindb"></jsp:useBean><% 
        int r = obj.addp(name, cat, qu,pr,sid);
        if (r >= 1) {
        	out.println("<div class='text-success text-center'>success Added</div>");
            
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
