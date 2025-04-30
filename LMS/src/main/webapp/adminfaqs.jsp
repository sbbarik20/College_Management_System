
<jsp:include page="adminmenu.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<h1> Users....</h1> 
<table class="table table-dark" border="1px" width="100%">
    <tr> 
        <th> Question </th> 
        <th> Answer </th> 
        <th> Action </th>
    </tr>
    
    <c:forEach var="faq" items="${faqlist}">
        <tr>
            <td>${faq.question}</td>
            <td>${faq.answer}</td>
        <td>
            <form method="post" action="/managefaq">
                <input type="hidden" name="id" value="${faq.id}" />
                <input type="submit" name="btn" value="delete" class="btn btn-primary btn-sm" />
                <input type="submit" name="btn" value="edit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')"/>       
            </form>     
        </td>
        </tr>
    </c:forEach>
</table>
${msg}
