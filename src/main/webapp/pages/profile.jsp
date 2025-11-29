<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.UserManager" %>
<%@ page import="dto.UserUpdateDto" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../components/header-config.html" %>
<title>SilverCare | Profile</title>
</head>
<body>
    <jsp:include page="../components/sessionTimeout.jsp"></jsp:include>
    <jsp:include page="../components/navBar.jsp"></jsp:include>

    <%
        HttpSession currentSession = request.getSession(false);

        if (currentSession == null || currentSession.getAttribute("userId") == null) {
            // No user logged in – you could redirect to login if you want
            // response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
            return;
        }

        Integer sessionUserId = (Integer) currentSession.getAttribute("userId");
        UserUpdateDto currentUser = UserManager.getUserProfileInfo(sessionUserId);

        String username = currentUser.username();
        String displayName = currentUser.displayName();
        String email = currentUser.email();
        String roleName = (String) currentSession.getAttribute("roleName"); // may be null
    %>

    <div class="container mt-5 mb-5">
        <div class="row gx-5 justify-content-center">
            <!-- Left column: profile summary -->
            <div class="col-12 col-md-4 mb-4 mb-md-0">
                <div class="card p-4 shadow-sm">
                    <div class="d-flex flex-column align-items-center text-center">
                        <!-- Simple avatar circle -->
                        <div style="
                            width: 80px;
                            height: 80px;
                            border-radius: 50%;
                            background-color: #E0E0E0;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            font-size: 32px;
                            font-weight: 600;
                            color: #555;">
                            <%= (displayName != null && !displayName.isEmpty())
                                    ? displayName.substring(0,1).toUpperCase()
                                    : "U" %>
                        </div>
                        <h5 class="mt-3 mb-1"><%= displayName %></h5>
                        <p class="text-muted mb-2">@<%= username %></p>
                        <p class="text-muted mb-1">
                            <i class="bi bi-envelope-at-fill"></i>&ensp;<%= email %>
                        </p>
                        <p class="text-muted mb-0" style="font-size: 14px;">
                            <i class="bi bi-person-badge-fill"></i>&ensp;
                            <%= (roleName != null && roleName.equalsIgnoreCase("admin"))
                                    ? "Administrator"
                                    : "Client" %>
                        </p>
                    </div>
                    <hr class="my-4">
                    <p class="text-muted mb-1" style="font-size: 14px;">
                        From this page, you can update your personal details and review your bookings.
                    </p>
                    <p class="text-muted mb-0" style="font-size: 13px;">
                        Keeping your information up to date helps us personalise your care and contact you when needed.
                    </p>
                </div>
            </div>

            <!-- Right column: forms (update profile + change password + logout) -->
            <div class="col-12 col-md-6">
                <div class="card p-4 shadow-sm">
                    <!-- Update Profile (TOP) -->
                    <form action="<%= request.getContextPath() %>/update-user-profile" method="post">
                        <h5 class="mb-3">
                            <i class="bi bi-info-circle-fill"></i>&ensp;Update Profile
                        </h5>

                        <div class="mb-3">
                            <label class="form-label">
                                <i class="bi bi-person-circle"></i>&ensp;Username
                            </label>
                            <input type="text"
                                   class="form-control update-profile-input-field"
                                   name="username"
                                   value="<%= username %>"
                                   required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">
                                <i class="bi bi-person-badge"></i>&ensp;Display Name
                            </label>
                            <input type="text"
                                   class="form-control update-profile-input-field"
                                   name="displayName"
                                   value="<%= displayName %>"
                                   required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">
                                <i class="bi bi-envelope-at-fill"></i>&ensp;Email
                            </label>
                            <input type="email"
                                   class="form-control update-profile-input-field"
                                   name="email"
                                   value="<%= email %>"
                                   required>
                        </div>

                        <div class="d-flex gap-2 mb-4">
                            <button type="submit"
                                    id="update-profile-button"
                                    class="btn btn-primary w-50"
                                    disabled>
                                Update Profile
                            </button>
                        </div>
                    </form>

                    <hr class="my-4">

                    <!-- Change Password (BOTTOM) -->
                    <form action="<%= request.getContextPath() %>/update-password" method="post">
                        <%-- TODO backend: create /update-password servlet to handle this --%>
                        <h5 class="mb-3">
                            <i class="bi bi-shield-lock-fill"></i>&ensp;Change Password
                        </h5>

                        <div class="mb-3">
                            <label class="form-label">Current Password</label>
                            <input type="password"
                                   class="form-control update-password-input-field"
                                   name="currentPassword"
                                   placeholder="Enter your current password"
                                   required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">New Password</label>
                            <input type="password"
                                   class="form-control update-password-input-field"
                                   name="newPassword"
                                   placeholder="Enter a new password"
                                   required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Confirm New Password</label>
                            <input type="password"
                                   class="form-control update-password-input-field"
                                   name="confirmPassword"
                                   placeholder="Re-enter new password"
                                   required>
                        </div>

                        <div class="d-flex gap-2 mb-4">
                            <button type="submit"
                                    id="update-password-button"
                                    class="btn btn-outline-primary w-50"
                                    disabled>
                                Update Password
                            </button>
                        </div>
                    </form>

                    <hr class="my-3">

                    <!-- Logout -->
                    <form action="<%= request.getContextPath() %>/logout" method="post">
                        <button type="submit" class="btn btn-danger w-50">
                            <i class="bi bi-box-arrow-left"></i>&ensp;Logout
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <!-- My Bookings section (unchanged, still dummy for now) -->
        <div class="row justify-content-center mt-5">
            <div class="col-12 col-md-10">
                <div class="card p-4 shadow-sm">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h5 class="mb-0">
                            <i class="bi bi-calendar-check-fill"></i>&ensp;My Bookings
                        </h5>
                        <div class="btn-group btn-group-sm" role="group">
                            <button type="button" class="btn btn-outline-secondary active">Upcoming</button>
                            <button type="button" class="btn btn-outline-secondary">Past</button>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Service</th>
                                    <th>Category</th>
                                    <th>Date &amp; Time</th>
                                    <th>Status</th>
                                    <th>Total (SGD)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>Personal Care Session (1 hour)</td>
                                    <td>In-home Care</td>
                                    <td>12 Dec 2025, 10:00 AM</td>
                                    <td><span class="badge bg-success">Confirmed</span></td>
                                    <td>$90.00</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Medical Appointment Transport</td>
                                    <td>Transportation &amp; Meal Delivery</td>
                                    <td>15 Dec 2025, 2:30 PM</td>
                                    <td><span class="badge bg-warning text-dark">Pending</span></td>
                                    <td>$40.00</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>Home Exercise &amp; Mobility Session</td>
                                    <td>Lifestyle Wellness Support</td>
                                    <td>20 Dec 2025, 5:00 PM</td>
                                    <td><span class="badge bg-secondary">Completed</span></td>
                                    <td>$60.00</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <p class="text-muted mt-3 mb-0" style="font-size: 13px;">
                        These are sample entries for layout preview. Once booking features are implemented,
                        this section will automatically show your real bookings.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="../components/footer.html" %>

    <script>
        // Enable "Update Profile" button when profile fields change
        const profileInputs = document.querySelectorAll(".update-profile-input-field");
        const updateProfileBtn = document.getElementById("update-profile-button");
        profileInputs.forEach(input => {
            input.addEventListener("input", () => {
                updateProfileBtn.disabled = false;
            });
        });

        // Enable "Update Password" button when any password fields change
        const passwordInputs = document.querySelectorAll(".update-password-input-field");
        const updatePasswordBtn = document.getElementById("update-password-button");
        passwordInputs.forEach(input => {
            input.addEventListener("input", () => {
                updatePasswordBtn.disabled = false;
            });
        });
    </script>
</body>
</html>

