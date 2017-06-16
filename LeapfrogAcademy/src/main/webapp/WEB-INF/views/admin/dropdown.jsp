<li class = "dropdown">
    <a class = "dropdown-toggle" data-toggle = "dropdown" href = "#menu1">
        <span class = "glyphicon glyphicon-circle-arrow-down"></span>
    </a>
    <ul class = "dropdown-menu">
        <li><a href = "${SITE_URL}/admin/profile/${loggedUser.adminId}" ><span class="glyphicon glyphicon-user"></span> ${loggedUser.username}</a></li>
        <li class = "divider"></li>
        <li><a href = "${SITE_URL}/admin/enquiry"><span class="glyphicon glyphicon-stats"></span> Enquiry</a></li>
        <li><a href = "${SITE_URL}/admin/account"><span class="glyphicon glyphicon-usd"></span> Account</a></li>
        <li><a href = "${SITE_URL}/admin/certificate"><span class="glyphicon glyphicon-certificate"></span> Certification</a></li>
        <li><a href = "${SITE_URL}/admin/mail-address"><span class="glyphicon glyphicon-envelope"></span> Mail-Address</a></li>
        <li class = "divider"></li>
        <li><a href="${SITE_URL}/admin/logout" onclick="return confirm('Are you sure to Logout?')"><span class="glyphicon glyphicon-off"></span> Logout</a></li>
    </ul>
</li>