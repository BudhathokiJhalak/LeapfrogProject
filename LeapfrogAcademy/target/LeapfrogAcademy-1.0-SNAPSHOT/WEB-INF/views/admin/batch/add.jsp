<%@include file="../header.jsp" %>
<nav class="navbar navbar-default navbar-fixed-top" >
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${SITE_URL}/admin" style="font-family:Monotype Corsiva; font-size: 27px">Leapfrog Academy</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="${SITE_URL}/admin/course"><span class="glyphicon glyphicon-book"></span> Course</a></li>
            <li><a href="${SITE_URL}/admin/tutor"><span class="glyphicon glyphicon-user"></span> Tutor</a></li>
            <li class="active"><a href="${SITE_URL}/admin/batch"><span class="glyphicon glyphicon-book"></span> Batch</a></li>
            <li><a href="${SITE_URL}/admin/student"><span class="glyphicon glyphicon-user"></span> Student</a></li>
                <%@include file="../dropdown.jsp" %>
        </ul>       
    </div>
</nav>
<br/><br/><br/>
<div class="container">
    <h3>Add Batch</h3>
    <br/>
    <form method="post" action="${SITE_URL}/admin/batch/save">
        <div class="form-group">
            <label>Batch Name</label>
            <input type="text" class="form-control" name="batchName" placeholder="Batch Name" required="required"/>
        </div>
        <div class="form-group">
            <label>Shift</label>
            <select class="form-control" name="shift"> 
                <option>Select Shift</option>
                <option value="Morning">Morning</option>
                <option value="Day">Day</option>
                <option value="Evening">Evening</option>
            </select>
        </div>
        <div class="form-group">
            <label>Time</label>
            <input type="text" class="form-control" name="time" placeholder="Time(Start-End)"/>
        </div>
        <div class="form-group">
            <label>Tutor</label>
            <select class="form-control" name="tutorId.tutorId"> 
                <option>Select Tutor</option>
                <c:forEach var="tutor" items="${tutors}">
                    <option value="${tutor.tutorId}">${tutor.firstName} ${tutor.middleName} ${tutor.lastName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="checkbox">
            <label>Status</label>
            <label><input type="checkbox" name="status">Active</label>
        </div>
        <a href="${SITE_URL}/admin/batch" class="btn btn-danger"><span class="glyphicon glyphicon-circle-arrow-left"></span> Back</a>
        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-save"></span> Save</button>
    </form>
</div>
<%@include file="../footer.jsp" %>