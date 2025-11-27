<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="../components/header-config.html" %>
    <title>SilverCare | Inbox</title>
</head>
<body style="background-color:#0D1117;">
    <jsp:include page="../components/sessionTimeout.jsp"></jsp:include>
    <jsp:include page="../components/navBar.jsp"></jsp:include>

    <%
        HttpSession currentSession = request.getSession(false);
        if (currentSession == null || currentSession.getAttribute("userId") == null) {
            // not logged in – send to login (or index, up to you)
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
            return;
        }
        String displayName = (String) currentSession.getAttribute("displayName");
    %>

    <div class="container-fluid mt-4 mb-5">
        <div class="row justify-content-center">
            <div class="col-11 col-lg-10">
                <!-- Header bar similar to GitHub notifications -->
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="mb-0 text-light">Notifications</h4>
                    <button class="btn btn-sm btn-outline-light">
                        Mark all as read
                    </button>
                </div>

                <div class="row">
                    <!-- Left: filters -->
                    <div class="col-12 col-md-3 mb-4 mb-md-0">
                        <div class="card border-0" style="background-color:#161B22; color:#C9D1D9;">
                            <div class="card-body">
                                <h6 class="card-title text-uppercase" style="font-size:12px; letter-spacing: .08em;">
                                    Filters
                                </h6>
                                <div class="list-group list-group-flush mt-2">
                                    <button type="button"
                                            class="list-group-item list-group-item-action active"
                                            style="background-color:#21262D; border-color:#30363D; color:#F0F6FC;">
                                        <i class="bi bi-inbox-fill me-2"></i>All
                                    </button>
                                    <button type="button"
                                            class="list-group-item list-group-item-action"
                                            style="background-color:#161B22; border-color:#30363D; color:#C9D1D9;">
                                        <i class="bi bi-envelope-open me-2"></i>Unread
                                    </button>
                                    <button type="button"
                                            class="list-group-item list-group-item-action"
                                            style="background-color:#161B22; border-color:#30363D; color:#C9D1D9;">
                                        <i class="bi bi-check2-all me-2"></i>Read
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Right: notification list -->
                    <div class="col-12 col-md-9">
                        <div class="card border-0" style="background-color:#161B22; color:#C9D1D9;">
                            <div class="card-body p-0">

                                <!-- One notification item -->
                                <a href="#" class="text-decoration-none">
                                    <div class="d-flex align-items-start p-3 border-bottom"
                                         style="border-color:#30363D; background-color:#1C2128;">
                                        <div class="form-check me-3 mt-1">
                                            <input class="form-check-input" type="checkbox">
                                        </div>
                                        <div class="me-2 mt-1">
                                            <!-- unread dot -->
                                            <span class="badge rounded-pill"
                                                  style="background-color:#2F81F7; width:10px; height:10px; padding:0;"></span>
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="d-flex justify-content-between">
                                                <div>
                                                    <span class="text-light fw-semibold">
                                                        Booking confirmed: Personal Care Session (1 hour)
                                                    </span>
                                                    <div style="font-size:13px;" class="text-muted">
                                                        Your upcoming In-home Care appointment has been confirmed.
                                                    </div>
                                                    <div style="font-size:12px;" class="text-muted mt-1">
                                                        <span class="badge rounded-pill bg-success me-2">Booking</span>
                                                        12 Dec 2025, 10:00 AM · SilverCare
                                                    </div>
                                                </div>
                                                <small class="text-muted">2h ago</small>
                                            </div>
                                        </div>
                                    </div>
                                </a>

                                <!-- Another notification -->
                                <a href="#" class="text-decoration-none">
                                    <div class="d-flex align-items-start p-3 border-bottom"
                                         style="border-color:#30363D;">
                                        <div class="form-check me-3 mt-1">
                                            <input class="form-check-input" type="checkbox">
                                        </div>
                                        <div class="me-2 mt-1">
                                            <!-- read = hollow circle -->
                                            <span class="badge rounded-pill"
                                                  style="border:1px solid #484F58; width:10px; height:10px; padding:0; background-color:transparent;"></span>
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="d-flex justify-content-between">
                                                <div>
                                                    <span class="text-light fw-semibold">
                                                        Appointment reminder: Medical Transport
                                                    </span>
                                                    <div style="font-size:13px;" class="text-muted">
                                                        Reminder: your transport service is scheduled for tomorrow at 2:30 PM.
                                                    </div>
                                                    <div style="font-size:12px;" class="text-muted mt-1">
                                                        <span class="badge rounded-pill bg-warning text-dark me-2">Reminder</span>
                                                        15 Dec 2025, 2:30 PM · Transportation &amp; Meal Delivery
                                                    </div>
                                                </div>
                                                <small class="text-muted">1 day ago</small>
                                            </div>
                                        </div>
                                    </div>
                                </a>

                                <!-- Another notification -->
                                <a href="#" class="text-decoration-none">
                                    <div class="d-flex align-items-start p-3 border-bottom"
                                         style="border-color:#30363D;">
                                        <div class="form-check me-3 mt-1">
                                            <input class="form-check-input" type="checkbox">
                                        </div>
                                        <div class="me-2 mt-1">
                                            <span class="badge rounded-pill"
                                                  style="border:1px solid #484F58; width:10px; height:10px; padding:0; background-color:transparent;"></span>
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="d-flex justify-content-between">
                                                <div>
                                                    <span class="text-light fw-semibold">
                                                        Profile updated successfully
                                                    </span>
                                                    <div style="font-size:13px;" class="text-muted">
                                                        Your profile details were updated. If this wasn't you, please contact support.
                                                    </div>
                                                    <div style="font-size:12px;" class="text-muted mt-1">
                                                        <span class="badge rounded-pill bg-info text-dark me-2">Account</span>
                                                        Just now · <%= displayName != null ? displayName : "You" %>
                                                    </div>
                                                </div>
                                                <small class="text-muted">3 days ago</small>
                                            </div>
                                        </div>
                                    </div>
                                </a>

                                <!-- Another notification -->
                                <a href="#" class="text-decoration-none">
                                    <div class="d-flex align-items-start p-3"
                                         style="border-color:#30363D;">
                                        <div class="form-check me-3 mt-1">
                                            <input class="form-check-input" type="checkbox">
                                        </div>
                                        <div class="me-2 mt-1">
                                            <span class="badge rounded-pill"
                                                  style="border:1px solid #484F58; width:10px; height:10px; padding:0; background-color:transparent;"></span>
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="d-flex justify-content-between">
                                                <div>
                                                    <span class="text-light fw-semibold">
                                                        New article: Staying active with Lifestyle Wellness Support
                                                    </span>
                                                    <div style="font-size:13px;" class="text-muted">
                                                        Check out our latest tips on gentle home exercises and community activities.
                                                    </div>
                                                    <div style="font-size:12px;" class="text-muted mt-1">
                                                        <span class="badge rounded-pill bg-secondary me-2">News</span>
                                                        SilverCare Updates
                                                    </div>
                                                </div>
                                                <small class="text-muted">1 week ago</small>
                                            </div>
                                        </div>
                                    </div>
                                </a>

                            </div>
                        </div>
                    </div>
                </div> <!-- row -->
            </div>
        </div>
    </div>

    <%@ include file="../components/footer.html" %>
</body>
</html>
