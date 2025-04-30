<jsp:include page="adminmenu.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- Heading Section -->
<div class="container mt-4">
    <h1 class="text-center mb-4">Manage Contacts</h1>

    <!-- Table Section -->
    <table class="table table-hover table-bordered table-striped" id="contactTable">
        <thead class="thead-dark">
            <tr> 
                <th>Full Name</th> 
                <th>Email</th> 
                <th>Phone No</th> 
                <th>Message</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${usermaster}">
                <tr>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                    <td>${user.phoneno}</td>
                    <td>${user.message}</td>
                    <td>${user.date}</td>
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
</style>
