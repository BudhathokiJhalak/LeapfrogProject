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
    <h3>Update Student</h3>
    <br/>
    <form method="post" action="${SITE_URL}/admin/student/save">
        <div>
            <div class="col-md-4">
                <div class="form-group">                      
                    <label>First Name</label>
                    <input type="text" class="form-control" placeholder="First Name" name="firstName" value="${student.firstName}" required="required"/>
                </div>
                <div class="form-group">                      
                    <label>Middle Name</label>
                    <input type="text" class="form-control" placeholder="Middle Name" name="middleName" value="${student.middleName}"/>
                </div>
                <div class="form-group">  
                    <label>Last Name</label>
                    <input type="text" class="form-control" placeholder="Last Name" name="lastName" value="${student.lastName}" required="required"/>
                </div>

            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>Gender</label> 
                    <select class="form-control" name="gender">
                        <option value="${student.gender}">${student.gender}</option>
                        <option>Select Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Others">Other</option>
                    </select> 
                </div>
                <div class="form-group">
                    <label>Contact No</label> 
                    <input type="text" class="form-control" placeholder="Contact number" name="contactNo" value="${student.contactNo}" required="required"/>
                </div>
                <div class="form-group">  
                    <label>Additional Contact No</label>
                    <input type="text" class="form-control" placeholder="Additional Contact number" name="additionalContactNo" value="${student.additionalContactNo}"/>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>Email</label> 
                    <input type="email" class="form-control" placeholder="Email" name="email" value="${student.email}" required="required"/>
                </div>              
                <div class="form-group">  
                    <label>Address</label>
                    <input type="text" class="form-control" placeholder="Address" name="address" value="${student.address}" required="required"/>
                </div>
                <div class="form-group">
                    <label>Course</label> 
                    <select class="form-control" name="courseId.courseId"> 
                        <option value="${student.courseId.courseId}">${student.courseId.courseName}</option>
                        <option>Select Course</option>
                        <c:forEach var="course" items="${courses}">
                            <option value="${course.courseId}">${course.courseName}</option>
                        </c:forEach>
                    </select> 
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-group">
                    <label>Batch</label> 
                    <select class="form-control" name="batchId.batchId">
                        <option value="${student.batchId.batchId}">${student.batchId.batchName}</option>
                        <option>Select Batch</option>
                        <c:forEach var="batch" items="${batches}">
                            <option value="${batch.batchId}">${batch.batchName}</option>
                        </c:forEach>
                    </select> 
                </div>
                <div class="checkbox">
                    <label>Status</label>
                    <label><input type="checkbox" name="status" <c:if test="${student.status}">checked="checked"</c:if>>Active</label>
                    </div>
                    <input type="hidden" name="studentId" value="${student.studentId}"/>
                <a href="${SITE_URL}/admin/student" class="btn btn-danger"><span class="glyphicon glyphicon-circle-arrow-left"></span> Back</a>
                <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-save"></span> Save</button>
            </div>
        </div>
    </form>
</div>
<%@include file="../footer.jsp" %>