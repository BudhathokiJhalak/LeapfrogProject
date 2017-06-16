<%@include file="header.jsp" %>
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
                <%@include file="dropdown.jsp" %>
        </ul>       
    </div>
</nav>
<br/><br/><br/>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="pull-left">
                <p>
                    <a href="${SITE_URL}/admin/dashboard" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-circle-arrow-left"> Back</span></a>
                </p>
            </div>
            <div class="pull-right">
                <p>
                    <a href="${SITE_URL}/admin/profile/update/${admin.adminId}" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-pencil"> Edit</span></a>
                </p>
            </div>
        </div>
    </div>
    <br/><br/>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <hr/>
            <i class="fa fa-user-circle fa-5x" style="padding-left: 238px"></i>
            <br/><br/><br/>
            <p style="text-align: center; font-family: David; font-size: 30px">${admin.firstName} ${admin.middleName} ${admin.lastName}</p>
            <p style="text-align: center; font-family: David; font-size: 17px">${admin.gender}</p>
            <p style="text-align: center; font-family: David; font-size: 20px">${admin.contactNo}</p>
            <p style="text-align: center; font-family: David; font-size: 20px">${admin.address}</p>
            <p style="text-align: center; font-family: David; font-size: 23px">${admin.email}</p>
            <p style="text-align: center; font-family: David; font-size: 25px">${admin.username} / ${admin.password}</p>
            <hr/>
        </div>
        <div class="col-md-3"></div>
    </div>
</div>
<%@include file="footer.jsp" %>