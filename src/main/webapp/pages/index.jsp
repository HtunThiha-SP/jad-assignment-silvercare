<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../components/header-config.html" %>
<title>SilverCare | Premium Caregiving Services</title>
</head>
<body>
    <jsp:include page="../components/navBar.jsp"></jsp:include>
    <img src="../img/homepage-banner.png" width="100%" height="auto">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-3 d-flex justify-content-center align-items-center">
                <img src="../img/silvercare-logo.png" width="120px" height="120px">
            </div>
            <div class="col-7">
                <div>
                    <h2><i class="bi bi-rocket-takeoff-fill"></i>&ensp;What We Do</h2>
                    <p>
                        SilverCare provides compassionate and professional in-home assistance, offering a range
                        of personalized caregiver services tailored to the unique need of seniors and individuals
                        requiring support to maintain their independence and quality of life. Our dedicated team is
                        committed to delivering exceptional care, focusing on everything from daily living activities
                        and medication reminders to specialized companionship.
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-4 d-flex justify-content-center align-items-center">
                <img src="../img/service-category-hero.png" width="280px" height="auto" style="border: 1px solid black; border-radius: 20px;">
            </div>
            <div class="col-6">
                <div>
                    <h2><i class="bi bi-box2-heart-fill"></i>&ensp;Our services, Your satisfaction</h2>
                    <p>
                        We offer a wide variety of services designed to meet your needs and exceed your expectations. 
                        With a strong focus on quality and customer care, we ensure every client enjoys a smooth, 
                        satisfying experience from start to finish. Choose us for reliable service, exceptional value, 
                        and results you can trust.
                    </p>
                    <div style="height: 10px;"></div>
                    <button style="
                        background-color: #2C2C2C;
                        color: white;
                        padding: 5px 30px 5px 30px;
                        border-radius: 10px;"
                        onclick="window.location.href='./serviceCategories.jsp'"
                    >
                        <i class="bi bi-heart-fill"></i>&ensp;Browse Services
                    </button>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../components/footer.html" %>
</body>
</html>