<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Callback Form</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        .callback-section {
            background-color: #f8f9fa;
            margin-top: 70px;
        }

        .contact-info-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 20px;
        }

        .contact-icon-box {
            width: 50px;
            height: 50px;
            background-color: #0d6efd;
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
            border-color: #0d6efd;
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
        }
    </style>
</head>
<body>

<jsp:include page="menu.jsp" />

<section class="callback-section py-5 py-md-7">
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-5">
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

            <div class="col-lg-7">
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
                                    <option value="" selected>Select a course</option>
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
                                <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
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

</body>
</html>
