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
            <li><a href="${SITE_URL}/admin/student" <span class="glyphicon glyphicon-user"></span> Student</a></li>
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
                <input type="text" class="form-control" name="search" placeholder="search by student name ...">
                <span class="glyphicon glyphicon-search form-control-feedback"></span>
            </div>
        </form>
    </div>
    <br/>
    <table class="table table-hover">
        <tr style="background: #fcfcfc">
            <th>ID</th>
            <th>Full Name</th>
            <th>Contact Info</th>
            <th>Address</th>
            <th>Interested Course</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <c:forEach var="enquiry" items="${enquiries}">
            <tr>
                <td>${enquiry.enquiryId}</td>
                <td>${enquiry.firstName} ${enquiry.middleName} ${enquiry.lastName}</td>
                <td>${enquiry.email}<br/> ${enquiry.contactNo}</td>
                <td>${enquiry.address}</td>
                <td>${enquiry.courseId.courseName}</td>
                <td style="background-color: ${enquiry.enquiryStatusId.color}">${enquiry.enquiryStatusId.enquiryStatus}</td>
                <td>
                    <a href="${SITE_URL}/admin/enquiry/mail/${enquiry.enquiryId}" class="btn btn-success btn-xs"><span class="glyphicon glyphicon-envelope"></span></a>
                    <a href="${SITE_URL}/admin/enquiry/update/${enquiry.enquiryId}" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-pencil"></span></a>
                    <a href="${SITE_URL}/admin/enquiry/delete/${enquiry.enquiryId}" class="btn btn-danger btn-xs" onclick="return confirm('Are you sure to delete?')"><span class="glyphicon glyphicon-trash"></span></a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<%@include file="../footer.jsp" %>