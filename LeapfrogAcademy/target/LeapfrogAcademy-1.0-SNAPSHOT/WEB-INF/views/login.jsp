<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="SITE_URL" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin | Leapfrog Academy</title>
        <link href="${SITE_URL}/static/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="${SITE_URL}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${SITE_URL}/static/css/login.css" rel="stylesheet" type="text/css"/>
        <script src="${SITE_URL}/static/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="${SITE_URL}/static/js/jquery.min.js" type="text/javascript"></script>
        <script src="${SITE_URL}/static/js/bootstrap-dropdown.js" type="text/javascript"></script>
    </head>
    <body>
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="${SITE_URL}" style="font-family:Monotype Corsiva; font-size: 27px"> Leapfrog Academy</a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${SITE_URL}/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            </ul>
        </div>
    </nav>
    <br/><br/><br/><br/>
    <div class="container">
        <section id="content">
            <form method="post">
                <h1>Login Form</h1>
                <div>
                    <input type="text" name="username" placeholder="Username" required="" id="username" />
                </div>
                <div>
                    <input type="password" name="password" placeholder="Password" required="" id="password" />
                </div>
                <div>
                    <div class="col-md-3"></div>
                    <div class="col-md-9">
                        <input type="submit" value="Login" />
                    </div>
                </div>
            </form><!-- form -->
            <div class="button">
                <c:if test="${param.error!=null}">
                    <h4><p class="text-center" style="font-family:cursive; color: #ff0000"> ${error}</p></h4>
                </c:if>
                <c:if test="${param.logout!=null}">
                    <h4><p class="text-center" style="font-family:cursive; color: #009900"> ${msg}</p></h4>
                </c:if>
            </div><!-- button -->
        </section>
    </div>
</body>
</html>