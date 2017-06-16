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
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <br/>
            <i class="fa fa-user-circle fa-5x" style="padding-left: 238px"></i>
            <br/><br/><br/>
            <form method="post" action="${SITE_URL}/admin/profile/save">
                <div class="col-md-4">
                    <div class="form-group">
                        <input type="text" name="firstName" value="${admin.firstName}" class="form-control" placeholder="First Name"/>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <input type="text" name="middleName" value="${admin.middleName}" class="form-control" placeholder="Middle Name"/>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <input type="text" name="lastName" value="${admin.lastName}" class="form-control" placeholder="Last Name"/>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <select class="form-control" name="gender">
                            <option value="${admin.gender}">${admin.gender}</option>
                            <option value="">Select Gender</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Others">Other</option>
                        </select> 
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <input type="text" name="contactNo" value="${admin.contactNo}" class="form-control" placeholder="Contact No"/>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <input type="text" name="address" value="${admin.address}" class="form-control" placeholder="Current Address"/>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <input type="text" name="email" value="${admin.email}" class="form-control" placeholder="Email Address"/>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <input type="text" name="username" value="${admin.username}" class="form-control" placeholder="Username"/>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <input type="text" name="password" value="${admin.password}" class="form-control" placeholder="Password"/>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <button type="submit" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-arrow-up"></span> Save</button>
                        <a href="${SITE_URL}/admin/profile/${admin.adminId}" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-circle-arrow-left"></span> Back</a>
                    </div>
                    <div class="col-md-4">
                        <input type="hidden" name="adminId" value="${admin.adminId}"/>
                        <input type="hidden" name="status" value="${admin.status}"/>
                        <input type="hidden" name="role" value="${admin.role}"/>
                    </div>
                </div>
            </form>
            <hr/>
        </div>
        <div class="col-md-3"></div>
    </div>
</div>
<%@include file="footer.jsp" %>