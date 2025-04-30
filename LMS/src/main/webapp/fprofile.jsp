<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f3f4f6;
            color: #111c55;
            font-family: 'Segoe UI', sans-serif;
        }

        .profile-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 25px;
            background: linear-gradient(145deg, #ffffff, #f2f6fc);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1), 0 6px 6px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .profile-container:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2), 0 10px 10px rgba(0, 0, 0, 0.1);
        }

        .profile-photo {
            border-radius: 50%;
            border: 5px solid #111c55;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            margin-bottom: 20px;
        }

        .profile-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .profile-header h2 {
            color: #111c55;
            font-weight: 700;
        }

        .profile-header p {
            font-size: 1.2em;
            color: #5f6368;
        }

        .table th, .table td {
            text-align: left;
            vertical-align: middle;
            padding: 12px;
        }

        .table-bordered {
            border: none;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f2f6fc;
        }

        .table-striped tbody tr:hover {
            background-color: #e2e7ff;
        }

        .table th {
            background-color: #111c55;
            color: #fff;
        }

        .btn-custom {
            font-weight: 600;
            padding: 12px 30px;
            font-size: 16px;
            border-radius: 30px;
            transition: all 0.3s ease;
        }

        .btn-warning {
            background-color: #f7c331;
            border-color: #f7c331;
        }

        .btn-danger {
            background-color: #f85f36;
            border-color: #f85f36;
        }

        .btn-custom:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .footer {
            text-align: center;
            margin-top: 30px;
            font-size: 0.9em;
            color: #111c55;
        }

        .footer a {
            color: #f7c331;
            text-decoration: none;
        }
    </style>
</head>
<body>

<jsp:include page="facultymenu.jsp" />

<div class="container">
    <div class="profile-container">
        <div class="profile-header">
            <%-- Profile Image --%>
            <img src="/image/${fprofileList[0].email}   " width="150" height="150" alt="Profile Photo" class="profile-photo">
            <h2>${fprofileList[0].name}</h2>
            <p>${fprofileList[0].role}</p>
        </div>

        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <tbody>
                    <tr>
                        <th>Id</th>
                        <td>${fprofileList[0].id}</td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td>${fprofileList[0].email}</td>
                    </tr>
                    <tr>
                        <th>Role</th>
                        <td>${fprofileList[0].role}</td>
                    </tr>
                    <tr>
                        <th>Mobile</th>
                        <td>${fprofileList[0].mobile}</td>
                    </tr>
                    <tr>
                        <th>Password</th>
                        <td>${fprofileList[0].password}</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="d-flex justify-content-between">
            <a href="/editprofile" class="btn btn-warning btn-custom">Edit Profile</a>
            <a href="/logout" class="btn btn-danger btn-custom">Logout</a>
        </div>
    </div>
</div>

<div class="footer">
    <p>&copy; 2025 Your Company | <a href="/privacy-policy">Privacy Policy</a></p>
</div>

</body>
</html>
