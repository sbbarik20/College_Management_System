<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> -->


<!-- <c:out value="${10*2}"/> -->

<c:set var = "str" value="Hello Seeree" />

str = <c:out value="${str}" />

<c:set var ="k" value="Hello Seeree" scope="page" />

<c:out value="${k}" />

<br>

<c:remove var="k" scope="page" />

<c:out value="${k}" />

<!-- Ex: <c:choose> -->

<c:set var ="salary" value="${2000*2}" scope="session" />

<p>Your Salary is <c:out value="${salary}" /></p>

<c:choose>
    <c:when test="${salary<=0}">
        Salary is very good
    </c:when>
    <c:otherwise>
        No comment sir...
    </c:otherwise>
</c:choose>

<c:forEach>
    <c:forEach var="i" begin="1" end="10" step="1" />
    <c:out value="${i}" />
    <br>
</c:forEach>

<c:forToken>
    <c:forToken items="jhili, nuha, rosy" delims="," var="name" />
    <c:out value="${name}" />
</c:forToken>

<c:redirect url="http://www.seeree.in" />