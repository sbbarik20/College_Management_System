<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- jstl --%>

<c:out value="${10*2}" />

<br/>

<%-- ex of set --%>
<c:set var="k" value="Hello seeree" scope="page" />

<c:out value="${k}" />

<%-- ex of remove --%>

<c:remove var="k" scope="page" />
<c:out value="${k}"/>

<%-- ex of choose --%>
<c:set var="salary" scope="session" value="${2000*2}" />
<p>your salary is : <c:out value="${salary}" /></p>

<c:choose>
    <c:when test = "${salary<=0}">
        salary is very low
    </c:when>
     <c:when test = "${salary>1000}">
        salary is very good
    </c:when>
    <c:otherwise>
        no comment sir...
    </c:otherwise>

</c:choose>