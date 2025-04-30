<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom Styles -->
<style>
    body {
        background-color: #f4f4f9;
    }
    .card {
        background-color: #ffffff;
        border: 1px solid #ddd;
    }
    .card h4 {
        color: #111c55;
    }
    .form-label {
        color: #111c55;
    }
    .btn-success {
        background-color: #111c55;
        border-color: #111c55;
    }
    .btn-success:hover {
        background-color: #0e1a3d;
        border-color: #0e1a3d;
    }
    .form-control {
        border-color: #111c55;
    }
    .form-control:focus {
        border-color: #111c55;
        box-shadow: 0 0 0 0.25rem rgba(17, 28, 85, 0.25);
    }
    .text-center button {
        background-color: #111c55;
        border: none;
    }
    .text-center button:hover {
        background-color: #0e1a3d;
    }
    /* Custom spacing for the form */
    .mb-3 {
        margin-bottom: 1rem;
    }
    .card.shadow-lg {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1), 0 4px 16px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        padding: 20px;
    }
    .w-100 {
        width: 100%;
    }
    .container {
        max-width: 800px;
    }
    .form-control {
        height: calc(1.5em + 0.75rem + 2px);
        padding: 0.75rem 1.25rem;
        font-size: 1rem;
    }
</style>

<jsp:include page="adminmenu.jsp"/>

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow-lg p-4">
                <h4 class="text-center text-primary">Edit Profile</h4>
                
                <!-- Display Success Message -->
                <c:if test="${not empty msg}">
                    <div class="alert alert-success">
                        ${msg}
                    </div>
                </c:if>

                <!-- Display Error Message -->
                <c:if test="${not empty error}">
                    <div class="alert alert-danger">
                        ${error}
                    </div>
                </c:if>

                <form action="updateProfile" method="post" enctype="multipart/form-data">
                    
                    <!-- File Upload for New Photo -->
                    <div class="mb-3">
                        <label class="form-label fw-bold">Choose Photo:</label>
                        <input type="file" name="photo" class="form-control">
                    </div>

                    <!-- Hidden Fields for User Info -->
                    <div class="mb-3">
                        <label class="form-label fw-bold">Id:</label>
                        <input type="text" name="id" value="${aprofileList[0].id}" class="form-control" readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Email:</label>
                        <input type="email" name="email" value="${aprofileList[0].email}" class="form-control" readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Name:</label>
                        <input type="text" name="name" value="${aprofileList[0].name}" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Mobile Number:</label>
                        <input type="text" name="mobile" value="${aprofileList[0].mobile}" class="form-control" required>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold">Password:</label>
                        <input type="password" name="password" value="${aprofileList[0].password}" class="form-control" required>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-success w-100">Update Profile</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
