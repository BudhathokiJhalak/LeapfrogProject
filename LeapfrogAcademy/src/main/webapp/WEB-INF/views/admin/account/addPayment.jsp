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
    <div class="col-md-12">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <form action="${SITE_URL}/admin/account/payment/save" method="post">
                <div class="form-group">
                    <select class="form-control" name="studentId.studentId" required="required">
                        <option value="">Select Student</option>
                        <c:forEach var="student" items="${students}">
                            <option value="${student.studentId}">${student.firstName} ${student.middleName} ${student.lastName}</option>
                        </c:forEach>
                    </select> 
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="paidAmount" placeholder="Enter Amount(NRs)" required="required"/>
                </div>
                <br/>
                <div class="col-md-12">
                    <div class="col-md-3"></div>
                    <div class="col-md-9">
                        <button type="submit" class="btn btn-primary">Make Payment</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-4"></div>
    </div>
</div>
<%@include file="../footer.jsp" %>