<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Faculty Dashboard</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<!-- Include the faculty menu -->
<jsp:include page="facultymenu.jsp" />

<div class="container mt-5">
    <div class="card shadow-lg p-4">
        <h2 class="text-center mb-4">Welcome to the Faculty Dashboard</h2>
        
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="alert alert-info text-center">
                    <strong>Name:</strong> <%= session.getAttribute("name") %><br>
                    <strong>ID:</strong> <%= session.getAttribute("id") %>
                </div>
            </div>
        </div>
        
        <!-- Add more dashboard content or cards below as needed -->
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
