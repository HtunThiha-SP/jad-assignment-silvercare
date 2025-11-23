<%@ page import="model.ServiceCategory" %>
<%@ page import="service.ServiceCategoryManager" %>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
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
          <a class="nav-link dropdown-toggle" href="./serviceCategory.jsp" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Services
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="./serviceCategories.jsp">All services</a></li>
            <li><hr class="dropdown-divider"></li>
            <%
            	for(ServiceCategory serviceCategory : ServiceCategoryManager.getAllServiceCategories()) {
            		String name = serviceCategory.getName();
            		out.println("<li><a class=\"dropdown-item\" href=\"./serviceCategoryDetails.jsp?name=" 
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
    </div>
  </div>
</nav>