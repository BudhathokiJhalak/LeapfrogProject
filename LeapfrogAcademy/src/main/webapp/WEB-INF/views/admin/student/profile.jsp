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
            <li class="active"><a href="${SITE_URL}/admin/student" <span class="glyphicon glyphicon-user"></span> Student</a></li>
                <%@include file="../dropdown.jsp" %>
        </ul>       
    </div>
</nav>
<br/><br/><br/>
<div class="container">
    <h3>Student Profile</h3>
    <table>
        <p><label>ID:</label> ${student.studentId}</p>
        <p><label>Full Name:</label> ${student.firstName} ${student.middleName} ${student.lastName}</p>
        <p><label>Gender:</label> ${student.gender}</p>
        <p><label>Email:</label> ${student.email}</p>
        <p><label>Contact No:</label> ${student.contactNo}</p>    
        <p><label>Additional Contact No:</label> ${student.additionalContactNo}</p>
        <p><label>Current Address:</label> ${student.address}</p>
        <p><label>Added Date:</label> ${student.addedDate}</p>
        <p><label>Course Name:</label> ${student.courseId.courseName}</p>
        <p><label>Batch Name:</label> ${student.batchId.batchName}</p>
        <p><label>Status:</label> 
            <c:choose>
                <c:when test="${student.status}">
                    Active
                </c:when>
                <c:otherwise>
                    Inactive
                </c:otherwise>
            </c:choose>
        </p>
    </table>
    <a href="${SITE_URL}/admin/student" class="btn btn-danger"><span class="glyphicon glyphicon-circle-arrow-left"></span> Back</a>
    <a href="${SITE_URL}/admin/student/update/${student.studentId}" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span> Edit</a>
</div>
<%@include file="../footer.jsp" %>