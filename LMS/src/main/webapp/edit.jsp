<jsp:include page="adminmenu.jsp" />


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form action="/updateusers" method="post">

    Name : <input type="text" name="name" value="${usermaster[0].name}" class="form-control" readonly>
    <br>
    <br>
    Role : <input type="text" name="role" value="${usermaster[0].role}" class="form-control" readonly>
    <br>
    <br>
    Status : <input type="text" name="status" value="${usermaster[0].status}" class="form-control" >
    <br>
    <br>
    <input type="hidden" name="email" value="${usermaster[0].email}"> 
    
    <input type="submit" name="btn" value="update" class="form-control">
</form>