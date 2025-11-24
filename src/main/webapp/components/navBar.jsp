<%@ page import="model.ServiceCategory" %>
<%@ page import="service.ServiceCategoryManager" %>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="./index.jsp">
        <img src="../img/silvercare-logo.png" width="33px" height="33px">
        SilverCare
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="./index.jsp">Home</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Services
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="./serviceCategories.jsp">All service categories</a></li>
            <li><hr class="dropdown-divider"></li>
            <%
            	for(ServiceCategory serviceCategory : ServiceCategoryManager.getAllServiceCategories()) {
            		String name = serviceCategory.getName();
            		out.println("<li><a class=\"dropdown-item\" href=\"./serviceCategory.jsp?name=" 
	           	            + name + "\">" + name + "</a></li>\n");
            	}
            %>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="./appointment.jsp">Appointment</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="./newsUpdates.jsp">News & Updates</a>
        </li>
      </ul>
      <div class="d-flex">
      	<%
      		String sessionDisplayName = (String) session.getAttribute("displayName");
      		if(sessionDisplayName == null) {
        		out.print("<a href=\"./login.jsp\" class=\"btn btn-outline-success me-2\">Login</a>\n");
        		out.print("<a href=\"./register.jsp\" class=\"btn btn-primary\">Register</a>");
      		} else {
      			out.print("<a href=\"./profile.jsp\" class=\"btn btn-outline-dark me-2\"><i class=\"bi bi-person-circle\"></i>&ensp;" + sessionDisplayName + "</a>\n");
        		out.print("<a href=\"./cart.jsp\" class=\"btn btn-primary\"><i class=\"bi bi-cart-check-fill\"></i>&ensp;Cart</a>");
      		}
      	%>
  	  </div>
    </div>
  </div>
</nav>