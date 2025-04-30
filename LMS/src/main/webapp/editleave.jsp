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
</style>

<jsp:include page="adminmenu.jsp"/>

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="card shadow-lg p-3">
                <h4 class="text-center text-primary">Edit Leave</h4>
                <form action="/updateleave" method="post">
                    <div class="mb-2">
                        <label class="form-label fw-bold">Leave ID:</label>
                        <input type="text" name="leave_id" value="${leaveList[0].leave_id}" class="form-control" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">Leave Name:</label>
                        <input type="text" name="leave_name" value="${leaveList[0].leave_name}" class="form-control" required>
                    </div>
                    <div class="text-center">
                        <button type="submit" name="btn" value="update" class="btn btn-success w-100">Update Leave</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
