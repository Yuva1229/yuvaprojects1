<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
</body>
</html>