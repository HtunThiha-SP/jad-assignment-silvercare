<%
    String roleName = (String) session.getAttribute("roleName");
    if (roleName == null || !"admin".equalsIgnoreCase(roleName)) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }
    String displayName = (String) session.getAttribute("displayName");
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="../components/header-config.html" %>
    <title>SilverCare | Manage Services</title>
</head>
<body style="background-color: #F5F5F5;">

    <%-- TODO LATER: add session / role check here when backend is ready --%>

    <jsp:include page="../components/navBar.jsp"></jsp:include>

    <div class="container mt-5 mb-5">
        <!-- Header -->
        <div class="row mb-4">
            <div class="col-12 d-flex justify-content-between align-items-center">
                <div>
                    <h2 style="font-weight: 700; color: #1D3142;">Manage Services</h2>
                    <p class="text-muted mb-0">
                        View and maintain all care services offered to clients.
                    </p>
                </div>
                <button class="btn"
                        style="background-color:#2C2C2C; color:white;"
                        data-bs-toggle="modal"
                        data-bs-target="#addServiceModal">
                    + Add Service
                </button>
            </div>
        </div>

        <!-- Services table -->
        <div class="row">
            <div class="col-12">
                <div class="table-responsive shadow-sm bg-white rounded-3 p-3">
                    <table class="table table-hover align-middle mb-0">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name (internal)</th>
                                <th>Title (display)</th>
                                <th>Price</th>
                                <th>Duration</th>
                                <th>Category</th>
                                <th style="width: 160px;">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%-- TODO LATER: replace these hard-coded rows with dynamic data from backend --%>
                            <tr>
                                <td>1</td>
                                <td>Personal Care Session (30 min)</td>
                                <td>Bathing, grooming, dressing support</td>
                                <td>$50.00</td>
                                <td>30 min</td>
                                <td>In-home Care</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-secondary me-1"
                                            data-bs-toggle="modal"
                                            data-bs-target="#editServiceModal">
                                        Edit
                                    </button>
                                    <button class="btn btn-sm btn-outline-danger">
                                        Delete
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Medical Appointment Transport</td>
                                <td>Clinic & hospital transport</td>
                                <td>$40.00</td>
                                <td>60 min</td>
                                <td>Transportation & Meal Delivery</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-secondary me-1"
                                            data-bs-toggle="modal"
                                            data-bs-target="#editServiceModal">
                                        Edit
                                    </button>
                                    <button class="btn btn-sm btn-outline-danger">
                                        Delete
                                    </button>
                                </td>
                            </tr>
                            <%-- Add more dummy rows if you want the table to look fuller --%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="../components/footer.html" %>

    <!-- Add Service Modal (frontend only for now) -->
    <div class="modal fade" id="addServiceModal" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered">
        <form class="modal-content">
          <%-- TODO LATER: add action and method when backend is ready --%>
          <div class="modal-header">
            <h5 class="modal-title">Add New Service</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"
                    aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="mb-3">
              <label class="form-label">Name (internal)</label>
              <input type="text" name="name" class="form-control" required>
            </div>
            <div class="mb-3">
              <label class="form-label">Title (displayed to clients)</label>
              <input type="text" name="title" class="form-control" required>
            </div>
            <div class="mb-3">
              <label class="form-label">Description</label>
              <textarea name="description" class="form-control" rows="4" required></textarea>
            </div>
            <div class="row">
              <div class="col-md-4 mb-3">
                <label class="form-label">Price (SGD)</label>
                <input type="number" step="0.01" name="price" class="form-control" required>
              </div>
              <div class="col-md-4 mb-3">
                <label class="form-label">Duration (minutes)</label>
                <input type="number" name="durationMinutes" class="form-control" required>
              </div>
              <div class="col-md-4 mb-3">
                <label class="form-label">Category</label>
                <select name="categoryId" class="form-select" required>
                  <%-- TODO LATER: populate from service_category table dynamically --%>
                  <option value="1">In-home Care</option>
                  <option value="2">Specialized Care</option>
                  <option value="3">Transportation & Meal Delivery</option>
                  <option value="4">Lifestyle Wellness Support</option>
                </select>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button"
                    class="btn btn-secondary"
                    data-bs-dismiss="modal">Cancel</button>
            <button type="submit"
                    class="btn"
                    style="background-color:#2C2C2C; color:white;">
              Save Service
            </button>
          </div>
        </form>
      </div>
    </div>

    <!-- Edit Service Modal (can reuse same form later with pre-filled values) -->
    <div class="modal fade" id="editServiceModal" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered">
        <form class="modal-content">
          <%-- TODO LATER: hook to backend update endpoint --%>
          <div class="modal-header">
            <h5 class="modal-title">Edit Service</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"
                    aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <%-- Same fields as Add Service, but pre-filled (we'll do dynamically later) --%>
            <div class="mb-3">
              <label class="form-label">Name (internal)</label>
              <input type="text" name="name" class="form-control" value="Personal Care Session (30 min)">
            </div>
            <div class="mb-3">
              <label class="form-label">Title (displayed to clients)</label>
              <input type="text" name="title" class="form-control" value="Bathing, grooming, dressing support">
            </div>
            <div class="mb-3">
              <label class="form-label">Description</label>
              <textarea name="description" class="form-control" rows="4">A caring professional provides focused support...</textarea>
            </div>
            <div class="row">
              <div class="col-md-4 mb-3">
                <label class="form-label">Price (SGD)</label>
                <input type="number" step="0.01" name="price" class="form-control" value="50.00">
              </div>
              <div class="col-md-4 mb-3">
                <label class="form-label">Duration (minutes)</label>
                <input type="number" name="durationMinutes" class="form-control" value="30">
              </div>
              <div class="col-md-4 mb-3">
                <label class="form-label">Category</label>
                <select name="categoryId" class="form-select">
                  <option value="1" selected>In-home Care</option>
                  <option value="2">Specialized Care</option>
                  <option value="3">Transportation & Meal Delivery</option>
                  <option value="4">Lifestyle Wellness Support</option>
                </select>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button"
                    class="btn btn-secondary"
                    data-bs-dismiss="modal">Cancel</button>
            <button type="submit"
                    class="btn"
                    style="background-color:#2C2C2C; color:white;">
              Save Changes
            </button>
          </div>
        </form>
      </div>
    </div>

</body>
</html>
