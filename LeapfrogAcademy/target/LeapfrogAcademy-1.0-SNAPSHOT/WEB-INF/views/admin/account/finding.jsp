<%@include file="../header.jsp" %>
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
    <h2 style="text-align: center">Leapfrog Academy</h2>
    <h4 style="text-align: center">Account Department</h4>
    <br/><br/>
    <table class="table table-hover">
        <tr style="background: #fcfcfc">
            <th>Student ID</th>
            <th>Student Name</th>
            <th>Email</th>
            <th>Course Name</th>
            <th>Course Fee(NRs)</th>
            <th>Action</th>
        </tr>
        <c:forEach var="student" items="${students}">
            <tr>
                <td>${student.studentId}</td>
                <td>${student.firstName} ${student.middleName} ${student.lastName}</td>
                <td>${student.email}</td>
                <td>${student.courseId.courseName}</td>
                <td>${student.courseId.fees}</td>
                <td>
                    <a href="${SITE_URL}/admin/account/payment/view/student/${student.studentId}" class="btn btn-primary btn-xs">View Payment</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<%@include file="../footer.jsp" %>