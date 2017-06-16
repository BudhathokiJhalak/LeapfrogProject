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
            <h3 style="text-align: center">Leapfrog Certification</h3>
            <hr class="arrow"/>
            <form method="post" action="${SITE_URL}/admin/certificate/save">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="form-group">
                        <select class="form-control" name="studentId.studentId">
                            <option>Select student name to certify </option>
                            <c:forEach var="student" items="${students}">
                                <option value="${student.studentId}">${student.firstName} ${student.middleName} ${student.lastName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <button type="submit" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-arrow-up"></span> Certify</button>
                        <a href="${SITE_URL}/admin/certificate" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-circle-arrow-left"></span> Back</a>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <div class="col-md-3"></div>
            </form>
        </div>
        <div class="col-md-3"></div>
    </div> <!--end of row 1-->

</div>
<%@include file="../footer.jsp" %>