<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seeree - Premier Coaching Center in Bhubaneswar</title>
    <meta name="description" content="Seeree offers comprehensive training in Fullstack Development, Software Development, and Digital Marketing in Bhubaneswar, Odisha.">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <!-- AOS Animation Library -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
    
    <style>
        header.custom-header {
            position: absolute;
            top: 0;
            width: 100%;
            z-index: 1000;
            background-color: transparent;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        header.custom-header.scrolled {
            position: fixed;
            background-color: rgba(17, 28, 85, 0.9);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);
        }

        .custom-header .nav-link {
            color: #fff;
            transition: 0.3s ease;
            position: relative;
        }

        .custom-header .nav-link:hover,
        .custom-header .nav-link.active {
            color: #ffc107;
        }

        /* Fancy underline on hover */
        .custom-header .nav-link::after {
            content: "";
            position: absolute;
            width: 0;
            height: 2px;
            left: 50%;
            bottom: 0;
            background-color: #ffc107;
            transition: all 0.3s ease-in-out;
        }

        .custom-header .nav-link:hover::after {
            width: 100%;
            left: 0;
        }

        .custom-header .btn-outline-light:hover {
            background-color: #ffc107;
            color: #000;
            border-color: #ffc107;
        }

        .custom-header .btn-warning:hover {
            background-color: #e0a800;
            border-color: #e0a800;
        }

        .logo-text {
            font-size: 1.5rem;
            font-weight: 600;
            color: #ffffff;
        }
        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            color: #ffc107; /* or use your custom --primary-color if defined */
            transition: color 0.3s ease;
        }

        .navbar-brand:hover {
            color: #fff; /* Matches the hover color from nav links */
        }
        :root {
            --primary-color: #2563eb;
            --primary-dark: #1d4ed8;
            --primary-light: #60a5fa;
            --primary-bg: #eff6ff;
            --secondary-color: #1e40af;
            --dark-color: #111827;
            --light-color: #f9fafb;
            --gray-color: #6b7280;
            --success-color: #10b981;
            --warning-color: #f59e0b;
            --danger-color: #ef4444;
        }
        
        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            color: var(--dark-color);
            line-height: 1.6;
            overflow-x:hidden;
        }
        
        /* Header & Navigation */
        .navbar {
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        
        .nav-link {
            font-weight: 500;
            transition: color 0.3s;
        }
        
        .nav-link:hover {
            color: var(--primary-color);
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        
        .btn-primary:hover {
            background-color: var(--primary-dark);
            border-color: var(--primary-dark);
        }
        
        .btn-outline-primary {
            color: var(--primary-color);
            border-color: var(--primary-color);
        }
        
        .btn-outline-primary:hover {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        
        .rounded-pill {
            border-radius: 50rem;
        }
        
        /* Banner/Hero Section */
        .hero-section {
            position: relative;
            height: 710px;
            overflow: hidden;
        }

        /* Slide container */
        .hero-slide {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            transition: opacity 1s ease;
            overflow: hidden;
        }

        .hero-slide.active {
            opacity: 1;
        }

        /* Background video inside slide */
        .background-video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: 0;
        }

        /* Overlay to darken background video/image */
        .hero-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }

        /* Content in the hero slide */
        .hero-content {
            position: relative;
            z-index: 2;
            text-align: center;
            max-width: 800px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            height: 100%;
        }

        /* Slide navigation indicators */
        .hero-indicators {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            gap: 8px;
            z-index: 3;
        }

        .hero-indicator {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.5);
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .hero-indicator.active {
            background-color: #fff;
            transform: scale(1.2);
        }

        /* Previous and next buttons */
        .hero-nav-btn {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            z-index: 3;
            background-color: rgba(255, 255, 255, 0.2);
            color: white;
            border: none;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            backdrop-filter: blur(4px);
            transition: background-color 0.3s;
        }

        .hero-nav-btn:hover {
            background-color: rgba(255, 255, 255, 0.3);
        }

        .hero-prev {
            left: 20px;
        }

        .hero-next {
            right: 20px;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .hero-content h1 {
                font-size: 2rem;
            }

            .hero-content p {
                font-size: 1rem;
            }

            .hero-nav-btn {
                width: 32px;
                height: 32px;
            }

            .hero-indicator {
                width: 10px;
                height: 10px;
            }
        }

        
        /* Services Section */
        .service-card {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s, box-shadow 0.3s;
            height: 100%;
        }
        
        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.12);
        }
        
        .service-img {
            height: 200px;
            object-fit: cover;
        }
        
        .service-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
        
        /* Career Section */
        .career-section {
            position: relative;
            background-image: url(images/backgroundimage1.png);
        }
        
        .career-section .shape-1 {
            position: absolute;
            top: -30px;
            left: -30px;
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background-color: var(--primary-bg);
            z-index: 0;
        }
        
        .career-section .shape-2 {
            position: absolute;
            bottom: -30px;
            right: -30px;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background-color: var(--primary-bg);
            z-index: 0;
        }
        
        .career-box {
            position: relative;
            z-index: 1;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }
        
        .check-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 15px;
        }
        
        .check-icon {
            color: var(--primary-color);
            font-size: 1.25rem;
            margin-right: 10px;
            flex-shrink: 0;
        }
        
        /* Partners Section */
        .partners-section {
            background-color:rgba(17, 28, 85, 0.9);
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
            position: relative;
            overflow: hidden;
        }
        
        .partners-slider {
            display: flex;
            animation: slide 30s linear infinite;
        }
        
        .partner-logo {
            flex: 0 0 200px;
            height: 80px;
            margin: 0 30px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .partner-logo img {
            max-width: 100%;
            max-height: 60px;
            object-fit: contain;
        }
        
        @keyframes slide {
            0% {
                transform: translateX(0);
            }
            100% {
                transform: translateX(-100%);
            }
        }
        
        .partners-section::before,
        .partners-section::after {
            content: "";
            position: absolute;
            top: 0;
            width: 100px;
            height: 100%;
            z-index: 2;
        }
        
        .partners-section::before {
            left: 0;
            background: linear-gradient(to right, var(--primary-bg), transparent);
        }
        
        .partners-section::after {
            right: 0;
            background: linear-gradient(to left, var(--primary-bg), transparent);
        }
        
        /* Courses Section */
        .course-card {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s, box-shadow 0.3s;
            height: 100%;
        }
        
        .course-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.12);
        }
        
        .course-img {
            height: 200px;
            object-fit: cover;
        }
        
        .course-meta {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 15px;
        }
        
        .course-meta-item {
            display: flex;
            align-items: center;
            font-size: 0.875rem;
            color: var(--gray-color);
        }
        
        .course-meta-icon {
            margin-right: 5px;
        }
        
        /* Testimonials Section */
        .seeree-testimonials-section {
        background-color: #1d3557;
        color: white;
        }

        .seeree-testimonial-card {
        background-color: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        border-radius: 12px;
        padding: 30px;
        position: relative;
        height: 100%;
        }

        .seeree-testimonial-quote {
        position: absolute;
        top: 20px;
        left: 20px;
        font-size: 4rem;
        opacity: 0.2;
        line-height: 1;
        }

        .seeree-testimonial-content {
        position: relative;
        z-index: 1;
        }

        .seeree-testimonial-img {
        width: 80px;
        height: 80px;
        border-radius: 50%;
        object-fit: cover;
        border: 3px solid rgba(255, 255, 255, 0.2);
        }

        .seeree-text-white-50 {
        color: rgba(255, 255, 255, 0.5);
        }
        /* Stats Section */
        .stats-card {
            background-color: white;
            border-radius: 12px;
            padding: 30px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s;
            height: 100%;
        }
        
        .stats-card:hover {
            transform: translateY(-10px);
        }
        
        .stats-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 15px;
        }
        
        .stats-number {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 10px;
        }
        
        /* Faculty Section */
        .faculty-card {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s, box-shadow 0.3s;
            height: 100%;
        }
        
        .faculty-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.12);
        }
        
        .faculty-img-container {
            height: 250px;
            overflow: hidden;
        }
        
        .faculty-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s;
        }
        
        .faculty-card:hover .faculty-img {
            transform: scale(1.05);
        }
        
        .faculty-social {
            display: flex;
            gap: 10px;
        }
        
        .faculty-social-link {
            width: 36px;
            height: 36px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: var(--primary-bg);
            color: var(--primary-color);
            border-radius: 50%;
            transition: all 0.3s;
        }
        
        .faculty-social-link:hover {
            background-color: var(--primary-color);
            color: white;
        }
        
        /* Callback Form Section */
        .callback-section {
            background-color: var(--primary-bg);
        }
        
        .contact-info-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 20px;
        }
        
        .contact-icon-box {
            width: 50px;
            height: 50px;
            background-color: var(--primary-color);
            color: white;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            flex-shrink: 0;
        }
        
        .contact-form {
            background-color: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }
        
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(37, 99, 235, 0.25);
        }
        
        /* Footer */
        .footer {
            background-color: var(--dark-color);
            color: #9ca3af;
        }
        
        .footer h5 {
            color: white;
            font-weight: 600;
            margin-bottom: 20px;
        }
        
        .footer-links {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        .footer-links li {
            margin-bottom: 10px;
        }
        
        .footer-links a {
            color: #9ca3af;
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .footer-links a:hover {
            color: white;
        }
        
        .footer-social {
            display: flex;
            gap: 15px;
        }
        
        .footer-social-link {
            width: 36px;
            height: 36px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            border-radius: 50%;
            transition: all 0.3s;
        }
        
        .footer-social-link:hover {
            background-color: var(--primary-color);
        }
        
        .footer-bottom {
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            padding-top: 20px;
            margin-top: 40px;
        }
        
        /* Animations */
        .fade-up {
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.5s ease, transform 0.5s ease;
        }
        
        .fade-up.active {
            opacity: 1;
            transform: translateY(0);
        }
        
        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .hero-section {
                height: 400px;
            }
            
            .hero-content h1 {
                font-size: 2.5rem;
            }
        }
        
        @media (max-width: 768px) {
            .hero-section {
                height: 350px;
            }
            
            .hero-content h1 {
                font-size: 2rem;
            }
            
            .hero-content p {
                font-size: 1rem;
            }
            
            .section-title {
                font-size: 2rem;
            }
        }
        
        @media (max-width: 576px) {
            .hero-section {
                height: 300px;
            }
            
            .hero-content h1 {
                font-size: 1.75rem;
            }
            
            .section-title {
                font-size: 1.75rem;
            }
        }
    </style>
</head>
<body>
    <!-- Header/Navigation -->
    <header>
        <header class="p-3 custom-header">
            <div class="container">
              <div class="row align-items-center">
                <!-- Logo -->
                <div class="col-md-3 text-center text-md-start mb-3 mb-md-0">
                  <a href="index.jsp" class="navbar-brand d-inline-flex align-items-center text-decoration-none">Seeree</a>
                </div>
          
                <!-- Nav Menu -->
                <div class="col-md-6">
                  <ul class="nav justify-content-center">
                    <li class="nav-item"><a href="/index" class="nav-link px-3">Home</a></li>
                    <li class="nav-item"><a href="/contact" class="nav-link px-3">Contact Us</a></li>
                    <li class="nav-item"><a href="/services" class="nav-link px-3">Our Services</a></li>
                    <li class="nav-item"><a href="/faq" class="nav-link px-3">FAQs</a></li>
                    <li class="nav-item"><a href="/about" class="nav-link px-3">About</a></li>
                  </ul>
                </div>
          
                <!-- Auth Buttons -->
                <div class="col-md-3 text-center text-md-end mt-3 mt-md-0">
                  <a href="/login" class="btn btn-outline-light me-2">Login</a>
                  <a href="/register" class="btn btn-warning">Sign-up</a>
                </div>
              </div>
            </div>
          </header>
    </header>

    <!-- Hero/Banner Section -->
    <section class="hero-section">
        <div class="hero-slide active">
            <!-- Background Video -->
            <video autoplay muted loop playsinline class="background-video">
                <source src="videos/computervideo1.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
        
            <!-- Optional dark overlay -->
            <div class="hero-overlay"></div>
        
            <!-- Content on top of the video -->
            <div class="hero-content d-flex flex-column justify-content-center h-100">
                <h1 class="text-white display-4 fw-bold mb-3">Unlock Your Potential with Seeree</h1>
                <p class="text-white fs-5 mb-4">Premier coaching center for tech education in Bhubaneswar</p>
                <div>
                    <a href="#" class="btn btn-primary btn-lg rounded-pill px-4 py-2">Explore Courses</a>
                </div>
            </div>
        </div>
        
        <!-- <div class="hero-slide active" style="background-image: url('images/bg9.jpg');">
            <div class="hero-overlay"></div>
            <div class="hero-content d-flex flex-column justify-content-center h-100">
                <h1 class="text-white display-4 fw-bold mb-3">Unlock Your Potential with Seeree</h1>
                <p class="text-white fs-5 mb-4">Premier coaching center for tech education in Bhubaneswar</p>
                <div>
                    <a href="#" class="btn btn-primary btn-lg rounded-pill px-4 py-2">Explore Courses</a>
                </div>
            </div>
        </div> -->
        <!-- <div class="hero-slide" style="background-image: url('images/bg8.jpg');">
            <div class="hero-overlay"></div>
            <div class="hero-content d-flex flex-column justify-content-center h-100">
                <h1 class="text-white display-4 fw-bold mb-3">Learn from Industry Experts</h1>
                <p class="text-white fs-5 mb-4">Gain practical skills with our experienced faculty</p>
                <div>
                    <a href="#" class="btn btn-primary btn-lg rounded-pill px-4 py-2">Meet Our Team</a>
                </div>
            </div>
        </div> -->
        <!-- <div class="hero-slide" style="background-image: url('images/bg7.jpg');">
            <div class="hero-overlay"></div>
            <div class="hero-content d-flex flex-column justify-content-center h-100">
                <h1 class="text-white display-4 fw-bold mb-3">Launch Your Tech Career</h1>
                <p class="text-white fs-5 mb-4">Get placed in top companies with our placement assistance</p>
                <div>
                    <a href="#" class="btn btn-primary btn-lg rounded-pill px-4 py-2">View Placements</a>
                </div>
            </div>
        </div> -->
        
        <!-- <button class="hero-nav-btn hero-prev">
            <i class="bi bi-chevron-left"></i>
        </button>
        <button class="hero-nav-btn hero-next">
            <i class="bi bi-chevron-right"></i>
        </button> -->
        
        <!-- <div class="hero-indicators">
            <div class="hero-indicator active" data-slide="0"></div>
            <div class="hero-indicator" data-slide="1"></div>
            <div class="hero-indicator" data-slide="2"></div>
        </div> -->
        
    </section>

    <!-- Services Section -->
    <section class="py-5 py-md-7 bg-light">
        <div class="container">
            <div class="text-center mb-5" data-aos="fade-up">
                <h2 class="display-5 fw-bold mb-3">Our Services</h2>
                <p class="lead text-muted mx-auto" style="max-width: 700px;">Comprehensive training and development services to launch your tech career</p>
            </div>
            
            <div class="row g-4">
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                    <div class="service-card bg-white h-100">
                        <img src="images/fullstack.jpg" alt="Fullstack Development" class="service-img w-100">
                        <div class="p-4">
                            <div class="service-icon">
                                <i class="bi bi-code-slash"></i>
                            </div>
                            <h3 class="h4 mb-3">Fullstack Development/Training</h3>
                            <p class="text-muted mb-4">Comprehensive training in frontend and backend technologies to build complete web applications.</p>
                            <a href="services.jsp#fullstack" class="btn btn-outline-primary w-100">Learn More</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                    <div class="service-card bg-white h-100">
                        <img src="images/software.jpg" alt="Software Development" class="service-img w-100">
                        <div class="p-4">
                            <div class="service-icon">
                                <i class="bi bi-laptop"></i>
                            </div>
                            <h3 class="h4 mb-3">Software Development</h3>
                            <p class="text-muted mb-4">Learn to build robust, scalable software solutions using industry-standard methodologies.</p>
                            <a href="services.jsp#software" class="btn btn-outline-primary w-100">Learn More</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="300">
                    <div class="service-card bg-white h-100">
                        <img src="images/digital-marketing.jpg" alt="Digital Marketing" class="service-img w-100">
                        <div class="p-4">
                            <div class="service-icon">
                                <i class="bi bi-graph-up"></i>
                            </div>
                            <h3 class="h4 mb-3">Digital Marketing/SEO Service</h3>
                            <p class="text-muted mb-4">Master the skills to promote businesses online and optimize websites for search engines.</p>
                            <a href="services.jsp#digital-marketing" class="btn btn-outline-primary w-100">Learn More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Career Section -->
    <section class="career-section py-5 py-md-7">
        <div class="container">
            <div class="shape-1"></div>
            <div class="shape-2"></div>
            
            <div class="row align-items-center">
                <div class="col-lg-6 mb-5 mb-lg-0" data-aos="fade-right">
                    <h2 class="display-5 fw-bold mb-4">Start Your New Career Ventures With Seeree</h2>
                    <p class="lead text-muted mb-4">Launch your tech career with our industry-focused training programs. We provide the skills, knowledge, and support you need to succeed in today's competitive job market.</p>
                    
                    <div class="mb-4">
                        <div class="check-item">
                            <i class="bi bi-check-circle-fill check-icon"></i>
                            <span>Industry-relevant curriculum</span>
                        </div>
                        <div class="check-item">
                            <i class="bi bi-check-circle-fill check-icon"></i>
                            <span>Hands-on project experience</span>
                        </div>
                        <div class="check-item">
                            <i class="bi bi-check-circle-fill check-icon"></i>
                            <span>Placement assistance</span>
                        </div>
                        <div class="check-item">
                            <i class="bi bi-check-circle-fill check-icon"></i>
                            <span>Expert mentorship</span>
                        </div>
                        <div class="check-item">
                            <i class="bi bi-check-circle-fill check-icon"></i>
                            <span>Flexible learning options</span>
                        </div>
                    </div>
                    
                    <div class="d-flex flex-wrap gap-2">
                        <a href="courses.jsp" class="btn btn-primary rounded-pill px-4">Explore Courses</a>
                        <a href="contact.jsp" class="btn btn-outline-primary rounded-pill px-4">Schedule a Consultation</a>
                    </div>
                </div>
                
                <div class="col-lg-6" data-aos="fade-left">
                    <div class="career-box">
                        <div class="mb-4">
                            <img src="images/career.jpg" alt="Career growth" class="img-fluid rounded">
                        </div>
                        
                        <!-- <h3 class="h4 mb-4">Our Hiring Partners</h3>
                        <div class="row g-3">
                            <div class="col-3 col-md-3">
                                <img src="images/Infosys.png" alt="Partner 1" class="img-fluid">
                            </div>
                            <div class="col-3 col-md-3">
                                <img src="images/invincix.png" alt="Partner 2" class="img-fluid">
                            </div>
                            <div class="col-3 col-md-3">
                                <img src="images/csm-Logo.png" alt="Partner 3" class="img-fluid">
                            </div>
                            <div class="col-3 col-md-3">
                                <img src="images/Cognizant.png" alt="Partner 4" class="img-fluid">
                            </div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Partners Section -->
    <section class="partners-section py-5">
        <div class="container">
            <div class="text-center mb-4" data-aos="fade-up">
                <h2 style="color: #fff;">Our Partners</h2>
                <p style="color: #e0a800;">Trusted by leading companies in the industry</p>
            </div>
            
            <div class="position-relative overflow-hidden">
                <div class="partners-slider">
                    <!-- Double the partners for infinite scroll effect -->
                    <div class="partner-logo">
                        <img src="images/Infosys.png" alt="Partner 1">
                    </div>
                    <div class="partner-logo">
                        <img src="images/Cognizant.png" alt="Partner 2">
                    </div>
                    <div class="partner-logo">
                        <img src="images/csm-Logo.png" alt="Partner 3">
                    </div>
                    <div class="partner-logo">
                        <img src="images/Deloitte.png" alt="Partner 4">
                    </div>
                    <div class="partner-logo">
                        <img src="images/Cyfrifpro20private20limited.png" alt="Partner 5">
                    </div>
                    <div class="partner-logo">
                        <img src="images/Kreativewebs.png" alt="Partner 6">
                    </div>
                    <div class="partner-logo">
                        <img src="images/tcs.png" alt="Partner 7">
                    </div>
                    <div class="partner-logo">
                        <img src="images/Oditech20solution.png" alt="Partner 8">
                    </div>
                    <!-- Duplicate for infinite scroll -->
                    <div class="partner-logo">
                        <img src="images/Otech20soft20solutions.png" alt="Partner 1">
                    </div>
                    <div class="partner-logo">
                        <img src="images/accenture-logo.png" alt="Partner 2">
                    </div>
                    <div class="partner-logo">
                        <img src="images/Cyfrifpro20private20limited.png" alt="Partner 3">
                    </div>
                    <div class="partner-logo">
                        <img src="images/jo.png" alt="Partner 4">
                    </div>
                    <div class="partner-logo">
                        <img src="images/Kreativewebs.png" alt="Partner 5">
                    </div>
                    <div class="partner-logo">
                        <img src="images/niladri.png" alt="Partner 6">
                    </div>
                    <div class="partner-logo">
                        <img src="images/Quacklabs.png" alt="Partner 7">
                    </div>
                    <div class="partner-logo">
                        <img src="images/Quocent-Logo.png" alt="Partner 8">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Courses Section -->
    <section class="py-5 py-md-7" style="background-image: url(images/backgroundimage1.png);">
        <div class="container">
            <div class="text-center mb-5" data-aos="fade-up">
                <h2 class="display-5 fw-bold mb-3">Our Courses</h2>
                <p class="lead text-muted mx-auto" style="max-width: 700px;">Comprehensive training programs to help you master in-demand tech skills</p>
            </div>
            
            <div class="row g-4">
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                    <div class="course-card h-100">
                        <img src="images/java.jpg" alt="Java Fullstack" class="course-img w-100">
                        <div class="p-4">
                            <h3 class="h4 mb-3">Java Fullstack Development</h3>
                            <div class="course-meta">
                                <div class="course-meta-item">
                                    <i class="bi bi-clock course-meta-icon"></i>
                                    6 months
                                </div>
                                <div class="course-meta-item">
                                    <i class="bi bi-people course-meta-icon"></i>
                                    500+ students
                                </div>
                                <div class="course-meta-item">
                                    <i class="bi bi-award course-meta-icon"></i>
                                    Beginner to Advanced
                                </div>
                            </div>
                            <p class="text-muted mb-4">Master Java, Spring Boot, and frontend technologies to become a fullstack developer.</p>
                            <a href="#" class="btn btn-primary w-100">Enroll Now</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                    <div class="course-card h-100">
                        <img src="images/python.jpg" alt="Python Fullstack" class="course-img w-100">
                        <div class="p-4">
                            <h3 class="h4 mb-3">Python Fullstack Development</h3>
                            <div class="course-meta">
                                <div class="course-meta-item">
                                    <i class="bi bi-clock course-meta-icon"></i>
                                    6 months
                                </div>
                                <div class="course-meta-item">
                                    <i class="bi bi-people course-meta-icon"></i>
                                    450+ students
                                </div>
                                <div class="course-meta-item">
                                    <i class="bi bi-award course-meta-icon"></i>
                                    Beginner to Advanced
                                </div>
                            </div>
                            <p class="text-muted mb-4">Learn Python, Django, Flask, and modern frontend frameworks to build complete web applications.</p>
                            <a href="#" class="btn btn-primary w-100">Enroll Now</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="300">
                    <div class="course-card h-100">
                        <img src="images/mern.jpg" alt="MERN Stack" class="course-img w-100">
                        <div class="p-4">
                            <h3 class="h4 mb-3">MERN Fullstack Development</h3>
                            <div class="course-meta">
                                <div class="course-meta-item">
                                    <i class="bi bi-clock course-meta-icon"></i>
                                    5 months
                                </div>
                                <div class="course-meta-item">
                                    <i class="bi bi-people course-meta-icon"></i>
                                    600+ students
                                </div>
                                <div class="course-meta-item">
                                    <i class="bi bi-award course-meta-icon"></i>
                                    Beginner to Advanced
                                </div>
                            </div>
                            <p class="text-muted mb-4">Become proficient in MongoDB, Express.js, React, and Node.js to create modern web applications.</p>
                            <a href="courses.jsp#mern" class="btn btn-primary w-100">Enroll Now</a>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row g-4 mt-4">
                <div class="col-md-6" data-aos="fade-up" data-aos-delay="100">
                    <div class="course-card h-100">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img src="images/php.jpg" alt="PHP Fullstack" class="img-fluid h-100 w-100 object-fit-cover">
                            </div>
                            <div class="col-md-8">
                                <div class="p-4">
                                    <h3 class="h4 mb-3">PHP Fullstack Development</h3>
                                    <div class="course-meta">
                                        <div class="course-meta-item">
                                            <i class="bi bi-clock course-meta-icon"></i>
                                            5 months
                                        </div>
                                        <div class="course-meta-item">
                                            <i class="bi bi-people course-meta-icon"></i>
                                            350+ students
                                        </div>
                                    </div>
                                    <p class="text-muted mb-4">Master PHP, Laravel, MySQL, and frontend technologies to build dynamic web applications.</p>
                                    <a href="#" class="btn btn-primary w-100">Enroll Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6" data-aos="fade-up" data-aos-delay="200">
                    <div class="course-card h-100">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img src="images/dotnet.jpg" alt=".NET Fullstack" class="img-fluid h-100 w-100 object-fit-cover">
                            </div>
                            <div class="col-md-8">
                                <div class="p-4">
                                    <h3 class="h4 mb-3">.NET Fullstack Development</h3>
                                    <div class="course-meta">
                                        <div class="course-meta-item">
                                            <i class="bi bi-clock course-meta-icon"></i>
                                            6 months
                                        </div>
                                        <div class="course-meta-item">
                                            <i class="bi bi-people course-meta-icon"></i>
                                            300+ students
                                        </div>
                                    </div>
                                    <p class="text-muted mb-4">Learn C#, ASP.NET Core, Entity Framework, and frontend to build enterprise applications.</p>
                                    <a href="#" class="btn btn-primary w-100">Enroll Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="text-center mt-5" data-aos="fade-up">
                <a href="#" class="btn btn-outline-primary btn-lg rounded-pill px-4">View All Courses</a>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section class="seeree-testimonials-section py-5 py-md-7">
        <div class="container">
          <div class="text-center mb-5" data-aos="fade-up">
            <h2 class="display-5 fw-bold text-white mb-3">Student Testimonials</h2>
            <p class="lead seeree-text-white-50 mx-auto" style="max-width: 700px;">
              Hear from our successful students who transformed their careers with Seeree
            </p>
          </div>
      
          <div class="row justify-content-center">
            <div class="col-lg-10">
              <div class="owl-carousel owl-theme seeree-testimonial-carousel">
                <!-- Testimonial 1 -->
                <div class="seeree-testimonial-card">
                  <div class="seeree-testimonial-quote">"</div>
                  <div class="seeree-testimonial-content">
                    <div class="row align-items-center">
                      <div class="col-md-3 text-center mb-4 mb-md-0">
                        <img src="images/testimonial1.jpg" alt="Priya Sharma" class="seeree-testimonial-img">
                      </div>
                      <div class="col-md-9">
                        <p class="fs-5 mb-4">
                          Seeree's Java Fullstack course completely transformed my career. The hands-on projects and industry-focused curriculum helped me land my dream job at TCS. The instructors were incredibly supportive throughout my journey.
                        </p>
                        <h4 class="h5 mb-1">Priya Sharma</h4>
                        <p class="seeree-text-white-50">Java Developer at TCS</p>
                      </div>
                    </div>
                  </div>
                </div>
      
                <!-- Testimonial 2 -->
                <div class="seeree-testimonial-card">
                  <div class="seeree-testimonial-quote">"</div>
                  <div class="seeree-testimonial-content">
                    <div class="row align-items-center">
                      <div class="col-md-3 text-center mb-4 mb-md-0">
                        <img src="images/testimonial2.jpg" alt="Rahul Patel" class="seeree-testimonial-img">
                      </div>
                      <div class="col-md-9">
                        <p class="fs-5 mb-4">
                          I had tried learning web development on my own, but joining Seeree's MERN stack course gave me the structure and guidance I needed. The placement assistance was exceptional, and I got hired within a month of completing the course.
                        </p>
                        <h4 class="h5 mb-1">Rahul Patel</h4>
                        <p class="seeree-text-white-50">MERN Developer at Wipro</p>
                      </div>
                    </div>
                  </div>
                </div>
      
                <!-- Testimonial 3 -->
                <div class="seeree-testimonial-card">
                  <div class="seeree-testimonial-quote">"</div>
                  <div class="seeree-testimonial-content">
                    <div class="row align-items-center">
                      <div class="col-md-3 text-center mb-4 mb-md-0">
                        <img src="images/testimonial3.jpg" alt="Ananya Mishra" class="seeree-testimonial-img">
                      </div>
                      <div class="col-md-9">
                        <p class="fs-5 mb-4">
                          The Python Fullstack course at Seeree was comprehensive and practical. The instructors have real industry experience and teach you skills that are actually used in the workplace. I'm now working at Infosys thanks to their training.
                        </p>
                        <h4 class="h5 mb-1">Ananya Mishra</h4>
                        <p class="seeree-text-white-50">Python Developer at Infosys</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

    <!-- Stats Section -->
    <section class="py-5 py-md-7 bg-light" style="background-image: url(images/backgroundimage1.png);">
        <div class="container">
            <div class="row g-4">
                <div class="col-6 col-md-3" data-aos="fade-up" data-aos-delay="100">
                    <div class="stats-card">
                        <div class="stats-icon">
                            <i class="bi bi-people"></i>
                        </div>
                        <div class="stats-number" data-count="5000">0</div>
                        <p class="text-muted">Students Trained</p>
                    </div>
                </div>
                
                <div class="col-6 col-md-3" data-aos="fade-up" data-aos-delay="200">
                    <div class="stats-card">
                        <div class="stats-icon">
                            <i class="bi bi-building"></i>
                        </div>
                        <div class="stats-number" data-count="100">60</div>
                        <p class="text-muted">Hiring Partners</p>
                    </div>
                </div>
                
                <div class="col-6 col-md-3" data-aos="fade-up" data-aos-delay="300">
                    <div class="stats-card">
                        <div class="stats-icon">
                            <i class="bi bi-award"></i>
                        </div>
                        <div class="stats-number" data-count="95">99</div>
                        <p class="text-muted">Placement Rate</p>
                    </div>
                </div>
                
                <div class="col-6 col-md-3" data-aos="fade-up" data-aos-delay="400">
                    <div class="stats-card">
                        <div class="stats-icon">
                            <i class="bi bi-clock-history"></i>
                        </div>
                        <div class="stats-number" data-count="8">5</div>
                        <p class="text-muted">Years of Excellence</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Faculty Section -->
    <section class="py-5 py-md-7" style="background-color: rgba(17, 28, 85, 0.9);">
        <div class="container">
            <div class="text-center mb-5" data-aos="fade-up">
                <h2 class="display-5 fw-bold mb-3" style="color: #fff;">Our Faculty</h2>
                <p style="color: #e0a800;" style="max-width: 700px;">Learn from industry experts with years of real-world experience</p>
            </div>
            
            <div class="row g-4">
                <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="100">
                    <div class="faculty-card">
                        <div class="faculty-img-container">
                            <img src="images/faculty1.jpeg" alt="Dr. Amit Kumar" class="faculty-img">
                        </div>
                        <div class="p-4">
                            <h3 class="h5 mb-1" style="color: #fff;">Er. Prabin Rout</h3>
                            <p class="text-primary mb-3">Director & Java Expert</p>
                            <p style="color: #e0a800;">Ph.D. in Computer Science with 15+ years of industry experience at top tech companies.</p>
                            <div class="faculty-social">
                                <a href="#" class="faculty-social-link">
                                    <i class="bi bi-linkedin"></i>
                                </a>
                                <a href="#" class="faculty-social-link">
                                    <i class="bi bi-twitter"></i>
                                </a>
                                <a href="#" class="faculty-social-link">
                                    <i class="bi bi-envelope"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="200">
                    <div class="faculty-card">
                        <div class="faculty-img-container">
                            <img src="images/faculty2.jpg" alt="Priya Mishra" class="faculty-img">
                        </div>
                        <div class="p-4">
                            <h3 class="h5 mb-1" style="color: #fff;">Er. Bisnu ch. Swain</h3>
                            <p class="text-primary mb-3">Python & Data Science Lead</p>
                            <p style="color: #e0a800;">Former Senior Developer at Microsoft with expertise in Python and machine learning.</p>
                            <div class="faculty-social">
                                <a href="#" class="faculty-social-link">
                                    <i class="bi bi-linkedin"></i>
                                </a>
                                <a href="#" class="faculty-social-link">
                                    <i class="bi bi-twitter"></i>
                                </a>
                                <a href="#" class="faculty-social-link">
                                    <i class="bi bi-envelope"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="300">
                    <div class="faculty-card">
                        <div class="faculty-img-container">
                            <img src="images/faculty4.png" alt="Rajesh Patel" class="faculty-img">
                        </div>
                        <div class="p-4">
                            <h3 class="h5 mb-1" style="color: #fff;">Er. Somya Ranjan</h3>
                            <p class="text-primary mb-3">MERN Stack Specialist</p>
                            <p style="color: #e0a800;">Full-stack developer with 10+ years of experience building web applications.</p>
                            <div class="faculty-social">
                                <a href="#" class="faculty-social-link">
                                    <i class="bi bi-linkedin"></i>
                                </a>
                                <a href="#" class="faculty-social-link">
                                    <i class="bi bi-twitter"></i>
                                </a>
                                <a href="#" class="faculty-social-link">
                                    <i class="bi bi-envelope"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="400">
                    <div class="faculty-card">
                        <div class="faculty-img-container">
                            <img src="images/faculty3.jpg" alt="Neha Singh" class="faculty-img">
                        </div>
                        <div class="p-4">
                            <h3 class="h5 mb-1" style="color: #fff;">Er.Neha Singh</h3>
                            <p class="text-primary mb-3">Digital Marketing Expert</p>
                            <p style="color: #e0a800;">Digital marketing professional with expertise in SEO, SEM, and social media marketing.</p>
                            <div class="faculty-social">
                                <a href="#" class="faculty-social-link">
                                    <i class="bi bi-linkedin"></i>
                                </a>
                                <a href="#" class="faculty-social-link">
                                    <i class="bi bi-twitter"></i>
                                </a>
                                <a href="#" class="faculty-social-link">
                                    <i class="bi bi-envelope"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Callback Form Section -->
    <section class="callback-section py-5 py-md-7">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-5" data-aos="fade-right">
                    <h2 class="display-5 fw-bold mb-4">Request a Call Back</h2>
                    <p class="lead text-muted mb-5">Have questions about our courses or services? Fill out the form and our team will get back to you within 24 hours.</p>
                    
                    <div class="contact-info-item">
                        <div class="contact-icon-box">
                            <i class="bi bi-telephone"></i>
                        </div>
                        <div>
                            <h3 class="h5 mb-1">Phone</h3>
                            <p class="mb-0">+91 1234567890</p>
                        </div>
                    </div>
                    
                    <div class="contact-info-item">
                        <div class="contact-icon-box">
                            <i class="bi bi-envelope"></i>
                        </div>
                        <div>
                            <h3 class="h5 mb-1">Email</h3>
                            <p class="mb-0">info@seeree.com</p>
                        </div>
                    </div>
                    
                    <div class="contact-info-item">
                        <div class="contact-icon-box">
                            <i class="bi bi-geo-alt"></i>
                        </div>
                        <div>
                            <h3 class="h5 mb-1">Location</h3>
                            <p class="mb-0">Jaydev Vihar, Bhubaneswar, Odisha 754012</p>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-7" data-aos="fade-left">
                    <div class="contact-form">
                        <form action="/Contact" method="post" id="callbackForm">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="name" class="form-label">Full Name *</label>
                                    <input type="text" class="form-control" id="name" name="name" required>
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="email" class="form-label">Email Address *</label>
                                    <input type="email" class="form-control" id="email" name="email" required>
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="phone" class="form-label">Phone Number *</label>
                                    <input type="tel" class="form-control" id="phoneno" name="phoneno" required>
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="course" class="form-label">Course of Interest</label>
                                    <select class="form-select" id="course" name="course" required>
                                        <option value="" selected >Select a course</option>
                                        <option value="java">Java Fullstack</option>
                                        <option value="python">Python Fullstack</option>
                                        <option value="mern">MERN Stack</option>
                                        <option value="php">PHP Fullstack</option>
                                        <option value="dotnet">.NET Fullstack</option>
                                        <option value="digital-marketing">Digital Marketing</option>
                                    </select>
                                </div>
                                
                                <div class="col-12">
                                    <label for="message" class="form-label">Message</label>
                                    <textarea class="form-control" id="message" name="message" rows="4"required></textarea>
                                </div>
                                
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary btn-lg w-100">Request Call Back</button>
                                </div>
                            </div>
                        </form>
                        <center>${msg}</center>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer py-5">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-4">
                    <h5>About Us</h5>
                    <p class="mb-4">Seeree is a premier coaching center in Bhubaneswar offering comprehensive training in fullstack development, software development, and digital marketing.</p>
                    <div class="footer-social">
                        <a href="#" class="footer-social-link">
                            <i class="bi bi-facebook"></i>
                        </a>
                        <a href="#" class="footer-social-link">
                            <i class="bi bi-twitter"></i>
                        </a>
                        <a href="#" class="footer-social-link">
                            <i class="bi bi-instagram"></i>
                        </a>
                        <a href="#" class="footer-social-link">
                            <i class="bi bi-linkedin"></i>
                        </a>
                        <a href="#" class="footer-social-link">
                            <i class="bi bi-youtube"></i>
                        </a>
                    </div>
                </div>
                
                <div class="col-md-4 col-lg-2">
                    <h5>Useful Links</h5>
                    <ul class="footer-links">
                        <li><a href="about.jsp">About Us</a></li>
                        <li><a href="courses.jsp">Courses</a></li>
                        <li><a href="services.jsp">Services</a></li>
                        <li><a href="placements.jsp">Placements</a></li>
                        <li><a href="contact.jsp">Contact Us</a></li>
                        <li><a href="privacy-policy.jsp">Privacy Policy</a></li>
                    </ul>
                </div>
                
                <div class="col-md-4 col-lg-3">
                    <h5>News & Events</h5>
                    <ul class="footer-links">
                        <li>
                            <a href="#">
                                <small>June 15, 2023</small>
                                <p class="mb-2">New Batch for Java Fullstack Starting Soon</p>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <small>May 28, 2023</small>
                                <p class="mb-2">Free Workshop on Web Development Fundamentals</p>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <small>May 10, 2023</small>
                                <p class="mb-0">Upcoming Placement Drive with Top Companies</p>
                            </a>
                        </li>
                    </ul>
                </div>
                
                <div class="col-md-4 col-lg-3">
                    <h5>Subscribe</h5>
                    <p class="mb-4">Subscribe to our newsletter to receive updates on new courses, events, and offers.</p>
                    <form action="#" method="post" class="mb-3">
                        <div class="input-group">
                            <input type="email" class="form-control bg-dark border-dark text-white" placeholder="Your email address" required>
                            <button type="submit" class="btn btn-primary">Subscribe</button>
                        </div>
                    </form>
                </div>
            </div>
            
            <div class="footer-bottom text-center">
                <p>&copy; <%= new java.util.Date().getYear() + 1900 %> Seeree. All rights reserved. | Jaydev Vihar, Bhubaneswar, Odisha 754012</p>
            </div>
        </div>
    </footer>

    <!-- JavaScript Libraries -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    
    <script>
        // Header file script
        window.addEventListener('scroll', function () {
            const header = document.querySelector('header.custom-header');
            if (window.scrollY > 50) {
            header.classList.add('scrolled');
            } else {
            header.classList.remove('scrolled');
            }
        });

        // Initialize AOS
        AOS.init({
            duration: 800,
            easing: 'ease-in-out',
            once: true
        });
        
        // Hero Slider
        let currentSlide = 0;
        const slides = document.querySelectorAll('.hero-slide');
        const indicators = document.querySelectorAll('.hero-indicator');
        
        function showSlide(index) {
            slides.forEach(slide => slide.classList.remove('active'));
            indicators.forEach(indicator => indicator.classList.remove('active'));
            
            slides[index].classList.add('active');
            indicators[index].classList.add('active');
            currentSlide = index;
        }
        
        function nextSlide() {
            let next = currentSlide + 1;
            if (next >= slides.length) next = 0;
            showSlide(next);
        }
        
        function prevSlide() {
            let prev = currentSlide - 1;
            if (prev < 0) prev = slides.length - 1;
            showSlide(prev);
        }
        
        // Add event listeners
        document.querySelector('.hero-next')?.addEventListener('click', nextSlide);
        document.querySelector('.hero-prev')?.addEventListener('click', prevSlide);
        
        // Add event listeners to indicators
        indicators.forEach((indicator, index) => {
            indicator.addEventListener('click', () => showSlide(index));
        });
        
        // Auto slide
        let slideInterval = setInterval(nextSlide, 5000);
        
        // Pause auto slide on hover
        const heroSection = document.querySelector('.hero-section');
        heroSection.addEventListener('mouseenter', () => {
            clearInterval(slideInterval);
        });
        
        heroSection.addEventListener('mouseleave', () => {
            slideInterval = setInterval(nextSlide, 5000);
        });
        
        // Initialize Owl Carousel for testimonials
        $(document).ready(function(){
            $(".testimonial-carousel").owlCarousel({
                items: 1,
                loop: true,
                margin: 30,
                nav: true,
                dots: true,
                autoplay: true,
                autoplayTimeout: 5000,
                autoplayHoverPause: true,
                navText: [
                    "<i class='bi bi-chevron-left'></i>",
                    "<i class='bi bi-chevron-right'></i>"
                ],
                responsive: {
                    0: {
                        items: 1
                    },
                    768: {
                        items: 1
                    },
                    1000: {
                        items: 1
                    }
                }
            });
        });
        
        // Counter animation
        const counters = document.querySelectorAll('.stats-number');
        const speed = 200;
        
        const animateCounter = () => {
            counters.forEach(counter => {
                const target = parseInt(counter.getAttribute('data-count'));
                const count = parseInt(counter.innerText);
                const increment = Math.trunc(target / speed);
                
                if (count < target) {
                    counter.innerText = count + increment;
                    setTimeout(animateCounter, 1);
                } else {
                    counter.innerText = target;
                }
            });
        };
        
        // Start counter animation when section is in view
        const statsSection = document.querySelector('.stats-card');
        const observer = new IntersectionObserver((entries) => {
            if (entries[0].isIntersecting) {
                animateCounter();
                observer.unobserve(statsSection);
            }
        });
        
        observer.observe(statsSection);
        
        // Initialize AOS
        AOS.init();

        // Initialize the testimonial carousel
        $(document).ready(function(){
            $('.seeree-testimonial-carousel').owlCarousel({
                loop: true,
                margin: 30,
                nav: true,
                dots: true,
                autoplay: true,
                autoplayTimeout: 5000,
                smartSpeed: 800,
                responsive: {
                    0: { items: 1 },
                    768: { items: 1 },
                    992: { items: 1 }
                },
                navText: [
                    '<i class="bi bi-chevron-left"></i>',
                    '<i class="bi bi-chevron-right"></i>'
                ]
            });
        });
    </script>
</body>
</html>