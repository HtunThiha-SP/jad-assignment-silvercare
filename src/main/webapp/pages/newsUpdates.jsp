<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="../components/header-config.html" %>
    <title>SilverCare | News & Updates</title>

    <style>
        /* Page background + section spacing */
        body {
            background-color: #F5F5F5;
        }

        .news-hero {
            background: linear-gradient(120deg, #1D3142, #2C5364);
            color: #F7FAFC;
            border-radius: 24px;
            padding: 32px 28px;
        }

        .news-tag {
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: .12em;
            font-weight: 600;
        }

        .news-card {
            border-radius: 16px;
            border: none;
            background-color: #FFFFFF;
            box-shadow: 0 8px 24px rgba(15, 23, 42, 0.08);
            overflow: hidden;
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .news-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 16px 40px rgba(15, 23, 42, 0.12);
        }

        .news-card-header {
            font-size: 12px;
            color: #6B7280;
        }

        .news-pill {
            border-radius: 999px;
            padding: 2px 10px;
            font-size: 11px;
            font-weight: 600;
        }

        .pill-announcement {
            background-color: #EFF6FF;
            color: #1D4ED8;
        }

        .pill-health {
            background-color: #ECFDF5;
            color: #15803D;
        }

        .pill-event {
            background-color: #FEF3C7;
            color: #92400E;
        }

        /* Fade-in animation on scroll */
        .fade-in-up {
            opacity: 0;
            transform: translateY(18px);
            transition: opacity 0.5s ease-out, transform 0.5s ease-out;
        }

        .fade-in-up.show {
            opacity: 1;
            transform: translateY(0);
        }

        /* Filter buttons */
        .filter-btn {
            border-radius: 999px;
            padding: 6px 16px;
            font-size: 13px;
            border: 1px solid #D1D5DB;
            background-color: #FFFFFF;
            color: #374151;
            transition: all 0.2s ease;
        }

        .filter-btn.active,
        .filter-btn:hover {
            background-color: #111827;
            color: #FFFFFF;
            border-color: #111827;
        }

        .news-stat-card {
            border-radius: 18px;
            border: none;
            background-color: #111827;
            color: #F9FAFB;
        }
    </style>
</head>
<body>
    <jsp:include page="../components/navBar.jsp"></jsp:include>

    <div class="container mt-5 mb-5">

        <!-- HERO / INTRO -->
        <div class="row justify-content-center mb-4">
            <div class="col-12 col-lg-10">
                <div class="news-hero fade-in-up">
                    <div class="row align-items-center">
                        <div class="col-md-8">
                            <div class="news-tag mb-2">News &amp; Updates</div>
                            <h2 class="mb-2" style="font-weight: 700;">
                                Stay informed about SilverCare and your well-being.
                            </h2>
                            <p class="mb-0" style="max-width: 520px;">
                                Read the latest service announcements, health tips, and community
                                activities carefully curated for our clients and their families.
                            </p>
                        </div>
                        <div class="col-md-4 mt-4 mt-md-0">
                            
<div class="card border-0 shadow-sm" 
     style="border-radius:20px; background:rgba(255,255,255,0.1); backdrop-filter:blur(10px); color:#F8FAFC;">
    <div class="card-body px-4 py-3">

        <p class="mb-3 text-uppercase"
           style="font-size:13px; letter-spacing:.15em; font-weight:600; opacity:0.85;">
            This Month at a Glance
        </p>

        <div class="row text-center g-3">

            <!-- Stat 1 -->
            <div class="col-4">
                <div class="p-3 rounded-4 h-100"
                     style="background:rgba(255,255,255,0.06); transition:0.25s;">
                    <i class="bi bi-newspaper" style="font-size:22px; opacity:0.85;"></i>
                    <h4 class="mt-2 mb-0" style="font-weight:700;">8</h4>
                    <small class="opacity-75">New Articles</small>
                </div>
            </div>

            <!-- Stat 2 -->
            <div class="col-4">
                <div class="p-3 rounded-4 h-100"
                     style="background:rgba(255,255,255,0.06); transition:0.25s;">
                    <i class="bi bi-calendar-event" style="font-size:22px; opacity:0.85;"></i>
                    <h4 class="mt-2 mb-0" style="font-weight:700;">3</h4>
                    <small class="opacity-75">Upcoming Events</small>
                </div>
            </div>

            <!-- Stat 3 -->
            <div class="col-4">
                <div class="p-3 rounded-4 h-100"
                     style="background:rgba(255,255,255,0.06); transition:0.25s;">
                    <i class="bi bi-hand-thumbs-up" style="font-size:22px; opacity:0.85;"></i>
                    <h4 class="mt-2 mb-0" style="font-weight:700;">92%</h4>
                    <small class="opacity-75">Satisfaction</small>
                </div>
            </div>

        </div>
    </div>
</div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- FILTER BAR -->
        <div class="row justify-content-center mb-3">
            <div class="col-12 col-lg-10 d-flex flex-wrap align-items-center justify-content-between">
                <div class="mb-2">
                    <strong style="font-size: 14px;">Filter by category</strong>
                </div>
                <div class="d-flex flex-wrap gap-2">
                    <button class="filter-btn active" data-filter="all">All</button>
                    <button class="filter-btn" data-filter="announcement">Announcements</button>
                    <button class="filter-btn" data-filter="health">Health Tips</button>
                    <button class="filter-btn" data-filter="event">Events</button>
                </div>
            </div>
        </div>

        <!-- NEWS GRID -->
        <div class="row justify-content-center g-4">
            <div class="col-12 col-lg-10">

                <!-- CARD 1: Announcement -->
                <div class="card news-card mb-3 fade-in-up news-item" data-category="announcement">
                    <div class="card-body">
                        <div class="d-flex justify-content-between news-card-header mb-1">
                            <span>Published • 5 Nov 2025</span>
                            <span>SilverCare HQ</span>
                        </div>
                        <div class="d-flex align-items-center mb-2">
                            <span class="news-pill pill-announcement me-2">Announcement</span>
                            <span style="font-size: 12px; color:#6B7280;">
                                New specialised dementia care packages
                            </span>
                        </div>
                        <h5 class="card-title mb-2">Introducing Enhanced Dementia Care Support</h5>
                        <p class="card-text mb-2" style="font-size: 14px;">
                            We have expanded our specialised care offerings for clients living with dementia.
                            The new packages include longer support sessions, personalised activity plans,
                            and enhanced caregiver training to support both clients and families at home.
                        </p>
                        <p class="card-text mb-0" style="font-size: 13px; color:#6B7280;">
                            Starting from <strong>1 December 2025</strong>, existing clients can speak to
                            our Care Coordinator to upgrade their plans at no additional consultation cost.
                        </p>
                    </div>
                </div>

                <!-- CARD 2: Health Tip -->
                <div class="card news-card mb-3 fade-in-up news-item" data-category="health">
                    <div class="card-body">
                        <div class="d-flex justify-content-between news-card-header mb-1">
                            <span>Health Tips • 1 Nov 2025</span>
                            <span>SilverCare Wellness Team</span>
                        </div>
                        <div class="d-flex align-items-center mb-2">
                            <span class="news-pill pill-health me-2">Health Tip</span>
                            <span style="font-size: 12px; color:#6B7280;">
                                Gentle movement for better balance
                            </span>
                        </div>
                        <h5 class="card-title mb-2">5 Simple Home Exercises to Prevent Falls</h5>
                        <p class="card-text mb-2" style="font-size: 14px;">
                            Falls are one of the most common causes of injury in older adults, but many can be prevented
                            with regular light exercise. Start with supported heel raises, seated leg extensions,
                            and short guided walks around the home or corridor.
                        </p>
                        <p class="card-text mb-0" style="font-size: 13px; color:#6B7280;">
                            Our Lifestyle Wellness Support services include customised exercise sessions guided by
                            trained caregivers. Speak to us if you would like a tailored programme for your loved one.
                        </p>
                    </div>
                </div>

                <!-- CARD 3: Event -->
                <div class="card news-card mb-3 fade-in-up news-item" data-category="event">
                    <div class="card-body">
                        <div class="d-flex justify-content-between news-card-header mb-1">
                            <span>Community Event • 26 Oct 2025</span>
                            <span>SilverCare Community</span>
                        </div>
                        <div class="d-flex align-items-center mb-2">
                            <span class="news-pill pill-event me-2">Event</span>
                            <span style="font-size: 12px; color:#6B7280;">
                                In-person caregiver workshop
                            </span>
                        </div>
                        <h5 class="card-title mb-2">Caregiver Evening: Supporting Independence at Home</h5>
                        <p class="card-text mb-2" style="font-size: 14px;">
                            Join our free in-person session where our care team shares practical tips on
                            safe transfers, medication reminders, and setting up a fall-safe home environment.
                            The session includes a short Q&amp;A with our senior care coordinator.
                        </p>
                        <p class="card-text mb-0" style="font-size: 13px; color:#6B7280;">
                            <strong>Date:</strong> 8 December 2025, 7:00 PM<br>
                            <strong>Location:</strong> SilverCare Centre, Level 3 Activity Room<br>
                            Seats are limited. Register through the Appointment page under “Caregiver Workshop”.
                        </p>
                    </div>
                </div>

                <!-- CARD 4: Health Tip -->
                <div class="card news-card mb-3 fade-in-up news-item" data-category="health">
                    <div class="card-body">
                        <div class="d-flex justify-content-between news-card-header mb-1">
                            <span>Health Tips • 18 Oct 2025</span>
                            <span>SilverCare Nutritionist</span>
                        </div>
                        <div class="d-flex align-items-center mb-2">
                            <span class="news-pill pill-health me-2">Health Tip</span>
                            <span style="font-size: 12px; color:#6B7280;">
                                Nutritious, easy-to-chew meals
                            </span>
                        </div>
                        <h5 class="card-title mb-2">Building a Balanced Plate for Seniors</h5>
                        <p class="card-text mb-2" style="font-size: 14px;">
                            Eating well doesn’t have to be complicated. Aim for a quarter plate of protein,
                            a quarter plate of whole grains, and half a plate of colourful vegetables, with
                            plenty of water throughout the day.
                        </p>
                        <p class="card-text mb-0" style="font-size: 13px; color:#6B7280;">
                            Our Transportation &amp; Meal Delivery category now includes meal plans designed in
                            collaboration with dietitians, suitable for soft diets and common health conditions.
                        </p>
                    </div>
                </div>

                <!-- CARD 5: Announcement -->
                <div class="card news-card mb-3 fade-in-up news-item" data-category="announcement">
                    <div class="card-body">
                        <div class="d-flex justify-content-between news-card-header mb-1">
                            <span>Service Update • 10 Oct 2025</span>
                            <span>SilverCare Operations</span>
                        </div>
                        <div class="d-flex align-items-center mb-2">
                            <span class="news-pill pill-announcement me-2">Announcement</span>
                            <span style="font-size: 12px; color:#6B7280;">
                                Extended service hours
                            </span>
                        </div>
                        <h5 class="card-title mb-2">Evening Home Visits Now Available</h5>
                        <p class="card-text mb-2" style="font-size: 14px;">
                            To better support working caregivers, SilverCare now offers selected In-home Care
                            and Lifestyle Wellness Support sessions between <strong>6:00 PM and 9:00 PM</strong>
                            on weekdays.
                        </p>
                        <p class="card-text mb-0" style="font-size: 13px; color:#6B7280;">
                            You can request an evening timeslot when booking an appointment. Availability may vary
                            based on location and caregiver schedule.
                        </p>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <%@ include file="../components/footer.html" %>

    <script>
        // Simple filter logic for category buttons
        const filterButtons = document.querySelectorAll(".filter-btn");
        const newsItems = document.querySelectorAll(".news-item");

        filterButtons.forEach(btn => {
            btn.addEventListener("click", () => {
                const filter = btn.getAttribute("data-filter");

                // update active state
                filterButtons.forEach(b => b.classList.remove("active"));
                btn.classList.add("active");

                // show/hide cards
                newsItems.forEach(card => {
                    const category = card.getAttribute("data-category");
                    if (filter === "all" || category === filter) {
                        card.style.display = "";
                    } else {
                        card.style.display = "none";
                    }
                });
            });
        });

        // Fade-in on scroll using IntersectionObserver
        const faders = document.querySelectorAll(".fade-in-up");
        const observer = new IntersectionObserver((entries, obs) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add("show");
                    obs.unobserve(entry.target); // animate once
                }
            });
        }, {
            threshold: 0.2
        });

        faders.forEach(el => observer.observe(el));
    </script>
</body>
</html>
