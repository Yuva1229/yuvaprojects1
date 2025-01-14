<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Stack" %>
<%@ page import="Logins.Storedat" %>
 
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
<jsp:useBean id="obje" class="Logins.Logindb"></jsp:useBean>
<%
String edi=request.getParameter("edit");
if(edi!=null && edi.equals("Edit"))
{
	int c = Integer.parseInt(request.getParameter("did"));
	Stack<Storedat> s=obje.select(c);
	for(Storedat ds:s)
	{
		%>
		<div class="container mt-3">
    <h2 class="text-center mb-4">EDIT Product</h2>
    <form method="post" >
    <div class="mb-3">
            <label for="id" class="form-label">Product Name</label>
            <input type="number" name="id" id="ide" class="form-control" placeholder="Enter the product name"  value="<%=ds.getId() %>"  >
        </div>
        <div class="mb-3">
            <label for="name" class="form-label">Product Name</label>
            <input type="text" name="name" id="name" class="form-control" placeholder="Enter the product name" required value="<%=ds.getName() %>" >
        </div>
        <div class="mb-3">
            <label for="category" class="form-label">Category</label>
            <input type="text" name="category" id="category" class="form-control" placeholder="Enter the product category"  value="<%=ds.getCategory() %>" required>
        </div>
        <div class="mb-3">
            <label for="quantity" class="form-label">Quantity</label>
            <input type="number" name="quantity" id="quantity" class="form-control" placeholder="Enter the quantity" value="<%=ds.getQuantity() %>"  required>
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Price</label>
            <input type="number" step="0.01" name="price" id="price" class="form-control" placeholder="Enter the price" value="<%=ds.getPrice() %>"  required>
        </div>
        <div class="mb-3">
            <label for="supplier" class="form-label">Supplier ID</label>
            <input type="number" name="supplier" id="supplier" class="form-control" placeholder="Enter the supplier ID"  value="<%=ds.getSupplier_id() %>" required>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary" name="btn" value="Update" value="<%=ds.getId() %>">Submit</button>
        </div>
    </form>
</div>
	<% 	
	}
}

String u=request.getParameter("btn");
if(u!=null && u.equals("Update"))
{
	
    int id=Integer.parseInt(request.getParameter("id"));
	String name=request.getParameter("name");
	String cat=request.getParameter("category");
	int qu=Integer.parseInt(request.getParameter("quantity"));
	double pr=Double.parseDouble(request.getParameter("price"));
	int sid=Integer.parseInt(request.getParameter("supplier"));
	
	int r=obje.update(name,cat,qu,pr,sid,id);
	if (r >= 1) {
    	out.println("<div class='text-success text-center'>success edied</div>");
        
    } else {
        out.println("<div class='text-danger text-center'>Registration failed. Please try again.</div>");
    }
}
%>

</body>
</html>