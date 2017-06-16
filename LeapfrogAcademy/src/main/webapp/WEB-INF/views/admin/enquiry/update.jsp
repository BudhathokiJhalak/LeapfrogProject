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
    <h3>Update Enquiry</h3>
    <br/>
    <form method="post" action="${SITE_URL}/admin/enquiry/save">
        <div>
            <div class="col-md-4">
                <div class="form-group">                      
                    <label>First Name</label>
                    <input type="text" class="form-control" placeholder="First Name" name="firstName" value="${enquiry.firstName}" required="required"/>
                </div>
                <div class="form-group">                      
                    <label>Middle Name</label>
                    <input type="text" class="form-control" placeholder="Middle Name" name="middleName" value="${enquiry.middleName}"/>
                </div>
                <div class="form-group">  
                    <label>Last Name</label>
                    <input type="text" class="form-control" placeholder="Last Name" name="lastName" value="${enquiry.lastName}" required="required"/>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>Email</label> 
                    <input type="email" class="form-control" placeholder="Email" name="email" value="${enquiry.email}" required="required"/>
                </div>              
                <div class="form-group">  
                    <label>Address</label>
                    <input type="text" class="form-control" placeholder="Address" name="address" value="${enquiry.address}" required="required"/>
                </div>
                <div class="form-group">
                    <label>Contact No</label> 
                    <input type="text" class="form-control" placeholder="Contact number" name="contactNo" value="${enquiry.contactNo}" required="required"/>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>Course</label> 
                    <select class="form-control" name="courseId.courseId"> 
                        <option value="${enquiry.courseId.courseId}">${enquiry.courseId.courseName}</option>
                        <option>Select Course</option>
                        <c:forEach var="course" items="${courses}">
                            <option value="${course.courseId}">${course.courseName}</option>
                        </c:forEach>
                    </select> 
                </div>
                <div class="form-group">
                    <label>Enquiry Status</label> 
                    <select class="form-control" name="enquiryStatusId.enquiryStatusId">
                        <option value="${enquiry.enquiryStatusId.enquiryStatusId}">${enquiry.enquiryStatusId.enquiryStatus}</option>
                        <option>Select Enquiry Status</option>
                        <c:forEach var="es" items="${enquiryStatus}">
                            <option value="${es.enquiryStatusId}">${es.enquiryStatus}</option>
                        </c:forEach>
                    </select> 
                </div>
            </div>
            <div class="col-md-12">
                <input type="hidden" name="enquiryId" value="${enquiry.enquiryId}"/>
                <a href="${SITE_URL}/admin/enquiry" class="btn btn-danger"><span class="glyphicon glyphicon-circle-arrow-left"></span> Back</a>
                <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-save"></span> Save</button>
            </div>
        </div>
    </form>
</div>
<%@include file="../footer.jsp" %>