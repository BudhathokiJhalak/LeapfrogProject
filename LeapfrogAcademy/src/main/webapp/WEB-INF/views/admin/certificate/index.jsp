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
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <h3 style="text-align: center">Listing All Leapfrog Certified Students</h3>
            <hr class="arrow"/>
        </div>
        <div class="col-md-3"></div>
    </div> <!-- end of row 1-->
    <div class="row">
        <div class="col-md-12">
            <div class="pull-right">
                <p>
                    <a href="${SITE_URL}/admin/certificate/add" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-plus"> Add</span></a>
                </p>
            </div>
            <table class="table table-hover">
                <tr style="background: #fcfcfc">
                    <th>ID</th>
                    <th>Student Name</th>
                    <th>Course Name</th>
                    <th>Added Date</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="certificate" items="${certificates}">
                    <tr>
                        <td>${certificate.certificateId}</td>
                        <td>${certificate.studentId.firstName} ${certificate.studentId.middleName} ${certificate.studentId.lastName}</td>
                        <td>${certificate.studentId.courseId.courseName}</td>
                        <td>${certificate.addedDate}</td>
                        <td>
                            <a href="${SITE_URL}/admin/certificate/delete/${certificate.certificateId}" class="btn btn-danger btn-xs" onclick="return confirm('Are you sure to delete?')"><span class="glyphicon glyphicon-trash"></span></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>  <!-- end of row 2-->
</div>
<%@include file="../footer.jsp" %>