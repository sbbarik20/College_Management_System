<jsp:include page="adminmenu.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Heading Section -->
<div class="container mt-4">
    <h1 class="text-center mb-4">View Gallery</h1>

    <!-- Table Section -->
    <table class="table table-hover table-bordered table-striped" id="galleryTable">
        <thead class="thead-dark">
            <tr>
                <th>Sl_No</th>
                <th>Time</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="gallery" items="${gallerylist}">
                <tr>
                    <td>${gallery.sl_no}</td>
                    <td>${gallery.time}</td>
                    <td>
                        <form method="post" action="/managegallery">
                            <input type="hidden" name="sl_no" value="${gallery.sl_no}" />
                            <button type="submit" name="btn" value="add" class="btn btn-success btn-sm">Add</button>
                            <button type="submit" name="btn" value="delete" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</button>
                            <button type="submit" name="btn" value="edit" class="btn btn-warning btn-sm" onclick="return confirm('Are you sure?')">Edit</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- Success/Error Message -->
    <div class="alert alert-info" role="alert" style="display: ${not empty msg ? 'block' : 'none'};">
        ${msg}
    </div>
</div>

<!-- Include Bootstrap JS for Modal functionality -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

<style>
    .table th, .table td {
        text-align: center;
        vertical-align: middle;
    }

    /* Optional: Adjusting spacing around the table */
    .table-container {
        padding: 20px;
    }
    
    /* Custom button styles */
    .btn-sm {
        font-size: 0.875rem; /* Smaller font size for the buttons */
    }
</style>
