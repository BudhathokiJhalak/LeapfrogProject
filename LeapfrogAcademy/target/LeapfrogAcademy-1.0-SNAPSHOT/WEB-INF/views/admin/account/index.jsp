<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="SITE_URL" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin | Leapfrog Academy</title>
        <link href="${SITE_URL}/static/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="${SITE_URL}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="${SITE_URL}/static/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="${SITE_URL}/static/js/jquery.min.js" type="text/javascript"></script>
        <script src="${SITE_URL}/static/js/bootstrap-dropdown.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
    <nav class="navbar navbar-default navbar-fixed-top" >
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="${SITE_URL}/admin" style="font-family:Monotype Corsiva; font-size: 27px">Leapfrog Academy</a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${SITE_URL}/admin/course"><span class="glyphicon glyphicon-book"></span> Course</a></li>
                <li><a href="${SITE_URL}/admin/tutor"><span class="glyphicon glyphicon-user"></span> Tutor</a></li>
                <li><a href="${SITE_URL}/admin/batch"><span class="glyphicon glyphicon-book"></span> Batch</a></li>
                <li><a href="${SITE_URL}/admin/student"><span class="glyphicon glyphicon-user"></span> Student</a></li>
                    <%@include file="../dropdown.jsp" %>
            </ul>       
        </div>
    </nav>
    <br/><br/><br/>
    <div class="container">
        <div class="col-md-4 col-md-offset-4">
            <form method="post" class="search-form" action="${SITE_URL}/admin/account/search">
                <div class="form-group has-feedback">
                    <label for="search" class="sr-only">Search</label>
                    <input type="text" class="form-control" name="keyword" placeholder="search by student name ...">
                    <span class="glyphicon glyphicon-search form-control-feedback"></span>
                </div>
            </form>
        </div>
        <br/>
        <div class="pull-right">
            <p>
                <a href="${SITE_URL}/admin/account/payment/add" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-plus"> Add</span></a>
            </p>
        </div>
        <table class="table table-hover">
            <tr style="background: #fcfcfc">
                <th>Payment ID</th>
                <th>Student Name</th>
                <th>Course Name</th>
                <th>Paid Amount(NRs)</th>
                <th>Paid Date</th>
                <th>Action</th>
            </tr>
            <c:forEach var="account" items="${accounts}">
                <tr>
                    <td>${account.paymentId}</td>
                    <td>${account.studentId.firstName} ${account.studentId.middleName} ${account.studentId.lastName}</td>
                    <td>${account.studentId.courseId.courseName}</td>
                    <td>${account.paidAmount}</td>
                    <td>${account.addedDate}</td>
                    <td>
                        <a href="${SITE_URL}/admin/account/payment/view/${account.paymentId}" class="btn btn-primary btn-xs">View</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>