<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Service" %>
<%@ page import="service.ServiceManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../components/header-config.html" %>
<title>SilverCare | Services</title>
</head>
<body style="background-color: #F5F5F5;">

    <jsp:include page="../components/navBar.jsp"></jsp:include>

    <%
        // Get selected category from query string
        String categoryName = request.getParameter("category");
        if (categoryName == null || categoryName.trim().isEmpty()) {
            categoryName = "Our Services";
        }

        // Fetch services for the category (adjust name if needed)
        List<Service> services = ServiceManager.getServicesByCategory(categoryName);
    %>

    <div class="container mt-5">
        <div class="row mb-4">
            <div class="col-12 text-center">
                <h2 style="font-weight: 700; color: #1D3142;">
                    <i class="bi bi-heart-fill"></i>
                    &ensp;<%= categoryName %>
                </h2>
                <p class="text-muted">
                    Explore our caregiving services designed to support your needs.
                </p>
            </div>
        </div>

        <div class="row g-4">

            <%
                if (services == null || services.isEmpty()) {
            %>

            <div class="col-12">
                <div class="alert alert-warning text-center">
                    No services available under this category.
                </div>
            </div>

            <%
                } else {
                    for (Service service : services) {
                        String name = service.getName();
                        String description = service.getDescription();
                        int imgIndex = service.getImgIndex();

                        String imgUrl = "../img/service-" + imgIndex + ".png";
                        String detailsUrl = "./serviceDetails.jsp?name=" + name;
            %>

            <div class="col-12 col-md-6 col-lg-4 d-flex">
                <div class="card shadow-sm flex-fill" 
                     style="border-radius: 16px; overflow: hidden;">

                    <img src="<%= imgUrl %>" 
                         class="card-img-top"
                         style="height: 200px; object-fit: cover;">

                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title" style="color: #1D3142; font-weight: 700;">
                            <%= name %>
                        </h5>

                        <p class="card-text text-muted" style="flex-grow: 1;">
                            <%= description %>
                        </p>

                        <button class="btn"
                                style="
                                    background-color: #2C2C2C;
                                    color: white;
                                    border-radius: 20px;
                                    padding: 6px 20px;
                                "
                                onclick="window.location.href='<%= detailsUrl %>'">
                            View Details
                        </button>
                    </div>
                </div>
            </div>

            <%
                    }
                }
            %>

        </div>
    </div>

    <%@ include file="../components/footer.html" %>

</body>
</html>
