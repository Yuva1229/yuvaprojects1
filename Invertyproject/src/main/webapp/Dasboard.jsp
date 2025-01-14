<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Responsive Page with Navbar and Carousel</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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
<%
String user = request.getParameter("user");
%>
<h1>Welcome <%=user%>!!</h1>
<!-- Carousel -->
<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://via.placeholder.com/800x400?text=Automati+Image" class="d-block w-100" alt="First slide">
    </div>
    <div class="carousel-item">
      <img src="data:image/jpeg;base64,[AUTOMATI_IMAGE_BASE64_DATA]" class="d-block w-100" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img src="https://via.placeholder.com/800x400" class="d-block w-100" alt="Third slide">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</body>
</html>
