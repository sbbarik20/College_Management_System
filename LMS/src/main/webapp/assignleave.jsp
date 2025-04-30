<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Alert on Message -->
<script>
    window.onload = function () {
        var message = "${msg}";
        if (message) {
            alert(message);
        }
    }
</script>

<jsp:include page="adminmenu.jsp" />

<!-- Main Page Container -->
<div class="container mt-4">
    <h2 class="text-center mb-4 text-primary">Assign Leave to Faculty</h2>

    <!-- Assign Leave Form -->
    <div class="row justify-content-center mb-5">
        <div class="col-md-6">
            <div class="card shadow-sm border-0">
                <div class="card-body">
                    <form action="assignleave" method="post">
                        <div class="mb-3">
                            <label class="form-label fw-bold">Choose Faculty:</label>
                            <select name="id" class="form-select" required>
                                <option value="" hidden>Choose...</option>
                                <c:forEach var="faculty" items="${faculty}">
                                    <option value="${faculty.id}">${faculty.email}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Choose Leave:</label>
                            <select name="leave_id" class="form-select" required>
                                <option value="" hidden>Choose leave...</option>
                                <c:forEach var="leavetype" items="${leavetype}">
                                    <option value="${leavetype.leave_id}">${leavetype.leave_name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Number of Leave:</label>
                            <input type="text" name="no_of_leave" class="form-control" required />
                        </div>

                        <div class="text-center">
                            <input type="submit" value="Assign Leave" class="btn btn-success w-100" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Leave Assignment Table -->
    <h3 class="text-center mb-3">Assigned Leave List</h3>
    <div class="table-responsive">
        <table class="table table-hover table-bordered table-striped">
            <thead class="table-header-blue text-white">
                <tr>
                    <th>Sl No</th>
                    <th>Faculty ID</th>
                    <th>Leave ID</th>
                    <th>No of Leave</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="assignedleave" items="${assignedleave}">
                    <tr>
                        <td>${assignedleave.sl_no}</td>
                        <td>${assignedleave.id}</td>
                        <td>${assignedleave.leave_id}</td>
                        <td>${assignedleave.no_of_leave}</td>
                        <td>
                            <form action="/manageassignleave" method="post" class="d-inline">
                                <input type="hidden" name="sl_no" value="${assignedleave.sl_no}" />
                                <button type="submit" name="btn" value="edit" class="btn btn-warning btn-sm" onclick="return confirm('Are you sure to edit?')">Edit</button>
                                <button type="submit" name="btn" value="delete" class="btn btn-danger btn-sm" onclick="return confirm('Delete this leave?')">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Optional Alert Display -->
    <c:if test="${not empty msg}">
        <div class="alert alert-info text-center mt-3" role="alert">
            ${msg}
        </div>
    </c:if>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Custom Styles -->
<style>
    .table th,
    .table td {
        text-align: center;
        vertical-align: middle;
    }

    h2, h3 {
        color: #111c55;
    }

    .btn-sm {
        font-size: 0.875rem;
    }

    .card {
        background-color: #f8f9fa;
    }
</style>
