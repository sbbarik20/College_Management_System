<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:include page="facultymenu.jsp"/>

<script>
    window.onload=function(){
        message = "${msg}"
        if (message) {
            alert(message);
        }
    }
</script>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        color: #333;
    }

    form {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        width: 40%;
        margin: 40px auto;
    }

    h2 {
        text-align: center;
        color: #111c55;
    }

    label {
        font-weight: bold;
        color: #111c55;
        display: block;
        margin: 10px 0 5px;
    }

    input[type="text"], select {
        width: 100%;
        padding: 10px;
        border: 2px solid #ddd;
        border-radius: 5px;
        font-size: 16px;
        margin-bottom: 20px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        background-color: #111c55;
        color: white;
        border: none;
        padding: 12px 20px;
        font-size: 16px;
        cursor: pointer;
        border-radius: 5px;
        width: 100%;
    }

    input[type="submit"]:hover {
        background-color: #0e1741;
    }

    .alert {
        background-color: #f44336;
        color: white;
        padding: 10px;
        margin-bottom: 20px;
        border-radius: 5px;
    }

    .alert.success {
        background-color: #4CAF50;
    }

    .alert.info {
        background-color: #2196F3;
    }
</style>

<form action="applyleave" method="post">
    <h2>Apply for Leave</h2>
    
    <input type="hidden" value="${id}" name="id">
    
    <label for="leave_id">Choose Leave:</label>
    <select name="leave_id">
        <option value="" hidden>Choose leave...</option>
        <c:forEach var="leave" items="${leave}">
            <option value="${leave.leave_id}">${leave.leave_name}</option>
        </c:forEach>
    </select>
    
    <label for="no_of_leave">No of Leave:</label>
    <input type="text" name="no_of_leave">
    
    <input type="submit" value="Apply">
</form>
