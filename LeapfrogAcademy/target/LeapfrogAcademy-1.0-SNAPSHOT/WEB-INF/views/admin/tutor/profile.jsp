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
    <h3>Tutor Profile</h3>
    <table>
        <p><label>ID:</label> ${tutor.tutorId}</p>
        <p><label>Full Name:</label> ${tutor.firstName} ${tutor.middleName} ${tutor.lastName}</p>
        <p><label>Gender:</label> ${tutor.gender}</p>
        <p><label>Email:</label> ${tutor.email}</p>
        <p><label>Contact No:</label> ${tutor.contactNo}</p>    
        <p><label>Additional Contact No:</label> ${tutor.additionalContactNo}</p>
        <p><label>Current Address:</label> ${tutor.address}</p>
        <p><label>Added Date:</label> ${tutor.addedDate}</p>
        <p><label>Status:</label> 
            <c:choose>
                <c:when test="${tutor.status}">
                    Active
                </c:when>
                <c:otherwise>
                    Inactive
                </c:otherwise>
            </c:choose>
        </p>
    </table>
    <a href="${SITE_URL}/admin/tutor" class="btn btn-danger"><span class="glyphicon glyphicon-circle-arrow-left"></span> Back</a>
    <a href="${SITE_URL}/admin/tutor/update/${tutor.tutorId}" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span> Edit</a>
</div>
<%@include file="../footer.jsp" %>