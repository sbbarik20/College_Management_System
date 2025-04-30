<jsp:include page="adminmenu.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- Heading Section -->
<div class="container mt-4">
    <h1 class="text-center mb-4">Manage Users</h1>

    <!-- Search Bar Section -->
    <div class="row mb-3">
        <div class="col-md-4 offset-md-8">
            <input type="text" id="searchInput" class="form-control" placeholder="Search users..." onkeyup="filterTable()" />
        </div>
    </div>

    <!-- Table Section -->
    <div class="table-container">
        <table class="table table-bordered table-striped table-hover" id="userTable">
            <thead class="thead-dark">
                <tr> 
                    <th>Name</th> 
                    <th>Email</th> 
                    <th>Role</th> 
                    <th>Action</th> 
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${usermaster}">
                    <tr>
                        <td>${user.name}</td>
                        <td>${user.email}</td>
                        <td>${user.role}</td>
                        <td class="text-center">
                            <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteModal" data-email="${user.email}" title="Delete">Delete</button>
                            <a href="/editUser?email=${user.email}" class="btn btn-primary btn-sm" title="Edit">Edit</a>
                        </td>
                        <td>${user.status}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Success/Error Message -->
    <div class="alert alert-info" role="alert" style="display: ${not empty msg ? 'block' : 'none'};">
        ${msg}
    </div>
</div>

<!-- Modal for Delete Confirmation -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Confirm Deletion</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this user?
            </div>
            <div class="modal-footer">
                <form method="post" action="/manageusers" id="deleteForm">
                    <input type="hidden" name="email" id="deleteEmail" />
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" name="btn" value="delete" class="btn btn-danger">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // JavaScript for filtering the table
    function filterTable() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchInput");
        filter = input.value.toLowerCase();
        table = document.getElementById("userTable");
        tr = table.getElementsByTagName("tr");

        for (i = 1; i < tr.length; i++) {  // Skip the header row
            td = tr[i].getElementsByTagName("td");
            if (td) {
                var name = td[0].textContent || td[0].innerText;
                var email = td[1].textContent || td[1].innerText;
                if (name.toLowerCase().indexOf(filter) > -1 || email.toLowerCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }       
        }
    }

    // JavaScript to set email for deletion in the modal
    $('#deleteModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var email = button.data('email');
        var modal = $(this);
        modal.find('#deleteEmail').val(email);
    });
</script>

<!-- Include Bootstrap JS for Modal functionality -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

<style>
    /* Styling the form control */
    .form-control {
        display: block;
        width: 100%;
        margin-top: -63px;
        padding: .375rem .75rem;
        font-size: 1rem;
        line-height: 1.5;
        background-color: #fff;
        border: 1px solid #ced4da;
        border-radius: .375rem;
    }

    /* Aligning the table and text */
    .table th, .table td {
        text-align: center;
        vertical-align: middle;
    }

    /* Optional: Adjusting spacing around the table */
    .table-container {
        padding: 20px;
    }

    /* Additional Modal Styling */
    .modal-content {
        border-radius: .375rem;
    }

    .modal-header .close {
        padding: 0.75rem;
    }

    .modal-footer .btn {
        width: 100px;
    }
</style>
