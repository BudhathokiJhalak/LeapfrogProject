<%@include file="../header.jsp" %>
<nav class="navbar navbar-default navbar-fixed-top" >
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${SITE_URL}/admin" style="font-family:Monotype Corsiva; font-size: 27px">Leapfrog Academy</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="${SITE_URL}/admin/course"><span class="glyphicon glyphicon-book"></span> Course</a></li>
            <li><a href="${SITE_URL}/admin/tutor"><span class="glyphicon glyphicon-user"></span> Tutor</a></li>
            <li><a href="${SITE_URL}/admin/batch"><span class="glyphicon glyphicon-book"></span> Batch</a></li>
            <li><a href="${SITE_URL}/admin/student"><span class="glyphicon glyphicon-user"></span> Student</a></li>
                <%@include file="../dropdown.jsp" %>
        </ul>       
    </div>
</nav>
<br/><br/><br/>
<div class="container">
    <h3>Update Course</h3>
    <br/>
    <form method="post" action="${SITE_URL}/admin/course/save">
        <div class="form-group">
            <label>Course Name</label>
            <input type="text" class="form-control" name="courseName" value="${course.courseName}"/>
        </div>
        <div class="form-group">
            <label>Description</label>
            <textarea name="description" placeholder="Course Description"class="form-control" required="required"/>${course.description}</textarea>
        </div>
        <div class="form-group">
            <label>Fees</label>
            <input type="text" class="form-control" name="fees" value="${course.fees}"/>
        </div>
        <div class="checkbox">
            <label>Status</label>
            <label><input type="checkbox" name="status" <c:if test="${course.status}">checked="checked"</c:if>>Active</label>
            </div>
            <input type="hidden" value="${course.courseId}" name="courseId"/>
        <a href="${SITE_URL}/admin/course" class="btn btn-danger"><span class="glyphicon glyphicon-circle-arrow-left"></span> Back</a>
        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-save"></span> Save</button>
    </form>
</div>
<%@include file="../footer.jsp" %>