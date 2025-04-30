<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Include Admin Menu -->
<jsp:include page="adminmenu.jsp" />

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

<!-- Main Container -->
<div class="container mt-4">
    <h2 class="text-center mb-4 text-primary">Leave Applications</h2>

    <div class="table-responsive">
        <table class="table table-bordered table-striped table-hover">
            <thead class="table-header-blue text-white text-center">
                <tr>
                    <th>Sl No</th>
                    <th>Faculty ID</th>
                    <th>Date of Leave Apply</th>
                    <th>Leave ID</th>
                    <th>Number of Leave</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody class="text-center">
                <c:forEach var="leavelist" items="${leavelist}">
                    <tr>
                        <td>${leavelist.sl_no}</td>
                        <td>${leavelist.id}</td>
                        <td>${leavelist.date_of_leave}</td>
                        <td>${leavelist.leave_id}</td>
                        <td>${leavelist.no_of_leave}</td>
                        <td>
                            <form action="grantleave" method="post" class="d-inline">
                                <input type="hidden" name="sl_no" value="${leavelist.sl_no}" />
                                <button type="submit" name="grant" value="grant" class="btn btn-success btn-sm" onclick="return confirm('Grant this leave?')">Grant</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Custom Styling -->
<style>
    h2 {
        color: #111c55;
    }

    .btn-sm {
        font-size: 0.85rem;
    }

    .table th, .table td {
        vertical-align: middle;
    }
</style>
