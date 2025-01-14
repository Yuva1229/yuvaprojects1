<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Stack" %>
<%@ page import="Logins.Storedat" %>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <title>Product List</title>
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
<div class="container">
    <h2>Product List</h2>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>S.NO</th>
                <th>PRODUCT ID</th>
                <th>PRODUCT NAME</th>
                <th>PRODUCT CATEGORY</th>
                <th>QUANTITY</th>
                <th>PRICE</th>
                <th>SUPPLIER ID</th>
                <th colspan="2">ACTION</th>
            </tr>
        </thead>
        <tbody>
            <jsp:useBean id="obj" class="Logins.Logindb" />
            <%
                int i = 0;
                Stack<Storedat> s = obj.view();
                for (Storedat d : s) {
            %>
            <tr>
                <td><%= ++i %></td>
                <td><%= d.getId() %></td>
                <td><%= d.getName() %></td>
                <td><%= d.getCategory() %></td>
                <td><%= d.getQuantity() %></td>
                <td><%= d.getPrice() %></td>
                <td><%= d.getSupplier_id() %></td>
                <td><a href="Edites.jsp?edit=Edit&did=<%=d.getId()%>">Edit</a></td>
                <td><a href="Edit.jsp?del=remove&did=<%=d.getId()%>">Delete</a></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
<%
String de = request.getParameter("del");
if (de != null && de.equals("remove")) {
    int c = Integer.parseInt(request.getParameter("did"));
    int delet = obj.delete(c);
    if (delet != 0) {
        response.sendRedirect("Edit.jsp");
    }
}
%>
</body>
</html>
