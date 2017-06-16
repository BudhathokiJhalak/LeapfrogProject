<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="SITE_URL" value="${pageContext.request.contextPath}"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <body>
        <h1>HTTP Status 403 - Access is denied</h1>

        <c:choose>
            <c:when test="${empty username}">
                <h2>You do not have permission to access this page!</h2>
            </c:when>
            <c:otherwise>
                <h2>Username : ${username} <br/>
                    You do not have permission to access this page!</h2>
                </c:otherwise>
            </c:choose>
        <a href="${SITE_URL}/admin/dashboard">Click here</a>

    </body>
</html>