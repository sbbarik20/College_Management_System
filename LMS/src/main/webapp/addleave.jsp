<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<jsp:include page="adminmenu.jsp"/>

<div class="container mt-3 text-center">
    <!-- Add Leave Form -->
    <form action="/add_leave" method="post" class="mb-3">
        <input type="text" name="leave_name" class="form-control d-inline w-50" placeholder="Enter leave name" required>
        <input type="submit" value="Add Leave" class="btn btn-primary">
    </form>
    <p class="text-success">${msg}</p>

    <!-- Leave Table -->
    <table class="table table-bordered table-sm text-center">
        <thead class="">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="leave" items="${leavemaster}">
                <tr>
                    <td>${leave.leave_id}</td>
                    <td>${leave.leave_name}</td>
                    <td>
                        <form action="/manageleave" method="post" class="d-inline">
                            <input type="hidden" name="leave_id" value="${leave.leave_id}">
                            <button type="submit" name="btn" value="edit" class="btn btn-success btn-sm" onclick="return confirm('Are you sure?')">Edit</button>
                            <button type="submit" name="btn" value="delete" class="btn btn-danger btn-sm" onclick="return confirm('Delete this leave?')">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
