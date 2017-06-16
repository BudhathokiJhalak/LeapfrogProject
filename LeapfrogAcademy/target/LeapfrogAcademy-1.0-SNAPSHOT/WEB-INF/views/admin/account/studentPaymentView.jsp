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
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <div class="row">

                    <div class="col-md-12">
                        <p class="pull-left"><label>Student ID:</label></p> <p class="pull-right">${student.studentId}</p>
                    </div>
                    <div class="col-md-12">
                        <p class="pull-left"><label>Student Name:</label></p> <p class="pull-right">${student.firstName} ${student.middleName} ${student.lastName}</p>
                    </div>
                    <div class="col-md-12">
                        <p class="pull-left"><label>Course Name:</label></p> <p class="pull-right">${student.courseId.courseName}</p>
                    </div>
                    <div class="col-md-12">
                        <p class="pull-left"><label>Course Fee(NRs):</label></p> <p class="pull-right">${student.courseId.fees}</p>
                    </div>

                    <c:forEach var="account" items="${accounts}">

                        <div class="col-md-12">
                            <hr/>
                            <p class="pull-left"><label>Payment ID:</label></p> <p class="pull-right">${account.paymentId}</p>
                        </div>
                        <div class="col-md-12">
                            <p class="pull-left"><label>Paid Amount(NRs):</label></p> <p class="pull-right">${account.paidAmount}</p>
                        </div>
                        <div class="col-md-12">
                            <p class="pull-left"><label>Payment Date:</label></p> <p class="pull-right">${account.addedDate}</p>

                        </div>
                    </c:forEach>
                    <div class="col-md-12">
                        <div class="col-md-5"></div>
                        <div class="col-md-4">
                            <br/>
                            <a href="${SITE_URL}/admin/account"class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-arrow-left"> Back</span></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
</div>
<%@include file="../footer.jsp" %>