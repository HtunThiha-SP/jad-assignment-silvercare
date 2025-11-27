<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../components/header-config.html" %>
<title>SilverCare | Service Reviews</title>

<style>
    body {
        background-color: #F5F5F5;
    }

    .review-hero {
        background: linear-gradient(120deg, #1D3142, #2C5364);
        color: #F9FAFB;
        border-radius: 24px;
        padding: 28px 24px;
    }

    .rating-number {
        font-size: 40px;
        font-weight: 700;
    }

    .star {
        font-size: 20px;
        cursor: pointer;
        color: #D1D5DB;
        transition: color 0.2s ease;
    }

    .star.active {
        color: #FACC15; /* yellow */
    }

    .review-card {
        border-radius: 18px;
        border: none;
        background-color: #FFFFFF;
        box-shadow: 0 6px 20px rgba(15,23,42,0.08);
    }

    .review-avatar {
        width: 40px;
        height: 40px;
        border-radius: 999px;
        background-color: #E5E7EB;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 600;
        color: #4B5563;
    }

    .badge-service {
        font-size: 11px;
        border-radius: 999px;
        background-color: #EEF2FF;
        color: #4338CA;
        padding: 2px 10px;
    }
</style>
</head>
<body>
    <jsp:include page="../components/navBar.jsp"></jsp:include>

    <%
        String categoryName = request.getParameter("name");
        if (categoryName == null || categoryName.isBlank()) {
            categoryName = "In-home Care";
        }

        // Weak mapping: pick a "main" example service name based on category
        String exampleService = "Personal Care Session (1 hour)";
        if ("Specialized Care".equalsIgnoreCase(categoryName)) {
            exampleService = "Dementia Care Support Session (1 hour)";
        } else if ("Transportation & Meal Delivery".equalsIgnoreCase(categoryName)) {
            exampleService = "Medical Appointment Transport";
        } else if ("Lifestyle Wellness Support".equalsIgnoreCase(categoryName)) {
            exampleService = "Home Exercise & Mobility Session (45 min)";
        }

        HttpSession currentSession = request.getSession(false);
        String displayName = (currentSession != null)
                ? (String) currentSession.getAttribute("displayName")
                : null;
        if (displayName == null || displayName.isBlank()) {
            displayName = "Guest";
        }
    %>

    <div class="container mt-5 mb-5">
        <!-- Hero / header -->
        <div class="row justify-content-center mb-4">
            <div class="col-12 col-lg-10">
                <div class="review-hero">
                    <div class="row align-items-center">
                        <div class="col-md-8">
                            <p class="mb-1 text-uppercase"
                               style="font-size: 12px; letter-spacing:.14em; font-weight:600;">
                                Reviews
                            </p>
                            <h3 class="mb-1" style="font-weight:700;">
                                <%= categoryName %>
                            </h3>
                            <p class="mb-0" style="max-width:520px;">
                                See what clients say about our <%= categoryName %> services and share
                                your own experience to help others make informed choices.
                            </p>
                        </div>
                        <div class="col-md-4 mt-4 mt-md-0">
                            <div class="card border-0" style="border-radius:18px; background:rgba(15,23,42,0.8); color:#F9FAFB;">
                                <div class="card-body text-center">
                                    <div class="rating-number">4.8</div>
                                    <div class="mb-1">
                                        <i class="bi bi-star-fill text-warning"></i>
                                        <i class="bi bi-star-fill text-warning"></i>
                                        <i class="bi bi-star-fill text-warning"></i>
                                        <i class="bi bi-star-fill text-warning"></i>
                                        <i class="bi bi-star-half text-warning"></i>
                                    </div>
                                    <small class="text-muted">Based on 24 reviews</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Review form + existing reviews -->
        <div class="row justify-content-center g-4">
            <div class="col-12 col-lg-10">
                <div class="row g-4">
                    <!-- Left: Review form -->
                    <div class="col-md-5">
                        <div class="card review-card mb-3">
                            <div class="card-body">
                                <h5 class="mb-3">
                                    <i class="bi bi-pencil-square"></i>&ensp;Write a Review
                                </h5>

                                <form>
                                    <!-- rating stars -->
                                    <div class="mb-3">
                                        <label class="form-label">Overall rating</label>
                                        <div id="starRating">
                                            <i class="bi bi-star-fill star" data-value="1"></i>
                                            <i class="bi bi-star-fill star" data-value="2"></i>
                                            <i class="bi bi-star-fill star" data-value="3"></i>
                                            <i class="bi bi-star-fill star" data-value="4"></i>
                                            <i class="bi bi-star-fill star" data-value="5"></i>
                                            <input type="hidden" name="rating" id="ratingInput" value="0">
                                        </div>
                                        <small id="ratingLabel" class="text-muted" style="font-size: 12px;">
                                            Tap a star to select your rating.
                                        </small>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Service</label>
                                        <select class="form-select" name="serviceName">
                                            <!-- Hardcoded options for demo -->
                                            <% if ("In-home Care".equalsIgnoreCase(categoryName)) { %>
                                                <option>Personal Care Session (30 min)</option>
                                                <option selected><%= exampleService %></option>
                                                <option>Home Assistance Session (1 hour)</option>
                                            <% } else if ("Specialized Care".equalsIgnoreCase(categoryName)) { %>
                                                <option selected><%= exampleService %></option>
                                                <option>Post-Surgery Recovery Session (2 hours)</option>
                                                <option>Chronic Illness Support Session (1 hour)</option>
                                            <% } else if ("Transportation & Meal Delivery".equalsIgnoreCase(categoryName)) { %>
                                                <option selected><%= exampleService %></option>
                                                <option>Grocery Shopping Transport</option>
                                                <option>Meal Delivery Drop-Off</option>
                                            <% } else { %>
                                                <option selected><%= exampleService %></option>
                                                <option>Home Exercise & Mobility Session (45 min)</option>
                                                <option>Community Outing Support Session (2 hours)</option>
                                            <% } %>
                                        </select>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Your review</label>
                                        <textarea class="form-control" name="comment" rows="4"
                                                  placeholder="Share how this service helped you or your loved one."></textarea>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Name (optional)</label>
                                        <input type="text" class="form-control"
                                               name="reviewerName"
                                               value="<%= displayName %>">
                                    </div>

                                    <button type="submit" class="btn btn-primary w-100" disabled>
                                        Submit Review (UI only)
                                    </button>
                                    <small class="text-muted d-block mt-2" style="font-size: 11px;">
                                        This is a demo interface for the assignment. Reviews are not stored yet.
                                    </small>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Right: Previous reviews -->
                    <div class="col-md-7">
                        <div class="mb-3 d-flex justify-content-between align-items-center">
                            <h5 class="mb-0">
                                <i class="bi bi-chat-left-quote-fill"></i>&ensp;What clients are saying
                            </h5>
                            <span class="text-muted" style="font-size: 13px;">Showing recent reviews</span>
                        </div>

                        <!-- Review 1 -->
                        <div class="card review-card mb-3">
                            <div class="card-body">
                                <div class="d-flex mb-2">
                                    <div class="review-avatar me-3">A</div>
                                    <div class="flex-grow-1">
                                        <div class="d-flex justify-content-between">
                                            <div>
                                                <strong>Amelia Tan</strong>
                                                <span class="badge-service ms-2">
                                                    <%= exampleService %>
                                                </span>
                                            </div>
                                            <small class="text-muted">2 weeks ago</small>
                                        </div>
                                        <div class="mt-1" style="font-size: 13px;">
                                            <i class="bi bi-star-fill text-warning"></i>
                                            <i class="bi bi-star-fill text-warning"></i>
                                            <i class="bi bi-star-fill text-warning"></i>
                                            <i class="bi bi-star-fill text-warning"></i>
                                            <i class="bi bi-star-fill text-warning"></i>
                                        </div>
                                    </div>
                                </div>
                                <p class="mb-0" style="font-size: 14px;">
                                    Our caregiver was patient and very gentle with my mum. The one-hour session
                                    was just right, and they also took time to explain what they were doing.
                                    It gave our family a lot of reassurance.
                                </p>
                            </div>
                        </div>

                        <!-- Review 2 -->
                        <div class="card review-card mb-3">
                            <div class="card-body">
                                <div class="d-flex mb-2">
                                    <div class="review-avatar me-3">J</div>
                                    <div class="flex-grow-1">
                                        <div class="d-flex justify-content-between">
                                            <div>
                                                <strong>John Lim</strong>
                                                <span class="badge-service ms-2">
                                                    Home Assistance Session (1 hour)
                                                </span>
                                            </div>
                                            <small class="text-muted">1 month ago</small>
                                        </div>
                                        <div class="mt-1" style="font-size: 13px;">
                                            <i class="bi bi-star-fill text-warning"></i>
                                            <i class="bi bi-star-fill text-warning"></i>
                                            <i class="bi bi-star-fill text-warning"></i>
                                            <i class="bi bi-star-fill text-warning"></i>
                                            <i class="bi bi-star text-warning"></i>
                                        </div>
                                    </div>
                                </div>
                                <p class="mb-0" style="font-size: 14px;">
                                    The home visit helped my dad keep his place tidy and safe. Booking was easy
                                    and the caregiver arrived on time. Would be great if weekend slots were available too.
                                </p>
                            </div>
                        </div>

                        <!-- Review 3 -->
                        <div class="card review-card">
                            <div class="card-body">
                                <div class="d-flex mb-2">
                                    <div class="review-avatar me-3">S</div>
                                    <div class="flex-grow-1">
                                        <div class="d-flex justify-content-between">
                                            <div>
                                                <strong>Sarah Koh</strong>
                                                <span class="badge-service ms-2">
                                                    Medication Reminder Visit (30 min)
                                                </span>
                                            </div>
                                            <small class="text-muted">2 months ago</small>
                                        </div>
                                        <div class="mt-1" style="font-size: 13px;">
                                            <i class="bi bi-star-fill text-warning"></i>
                                            <i class="bi bi-star-fill text-warning"></i>
                                            <i class="bi bi-star-fill text-warning"></i>
                                            <i class="bi bi-star-fill text-warning"></i>
                                            <i class="bi bi-star-half text-warning"></i>
                                        </div>
                                    </div>
                                </div>
                                <p class="mb-0" style="font-size: 14px;">
                                    Helpful for keeping track of my grandfather's medications. The short check-in
                                    makes sure he doesn't miss his doses, especially on days we are working late.
                                </p>
                            </div>
                        </div>

                    </div> <!-- /col-md-7 -->
                </div>
            </div>
        </div>
    </div>

    <%@ include file="../components/footer.html" %>

    <script>
        // Simple star rating UI (front-end only)
        const stars = document.querySelectorAll("#starRating .star");
        const ratingInput = document.getElementById("ratingInput");
        const ratingLabel = document.getElementById("ratingLabel");

        stars.forEach(star => {
            star.addEventListener("click", () => {
                const value = parseInt(star.getAttribute("data-value"));
                ratingInput.value = value;

                stars.forEach(s => {
                    const sVal = parseInt(s.getAttribute("data-value"));
                    if (sVal <= value) {
                        s.classList.add("active");
                    } else {
                        s.classList.remove("active");
                    }
                });

                const labels = ["Very poor", "Poor", "Okay", "Good", "Excellent"];
                ratingLabel.textContent = "You selected: " + labels[value - 1] + " (" + value + " / 5)";
            });
        });
    </script>
</body>
</html>
