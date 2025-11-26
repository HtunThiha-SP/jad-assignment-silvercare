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
    <title>SilverCare | Manage Users</title>
</head>
<body style="background-color: #F5F5F5;">

    <%-- TODO LATER: add session / role check here when backend is ready --%>

    <jsp:include page="../components/navBar.jsp"></jsp:include>

    <div class="container mt-5 mb-5">
        <!-- Header -->
        <div class="row mb-4">
            <div class="col-12 d-flex justify-content-between align-items-center">
                <div>
                    <h2 style="font-weight: 700; color: #1D3142;">Manage Users</h2>
                    <p class="text-muted mb-0">
                        View and maintain registered client accounts.
                    </p>
                </div>
                <button class="btn"
                        style="background-color:#2C2C2C; color:white;"
                        data-bs-toggle="modal"
                        data-bs-target="#addUserModal">
                    + Add User
                </button>
            </div>
        </div>

        <!-- Users table -->
        <div class="row">
            <div class="col-12">
                <div class="table-responsive shadow-sm bg-white rounded-3 p-3">
                    <table class="table table-hover align-middle mb-0">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Username</th>
                                <th>Display Name</th>
                                <th>Email</th>
                                <th>Role</th>
                                <th style="width: 180px;">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%-- TODO LATER: replace dummy rows with dynamic user list from backend --%>
                            <tr>
                                <td>1</td>
                                <td>steve-helloworld</td>
                                <td>Steve</td>
                                <td>helloworld.steve@gmail.com</td>
                                <td>User</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-secondary me-1"
                                            data-bs-toggle="modal"
                                            data-bs-target="#editUserModal">
                                        Edit
                                    </button>
                                    <button class="btn btn-sm btn-outline-danger">
                                        Delete
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>java-lecturer</td>
                                <td>Java Lecturer</td>
                                <td>java.lec@gmail.com</td>
                                <td>Admin</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-secondary me-1"
                                            data-bs-toggle="modal"
                                            data-bs-target="#editUserModal">
                                        Edit
                                    </button>
                                    <button class="btn btn-sm btn-outline-danger" disabled
                                            title="Example: prevent deleting main admin">
                                        Delete
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>hollowknight0000</td>
                                <td>Hollow Knight</td>
                                <td>hollowknight@tc.com</td>
                                <td>User</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-secondary me-1"
                                            data-bs-toggle="modal"
                                            data-bs-target="#editUserModal">
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

    <!-- Add User Modal (frontend only for now) -->
    <div class="modal fade" id="addUserModal" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <form class="modal-content">
          <%-- TODO LATER: set action and method to admin user-create servlet --%>
          <div class="modal-header">
            <h5 class="modal-title">Add New User</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"
                    aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="mb-3">
              <label class="form-label">Username</label>
              <input type="text" name="username" class="form-control" required>
              <div class="form-text">
                8–32 characters, letters, numbers, and hyphens only.
              </div>
            </div>
            <div class="mb-3">
              <label class="form-label">Display Name</label>
              <input type="text" name="displayName" class="form-control">
            </div>
            <div class="mb-3">
              <label class="form-label">Email</label>
              <input type="email" name="email" class="form-control" required>
            </div>
            <div class="mb-3">
              <label class="form-label">Password</label>
              <input type="password" name="password" class="form-control" required>
            </div>
            <div class="mb-3">
              <label class="form-label">Role</label>
              <select name="roleId" class="form-select">
                <%-- Later we’ll map 1=user, 2=admin --%>
                <option value="1" selected>User</option>
                <option value="2">Admin</option>
              </select>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button"
                    class="btn btn-secondary"
                    data-bs-dismiss="modal">Cancel</button>
            <button type="submit"
                    class="btn"
                    style="background-color:#2C2C2C; color:white;">
              Save User
            </button>
          </div>
        </form>
      </div>
    </div>

    <!-- Edit User Modal (frontend only for now) -->
    <div class="modal fade" id="editUserModal" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <form class="modal-content">
          <%-- TODO LATER: set action/method, and pre-fill fields dynamically for the selected user --%>
          <div class="modal-header">
            <h5 class="modal-title">Edit User</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"
                    aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <%-- Example pre-filled values just for UI preview --%>
            <div class="mb-3">
              <label class="form-label">Username</label>
              <input type="text" name="username" class="form-control"
                     value="steve-helloworld">
            </div>
            <div class="mb-3">
              <label class="form-label">Display Name</label>
              <input type="text" name="displayName" class="form-control"
                     value="Steve">
            </div>
            <div class="mb-3">
              <label class="form-label">Email</label>
              <input type="email" name="email" class="form-control"
                     value="helloworld.steve@gmail.com">
            </div>
            <div class="mb-3">
              <label class="form-label">Role</label>
              <select name="roleId" class="form-select">
                <option value="1">User</option>
                <option value="2" selected>Admin</option>
              </select>
            </div>
            <div class="mb-3">
              <label class="form-label">Reset Password (optional)</label>
              <input type="password" name="newPassword" class="form-control"
                     placeholder="Leave blank to keep current password">
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
