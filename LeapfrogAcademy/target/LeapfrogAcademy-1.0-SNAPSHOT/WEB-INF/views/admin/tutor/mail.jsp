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
    <form method="post" action="${SITE_URL}/admin/mail/send">
        <h2>Send Email</h2>
        <div class="col-md-12">
            <div class="col-md-3">
                <div class="form-group" > 
                    <label>To</label>
                    <input type="text" name="to" value="${tutor.email}" class="form-control"/>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group" > 
                    <label>From</label>
                    <select class="form-control" name="from"> 
                        <option>Select Mail Address</option>
                        <c:forEach var="ma" items="${mailAddress}">
                            <option value="${ma.mailAddress}">${ma.mailAddress}</option>
                        </c:forEach>
                    </select> 
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group" > 
                    <label>ISP</label>
                    <select class="form-control" name="hostName"> 
                        <option>Select ISP</option>
                        <c:forEach var="isp" items="${isps}">
                            <option value="${isp.value}">${isp.ispName}</option>
                        </c:forEach>
                    </select> 
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="col-md-9">
                <div class="form-group">
                    <label>Subject</label>
                    <input type="text" name="subject" class="form-control" required="required"/>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="col-md-12">
                <div class="form-group">
                    <label>Message</label>
                    <textarea name="message" class="form-control" required="required"/></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Send</button>
                <a href="${SITE_URL}/admin/tutor" class="btn btn-danger">Discard</a>
            </div>
        </div>

    </form>
</div>
<%@include file="../footer.jsp" %>