<%@include file="../header.jsp" %>
<nav class="navbar navbar-default navbar-fixed-top" >
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${SITE_URL}/admin" style="font-family:Monotype Corsiva; font-size: 27px">Leapfrog Academy</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="${SITE_URL}/admin/course"><span class="glyphicon glyphicon-book"></span> Course</a></li>
            <li class="active"><a href="${SITE_URL}/admin/tutor"><span class="glyphicon glyphicon-user"></span> Tutor</a></li>
            <li><a href="${SITE_URL}/admin/batch"><span class="glyphicon glyphicon-book"></span> Batch</a></li>
            <li><a href="${SITE_URL}/admin/student"><span class="glyphicon glyphicon-user"></span> Student</a></li>
                <%@include file="../dropdown.jsp" %>
        </ul>       
    </div>
</nav>
<br/><br/><br/>
<div class="container">
    <div class="col-md-4 col-md-offset-4">
        <form method="post" class="search-form">
            <div class="form-group has-feedback">
                <label for="search" class="sr-only">Search</label>
                <input type="text" class="form-control" name="search" placeholder="search by tutor name ...">
                <span class="glyphicon glyphicon-search form-control-feedback"></span>
            </div>
        </form>
    </div>
    <br/>
    <div class="pull-right">
        <p>
            <a href="${SITE_URL}/admin/tutor/add" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-plus"> Add</span></a>
        </p>
    </div>
    <table class="table table-hover">
        <tr style="background: #fcfcfc">
            <th>ID</th>
            <th>Full Name</th>            
            <th>Gender</th>
            <th>Email</th>
            <th>Address</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <c:forEach var="tutor" items="${tutors}">
            <tr>
                <td>${tutor.tutorId}</td>
                <td>${tutor.firstName} ${tutor.middleName} ${tutor.lastName}</td>
                <td>${tutor.gender}</td>
                <td>${tutor.email}</td>
                <td>${tutor.address}</td>
                <td>
                    <c:choose>
                        <c:when test="${tutor.status}">
                            Active
                        </c:when>
                        <c:otherwise>
                            Inactive
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <a href="${SITE_URL}/admin/tutor/profile/${tutor.tutorId}" class="btn btn-default btn-xs"><span class="glyphicon glyphicon-user"></span></a>
                    <a href="${SITE_URL}/admin/tutor/mail/${tutor.tutorId}" class="btn btn-success btn-xs"><span class="glyphicon glyphicon-envelope"></span></a>
                    <a href="${SITE_URL}/admin/tutor/update/${tutor.tutorId}" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-pencil"></span></a>
                    <a href="${SITE_URL}/admin/tutor/delete/${tutor.tutorId}" class="btn btn-danger btn-xs" onclick="return confirm('Are you sure to delete?')"><span class="glyphicon glyphicon-trash"></span></a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<%@include file="../footer.jsp" %>